/*
 Classify facilities into equally sized groups of high, average, and low based
 on their revenue.
 Order by classification and facility name.
 */
select
  avgr.name,
  case
    when avgr.average = 1 then 'high'
    when avgr.average = 2 then 'average'
    when avgr.average = 3 then 'low'
  end as revenue
from
  (
    select
      f.name,
      ntile(3) over(
        order by
          sum(
            case
              when b.memid = 0 then b.slots * f.guestcost
              else b.slots * f.membercost
            end
          ) desc
      ) as average
    from
      facilities f
      inner join bookings b using(facid)
    group by
      f.name
  ) as avgr
order by
  avgr.average,
  avgr.name;
