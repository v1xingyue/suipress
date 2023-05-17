module blog::sample {

    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self,UID};
    use sui::clock::{Self,Clock};

    struct A has store {
        msg:vector<u8>
    }

    struct B has key {
        id:UID,
        create_time:u64,
        a:A
    }

    public entry fun make_b(now: &Clock,ctx: &mut TxContext) {
        let id = object::new(ctx);
        transfer::transfer(B{
            id,
            a: A {
                msg: b"hello world"
            },
            create_time:clock::timestamp_ms(now)
        },tx_context::sender(ctx));
    }

}