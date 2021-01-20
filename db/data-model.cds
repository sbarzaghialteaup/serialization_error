namespace my.bookshop;

using {cuid} from '@sap/cds/common';

entity Books : cuid {
    @title  : 'Title'
    title  : String;
    @Common : {
        Text            : author.name,
        TextArrangement : #TextOnly
    }
    @title  : 'Author'
    author : Association to Authors;
}

@cds.odata.valuelist
entity Authors : cuid {
    @title  : 'Author'
    name : String;
    @title  : 'From City'
    @Common : {
        Text            : city.name,
        TextArrangement : #TextOnly
    }
    city : Association to Cities;
}

@cds.odata.valuelist
entity Cities : cuid {
    @title  : 'City'
    name   : String;
    @title  : 'State'
    @Common : {
        Text            : state.name,
        TextArrangement : #TextOnly
    }
    state : Association to States;
}

@cds.odata.valuelist
entity States : cuid {
    @title : 'State'
    name         : String;
    @title : 'State Citizen'
    citizenCount : Integer;
}

annotate Books with {
    ID @UI.Hidden;
}

annotate Authors with {
    ID @(
        UI.Hidden,
        Core.Computed,
        Common.Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
}

annotate Cities with {
    ID @(
        UI.Hidden,
        Core.Computed,
        Common.Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
}

annotate States with {
    ID @(
        UI.Hidden,
        Core.Computed,
        Common.Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
}
