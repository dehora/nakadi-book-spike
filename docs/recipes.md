# Recipes and Patterns

_This section will feature patterns on how to use Nakadi and event stream processing in general._

Some ideas:

 - OrderedProducer: strong and weak ordering
 - StatefulConsumer: managing offsets locally
 - UsingPartitions: when to use which partition options
 - HighThroughputEventing: approaches to high volume events
 - ConsumerLeaseStealing: redistributing partition workloads in a cluster
 - CausalEventing: events that have causal relationships (happens-before)
 - EventTypeVersioning: approaches to versioning event types
 - SendAnything: approaches to send arbitrary content through Nakadi (incl Avro and Protobufs)
