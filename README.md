# Nakadi

Nakadi is a distributed, open source event broker. The project is being developed by [Zalando](https://zalando.github.io/) and is available on [Github](https://github.com/zalando/nakadi). 

### Why Nakadi?

The goal of Nakadi is to enable convenient development of event-driven applications and asynchronous microservices by allowing producers to publish streams of event data to multiple consumers, without direct integration. It does this by exposing a [HTTP API](/api/nakadi-event-bus-api.yaml) to let microservices to maintain their boundaries and not force a particular technology dependency on producers and consumers - if you can speak HTTP you can use Nakadi.

Operations is also a factor behind Nakadi's design. Managing upgrades to systems like Kafka becomes easier when technology sits behind an API and isn't a shared dependency between microservices. Operationally, asychronous event delivery can be a simpler overall option for a microservice architecture compared to synchronized and deep call paths that have to be mitigated with caches, bulkheads and circuit breakers. 

### Features

- **A secured HTTP API.** This allows microservices teams to maintain service boundaries, and not directly depend on any specific message broker technology. Access to the API can be managed and secured using OAuth scopes.

- **An event type registry.** Events sent to Nakadi can be defined with a schema and managed via a registry. Events can be validated before they are distributed to consumers.
 
- **Inbuilt event types.** Nakadi also has optional support for events describing business processes and data changes using standard primitives for identity, timestamps, event types, and causality. 

-  **Low latency event delivery.** Once a publisher sends an event using a simple HTTP POST, consumers can be pushed to via a streaming HTTP connection, allowing near real-time event processing. The consumer connection has keepalive controls and support for managing stream offsets. 

- **Compatibility with the [STUPS project](https://stups.io/).** STUPS is Zalando's open source platform infrastructure for running and securing microservices on AWS.

- **Built on proven infrastructure.** Nakadi uses the excellent [Apache Kafka](http://kafka.apache.org/) as its internal message broker and the also excellent PostgreSQL as a backing database. 
 
The section ["Comparison to Other Systems"](./docs/using/comparison.html) describes Nakadi relative to systems such as Apache Kafka, AWS Kinesis, Google Pub/Sub and 

### Contributing
 
Nakadi accepts contributions from the open-source community. Please see the 
 [project issue tracker](https://github.com/zalando/nakadi/issues) for things to work on.
 
Before making a contribution, please let us know by posting a comment to the relevant issue. And if you would like to propose a new feature, do start a new issue explaining the feature you’d like to contribute.

### About

This book is generated using Gitbook and published to GitHub Pages via [a Travis CI build](https://travis-ci.org/dehora/nakadi-book-spike). The project is [here](https://github.com/dehora/nakadi-book-spike) and the toolchain is described [here](https://github.com/dehora/nakadi-book-spike/blob/master/HOWTO.md). The project has an [MIT License](https://github.com/dehora/nakadi-book-spike/blob/master/LICENSE).
 



