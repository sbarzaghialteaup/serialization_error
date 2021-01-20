# Schema
Three entities: `Authors`, `Books` and `Cities`  
`Books` has association to one `Author`, `Author` has association to one `City`  
__`Authors` and `Books` entities with `odata.draft.enabled`__  
`Books` table contains a record without reference to the `Author`

The fiori list display fields:
- book.title
- author.city.citizenCount

Seems a problem related to deep navigation, but only in dev, in production (NODE_ENV=production) there is no problems

# How to reproduce error
Screenrecording:
[recording](https://github.com/sbarzaghialteaup/serialization_error/blob/master/explain_problem.gif)

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

__The problems doesn't occurs in production.__

Try with:
- export NODE_ENV=production
- cds watch
- open fiori preview for Books entity
- search
- you can see the correct data

[recording](https://github.com/sbarzaghialteaup/serialization_error/blob/master/recording_production.gif)