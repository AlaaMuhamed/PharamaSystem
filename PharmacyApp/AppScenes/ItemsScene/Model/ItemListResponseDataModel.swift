//
//  ItemListResponseDataModel.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed.
//

import Foundation


import Foundation

struct ItemListResponseDataModel :Identifiable, Codable {

    let actualReturnValue : Float?
    let adminComment : String?
    let controlledSubstanceCode : String?
    let createdAt : String?
    let descriptionField : String?
    let dosage : String?
    let expectedReturnValue : Float?
    let expirationDate : String?
    let fullQuantity : Float?
    let gtin14 : String?
    let id : Int?
    let lotNumber : String?
    let manufacturer : String?
    let name : String?
    let ndc : String?
    let packageSize : String?
    let partialQuantity : Float?
    let requestType : String?
    let serialNumber : String?
    let status : String?
    let strength : String?
    let updatedAt : String?


    enum CodingKeys: String, CodingKey {
        case actualReturnValue = "actualReturnValue"
        case adminComment = "adminComment"
        case controlledSubstanceCode = "controlledSubstanceCode"
        case createdAt = "createdAt"
        case descriptionField = "description"
        case dosage = "dosage"
        case expectedReturnValue = "expectedReturnValue"
        case expirationDate = "expirationDate"
        case fullQuantity = "fullQuantity"
        case gtin14 = "gtin14"
        case id = "id"
        case lotNumber = "lotNumber"
        case manufacturer = "manufacturer"
        case name = "name"
        case ndc = "ndc"
        case packageSize = "packageSize"
        case partialQuantity = "partialQuantity"
        case requestType = "requestType"
        case serialNumber = "serialNumber"
        case status = "status"
        case strength = "strength"
        case updatedAt = "updatedAt"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        actualReturnValue = try values.decodeIfPresent(Float.self, forKey: .actualReturnValue)
        adminComment = try values.decodeIfPresent(String.self, forKey: .adminComment)
        controlledSubstanceCode = try values.decodeIfPresent(String.self, forKey: .controlledSubstanceCode)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        dosage = try values.decodeIfPresent(String.self, forKey: .dosage)
        expectedReturnValue = try values.decodeIfPresent(Float.self, forKey: .expectedReturnValue)
        expirationDate = try values.decodeIfPresent(String.self, forKey: .expirationDate)
        fullQuantity = try values.decodeIfPresent(Float.self, forKey: .fullQuantity)
        gtin14 = try values.decodeIfPresent(String.self, forKey: .gtin14)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lotNumber = try values.decodeIfPresent(String.self, forKey: .lotNumber)
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        ndc = try values.decodeIfPresent(String.self, forKey: .ndc)
        packageSize = try values.decodeIfPresent(String.self, forKey: .packageSize)
        partialQuantity = try values.decodeIfPresent(Float.self, forKey: .partialQuantity)
        requestType = try values.decodeIfPresent(String.self, forKey: .requestType)
        serialNumber = try values.decodeIfPresent(String.self, forKey: .serialNumber)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        strength = try values.decodeIfPresent(String.self, forKey: .strength)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }
}
