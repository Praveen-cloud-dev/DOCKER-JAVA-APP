#base image ko pull karega jisme req tools and libraries hogi
FROM openjdk:17-jdk-alpine

#folder create karege jaha app ka code store hoga
WORKDIR /app

#souce code ko copy karege app me jo ki hamara container hai
COPY src/Main.java /app/Main.java

#compile karege application code ko
RUN javac Main.java

#run karege application , here we injecting command
CMD ["java","Main"]


