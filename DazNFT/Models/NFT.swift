//
//  NFT.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import Foundation

struct NFT {
    let imageString: String
    let name: String
    let author: String
    let passedTime: String
    let price: String
}

let nfts = [
    NFT(imageString: "Mask Group", name: "Design Mania", author: "by Emir", passedTime: "22 min ago", price: "0.17 ETH"),
    NFT(imageString: "Mask Group 1", name: "Test 2", author: "by Emir", passedTime: "38 min ago", price: "0.3 ETH"),
    NFT(imageString: "Mask Group", name: "Design Mania", author: "by Emir", passedTime: "11 min ago", price: "0.004 ETH"),
    NFT(imageString: "Mask Group", name: "Design Mania", author: "by Emir", passedTime: "7 min ago", price: "0.8 ETH"),
    NFT(imageString: "Mask Group 1", name: "Design Mania", author: "by Emir", passedTime: "23 min ago", price: "2.17 ETH"),
    NFT(imageString: "Mask Group", name: "Design Mania", author: "by Emir", passedTime: "44 min ago", price: "0.17 ETH"),
]
