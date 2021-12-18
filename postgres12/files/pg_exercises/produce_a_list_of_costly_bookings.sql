/*
 How can you produce a list of bookings on the day of 2012-09-14 which
 will cost the member (or guest) more than $30?
 Remember that guests have different costs to members(the listed costs are per
 half-hour 'slot'), and the guest user is always ID 0.
 Include in your output the name of the facility, the name of the member formatted
 as a single column, and the cost.
 Order by descending cost, and do not use any subqueries.
 */
select
  m.firstname || ' ' || m.surname as member,
  f.name as facility,
  case
    when m.memid = 0
    and (b.slots * f.guestcost) > 30.0 then b.slots * f.guestcost
    when m.memid > 0
    and (b.slots * f.membercost) > 30.0 then b.slots * f.membercost
    else 0
  end as cost
from
  members m
  inner join bookings b using(memid)
  inner join facilities f using(facid)
where
  b.starttime >= '2012-09-14'
  and b.starttime < '2012-09-15'
  and (
    (
      memid = 0
      and slots * guestcost > 30
    )
    or (
      memid > 0
      and slots * membercost > 30
    )
  )
order by
  cost desc;
