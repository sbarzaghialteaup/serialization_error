using {
    my.bookshop as my,
} from '../db/data-model';

service CatalogService {
    @odata.draft.enabled
    entity Books   as projection on my.Books;

    @odata.draft.enabled
    entity Authors as projection on my.Authors;

    entity Cities  as projection on my.Cities;

}
