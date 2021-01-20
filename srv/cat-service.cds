using {
    my.bookshop as my,
    my.bookshop.States
} from '../db/data-model';

service CatalogService {
    @odata.draft.enabled
    entity Books   as projection on my.Books;

    @odata.draft.enabled
    entity Authors as projection on my.Authors;

    @odata.draft.enabled
    entity Cities  as projection on my.Cities;

    @odata.draft.enabled
    entity States  as projection on my.States;
}
