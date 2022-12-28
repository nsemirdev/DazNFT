//
//  Seller.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import Foundation

struct SellerModel {
    let index: Int
    let profileImageName: String
    let name: String
    let price: String
    var isFollowing: Bool
}

let sellers = [
    SellerModel(index: 1, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
    SellerModel(index: 2, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
    SellerModel(index: 3, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
    SellerModel(index: 4, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
    SellerModel(index: 5, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
    SellerModel(index: 6, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
    SellerModel(index: 7, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
    SellerModel(index: 8, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: true),
    SellerModel(index: 9, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
    SellerModel(index: 10, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
]
