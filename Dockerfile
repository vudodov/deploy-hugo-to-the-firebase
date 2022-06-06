FROM klakegg/hugo:0.93.2-ext-nodejs

LABEL maintainer="Valerii Udodov (https://valerii-udodov.com)"

# Downloading & Installing Firebase
RUN npm install -g firebase-tools

# Start the building & deploying now
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
