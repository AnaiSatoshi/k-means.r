# シンプルなXORパターン
p11<-cbind(rnorm(n=25,mean=1,sd=0.5),rnorm(n=25,mean=1,sd=0.5))
p12<-cbind(rnorm(n=25,mean=-1,sd=0.5),rnorm(n=25,mean=1,sd=0.5))
p13<-cbind(rnorm(n=25,mean=-1,sd=0.5),rnorm(n=25,mean=-1,sd=0.5))
p14<-cbind(rnorm(n=25,mean=1,sd=0.5),rnorm(n=25,mean=-1,sd=0.5))
t<-as.factor(c(rep(0,50),rep(1,50)))
xors<-as.data.frame(cbind(rbind(p11,p13,p12,p14),t))
names(xors)<-c("x","y","label")

# 複雑なXORパターン
p21<-cbind(rnorm(n=25,mean=1,sd=1),rnorm(n=25,mean=1,sd=1))
p22<-cbind(rnorm(n=25,mean=-1,sd=1),rnorm(n=25,mean=1,sd=1))
p23<-cbind(rnorm(n=25,mean=-1,sd=1),rnorm(n=25,mean=-1,sd=1))
p24<-cbind(rnorm(n=25,mean=1,sd=1),rnorm(n=25,mean=-1,sd=1))
t<-as.factor(c(rep(0,50),rep(1,50)))
xorc<-as.data.frame(cbind(rbind(p21,p23,p22,p24),t))
names(xorc)<-c("x","y","label")

#k-measの実行
xors.km<-kmeans(xors,centers=4)
xorc.km<-kmeans(xorc,centers=4)

#正答率
table(c(rep(1,25),rep(2,25),rep(3,25),rep(4,25)),xors.km$cluster)
table(c(rep(1,25),rep(2,25),rep(3,25),rep(4,25)),xorc.km$cluster)

#作図
plot(xors[,-3],pch=19,cex=3,col=xors.km$cluster,xlim=c(-3,3),ylim=c(-3,3))
plot(xorc[,-3],pch=19,cex=3,col=xorc.km$cluster,xlim=c(-3,3),ylim=c(-3,3))
