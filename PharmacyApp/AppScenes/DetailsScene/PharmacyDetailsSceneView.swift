
import Foundation
import SwiftUI

struct PharmacyDetailsSceneView: View {
    
    //MARK: - Variables -
    var coordinator: PharmacyDetailsCoordinator?
    @ObservedObject var detailsViewModel: PharmacyDetailsViewModel
    
    //MARK: - Initialization -
    init(pharmacyDetailsCoordinator: PharmacyDetailsCoordinator? = nil,
         viewModel: PharmacyDetailsViewModel? = nil ) {
        coordinator = pharmacyDetailsCoordinator
        detailsViewModel = viewModel ?? PharmacyDetailsViewModel()
    }
    
    //MARK: - Scene View -

    var body: some View {
        VStack {
            Color.extraLightPurple
                .frame(height: 300)
                .cornerRadius(30)
                .overlay {
                    VStack {
                        makeHeaderView()
                            .padding(.top, 50)
                        Spacer()
                        Image( "pharmacy-logo")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .clipShape(Circle())
                            .padding(.bottom,20)
                        Text("By." + (detailsViewModel.pharmacy?.doingBusinessAs ?? ""))
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .ignoresSafeArea(.all)
            makeTitleView()
            makePharmacyReturnRequestListView()
                .overlay {
                    VStack (alignment: .trailing){
                        Spacer()
                        makeNewReturnButton()
                    }
                }
            Spacer()
        }
        .onAppear {
            detailsViewModel.fetchPharmacyReturnRequests()
        }
    }
    
    //MARK: - View Builders -

    @ViewBuilder private func makeHeaderView() -> some View {
        HStack {
            Button(action: {
                coordinator?.backToHome()
            }) {
                Image("chevron-left")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .font(.title)
            }
            Spacer()
            Text("Return Requests")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
            Spacer()
            Button(action: { }) {
                Image("notification-icon")
                    .resizable()
                    .frame(width: 24,height: 24)
                    .font(.title)
            }
        }
        .padding()
    }
    
    
    @ViewBuilder private func makeTitleView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Requests:")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.lightPurble)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, -30)
        }
       
    }

    
    @ViewBuilder private func makePharmacyReturnRequestListView() -> some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(detailsViewModel.returnRequests ?? [] , id: \.id) { returnRequest in
                    ReturnRequestBanner(id: "\(returnRequest.returnRequest?.id ?? 0)",
                                        createdAt: "\(returnRequest.returnRequest?.createdAt ?? 0)",
                                        noOfItems: "\(returnRequest.numberOfItems ?? 0)",
                                        status: "\(returnRequest.returnRequest?.returnRequestStatus ?? "")",
                                        serviceType: "\(returnRequest.returnRequest?.serviceType ?? "")",
                                        onItemsNavigationHandler: {
                        if returnRequest.numberOfItems != 0 , returnRequest.numberOfItems != nil {
                            coordinator?.routeToItemList(pharmacyId: detailsViewModel.pharmacy?.id ?? 0, requestId: returnRequest.returnRequest?.id ?? 0)
                        }
                        print("zero items")
                    })
                    
                }
                .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
    }
    
    
    @ViewBuilder private func makeNewReturnButton() -> some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    coordinator?.routeToCreateNewRequest(pharmacyId: detailsViewModel.pharmacy?.id ?? 0 )
                }) {
                    Text("+Add")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
                .frame(width: 60, height: 60)
                .background(Color(.lightPurble))
                .cornerRadius(40)
                .padding(.trailing, 40)
                .shadow(radius: 30)
            }
        }
    }

}

#Preview {
    PharmacyDetailsSceneView()
}
