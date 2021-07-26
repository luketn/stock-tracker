export MAVEN_OPTS="-Xmx4g"

#mvn clean package -Pnative \
#    -Dquarkus.native.container-runtime=docker \
#    -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-native-image:20.3.0-java11

#mvn clean install \
#    -Dnative \
#    -Dquarkus.native.container-build=true \
#    -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-native-image:21.1-java16

#docker pull quay.io/quarkus/ubi-quarkus-native-image:21.1-java11

docker run --env LANG=C --platform linux/amd64 \
        --rm -v /Users/lthompson/IdeaProjects/stock-tracker/target/stock-tracker-1.0-SNAPSHOT-native-image-source-jar:/project:z \
        quay.io/quarkus/ubi-quarkus-native-image:20.3.0-java11 \
        -J-Djava.util.logging.manager=org.jboss.logmanager.LogManager \
        -J-Duser.language=en \
        -J-Duser.country=AU \
        -J-Dfile.encoding=UTF-8 \
        --initialize-at-build-time= \
        -H:InitialCollectionPolicy=com.oracle.svm.core.genscavenge.CollectionPolicy\$BySpaceAndTime \
        -H:+JNI \
        -H:+AllowFoldMethods \
        -jar stock-tracker-1.0-SNAPSHOT-runner.jar \
        -H:FallbackThreshold=0 \
        -H:+ReportExceptionStackTraces \
        -H:-AddAllCharsets \
        -H:EnableURLProtocols=http \
        -H:-UseServiceLoaderFeature \
        -H:+StackTrace stock-tracker-1.0-SNAPSHOT-runner
