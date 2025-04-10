## Data Profiling
Visualize graph schema:
```cyp
call db.schema.visualization()
```

List node label types:
```cyp
CALL db.labels()
```

Count all nodes:
```cyp
MATCH(n)
RETURN(n)
```

Property and relationship counts for each node:
```cyp
MATCH (n) WHERE rand() <= 0.1
RETURN
DISTINCT labels(n),
count(*) AS SampleSize,
avg(size(keys(n))) as Avg_PropertyCount,
min(size(keys(n))) as Min_PropertyCount,
max(size(keys(n))) as Max_PropertyCount,
avg(count{ (n)-[]-() } ) as Avg_RelationshipCount,
min(count{ (n)-[]-() } ) as Min_RelationshipCount,
max(count{ (n)-[]-() } ) as Max_RelationshipCount
```

List relationship types:
```cyp
CALL db.relationshipTypes()
```

Count all relationships:
```cyp
MATCH ()-->() RETURN count(*);
```

