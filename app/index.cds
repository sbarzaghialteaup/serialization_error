using my.bookshop as Services from '../srv/cat-service';

annotate Services.Books with @(UI : {
    SelectionFields : [title],
    LineItem        : [
    {
        $Type : 'UI.DataField',
        Value : title
    },
    {
        $Type : 'UI.DataField',
        Value : author_ID
    },
    {
        $Type : 'UI.DataField',
        Value : author.city.state.citizenCount
    },
    ]
});
