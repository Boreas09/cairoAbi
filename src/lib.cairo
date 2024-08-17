use starknet::{ContractAddress, ClassHash, EthAddress};
use alexandria_math::i257::i257;

#[derive(Drop, Serde, Clone)]
struct exampleStruct1 {
    firstVal: u256,
    secondVal: EthAddress,
}

#[derive(Drop, Serde, Clone)]
struct exampleStruct2 {
    firstVal: u64,
    secondVal: u128,
    thirdVal: u256,
    fourthVal: felt252,
    fifthVal: bytes31,
    booleanVal: bool,
    firstArr: Array<u128>,
    secondArr: Array<u256>,
    thirdArr: Array<bytes31>,
    firstOpt: Option<usize>,
    firstSpan: Span<usize>,
}

#[derive(Drop, Serde, Clone)]
struct exampleStruct3 {
    str: Array<exampleStruct2>,
    firstVal: u64,
    secondVal: u128,
    thirdVal: u256,
    fourthVal: felt252,
    fifthVal: bytes31,
    booleanVal: bool,
    firstArr: Array<u128>,
    secondArr: Array<u256>,
    thirdArr: Array<bytes31>,
    firstOpt: Option<u256>,
    firstSpan: Span<u256>,
}

#[derive(Drop, Serde, Clone)]
struct exampleStruct4 {
    str: Array<exampleStruct3>,
    firstVal: u64,
    secondVal: u128,
    thirdVal: u256,
    fourthVal: felt252,
    fifthVal: bytes31,
    booleanVal: bool,
    firstArr: Array<u128>,
    secondArr: Array<u256>,
    thirdArr: Array<bytes31>,
    firstOpt: Option<u128>,
    firstSpan: Span<u128>,
}

#[starknet::interface]
trait IExample<TContractState> {
    fn twoFelts(self: @TContractState, a: felt252, b: felt252) -> (felt252, felt252);
    fn addresses(
        self: @TContractState, cAddress: ContractAddress, eAddress: EthAddress
    ) -> (ContractAddress, EthAddress);
    fn classHash(self: @TContractState, cHash: ClassHash) -> ClassHash;
    fn useExampleStruct1(self: @TContractState, str: exampleStruct1) -> exampleStruct1;
    fn useExampleStruct2(self: @TContractState, strTwo: exampleStruct2) -> exampleStruct2;
    fn useExampleStruct3(
        self: @TContractState, strTwo: exampleStruct2, strThree: exampleStruct3
    ) -> (exampleStruct2, exampleStruct3);
    fn useExampleStruct4(self: @TContractState, strFour: exampleStruct4) -> exampleStruct4;
    fn useAlexandria1(self: @TContractState, alex: i257) -> i257;
    fn useBytes31(self: @TContractState, byte31: bytes31) -> bytes31;
}

#[starknet::contract]
mod Example {
    use starknet::{ContractAddress, EthAddress, ClassHash};
    use alexandria_math::i257::i257;
    use super::exampleStruct1;
    use super::exampleStruct2;
    use super::exampleStruct3;
    use super::exampleStruct4;


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
            return str;
        }
        fn useExampleStruct2(self: @ContractState, strTwo: exampleStruct2) -> exampleStruct2 {
            return strTwo;
        }
        fn useExampleStruct3(
            self: @ContractState, strTwo: exampleStruct2, strThree: exampleStruct3
        ) -> (exampleStruct2, exampleStruct3) {
            return (strTwo, strThree);
        }
        fn useExampleStruct4(self: @ContractState, strFour: exampleStruct4) -> exampleStruct4 {
            return strFour;
        }
        fn useAlexandria1(self: @ContractState, alex: i257) -> i257 {
            return alex;
        }
        fn useBytes31(self: @ContractState, byte31: bytes31) -> bytes31 {
            return byte31;
        }
    }
}
