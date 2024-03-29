FROM tomcat:7.0.91-jre7

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir ovitmp && \
    cd ovitmp && \
    curl https://master.dl.sourceforge.net/project/webpacs/Oviyam-2.7.1-bin.zip > oviyam.zip && \
        unzip oviyam.zip
        
RUN rm -R /usr/local/tomcat/webapps/ROOT/
RUN cp /ovitmp/Oviyam-2.7.1-bin/Oviyam-2.7.1-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war
RUN cp /ovitmp/Oviyam-2.7.1-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
