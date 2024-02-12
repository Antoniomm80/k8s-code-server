FROM node:18.0-alpine3.15
LABEL maintainer="Antonio MM"

RUN <<EOF
echo "Code server NPM Installation..."
echo "Installing Python..."
apk add alpine-sdk bash libstdc++ libc6-compat krb5-dev
echo "Installing Python..."
apk add --no-cache python3 py3-pip
echo "Installing Git..."
apk add git
echo "Setting python npm config ..."
npm config set python python3
echo "Installing Code Server..."
npm install --global code-server --unsafe-perm
echo "Setting up code server..."
EOF

COPY ./config/config.yaml /root/.config/code-server/config.yaml
ENTRYPOINT ["code-server"]


