SET 'auto.offset.reset'='earliest';

create stream if not exists actions_stream (
    id varchar,
    userId varchar,
    action varchar
) with (kafka_topic='logging.audit', VALUE_FORMAT='AVRO');

create table action_counts with (kafka_topic='action_counts')
    as select action,
              count(action) as total_actions
from actions_stream
group by action
emit changes;
