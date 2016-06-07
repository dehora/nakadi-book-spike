# Nakadi

Nakadi is a distributed event broker. 

## Why Nakadi?

The goal of Nakadi is to enable convenient development of event-driven applications and asynchronous microservices by allowing producers to publish streams of event data to multiple consumers, without direct integration. It does this by exposing a [HTTP API](/api/nakadi-event-bus-api.yaml) to allow microservices to maintain their boundaries and not force a particular technology dependency on producers and consumers - if you can speak HTTP you can use Nakadi.

## Features

- A secured HTTP API. This allows microservices teams to maintain service boundaries, and not directly depend on any specific message broker technology. Access to the API can be managed and secured using OAuth scopes.

- An event type registry. Events sent to Nakadi can be defined with a schema and managed via a registry. Events can be validated before they are distributed to consumers.
 
- Inbuilt event types. Nakadi also has optional support for events describing business processes and data changes using standard primitives for identity, timestamps, event types, and causality. 

-  Low latency event delivery. Once a publisher sends an event using a simple HTTP POST, consumers can be pushed to via a streaming HTTP connection, allowing near real-time event processing. The consumer connection has keepalive controls and support for managing stream offsets. 

- Compatability with the [STUPS project](https://stups.io/). STUPS is Zalando's opne source platform infrastructure for running and securing microservices on AWS.

- Built on proven infrastructure. Nakadi uses the excellent [Apache Kafka](http://kafka.apache.org/) as its internal message broker and the also excellent PostgreSQL as a backing database. 

## Roadmap

In the future the project will look at:

* Discoverability of the resource structures flowing into the broker.

* A managed API that allows consumers to subscribe and have stream offsets stored by the server.

* Filtering of events for subscribing consumers.

* Role base access control to data. 

* Support for different streaming technologies and engines. 

* A common envelope to allow arbitrary non-JSON message formats.
 




