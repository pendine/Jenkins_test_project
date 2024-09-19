# 베이스 이미지로 Java 실행 환경 사용
FROM openjdk:17-jdk-slim

LABEL authors="neokin"

# 작업 디렉토리 설정
WORKDIR /app

# WAR 파일을 컨테이너로 복사
COPY build/libs/*.war app.war

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.war"]