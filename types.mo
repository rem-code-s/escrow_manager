import Time "mo:base/Time";

module {

    public type AccountId           = Blob;
    public type AccountIdText       = Text;
    public type Subaccount          = Nat;
    public type SubaccountNat8Arr   = [Nat8];
    public type SubaccountBlob      = Blob;
    public type SubaccountStatus    = { 
        #empty;     // empty and waiting for a transfer
        #cancelled; // transfer has been cancelled
        #confirmed; // transfer has been confirmed by frontend, 
                    // now we need to check that we recieved the funds
        #funded;    // funds recieved
    };

    // PROJECT

    public type ProjectId = Nat;
    public type ProjectStatus = { 
        #whitelist;
        #live;
        #fully_funded;
    };

    // LEDGER
    public type AccountBalanceArgs  = { account : AccountIdText };
    public type ICPTs               = { e8s     : Nat64     };
    public type SendArgs            = {
        memo            : Nat64;
        amount          : ICPTs;
        fee             : ICPTs;
        from_subaccount : ?SubaccountNat8Arr;
        to              : AccountIdText;
        created_at_time : ?Time.Time;
    };

    // ESCROW STATS
    public type EscrowStats         = {
        nftNumber       : Nat;
        nftPriceE8S     : Nat;
        endTime         : Time.Time;
        nftsSold        : Nat;
        openSubaccounts : Nat;
    };

};