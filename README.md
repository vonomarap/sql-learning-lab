# SQL Learning Lab

Public SQL learning repository with scripts, notes, exercises, snippets, PostgreSQL training datasets, and historical MySQL/MariaDB plus Oracle practice materials.

## Goals

- Keep SQL practice materials in one place
- Organize scripts by topic and dialect
- Store notes that explain the reasoning behind each query pattern
- Include realistic PostgreSQL dumps for local practice
- Provide a repo that is useful both for study and portfolio review

## Repository Layout

```text
.
|-- archive/
|   `-- oracle/
|       `-- oracle-sql-hw/
|-- datasets/
|   |-- mysql/
|   |   `-- department-programmers/
|   `-- postgres/
|-- exercises/
|   |-- mysql/
|   |   `-- archive/
|   |       `-- department-programmers/
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
- `mysql`: historical MariaDB/MySQL archive materials plus planned curated examples
- `oracle`: historical Oracle homework bundle preserved as a single archive block

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

## Archived MySQL/MariaDB Materials

The repository now also includes a historical `department_programmers` block:

- `datasets/mysql/department-programmers/` for raw SQL dump snapshots
- `exercises/mysql/archive/department-programmers/` for archived task and query packs

These files are preserved verbatim from the source archive and documented with local README files.

## Archived Oracle Materials

The repository also includes a single Oracle homework archive bundle:

- `archive/oracle/oracle-sql-hw/` for raw Oracle SQL, PDF homework sheets, slides, and plan materials

This block is preserved as a single historical archive instead of being split into curated topic folders.

## Suggested Study Flow

1. Read the matching topic note in `notes/`
2. Run the example scripts from `scripts/`
3. Solve the task in `exercises/`
4. Compare with `solution.sql`
5. Use the dump files for more realistic exploration in PostgreSQL

## Current Status

- PostgreSQL materials: ready
- Generic SQL materials: ready
- MySQL historical materials: imported
- MySQL curated examples: planned scaffold in place
- Oracle historical archive bundle: imported

## Next Additions

- MySQL curated query equivalents
- Oracle curated exercises extracted from the archive
- more interview-style exercises
- normalization examples
- performance tuning checklists
