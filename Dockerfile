FROM confluentinc/cp-kafka-connect:6.1.0 AS base

FROM curlimages/curl:7.81.0 AS curler
WORKDIR /download
# RUN curl -sSLO https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar
RUN sudo curl -LJO https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar

FROM base AS final
RUN mkdir -p /usr/share/java/plugins
# RUN curl -sSL https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar -o pubsub-kafka-connector.jar
COPY --from=curler --chown=root:root /download/pubsub-kafka-connector.jar /usr/share/java/plugins/pubsub-kafka-connector.jar