# Nakadi API Definition


<a name="api-overview"></a>
## Overview
In Nakadi every Event has an EventType, and a **stream** of Events is exposed for each registered
EventType.

An EventType defines properties relevant for the operation of its associated stream, namely:

* The **schema** of the Event of this EventType. The schema defines the accepted format of Events of an
EventType and will be, if so desired, enforced by Nakadi. Usually Nakadi will respect the schema for
the EventTypes in accordance to how an owning Application defines them.

* The expected **validation** and **enrichment** procedures upon reception of an Event.
Validation define conditions for the acceptance of the incoming Event and are strictly enforced by
Nakadi. Usually the validation will enforce compliance of the payload (or part of it) with the defined
schema of its EventType. Enrichment specify properties that are added to the payload (body) of the Event
before persisting it. Usually enrichment affects the metadata of an Event but is not limited to.

* The **ordering** expectations of Events in this stream. Each EventType will have its Events stored in
an underlying logical stream (the Topic) that is physically organized in disjoint collections of
strictly ordered Events (the Partition). The EventType defines the field that acts as evaluator of the
ordering (that is, its partition key); this ordering is guaranteed by making Events whose partition
key resolves to the same Partition (usually a hash function on its value) be persisted strictly ordered
in a Partition.
In practice this means that all Events within a Partition have their relative order guaranteed: Events
(of a same EventType) that are *about* a same data entity (that is, have the same value on its Partition
key) reach always the same Partition, the relative ordering of them is secured. This mechanism implies
that no statements can be made about the relative ordering of Events that are in different partitions.

Except for defined enrichment rules, Nakadi will never manipulate the content of any Event.


### Version information
*Version* : 0.5.1



