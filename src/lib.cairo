use starknet::{ContractAddress, EthAddress, ClassHash};

#[derive(Serde,Copy,Drop)]
struct exampleStruct1 {
    firstVal: u256,
    secondVal: EthAddress,
}


#[starknet::interface]
trait IExample<TContractState> {
    fn twoFelts(self: @TContractState, a: felt252, b: felt252) -> (felt252, felt252);
    fn addresses(
        self: @TContractState, cAddress: ContractAddress, eAddress: EthAddress
    ) -> (ContractAddress, EthAddress);
    fn classHash(self: @TContractState, cHash: ClassHash) -> ClassHash;
    fn useExampleStruct1(self: @TContractState, str: exampleStruct1) -> exampleStruct1;
}

#[starknet::contract]
mod Example {
    use starknet::{ContractAddress, EthAddress, ClassHash};
    use super::exampleStruct1;
    #[storage]
    struct Storage {}
    #[abi(embed_v0)]
    impl ExampleImpl of super::IExample<ContractState> {
        fn twoFelts(self: @ContractState, a: felt252, b: felt252) -> (felt252, felt252) {
            return (a, b);
        }
        fn addresses(
            self: @ContractState, cAddress: ContractAddress, eAddress: EthAddress
        ) -> (ContractAddress, EthAddress) {
            return (cAddress, eAddress);
        }
        fn classHash(self: @ContractState, cHash: ClassHash) -> ClassHash {
            return cHash;
        }
        fn useExampleStruct1(self: @ContractState, str: exampleStruct1) -> exampleStruct1 {
            str
        }
    }
}