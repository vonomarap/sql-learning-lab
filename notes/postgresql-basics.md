# PostgreSQL Basics

## Focus

Use PostgreSQL when you need strong relational features, good indexing options, JSON support, and modern SQL features such as window functions and common table expressions.

## Practical Checklist

- create explicit primary keys
- index foreign keys used in joins
- use `EXPLAIN` before adding indexes blindly
- prefer transactions around related writes
- keep schema names meaningful in multi-domain databases

## Useful Commands

```sql
\dt
\dn
\d clinic.cases
EXPLAIN ANALYZE SELECT * FROM clinic.cases;
```
