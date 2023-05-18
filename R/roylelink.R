gf.data
gf.temp
dim(gf.data)
"frogindexmodel.fn" <-
	function(){
		
		# R code for fitting multinomial mixture models described in "A general class
		# of multinomial mixture models for anuran calling survey data" by J.A. Royle
		# and W.A. Link.
		
		# this is a function that computes the multinomial cell probabilities of
		# the sampling distribution. Note that a multinomial logit transform is used
		
		cp<-function(x){
			c2<-exp(c(0,x[1]))/sum( exp(c(0,x[1])) )
			c3<-exp(c(0,x[2:3]))/sum( exp(c(0,x[2:3])) )
			c4<-exp(c(0,x[4:6]))/sum( exp(c(0,x[4:6])) )
			P<-matrix(0,4,4)
			P[1,1]<-1
			P[1:2,2]<-c2
			P[1:3,3]<-c3
			P[1:4,4]<-c4
			P
		}
		
		# a utility function, inverse-logit transform
		expit<-function (mu)
		{
			1/((1/exp(mu)) + 1)
		}
		
		
		
		# This function evaluates the negative log-likelihood function. A multinomial
		# logit transform is used for the latent index distribution
		
		negloglik<-function(x,pim,vars=NULL){
			pim[4:6]<-length(unique(pim[1:3]))+pim[4:6]
			nparm<-length(unique(pim))
			
			psi<-x[(nparm+1):(nparm+3)]
			psi<-exp(c(0,psi))/sum( exp(c(0,psi)))
			
			if(length(vars)>0){
				covparms<-x[ (nparm+4):length(x)]
				names(covparms)<-vars
				tempparms<-c(0,0,0,0)
				names(tempparms)<-c("time1","time3","temp1","temp2")
				tempparms[vars]<-covparms
				time1<-tempparms[1]
				time3<-tempparms[2]
				temp1<-tempparms[3]
				temp2<-tempparms[4]
			}
			else{
				time1<-time3<-temp1<-temp2<-0
			}
			
			x<-x[pim]
			beta1<-expit(x[4])
			beta2<-expit(x[5])
			beta3<-expit(x[6])
			
			cs<-rep(NA,nrow(M))
			for(i in 1:nrow(M)){
				
				lik<-matrix(NA,nrow=4,ncol=ncol(M))
				for(j in 1:ncol(M)){
					
					p1<-expit(x[1]+time1*ifelse(j==1,1,0) +time3*ifelse(j==3,1,0) + temp1*temp[i,j] + temp2*temp[i,j]*temp[i,j])
					p2<-expit(x[2]+time1*ifelse(j==1,1,0) +time3*ifelse(j==3,1,0) + temp1*temp[i,j] + temp2*temp[i,j]*temp[i,j])
					p3<-expit(x[3]+time1*ifelse(j==1,1,0) +time3*ifelse(j==3,1,0) + temp1*temp[i,j] + temp2*temp[i,j]*temp[i,j])
					c2<-c(1-p1,p1)
					c3<-c((1-beta1)*(1-p2),beta1*(1-p2),p2)
					c4<-c( (1-beta3)*(1-beta2)*(1-p3),(1-beta3)*beta2*(1-p3),beta3*(1-p3),p3)
					P<-matrix(0,4,4)
					P[1,1]<-1
					P[1:2,2]<-c2
					P[1:3,3]<-c3
					P[1:4,4]<-c4
					
					if(!is.na(M[i,j])){
						# probabilities of observed value for each N=0,1,2,3 state
						this.p<-  P[M[i,j]+1, ]
						lik[,j]<- this.p
					}
					else{
						lik[,j]<-1
					}
				}
				cs[i]<-sum(apply(lik,1,prod)*psi)
				
			}
			-2*sum(log(cs))
		}
		
		# here are the two data files.
		
		M<-gf.data
		temp<-gf.temp
		
		# center the temperature covariate to have mean 0
		
		temp<-temp-mean(temp,na.rm=T)
		
		
		# Define detection model using parameter index vector.
		# Note this is a slightly different format than described by Royle and Link
		# Here, (1,2,2,1,1,1) = (1,2,2,3,3,3) in Royle and Link
		
		PIM<-c(1,2,2,1,1,1)
		
		# Set starting values. It helps to have good starting values.....
		# See the function "negloglik" to determine the ordering of the parameters
		
		st<-c(-1, -2, -1.5, -0.4,-1.2, -2, -2, 2,0)
		
		# Fit model contained in Row 1 of Table 2 of Royle and Link. Note that
		# the basic detection probability structure is determined by the PIM vector
		# (passed to nlm using the pim= argument) whereas the covariate structure
		# is passed as a character vector, "vars"
		
		out1<-nlm(negloglik,st,pim=PIM,vars=c("time1","time3","temp1"),hessian=T)
		
		return(out1) 
	}
