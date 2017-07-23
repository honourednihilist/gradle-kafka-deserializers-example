# gradle-kafka-deserializers-example

This project is an example of how the [gradle-kafka-deserializers](https://github.com/honourednihilist/gradle-kafka-deserializers) plugin can be used. 

The example consists of two modules: 
1. _thrift-model_ - contains thrift classes definitions.
2. _kafka-deserializers_ - generates jar with thrift java classes and kafka deserializers for them.

[thrift-gradle-plugin](https://github.com/jruyi/thrift-gradle-plugin) is used to generate thrift java classes.
Here is how the plugins interaction is configured:

```groovy
Task compileThriftTask = project(':thrift-model').tasks.getByName('compileThrift')

kafkaDeserializers {
    sourceItems = compileThriftTask.getOutputs().files
}

generateThriftKafkaDeserializers.dependsOn(compileThriftTask)
``` 

Set the _THRIFT_ environment variable to let the build know where a thrift compiler is located:
```bash
$ export THRIFT=~/Programs/thrift-0.9.3/compiler/cpp/thrift
```

Assemble the project:
```bash
$ ./gradlew clean build
``` 

Put the created jar file into Kafka libs directory:
```bash
$ cp kafka-deserializers/build/libs/kafka-deserializers-0.1.0-SNAPSHOT.jar ~/Programs/kafka_2.10-0.10.1.0/libs/
```

Now you can use Kafka console consumer with generated deserializers:
```bash
$ ./kafka-console-consumer.sh --bootstrap-server localhost:6667 --topic test --max-messages 10 --property value.deserializer=com.github.honourednihilist.gradle.kafka.deserializers.example.model.gen.YourBaseStructThriftBinaryToJsonDeserializer
```
