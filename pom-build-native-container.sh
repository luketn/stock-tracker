export MAVEN_OPTS="-Xmx4g"
export DOCKER_DEFAULT_PLATFORM="linux/amd64"
mvn clean package -Pnative -Dquarkus.native.container-build=true
