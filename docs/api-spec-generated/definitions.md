
## Objects 

  - [BatchItemResponse](#batchitemresponse)
  - [BusinessEvent](#businessevent)
  - [Cursor](#cursor)
  - [DataChangeEvent](#datachangeevent)
  - [DataChangeEventQualifier](#datachangeeventqualifier)
  - [Event](#event)
  - [EventMetadata](#eventmetadata)
  - [EventStreamBatch](#eventstreambatch)
  - [EventType](#eventtype)
  - [EventTypeSchema](#eventtypeschema)
  - [EventTypeStatistics](#eventtypestatistics)
  - [Metrics](#metrics)
  - [Partition](#partition)
  - [Problem](#problem)


<a name="definitions"></a>
## Definitions

<a name="batchitemresponse"></a>
### BatchItemResponse
A status corresponding to one individual Event's publishing attempt.


|Name|Description|Schema|
|---|---|---|
|**detail**  <br>*optional*|Human readable information about the failure on this item. Items that <br>are not "submitted" should have a description.|string|
|**eid**  <br>*optional*|eid of the corresponding item. Will be absent if missing on the incoming Event.|string(uuid)|
|**publishing_status**  <br>*required*|Indicator of the submission of the Event within a Batch.<br><br>- "submitted" indicates successful submission, including commit on <br>the underlying broker.<br><br>- "failed" indicates the message submission was not possible and can <br>be resubmitted if so desired.<br><br>- "aborted" indicates that the submission of this item was not <br>attempted any further due to a failure on another item in the batch.|enum (submitted, failed, aborted)|
|**step**  <br>*optional*|Indicator of the step in the publishing process this Event reached.<br><br>In Items that "failed" means the step of the failure.<br><br>- "none" indicates that nothing was yet attempted for the publishing <br>of this Event. Should be present only in the case of aborting the <br>publishing during the validation of another (previous) Event.<br><br>- "validating", "enriching", "partitioning" and "publishing" indicate <br>all the corresponding steps of the publishing process.|enum (none, validating, enriching, partitioning, publishing)|


<a name="businessevent"></a>
### BusinessEvent
A Business Event.

Usually represents a status transition in a Business process.

*Polymorphism* : Composition


|Name|Description|Schema|
|---|---|---|
|**metadata**  <br>*required*||[metadata](#businessevent-metadata)|

<a name="businessevent-metadata"></a>
**metadata**

|Name|Description|Schema|
|---|---|---|
|**eid**  <br>*required*|Identifier of this Event.<br><br>Clients MUST generate this value and it SHOULD be guaranteed to <br>be unique from the perspective of the producer. Consumers may <br>use this value to assert uniqueness of reception of the Event.  <br>**Example** : `"105a76d8-db49-4144-ace7-e683e8f4ba46"`|string(uuid)|
|**event_type**  <br>*optional*|The EventType of this Event. This is enriched by Nakadi on <br>reception of the Event based on the endpoint where the Producer <br>sent the Event to.<br><br>If provided MUST match the endpoint. Failure to do so will cause <br>rejection of the Event.  <br>**Example** : `"pennybags.payment-business-event"`|string|
|**flow_id**  <br>*optional*|The flow-id of the producer of this Event. As this is usually <br>a HTTP header, this is enriched from the header into the metadata <br>by Nakadi to avoid clients having to explicitly copy this.  <br>**Example** : `"JAh6xH4OQhCJ9PutIV_RYw"`|string|
|**occurred_at**  <br>*required*|Timestamp of creation of the Event generated by the producer.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|
|**parent_eids**  <br>*optional*||< string(uuid) > array|
|**partition**  <br>*optional*|Indicates the partition assigned to this Event.<br><br>Required to be set by the client if partition strategy of the <br>EventType is 'user_defined'.  <br>**Example** : `"0"`|string|
|**received_at**  <br>*optional*|Timestamp of the reception of the Event by Nakadi. This is <br>enriched upon reception of the Event.<br>If set by the producer Event will be rejected.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|


<a name="cursor"></a>
### Cursor

|Name|Description|Schema|
|---|---|---|
|**offset**  <br>*required*|Offset of the event being pointed to.|string|
|**partition**  <br>*required*|Id of the partition pointed to by this cursor.|string|


<a name="datachangeevent"></a>
### DataChangeEvent
A Data change Event.

Represents a change on a resource.

*Polymorphism* : Composition


|Name|Description|Schema|
|---|---|---|
|**data_op**  <br>*required*|The type of operation executed on the entity.<br>* C: Creation<br>* U: Update<br>* D: Deletion<br>* S: Snapshot|enum (C, U, D, S)|
|**data_type**  <br>*required*|**Example** : `"pennybags:order"`|string|
|**metadata**  <br>*required*||[metadata](#datachangeevent-metadata)|

<a name="datachangeevent-metadata"></a>
**metadata**

|Name|Description|Schema|
|---|---|---|
|**eid**  <br>*required*|Identifier of this Event.<br><br>Clients MUST generate this value and it SHOULD be guaranteed to <br>be unique from the perspective of the producer. Consumers may <br>use this value to assert uniqueness of reception of the Event.  <br>**Example** : `"105a76d8-db49-4144-ace7-e683e8f4ba46"`|string(uuid)|
|**event_type**  <br>*optional*|The EventType of this Event. This is enriched by Nakadi on <br>reception of the Event based on the endpoint where the Producer <br>sent the Event to.<br><br>If provided MUST match the endpoint. Failure to do so will cause <br>rejection of the Event.  <br>**Example** : `"pennybags.payment-business-event"`|string|
|**flow_id**  <br>*optional*|The flow-id of the producer of this Event. As this is usually <br>a HTTP header, this is enriched from the header into the metadata <br>by Nakadi to avoid clients having to explicitly copy this.  <br>**Example** : `"JAh6xH4OQhCJ9PutIV_RYw"`|string|
|**occurred_at**  <br>*required*|Timestamp of creation of the Event generated by the producer.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|
|**parent_eids**  <br>*optional*||< string(uuid) > array|
|**partition**  <br>*optional*|Indicates the partition assigned to this Event.<br><br>Required to be set by the client if partition strategy of the <br>EventType is 'user_defined'.  <br>**Example** : `"0"`|string|
|**received_at**  <br>*optional*|Timestamp of the reception of the Event by Nakadi. This is <br>enriched upon reception of the Event.<br>If set by the producer Event will be rejected.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|


<a name="datachangeeventqualifier"></a>
### DataChangeEventQualifier
Indicators of a `DataChangeEvent`'s referred data type and the type 
of operations done on them.


|Name|Description|Schema|
|---|---|---|
|**data_op**  <br>*required*|The type of operation executed on the entity.<br>* C: Creation<br>* U: Update<br>* D: Deletion<br>* S: Snapshot|enum (C, U, D, S)|
|**data_type**  <br>*required*|**Example** : `"pennybags:order"`|string|


<a name="event"></a>
### Event
**Note** The Event definition will be externalized in future versions 
of this document.

A basic payload of an Event. The actual schema is dependent on the 
information configured for the EventType, as is its enforcement 
(see POST /event-types). Setting of metadata properties are
dependent on the configured enrichment as well.

For explanation on default configurations of validation and enrichment, 
see documentation of `EventType.category`.

For concrete examples of what will be enforced by Nakadi see the 
objects BusinessEvent and DataChangeEvent below.

*Type* : object


<a name="eventmetadata"></a>
### EventMetadata
Metadata for this Event.

Contains commons fields for both Business and DataChange Events. Most 
are enriched by Nakadi upon reception, but they in general might be 
set by the client.


|Name|Description|Schema|
|---|---|---|
|**metadata**  <br>*required*||[metadata](#eventmetadata-metadata)|

<a name="eventmetadata-metadata"></a>
**metadata**

|Name|Description|Schema|
|---|---|---|
|**eid**  <br>*required*|Identifier of this Event.<br><br>Clients MUST generate this value and it SHOULD be guaranteed to <br>be unique from the perspective of the producer. Consumers may <br>use this value to assert uniqueness of reception of the Event.  <br>**Example** : `"105a76d8-db49-4144-ace7-e683e8f4ba46"`|string(uuid)|
|**event_type**  <br>*optional*|The EventType of this Event. This is enriched by Nakadi on <br>reception of the Event based on the endpoint where the Producer <br>sent the Event to.<br><br>If provided MUST match the endpoint. Failure to do so will cause <br>rejection of the Event.  <br>**Example** : `"pennybags.payment-business-event"`|string|
|**flow_id**  <br>*optional*|The flow-id of the producer of this Event. As this is usually <br>a HTTP header, this is enriched from the header into the metadata <br>by Nakadi to avoid clients having to explicitly copy this.  <br>**Example** : `"JAh6xH4OQhCJ9PutIV_RYw"`|string|
|**occurred_at**  <br>*required*|Timestamp of creation of the Event generated by the producer.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|
|**parent_eids**  <br>*optional*||< string(uuid) > array|
|**partition**  <br>*optional*|Indicates the partition assigned to this Event.<br><br>Required to be set by the client if partition strategy of the <br>EventType is 'user_defined'.  <br>**Example** : `"0"`|string|
|**received_at**  <br>*optional*|Timestamp of the reception of the Event by Nakadi. This is <br>enriched upon reception of the Event.<br>If set by the producer Event will be rejected.  <br>**Example** : `"1996-12-19T16:39:57-08:00"`|string(date-time)|


<a name="eventstreambatch"></a>
### EventStreamBatch
One chunk of events in a stream. A batch consists of an array of 
`Event`s plus a `Cursor` pointing to the offset of the last Event 
in the stream.

The size of the array of Event is limited by the parameters used to 
initialize a Stream.

If acting as a keep alive message (see `GET /event-type/{name}/events`) 
the events array will be omitted.

Sequential batches might present repeated cursors if no new events 
have arrived.


|Name|Description|Schema|
|---|---|---|
|**cursor**  <br>*required*||[Cursor](definitions.md#cursor)|
|**events**  <br>*optional*||< [Event](definitions.md#event) > array|


<a name="eventtype"></a>
### EventType
An event type defines the schema and its runtime properties.


|Name|Description|Schema|
|---|---|---|
|**category**  <br>*required*|Defines the category of this EventType.<br><br>The value set will influence, if not set otherwise, the default <br>set of validation-strategies, enrichment-strategies, and the effective <br>schema for validation in the following way:<br><br>- `undefined`: No predefined changes apply. The effective schema for <br>the validation is exactly the same as the `EventTypeSchema`.<br>  Default validation_strategy for this `EventType` is `['schema-validation']`.<br><br>- `data`: Events of this category will be DataChangeEvents. The <br>effective schema during the validation contains `metadata`,<br>  and adds fields `data_op` and `data_type`. The passed <br>  EventTypeSchema defines the schema of `data`.<br><br>- `business`: Events of this category will be BusinessEvents. The <br>effective schema for validation contains `metadata` and any <br>additionally defined properties passed in the `EventTypeSchema` <br>directly on top level of the Event. If name conflicts arise, creation <br>of this EventType will be rejected. Default validation_strategy for <br>this `EventType` is `['schema-validation']`.|enum (undefined, data, business)|
|**data_key_fields**  <br>*optional*|Indicators of the path of the properties that constitute the primary <br>key (identifier) of the data within this Event.<br>If set MUST be a valid required field as defined in the schema.<br>(TBD should be required? Is applicable only to both Business and <br>DataChange Events?)|< string > array|
|**default_statistics**  <br>*optional*|Statistics of this EventType used for optimization purposes. Internal <br>use of these values might change over time.|object|
|**enrichment_strategies**  <br>*optional*|Determines the enrichment to be performed on an Event upon reception. <br>Enrichment is performed once upon reception (and after validation) of <br>an Event and is only possible on fields that are not defined on the <br>incoming Event.<br><br>For event types in categories 'business' or 'data' it's mandatory to <br>use METADATA_ENRICHMENT strategy. For 'undefined' event types it's <br>not possible to use this strategy, since metadata field is not required.<br><br>See documentation for the write operation for details on behaviour <br>in case of unsuccessful enrichment.|< enum (METADATA_ENRICHMENT) > array|
|**name**  <br>*required*|Name of this EventType. Encodes the owner/responsible for this EventType.  <br>**Example** : `"order.ORDER_CANCELLED"`|string|
|**owning_application**  <br>*required*|Indicator of the (Stups) Application owning this `EventType`.  <br>**Example** : `"price-service"`|string|
|**partition_key_fields**  <br>*optional*|Required when 'partition_resolution_strategy' is set to 'hash'. Must <br>be absent otherwise. Indicates the fields used for evaluatiion the <br>partition of Events of this type.<br><br>If set it MUST be a valid required field as defined in the schema.|< string > array|
|**partition_strategy**  <br>*optional*|Determines how the assignment of the event to a partition <br>should be handled.<br><br>For details of possible values, see GET /registry/partition-strategies.  <br>**Default** : `"random"`|string|
|**schema**  <br>*required*|The schema for this EventType. Submitted events will be validated <br>against it.|object|
|**validation_strategies**  <br>*optional*|Determines the validation that has to be executed upon reception of <br>Events of this type. Events are rejected if any of the rules fail <br>(see details of Problem response on the Event publishing methods).<br><br>Rule evaluation order is the same as in this array.<br><br>If not explicitly set, default value will respect the definition <br>of the `EventType.category`.|< string > array|


<a name="eventtypeschema"></a>
### EventTypeSchema

|Name|Description|Schema|
|---|---|---|
|**schema**  <br>*required*|The schema as string in the syntax defined in the field type. Failure <br>to respect the syntax will fail any operation on an EventType.<br><br>To have a generic, undefined schema it is possible to define the <br>schema as `"schema": "{\"additionalProperties\": true}"`.|string|
|**type**  <br>*required*|The type of schema definition. Currently only JSON_SCHEMA v4 is <br>supported, but in the future there<br>could be others.|enum (JSON_SCHEMA)|


<a name="eventtypestatistics"></a>
### EventTypeStatistics
Operational statistics for an EventType. This data is generated by Nakadi 
based on the runtime and might be used to guide changes in internal 
parameters.


|Name|Description|Schema|
|---|---|---|
|**message_size**  <br>*required*|Average message size for each Event of this EventType. Includes in <br>the count the whole serialized form of the event, including metadata.<br>Measured in bytes.|integer|
|**messages_per_minute**  <br>*required*|Write rate for events of this EventType. This rate encompasses all <br>producers of this EventType for<br>a Nakadi cluster.<br><br>Measured in event count per minute.|integer|
|**read_parallelism**  <br>*required*|Amount of parallel readers (consumers) to this EventType.|integer|
|**write_parallelism**  <br>*required*|Amount of parallel writers (producers) to this EventType.|integer|


<a name="metrics"></a>
### Metrics
*Type* : object


<a name="partition"></a>
### Partition
Partition information. Can be helpful when trying to start a 
stream using an unmanaged API.

This information is not related to the state of the consumer clients.


|Name|Description|Schema|
|---|---|---|
|**newest_available_offset**  <br>*required*|An offset of the newest available Event in that partition. This <br>value will be changing upon reception of new events for this partition <br>by Nakadi.<br><br>This value can be used to construct a cursor when opening streams (see<br>`GET /event-type/{name}/events` for details).<br><br>Might assume the special name BEGIN, meaning a pointer to the offset <br>of the oldest available event in the partition.|string|
|**oldest_available_offset**  <br>*required*|An offset of the oldest available Event in that partition. This <br>value will be changing upon removal of Events from the partition <br>by the background archiving/cleanup mechanism.|string|
|**partition**  <br>*required*||string|


<a name="problem"></a>
### Problem

|Name|Description|Schema|
|---|---|---|
|**detail**  <br>*optional*|A human readable explanation specific to this occurrence of the problem.  <br>**Example** : `"Connection to database timed out"`|string|
|**instance**  <br>*optional*|An absolute URI that identifies the specific occurrence of the problem.<br>It may or may not yield further information if dereferenced.|string|
|**status**  <br>*required*|The HTTP status code generated by the origin server for this <br>occurrence of the problem.  <br>**Example** : `503`|integer(int32)|
|**title**  <br>*required*|A short, summary of the problem type. Written in English and <br>readable for engineers (usually not suited for non technical <br>stakeholders and not localized)  <br>**Example** : `"Service Unavailable"`|string|
|**type**  <br>*required*|An absolute URI that identifies the problem type.  When <br>dereferenced, it SHOULD provide human-readable API documentation <br>for the problem type (e.g., using HTML). This Problem object is <br>the same as provided by https://github.com/zalando/problem  <br>**Example** : `"http://httpstatus.es/503"`|string|



