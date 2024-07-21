
import Foundation

final class HomeViewModel: ObservableObject {
    //MARK: - Variables -
    @Published var searchText = ""
    @Published var pharmacies: [PharmacyListResponseDataModel] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let service = NetworkServiceManager()
    
    
    //MARK: - Getters -
    
    var filteredPharmacies: [PharmacyListResponseDataModel] {
        if searchText.isEmpty {
            return pharmacies
        } else {
          return  pharmacies.filter { pharmacy in
                (pharmacy.doingBusinessAs ?? "").lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    //MARK: - Helpers -

    func fetchPharmacies() {
        isLoading = true
        NetworkServiceManager.fetchPharmacies {[weak self] response, message in
            guard let self else  {return}
            self.isLoading = false
            if let response {
                self.pharmacies = response
            } else {
                print(message)
            }
        }
    }
}
