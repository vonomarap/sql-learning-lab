# Department Programmers Dumps

This directory stores raw historical MySQL/MariaDB dump snapshots for the `department_programmers` database.

## Included Files

- `department_programmers_v3.sql`
- `department_programmers_v4.sql`

## Notes

- The files were imported verbatim from the source archive
- The headers identify them as phpMyAdmin exports from MariaDB
- `v4` is the later snapshot on the same export day

## Import

Example:

```bash
mysql -u root -p department_programmers < department_programmers_v4.sql
```

If the target database does not exist yet:

```bash
mysql -u root -p -e "CREATE DATABASE department_programmers;"
mysql -u root -p department_programmers < department_programmers_v4.sql
```
