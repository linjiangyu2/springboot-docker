#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
apk update && apk add openjdk8 maven --no-cache
mkdir -p ~/.m2
cat > ~/.m2/settings.xml <<END
<?xml version="1.0" encoding="UTF-8"?>
<settings>
  <mirrors>
    <mirror>
      <id>aliyunmaven</id>
      <mirrorOf>*</mirrorOf>
      <name>阿里云公共仓库</name>
      <url>https://maven.aliyun.com/repository/public</url>
    </mirror>
  </mirrors>
 
  <profiles>
    <profile>
      <id>openjdk8</id>
      <activation>
        <activeByDefault>true</activeByDefault>
        <jdk>openjdk8</jdk>
      </activation>
      <properties>
      <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
      <maven.compiler.source>1.8</maven.compiler.source>
      <maven.compiler.target>1.8</maven.compiler.target>
      <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
      <maven.compiler.release>8</maven.compiler.release>
      <java.version>1.8</java.version>
      </properties>
    </profile> 
  </profiles>
</settings>
END
cd /tianlin
mvn package
export JRE_NAME=$(ls -l target  | grep '\.jar$' | awk '{print $NF}')
mv target/${JRE_NAME} /
cd /
#rm -rf /tianlin
apk cache clean

java -jar /${JRE_NAME}
