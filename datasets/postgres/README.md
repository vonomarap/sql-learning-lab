# PostgreSQL Datasets

This folder contains PostgreSQL custom-format dumps based on a `clinic` schema.

## Files

- `clinic-training-2025-06-01.dump`
- `clinic-training-2025-06-04.dump`

## Restore

```bash
createdb clinic_lab
pg_restore --clean --if-exists --no-owner --dbname=clinic_lab clinic-training-2025-06-01.dump
```

## Preview Objects

```bash
pg_restore --list clinic-training-2025-06-01.dump
```

## Notes

- These files are not plain SQL scripts
- Use `pg_restore`, not `psql -f`
- The dump content includes tables such as `clinic.cases` and `clinic.diagnosis`
