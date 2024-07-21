
import Foundation

struct PharmacyListResponseDataModel: Identifiable , Codable {
    
    let id: Int?
    let doingBusinessAs: String?
    let numberOfReturns: Int?
    let user : User?

    enum CodingKeys: String, CodingKey {
        case id = "pharmacyId"
        case doingBusinessAs = "doingBusinessAs"
        case numberOfReturns = "numberOfReturns"
        case user

    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        doingBusinessAs = try? container.decode(String.self, forKey: .doingBusinessAs)
        numberOfReturns = try? container.decode(Int.self, forKey: .numberOfReturns)
        user = try User(from: decoder)
    }
}


