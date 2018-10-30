echo "Loading UMLS 2018 tables and data"
psql -U jmbanda -d umls2018aa -f pgsql_all_tables.sql
echo "Tables loaded"
psql -U jmbanda -d umls2018aa -f pgsql_index.sql
echo "Indexing Ready"
