//
//  NewReturnRequestCoordinator.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed.
//

import Foundation

final class NewReturnRequestCoordinator: RouterCoordinator {
    
    weak var parentCoordinator: RouterCoordinator?
    var childCoordinators: [RouterCoordinator] = []
    let router: RouterProtocol
    let newRequestViewModel: NewReturnRequestViewModel?
    
    init(router: RouterProtocol, viewModel: NewReturnRequestViewModel) {
        self.router = router
        newRequestViewModel = viewModel
    }
    
    func start() {
        let newRequestView = NewReturnRequestSceneView(newRequestCoordinator: self,viewModel: newRequestViewModel)
        router.hideNavigation(animated: false)
        router.push(newRequestView, onNavigateBack: { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        })
    }
   
    func backToHome() {
        router.pop(animated: true)
    }
}
