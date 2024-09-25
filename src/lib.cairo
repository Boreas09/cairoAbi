use starknet::{ContractAddress, ClassHash, EthAddress, StorageAddress};
use core::{integer, integer::{u512}};
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
    arrOfTuple: Array<(u256, u256)>,
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
    arrOfTuple: Array<(u256, u256)>,
}

#[derive(Drop, Serde, Clone)]
struct exampleStruct4 {
    str: Array<exampleStruct3>,
    str2: exampleStruct3,
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
    arrOfTuple: Array<(u256, u256)>,
}

#[starknet::interface]
trait IExample<TContractState> {
    fn twoFelts(self: @TContractState, a: felt252, b: felt252) -> (felt252, felt252);
    fn addresses(
        self: @TContractState, cAddress: ContractAddress, eAddress: EthAddress
    ) -> (ContractAddress, EthAddress);
    fn useUsize(self: @TContractState, usize: usize) -> usize;
    fn useStorageAddress(self: @TContractState, storageAddress: StorageAddress) -> StorageAddress;
    fn useU512(self: @TContractState, u512: u512) -> u512;
    fn classHash(self: @TContractState, cHash: ClassHash) -> ClassHash;
    fn useExampleStruct1(self: @TContractState, str: exampleStruct1) -> exampleStruct1;
    fn useExampleStruct2(self: @TContractState, strTwo: exampleStruct2) -> exampleStruct2;
    fn useExampleStruct3(
        self: @TContractState, strTwo: exampleStruct2, strThree: exampleStruct3
    ) -> (exampleStruct2, exampleStruct3);
    fn useExampleStruct4(self: @TContractState, strFour: exampleStruct4) -> exampleStruct4;
    fn useAlexandriai257(self: @TContractState, alex: i257) -> i257;
    fn useBytes31(self: @TContractState, byte31: bytes31) -> bytes31;
    fn useSignedIntegeri8(self: @TContractState, signedIntegeri8: i8) -> i8;
    fn useSignedIntegeri16(self: @TContractState, signedIntegeri16: i16) -> i16;
    fn useSignedIntegeri32(self: @TContractState, signedIntegeri32: i32) -> i32;
    fn useSignedIntegeri64(self: @TContractState, signedIntegeri64: i64) -> i64;
    fn useSignedIntegeri128(self: @TContractState, signedIntegeri128: i128) -> i128;
    fn arrayOfTuple(
        self: @TContractState, arrTuple: Array<(felt252, felt252)>
    ) -> Array<(felt252, felt252)>;
}

#[starknet::contract]
mod Example {
    use starknet::{ContractAddress, EthAddress, ClassHash, StorageAddress};
    use core::{integer, integer::{u512}};
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
        fn useUsize(self: @ContractState, usize: usize) -> usize {
            return usize;
        }
        fn useStorageAddress(
            self: @ContractState, storageAddress: StorageAddress
        ) -> StorageAddress {
            return storageAddress;
        }
        fn useU512(self: @ContractState, u512: u512) -> u512 {
            return u512;
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
        fn useAlexandriai257(self: @ContractState, alex: i257) -> i257 {
            return alex;
        }
        fn useBytes31(self: @ContractState, byte31: bytes31) -> bytes31 {
            return byte31;
        }
        fn useSignedIntegeri8(self: @ContractState, signedIntegeri8: i8) -> i8 {
            return signedIntegeri8;
        }
        fn useSignedIntegeri16(self: @ContractState, signedIntegeri16: i16) -> i16 {
            return signedIntegeri16;
        }
        fn useSignedIntegeri32(self: @ContractState, signedIntegeri32: i32) -> i32 {
            return signedIntegeri32;
        }
        fn useSignedIntegeri64(self: @ContractState, signedIntegeri64: i64) -> i64 {
            return signedIntegeri64;
        }
        fn useSignedIntegeri128(self: @ContractState, signedIntegeri128: i128) -> i128 {
            return signedIntegeri128;
        }
        fn arrayOfTuple(
            self: @ContractState, arrTuple: Array<(felt252, felt252)>
        ) -> Array<(felt252, felt252)> {
            return arrTuple;
        }
    }
}
