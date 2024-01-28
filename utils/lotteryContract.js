import { contractAddress,contractABI } from "./constants";

const lotteryContract = web3=>{
    return new web3.eth.Contract(contractABI,
        contractAddress)
}