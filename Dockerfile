FROM confluentinc/cp-kafka-connect:6.1.0 AS base

# FROM curlimages/curl:7.81.0 AS curler
# WORKDIR /app
# # RUN curl -sSLO https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar
# RUN curl -LJO https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar

# FROM base AS final
RUN mkdir -p /usr/share/java/plugins
RUN curl -LJO https://github.com/GoogleCloudPlatform/pubsub/releases/download/v0.11-alpha/pubsub-kafka-connector.jar
COPY --chown=root:root pubsub-kafka-connector.jar /usr/share/java/plugins/pubsub-kafka-connector.jar