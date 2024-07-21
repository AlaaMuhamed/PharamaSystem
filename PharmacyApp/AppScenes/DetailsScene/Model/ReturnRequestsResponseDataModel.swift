//
//  ReturnRequestsResponseDataModel.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation

struct ReturnRequestsResponseDataModel : Codable {
    let content : [RequestContent]?
    let empty : Bool?
    let first : Bool?
    let last : Bool?
    let number : Int?
    let numberOfElements : Int?
    let pageable : Pageable?
    let size : Int?
    let totalElements : Int?
    let totalPages : Int?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case empty = "empty"
        case first = "first"
        case last = "last"
        case number = "number"
        case numberOfElements = "numberOfElements"
        case pageable
        case size = "size"
        case totalElements = "totalElements"
        case totalPages = "totalPages"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        content = try values.decodeIfPresent([RequestContent].self, forKey: .content)
        empty = try values.decodeIfPresent(Bool.self, forKey: .empty)
        first = try values.decodeIfPresent(Bool.self, forKey: .first)
        last = try values.decodeIfPresent(Bool.self, forKey: .last)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        numberOfElements = try values.decodeIfPresent(Int.self, forKey: .numberOfElements)
        pageable = try Pageable(from: decoder)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        totalElements = try values.decodeIfPresent(Int.self, forKey: .totalElements)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
    }
}

struct Pageable : Codable {
    let offset : Int?
    let pageNumber : Int?
    let pageSize : Int?
    let paged : Bool?
    let unpaged : Bool?
    
    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case pageNumber = "pageNumber"
        case pageSize = "pageSize"
        case paged = "paged"
        case unpaged = "unpaged"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        pageNumber = try values.decodeIfPresent(Int.self, forKey: .pageNumber)
        pageSize = try values.decodeIfPresent(Int.self, forKey: .pageSize)
        paged = try values.decodeIfPresent(Bool.self, forKey: .paged)
        unpaged = try values.decodeIfPresent(Bool.self, forKey: .unpaged)
    }
}


struct RequestContent : Identifiable , Codable {
    var id: UUID = UUID() // Use UUID to ensure uniqueness
    let numberOfItems : Int?
    let numberOfReports : Int?
    let numberOfShipments : Int?
    let returnRequest : ReturnRequest?
    
    enum CodingKeys: String, CodingKey {
        case numberOfItems = "numberOfItems"
        case numberOfReports = "numberOfReports"
        case numberOfShipments = "numberOfShipments"
        case returnRequest = "returnRequest"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        numberOfItems = try values.decodeIfPresent(Int.self, forKey: .numberOfItems)
        numberOfReports = try values.decodeIfPresent(Int.self, forKey: .numberOfReports)
        numberOfShipments = try values.decodeIfPresent(Int.self, forKey: .numberOfShipments)
        returnRequest = try values.decodeIfPresent(ReturnRequest.self, forKey: .returnRequest)

    }
}

struct ReturnRequest :Identifiable, Codable {
    let createdAt : Int?
    let id : Int?
    let pharmacy : PharmacyListResponseDataModel?
    let preferredDate : String?
    let returnRequestStatus : String?
    let returnRequestStatusLabel : String?
    let serviceType : String?
    
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case id = "id"
        case pharmacy
        case preferredDate = "preferredDate"
        case returnRequestStatus = "returnRequestStatus"
        case returnRequestStatusLabel = "returnRequestStatusLabel"
        case serviceType = "serviceType"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(Int.self, forKey: .createdAt)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        pharmacy = try PharmacyListResponseDataModel(from: decoder)
        preferredDate = try values.decodeIfPresent(String.self, forKey: .preferredDate)
        returnRequestStatus = try values.decodeIfPresent(String.self, forKey: .returnRequestStatus)
        returnRequestStatusLabel = try values.decodeIfPresent(String.self, forKey: .returnRequestStatusLabel)
        serviceType = try values.decodeIfPresent(String.self, forKey: .serviceType)
    }
}


struct User : Codable {
    let activated : Bool?
    let id : Int?
    let role : String?
    let username : String?
    
    enum CodingKeys: String, CodingKey {
        case activated = "activated"
        case id = "id"
        case role = "role"
        case username = "username"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activated = try values.decodeIfPresent(Bool.self, forKey: .activated)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        username = try values.decodeIfPresent(String.self, forKey: .username)
    }
}
