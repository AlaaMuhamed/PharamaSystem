
import Foundation
import Moya

class NetworkServiceManager {
    static var networkProvider: MoyaProvider<NetworkServiceApi> = {
        return MoyaProvider <NetworkServiceApi> (plugins: [NetworkLoggerPlugin.networkLogger])
    } ()
    
    
    class func login(userName:String, password: String, callback: @escaping (LoginDataModel? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.login(userName: userName, password: password), callBack: callback)
    }
    
    class func fetchPharmacies( callback: @escaping ([PharmacyListResponseDataModel]? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.fetchPharmacies, callBack: callback)
    }
    
    class func getReturnRequests(id: Int, callback: @escaping (ReturnRequestsResponseDataModel? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.fetchReturnRequests(id: id), callBack: callback)
    }
    
    class func getReturnedItems(pharmacyId: Int,requestId: Int , callback: @escaping ([ItemListResponseDataModel]? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.fetchReturnedITems(pharmacyId: pharmacyId, requestId: requestId), callBack: callback)
    }
    
    class func getPhatmacyWholesalers(pharmacyId: Int , callback: @escaping ([WholeSalersDataModel]? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.fetchWholeSalers(pharmacyId: pharmacyId), callBack: callback)
    }
    
    class func addNewReturnRequest(pharmacyId: Int ,serviceType: String, wholeSalerId: Int, callback: @escaping (ReturnRequest? , String?) -> Void) {
        networkProvider.requestDataWithCustomResponse(.addNewReturnRequest(pharmacyId: pharmacyId, serviceType: serviceType, wholeSalerId: wholeSalerId), callBack: callback)

    }
}
