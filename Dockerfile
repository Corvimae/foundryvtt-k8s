FROM node:12-alpine

# This is where the app data is stored (should not require a volume)
ENV FOUNDRY_APP_DIR=/home/foundry/app
# This is where persistence data is stored (make it a volume)
ENV FOUNDRY_DATA_DIR=/home/foundry/data
ENV UID=1000
ENV GUID=1000

# Change to foundry user
RUN deluser node
RUN adduser -u $UID -D foundry

# Set up directories
USER foundry
RUN mkdir -p ${FOUNDRY_APP_DIR}
RUN mkdir -p ${FOUNDRY_DATA_DIR}

# Fetch (or copy) and extract application
WORKDIR ${FOUNDRY_APP_DIR}
# (1) If you already have the zip, place it in this directory and change the next line to COPY
COPY foundryvtt*.zip .
RUN unzip foundryvtt*.zip
RUN rm foundryvtt*.zip

# the Foundry VTT node application round on port 30000 by default
EXPOSE 30000

CMD node ${FOUNDRY_APP_DIR}/resources/app/main.js --headless --dataPath=${FOUNDRY_DATA_DIR}