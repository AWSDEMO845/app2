FROM adoptopenjdk/openjdk8:alpine-slim
EXPOSE 8080
ARG JAR_FILE=target/*.jar

#The below Run means group is created called pipeline 
#It continues to say a user called k8s-pipeline is created and then added to the pipeline group  
RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline

#The below Copy command says we are using COPY instead of RUN to copy files to user k8s-pipeline home directory
COPY ${JAR_FILE} /home/k8s-pipeline/app.jar

#To use the user, USER instruction created in line 13 is being used
USER k8s-pipeline
ENTRYPOINT ["java","-jar","/home/k8s-pipeline/app.jar"]





