//
//  ItemListSceneView.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation
import SwiftUI

struct ItemListSceneView: View {
    //MARK: - Variables -
    var coordinator: ItemListCoordinator?
    @ObservedObject var itemListviewModel: ItemListViewModel
    
    //MARK: - Initialization -

    init(itemListCoordinator: ItemListCoordinator? = nil,
         viewModel: ItemListViewModel? = nil ) {
        coordinator = itemListCoordinator
        itemListviewModel = viewModel ?? ItemListViewModel()
    }
    
    
    //MARK: - SceneView -
    var body: some View {
        VStack {
            makeHeaderView()
            makeItemsListView()
        }
        .onAppear {
            itemListviewModel.fetchPharmacyReturnRequests()
        }
    }
    
    //MARK: - View Builders -

    @ViewBuilder private func makeHeaderView() -> some View {
        HStack {
            Button(action: {
                coordinator?.pop()
            }) {
                Image("chevron-left")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .font(.title)
            }
            .padding(.trailing,10)
            
            Text("Items")
                .font(.system(size: 20, weight: .regular))
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
    
    @ViewBuilder private func makeItemsListView() -> some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(itemListviewModel.items ?? [] , id: \.id) { item in
                    ItemBanner(ndc: item.ndc ?? "",
                               desc: item.descriptionField ?? "",
                               manufacturer: item.manufacturer ?? "",
                               fullQuantity: "\(item.fullQuantity ?? 0)",
                               partialQuantity: "\(item.partialQuantity ?? 0)",
                               expirationDate: item.expirationDate ?? "",
                               lotNumber: item.lotNumber ?? "")
                    
                }
                .foregroundColor(.black)
            }
        }
            .padding(.horizontal)
        }
    }
