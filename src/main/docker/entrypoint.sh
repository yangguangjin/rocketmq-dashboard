#!/bin/bash
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

# 构建 Java 启动参数
JAVA_ARGS=""

# Server 配置
[ -n "$SERVER_PORT" ] && JAVA_ARGS="$JAVA_ARGS -Dserver.port=$SERVER_PORT"

# Spring Security 配置
[ -n "$SPRING_SECURITY_USER_NAME" ] && JAVA_ARGS="$JAVA_ARGS -Dspring.security.user.name=$SPRING_SECURITY_USER_NAME"
[ -n "$SPRING_SECURITY_USER_PASSWORD" ] && JAVA_ARGS="$JAVA_ARGS -Dspring.security.user.password=$SPRING_SECURITY_USER_PASSWORD"
[ -n "$SPRING_SECURITY_USER_ROLES" ] && JAVA_ARGS="$JAVA_ARGS -Dspring.security.user.roles=$SPRING_SECURITY_USER_ROLES"

# RocketMQ 配置
[ -n "$ROCKETMQ_CONFIG_NAMESRVADDRS" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.namesrvAddrs=$ROCKETMQ_CONFIG_NAMESRVADDRS"
[ -n "$ROCKETMQ_CONFIG_LOGINREQUIRED" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.loginRequired=$ROCKETMQ_CONFIG_LOGINREQUIRED"
[ -n "$ROCKETMQ_CONFIG_AUTHMODE" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.authMode=$ROCKETMQ_CONFIG_AUTHMODE"
[ -n "$ROCKETMQ_CONFIG_ACCESSKEY" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.accessKey=$ROCKETMQ_CONFIG_ACCESSKEY"
[ -n "$ROCKETMQ_CONFIG_SECRETKEY" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.secretKey=$ROCKETMQ_CONFIG_SECRETKEY"
[ -n "$ROCKETMQ_CONFIG_DATAPATH" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.dataPath=$ROCKETMQ_CONFIG_DATAPATH"
[ -n "$ROCKETMQ_CONFIG_ENABLEDASHBOARDCOLLECT" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.enableDashBoardCollect=$ROCKETMQ_CONFIG_ENABLEDASHBOARDCOLLECT"
[ -n "$ROCKETMQ_CONFIG_ISVIPCHANNEL" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.isVIPChannel=$ROCKETMQ_CONFIG_ISVIPCHANNEL"
[ -n "$ROCKETMQ_CONFIG_TIMEOUTMILLIS" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.timeoutMillis=$ROCKETMQ_CONFIG_TIMEOUTMILLIS"
[ -n "$ROCKETMQ_CONFIG_USETLS" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.useTLS=$ROCKETMQ_CONFIG_USETLS"
[ -n "$ROCKETMQ_CONFIG_PROXYADDR" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.proxyAddr=$ROCKETMQ_CONFIG_PROXYADDR"
[ -n "$ROCKETMQ_CONFIG_PROXYADDRS" ] && JAVA_ARGS="$JAVA_ARGS -Drocketmq.config.proxyAddrs=$ROCKETMQ_CONFIG_PROXYADDRS"

# 启动应用
exec java $JAVA_OPTS $JAVA_ARGS -jar /home/rocketmq-dashboard/rocketmq-dashboard.jar
