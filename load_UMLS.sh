#!/usr/bin zsh

# change the user and database according to your parctice.

echo "Loading UMLS 2020 tables and data"
psql -U postgres -d umls -f pgsql_all_tables.sql
echo "Tables loaded"
psql -U postgres -d umls -f pgsql_index.sql
echo "Indexing Ready"
