# Generic Query Patterns

## Join First, Filter Second

Start from the table that represents the business question, join only the tables you need, and then filter the final row set.

## Aggregate With Intent

Use `GROUP BY` only when you really need summary rows. If you need detail rows plus totals or ranks, prefer window functions.

## EXISTS Over COUNT

For existence checks, `EXISTS` usually communicates intent better than `COUNT(*) > 0`.

## CTEs For Readability

Use common table expressions when they improve structure. Do not assume they are always faster.
