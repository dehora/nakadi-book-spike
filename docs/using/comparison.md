## Comparison to Other Systems

In this section, we'll look at how Nakadi fits in with the stream broker/processing ecosystems. Notably we'll compare it to Apache Kafka, as that's a common question, but also look briefly at the main cloud offerings in this area.

### Apache Kafka

Relative to Apache Kafka, Nakadi provides a number of benefits while still leveraging the raw power of Kafka as its internal broker. 

- Nakadi uses HTTP for communications. This lets microservices to maintain their boundaries and avoids forcing a shared technology dependency on producers and consumers - if you can speak HTTP you can use Nakadi and communicate with other services. This is a fairly subtle point, but Nakadi is optimised for general microservices integration and message passing, and not just handing off data to analytics subsystems. This means it needs to be available to as many different runtimes and stacks as possible, hence HTTP becomes the de-facto choice.

- An event type registry with schema validation. Producers can define event types using JSON Schema. Having events validated against a published schema allows consumers to know they will.  There are projects in the Kafka ecosystem from Confluent that provide similar features such as the rest-proxy and the schema-registry, but they're slightly optimised for analytics, and not quite ideal for microservices where its more common to use regular JSON rather than Avro. The schema registry in particular is dependent on Avro. Also the consumer connection model for the rest-proxy requires clients are pinned to servers which complicates clients - the hope for the Nakadi is that it's managed susbcription API (the "hugh level" API) when it's available, will not require session affinity in this way.

- Inbuilt event types. Nakadi also optional support for events that describe business processes and data changes. These provide common primitives for event identity, timestamps, causality, operations on data and header propagation. Teams could define their own structures, but there's value in having some basic things that consumers and producers can coordinate on independent of the payload, and which are being checked before being propagated to multiple consumers.

- Operations is also a factor in Nakadi's design. Managing upgrades to systems like Kafka becomes easier when technology sits behind an API and isn't a shared dependency between microservices. Asychronous event delivery can be a simpler overall option for a microservice architecture compared to synchronized and deep call paths that have to be mitigated with caches, bulkheads and circuit breakers.

- Nakadi is designed to support autonomous service teams. In Zalando, where Nakadi originated, each team has autonomy and control of their microservices stack to let them move quickly and take ownership. When running on AWS, this extends all the way down - every team has their own account structure, and to ensure a level of security and compliance teams run standard AMIs and constrain how they interact to HTTPS using OAuth2 access controls. This means we tend to want to run any shared infrastructure as a service with a HTTP based interface. Granted, not everyone has this need - many shops on AWS won't have per-team account structures and will tend to use a smaller number of shared environments, but we've found it valulable to be able leverage the power of systems like Kafka in a way that fits in with this service architecture. 

- Nakadi has some characteristics in common with Kafka, which is to be expected as the Kafka community has done an excellent job in defining the space. The logical model is basically the same - streams have partitions, messages in a partition maintain their order, but there's no order across partitions. One producer can send an event to be read by multiple consumers and consumers have access to offset data that they can checkpoint. There are also some differences. For example Nakadi doens't expose Topics as a concept in its API. Instead there are Event Types that define structure and ownership details as well as the stream. Also consumers receive messages in batches and each batch is checkpointed rather than an individual message.

In short, Nakadi is best seen as a complement to Kafka. It allows teams to use Kafka within their own boundaries but not be forced into sharing it as a global dependency.

### Google Pub/Sub



### AWS Kinesis

### Azure Event Hub

