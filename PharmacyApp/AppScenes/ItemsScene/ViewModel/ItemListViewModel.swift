//
//  ItemListViewModel.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation

final class ItemListViewModel: ObservableObject {
    var requestId: Int?
    var pharmacyId: Int?
    @Published var items: [ItemListResponseDataModel]?
    
    //MARK: - Networking -

    func fetchPharmacyReturnRequests() {
        NetworkServiceManager.getReturnedItems(pharmacyId: pharmacyId ?? 0 , requestId: requestId ?? 0) {[weak self] response , message  in
            guard let self else {return}
            guard let response  else {
                print(message)
                return
            }
            items = response 
        }
    }
    
}
