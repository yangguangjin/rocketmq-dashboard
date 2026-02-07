#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM 192.168.0.50:5000/application/ubuntu:24.04

WORKDIR /home/rocketmq-dashboard

# 添加 JDK
ADD bellsoft-jdk25.0.2+12-linux-amd64-full.tar.gz .

# 复制应用 JAR 包
COPY rocketmq-dashboard-*.jar rocketmq-dashboard.jar

# 复制启动脚本
COPY entrypoint.sh entrypoint.sh
RUN chmod 755 /home/rocketmq-dashboard/entrypoint.sh

# 创建配置文件目录 (用于宿主机挂载)
RUN mkdir -p /home/rocketmq-dashboard/config

# 时区设置
ENV TZ="Asia/Shanghai"
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo $TZ > /etc/timezone

# JDK 环境变量
ENV JAVA_HOME=/home/rocketmq-dashboard/jdk-25.0.2-full
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# 应用默认环境变量
ENV SERVER_PORT=8082
ENV JAVA_OPTS=""

# 外部配置文件目录 (宿主机挂载此目录)
ENV CONFIG_DIR=/home/rocketmq-dashboard/config

# 数据目录
VOLUME /tmp/rocketmq-console/data

# 使用非 root 用户运行
USER 1000

ENTRYPOINT ["/home/rocketmq-dashboard/entrypoint.sh"]
