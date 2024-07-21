//
//  NewReturnRequestViewModel.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed.
//

import Foundation

final class NewReturnRequestViewModel: ObservableObject {
    var pharmacyId: Int?
    @Published var wholeSalers: [WholeSalersDataModel]?
    
    //MARK: - Networking -

    func fetchPharmacyWholeSalers() {
        NetworkServiceManager.getPhatmacyWholesalers(pharmacyId: pharmacyId ?? 0) {[weak self] response , message  in
            guard let self else {return}
            guard let response  else {
                print(message)
                return
            }
            wholeSalers = response
        }
    }
    
    func addReturnRequest(serviceType: String , wholeSalerId: Int) {
        NetworkServiceManager.addNewReturnRequest(pharmacyId: pharmacyId ?? 0 , serviceType: serviceType, wholeSalerId: wholeSalerId) {[weak self] response , message  in
            guard let self else {return}
            guard let response  else {
                print(message)
                return
            }
        }
    }
    
    
}
