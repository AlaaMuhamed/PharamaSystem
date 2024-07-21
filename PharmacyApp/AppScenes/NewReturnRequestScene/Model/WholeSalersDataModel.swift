//
//  WholeSalersDataModel.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed.
//

import Foundation

struct WholeSalersDataModel :Identifiable, Codable {

    let accountNumber : String?
    let id : Int?
    let name : String?


    enum CodingKeys: String, CodingKey {
        case accountNumber = "accountNumber"
        case id = "id"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accountNumber = try values.decodeIfPresent(String.self, forKey: .accountNumber)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }


}
