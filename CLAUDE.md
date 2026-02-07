# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Run Commands

### Backend (Java/Maven)

```bash
# Build (skip tests)
mvn clean package -Dmaven.test.skip=true

# Build with tests
mvn clean package

# Run with Maven
mvn spring-boot:run

# Run JAR directly
java -jar target/rocketmq-dashboard-2.1.1-SNAPSHOT.jar

# Run single test class
mvn test -Dtest=TopicControllerTest

# Run single test method
mvn test -Dtest=TopicControllerTest#testList

# Checkstyle validation
mvn checkstyle:check
```

### Frontend (React)

```bash
cd frontend-new

# Install dependencies
npm install

# Development server (port 3003)
npm start

# Build for production
npm run build

# Run tests
npm test
```

### Docker

```bash
# Build Docker image
mvn docker:build

# Run container
docker run -d --name rocketmq-dashboard \
  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=127.0.0.1:9876" \
  -p 8082:8082 \
  apacherocketmq/rocketmq-dashboard:latest
```

## Architecture Overview

This is a **front-end/back-end separated** web application for managing Apache RocketMQ clusters.

### Backend Structure (`src/main/java/org/apache/rocketmq/dashboard/`)

- **controller/** - REST API endpoints (Topic, Consumer, Producer, Message, Cluster, ACL, etc.)
- **service/** - Business logic layer with interfaces and `impl/` implementations
- **admin/** - MQAdmin connection pool management (`MqAdminExtObjectPool`, `MQAdminFactory`)
- **config/** - Spring configuration classes (`RMQConfigure` for RocketMQ settings, `SecurityConfig`)
- **model/** - Data models including `request/` DTOs and `trace/` for message tracing
- **permission/** - Role-based access control (`UserRoleEnum`, `PermissionAspect`)
- **task/** - Background tasks for dashboard data collection (`DashboardCollectTask`)
- **support/** - Global exception handling and response formatting

### Frontend Structure (`frontend-new/src/`)

- **pages/** - Page components (Dashboard, Topic, Consumer, Message, Cluster, ACL, etc.)
- **components/** - Reusable React components
- **api/remoteApi/** - Backend API calls via Axios
- **store/** - Redux state management (actions, reducers, context)
- **router/** - React Router configuration
- **i18n/** - Internationalization (Chinese/English)

### Key Integration Points

- Backend serves on port **8082**, frontend dev server on **3003**
- Frontend proxies API requests to backend during development
- Production build copies frontend assets to `target/classes/public`
- Maven `frontend-maven-plugin` handles Node.js installation and frontend build

## Configuration

### Main Config (`src/main/resources/application.yml`)

Key settings:
- `rocketmq.config.namesrvAddrs` - RocketMQ NameServer addresses (supports multiple clusters)
- `rocketmq.config.loginRequired` - Enable/disable authentication
- `rocketmq.config.authMode` - Authentication mode: `file` or `acl`
- `rocketmq.config.dataPath` - Data storage path for dashboard metrics

### Authentication

- File-based: Configure users in `${dataPath}/users.properties`
- ACL-based: Set `accessKey` and `secretKey` in application.yml
- Default credentials: `rocketmq` / `1234567`

## Code Style

- Checkstyle rules: `style/rmq_checkstyle.xml`
- Apache License header required on all Java files
- No `System.out.println` allowed
- No `//TODO` or `//FIXME` comments (must be resolved)

## Tech Stack

- **Backend**: Spring Boot 3.4.5, JDK 17, RocketMQ Client 5.3.3
- **Frontend**: React 19, Ant Design 5, Redux, ECharts
- **Testing**: JUnit 4, Mockito 3.3.3, Spring Boot Test
