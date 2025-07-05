# SQL Learning Lab

Public SQL learning repository with scripts, notes, exercises, snippets, and PostgreSQL training datasets.

## Goals

- Keep SQL practice materials in one place
- Organize scripts by topic and dialect
- Store notes that explain the reasoning behind each query pattern
- Include realistic PostgreSQL dumps for local practice
- Provide a repo that is useful both for study and portfolio review

## Repository Layout

```text
.
|-- datasets/
|   `-- postgres/
|-- exercises/
|   `-- postgresql/
|-- notes/
|-- scripts/
|   |-- generic/
|   |-- mysql/
|   `-- postgresql/
`-- snippets/
```

## Dialects

- `generic`: ANSI-style examples that are portable across engines
- `postgresql`: PostgreSQL-specific DDL, DML, indexes, and restore notes
- `mysql`: reserved for future MySQL-focused material

## Included Topics

- DDL
- DML
- joins
- aggregation
- subqueries
- common table expressions
- window functions
- indexes
- transactions

## Working With The PostgreSQL Dumps

The files in `datasets/postgres/` are PostgreSQL custom-format dumps. They are not plain SQL files, so restore them with `pg_restore`.

Example:

```bash
createdb clinic_lab
pg_restore --clean --if-exists --no-owner --dbname=clinic_lab datasets/postgres/clinic-training-2025-06-01.dump
```

To inspect the objects without restoring:

```bash
pg_restore --list datasets/postgres/clinic-training-2025-06-01.dump
```

## Suggested Study Flow

1. Read the matching topic note in `notes/`
2. Run the example scripts from `scripts/`
3. Solve the task in `exercises/`
4. Compare with `solution.sql`
5. Use the dump files for more realistic exploration in PostgreSQL

## Current Status

- PostgreSQL materials: ready
- Generic SQL materials: ready
- MySQL materials: planned scaffold in place

## Next Additions

- MySQL query equivalents
- more interview-style exercises
- normalization examples
- performance tuning checklists
