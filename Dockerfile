# syntax=docker/dockerfile:1

FROM eclipse-temurin:21-jdk

LABEL version="1.13.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Skies 2"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/49/4951517d1bd2376e48d280427f95fd313c7aa778bddff582296651cfae7d7a9a.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Skies-2:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Skies 2 v1.13.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms6144m -Xmx8092m"

CMD ["/launch.sh"]