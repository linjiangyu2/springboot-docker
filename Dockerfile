FROM alpine:latest
ARG JAR_NAME
#COPY target/${JAR_NAME}	Tianlin-V1.0.jar
COPY .settings.xml  ./src/  /tianlin/
WORKDIR /tianlin
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
apk add openjdk8 maven --no-cache && \
mkdir -p ~/.m2 && \
#mv /Tianlin-V1.0.jar /tianlin/ && \
mv /tianlin/.settings.xml ~/.m2/settings.xml && \
mvn package && \
mv /tianlin/target/*.jar /Tianlin-V1.0.jar && \
rm -rf /tianllin
EXPOSE	80
CMD ["java","-jar","/Tianlin-V1.0.jar"]
