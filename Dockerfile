FROM node:18
LABEL maintainer="Antonio MM"

RUN <<EOF
echo "Code server NPM Installation..."
echo "Installing Python..."
apt-get update
echo "Installing dependencies..."
apt-get install curl zip unzip -y
echo "Installing Python..."
apt-get install python3 -y
echo "Installing Git..."
apt-get install git -y
echo "Setting python npm config ..."
npm config set python python3
echo "Installing Code Server..."
npm install --global code-server --unsafe-perm
echo "Setting up code server..."
EOF



RUN groupadd developers && useradd devpi --create-home && usermod -a -G developers devpi
USER devpi
SHELL ["/bin/bash", "-c"]
#RUN <<EOF
#curl -s "https://get.sdkman.io" | bash
#EOF
#RUN source /home/devpi/.sdkman/bin/sdkman-init.sh
#RUN sdk install java 21.0.2-librca && sdk install maven


COPY ./config/config.yaml /home/devpi/.config/code-server/config.yaml
ENTRYPOINT ["code-server"]


