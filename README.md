# Schema
Three entities: `Authors`, `Books` and `Cities`
`Books` has association to one `Author`, `Author` has association to one `City`
__`Authors` and `Books` entities with `odata.draft.enabled`__
`Books` table contains a record without reference to the `Author`

# How to reproduce error
Screenrecording:
[recording](https://github.com/sbarzaghialteaup/cap_ambiguous_id/blob/master/explain_problem.gif)

Steps:
- clone
- cds watch
- open fiori preview for Books entity
- search
- you get popup with error 
```
An error occurred during serialization of the entity collection.  
An error occurred during serialization of the entity with the following key(s): ID: 7aa24fe3-6a4b-4f6c-bb89-de29c3251990, IsActiveEntity: true.  
Not nullable value for 'ID' must not be null.
```

# Light analysis
This odata request:
```
"Authors?$search=allen&$orderby=name&$select=ID,IsActiveEntity,name&$skip=0&$top=20"
```

is converted to sql:
```
SELECT
  active.ID,
  active.name,
  true AS "IsActiveEntity",
  false AS "HasActiveEntity",
  null AS "DraftAdministrativeData_DraftUUID",
  CASE WHEN DRAFTS.DRAFTADMINISTRATIVEDATA_DRAFTUUID IS NOT NULL THEN TRUE ELSE FALSE END AS "HasDraftEntity"
FROM
  CatalogService_Authors active
  LEFT JOIN CatalogService_Authors_drafts drafts ON active.ID = drafts.ID
WHERE
  (
    lower (ID) LIKE ? ESCAPE '^'
    OR lower (name) LIKE ? ESCAPE '^'
  )
ORDER BY
  active.name COLLATE NOCASE ASC,
  active.ID COLLATE NOCASE ASC
LIMIT
  20
```

Error:
```
Error: SQLITE_ERROR: ambiguous column name: ID
```

No problems when no `odata.draft.enable` on the `Authors` entity