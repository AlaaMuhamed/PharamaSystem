
import Foundation

final class PharmacyDetailsViewModel: ObservableObject {
    
    @Published var pharmacy: PharmacyListResponseDataModel?
    @Published var returnRequests: [RequestContent]?
    var pharmacyId: Int?
    
    //MARK: - Networking -

    func fetchPharmacyReturnRequests() {
        NetworkServiceManager.getReturnRequests(id: pharmacy?.id ?? 0) {[weak self] response , message  in
            guard let self else {return}
            guard let response  else {
                print(message)
                return
            }
            returnRequests =  response.content ?? []
        }
    }
    
}
