FROM node

RUN npm i -g serve@">=9.2.0"

ADD ./build/ /build/

ENTRYPOINT ["serve", "-l", "8081", "-s", "build"]