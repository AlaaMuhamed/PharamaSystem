//
//  ItemListCoordinator.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation
import SwiftUI

final class ItemListCoordinator: RouterCoordinator {
    
    weak var parentCoordinator: RouterCoordinator?
    var childCoordinators: [RouterCoordinator] = []
    let router: RouterProtocol
    let itemListViewModel: ItemListViewModel?
    
    init(router: RouterProtocol, viewModel: ItemListViewModel) {
        self.router = router
        itemListViewModel = viewModel
    }
    
    func start() {
        let itemListView = ItemListSceneView(itemListCoordinator: self,
                                                   viewModel: itemListViewModel)
        router.hideNavigation(animated: false)
        router.push(itemListView, onNavigateBack: { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        })
    }
    
    
   
    
    func backToHome() {
        router.pop(animated: true)
    }
}
