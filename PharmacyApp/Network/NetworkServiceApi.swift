//
//  PharmacyApp
//  Created by Alaa Mohamed.
//

import Foundation
import Moya

enum NetworkServiceApi {
    case login(userName: String,password: String)
    case fetchPharmacies
    case fetchReturnRequests(id: Int)
    case fetchReturnedITems(pharmacyId: Int, requestId: Int)
    case fetchWholeSalers(pharmacyId: Int)
    case addNewReturnRequest(pharmacyId: Int ,serviceType: String, wholeSalerId: Int)

}

extension NetworkServiceApi: TargetType {
    
    var baseURL: URL {
        return URL(string:EndPoints.BASE_URL ?? "")!
    }
    
    var path: String {
        switch self {
        case .login:
            return EndPoints.Authorization.LOGIN
        case .fetchPharmacies:
            return EndPoints.Authorization.PHARMACIES
        case .fetchReturnRequests(id: let id):
            return EndPoints.Authorization.RETURN_REQUEST + "\(id)" + "/returnrequests"
        case .fetchReturnedITems(pharmacyId: let pharmacyId, requestId: let requestId):
            return EndPoints.Authorization.RETURN_REQUEST + "\(pharmacyId)" + "/returnrequests/" + "\(requestId)" + "/items"
        case .addNewReturnRequest( let pharmacyId,_,_):
            return EndPoints.Authorization.RETURN_REQUEST + "\(pharmacyId)" + "/returnrequests"
            
        case .fetchWholeSalers(pharmacyId: let pharmacyId):
            return EndPoints.Authorization.RETURN_REQUEST + "\(pharmacyId)" + "/wholesalers"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .fetchPharmacies:
            return .get
        case .fetchReturnRequests:
            return .get
        case .fetchReturnedITems:
            return .get
        case .addNewReturnRequest:
            return .post
        case .fetchWholeSalers:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login(let userName, let password):
            return .requestParameters(parameters: ["username": userName, "password": password], encoding: JSONEncoding.default)
        case .fetchPharmacies , .fetchReturnRequests , .fetchReturnedITems , .fetchWholeSalers:
            return .requestPlain
        case .addNewReturnRequest(_, serviceType: let serviceType, wholeSalerId: let wholeSalerId):
            return .requestParameters(parameters: ["serviceType": serviceType, "wholesalerId": wholeSalerId], encoding: JSONEncoding.default)
        }
    }

}


