with u as (
    select
        userId,
        sessionId,
        channel
    from {{ ref("user_session_channel") }}
    where sessionId is not null
), 
st as (
    select
        sessionId,
        ts
    from {{ ref("session_timestamp") }}
    where sessionId is not null
)

select 
    u.userId, 
    u.sessionId, 
    u.channel, 
    st.ts
from u
join st on u.sessionId = st.sessionId
