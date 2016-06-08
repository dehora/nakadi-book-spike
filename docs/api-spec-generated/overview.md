# Nakadi API Definition


## API Reference

The Nakadi API is specified using an [Open API definition](https://github.com/zalando/nakadi/blob/nakadi-jvm/api/nakadi-event-bus-api.yaml).  This section provides an API reference and adds context, but the Open API definition should be considered authoritative. You can learn more about Open API from its website, [https://openapis.org](openapis.org).

For a high level view on using the API see the section ["Using Nakadi"](./using.html).


<a name="overview"></a>
## Overview
In Nakadi every Event has an EventType, and a **stream** of Events is 
created for each registered EventType.

An EventType defines properties relevant for the operation of its a
ssociated stream, namely:

* The **schema** of the Event of this EventType. The schema defines the 
accepted format of Events of an EventType and will be, if requested, 
enforced by Nakadi. The exact schema an event conforms to depends on 
its category - each category has a different pre-defined schema to 
which the event type's declared schema is combined to create an "effective 
schema". 

* The expected **validation** and **enrichment** procedures upon reception 
of an Event. Validation define conditions for the acceptance of the 
incoming Event and are strictly enforced by Nakadi. Enrichment specifies 
properties that are added to the payload (body) of the Event
before persisting it. Usually enrichment affects the metadata of an Event.

* The **partitioning** expectations of Events in this stream. Each EventType 
will have its Events stored in an underlying logical stream (the Topic) 
that is physically organized into strictly ordered logs
Events (Partitions). The EventType can define the fields that act as 
part of partition key; partial ordering is guaranteed by making Events 
whose partition key resolves to the same partition placed into that 
partition in the order the events arrive.

In practice this means that all Events within a Partition have their 
relative order guaranteed: Events (of a same EventType) that are 
*about* a same data entity (that is, have the same value on its Partition
key) always go the same Partition. The order across partitions is undefined; 
in particular consumers can end up altering the cross-partition order based 
on the how they use cursors to consume a stream.

Except for defined enrichment rules, Nakadi will never manipulate the 
content of any Event.


### Version information
*Version* : 0.5.1



