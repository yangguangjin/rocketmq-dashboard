FROM 192.168.0.50:5000/application/ubuntu:24.04
WORKDIR /home/rocketmq-dashboard
ADD bellsoft-jdk25.0.2+12-linux-amd64-full.tar.gz .
COPY rocketmq-dashboard-*.jar rocketmq-dashboard.jar
COPY entrypoint.sh entrypoint.sh
RUN chmod 777 /home/rocketmq-dashboard/entrypoint.sh
ENV TZ="Asia/Shanghai"
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo $TZ > /etc/timezone

ENV JAVA_HOME=/home/rocketmq-dashboard/jdk-25.0.2-full
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

ENV SERVER_PORT=8082
ENV JAVA_OPTS=""

VOLUME /tmp/rocketmq-console/data

USER 1000

ENTRYPOINT ["/home/rocketmq-dashboard/entrypoint.sh"]
