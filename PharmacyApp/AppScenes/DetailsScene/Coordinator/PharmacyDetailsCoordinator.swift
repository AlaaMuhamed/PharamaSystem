
import Foundation
import SwiftUI

final class PharmacyDetailsCoordinator: RouterCoordinator {
    
    weak var parentCoordinator: RouterCoordinator?
    var childCoordinators: [RouterCoordinator] = []
    let router: RouterProtocol
    let detailsViewModel: PharmacyDetailsViewModel?
    
    init(router: RouterProtocol, viewModel: PharmacyDetailsViewModel) {
        self.router = router
        detailsViewModel = viewModel
    }
    
    func start() {
        let pharmacyDetailsView = PharmacyDetailsSceneView(pharmacyDetailsCoordinator: self,
                                                   viewModel: detailsViewModel)
        router.hideNavigation(animated: false)
        router.push(pharmacyDetailsView, onNavigateBack: { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        })
    }
    
    func routeToItemList(pharmacyId: Int ,requestId: Int) {
        let viewModel = ItemListViewModel()
        viewModel.requestId = requestId
        viewModel.pharmacyId = pharmacyId
        let child = ItemListCoordinator(router: router, viewModel: viewModel)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func routeToCreateNewRequest(pharmacyId: Int ) {
        let viewModel = NewReturnRequestViewModel()
        viewModel.pharmacyId = pharmacyId
        let child = NewReturnRequestCoordinator(router: router, viewModel: viewModel)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func backToHome() {
        router.pop(animated: true)
    }
}
