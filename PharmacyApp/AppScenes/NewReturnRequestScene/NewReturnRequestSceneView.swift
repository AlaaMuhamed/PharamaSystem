//
//  NewReturnRequestSceneView.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed.
//

import Foundation
import SwiftUI

struct NewReturnRequestSceneView: View {
    
    //MARK: - Variables -
    var coordinator: NewReturnRequestCoordinator?
    @State private var isFullService: Bool = false
    @State private var selectedName: String = "Select a name"
    @State private var selectedID: Int = 0
    @State private var isExpanded: Bool = false
    @ObservedObject var newRequestViewModel: NewReturnRequestViewModel
    
    init(newRequestCoordinator: NewReturnRequestCoordinator? = nil,
         viewModel: NewReturnRequestViewModel? = nil ) {
        coordinator = newRequestCoordinator
        newRequestViewModel = viewModel ?? NewReturnRequestViewModel()
    }
    
    
    //MARK: - SceneView -
    var body: some View {
        VStack {
            makeHeaderView()
            makeServiceTypeView()
            makeWholeSalerView()
            Spacer()
            makeSubmitButton()
        }
        .onAppear {
            newRequestViewModel.fetchPharmacyWholeSalers()
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
            
            Text("Create Return Request")
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
    
    @ViewBuilder private func makeServiceTypeView() -> some View {
        VStack {
            HStack {
                Text("Service type:")
                    .foregroundColor(.lightPurble)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
                Spacer()
            }
            
            HStack {
                Button(action: {
                    isFullService = false
                }) {
                    Text("EXPRESS_SERVICE")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(height: 60 )
                .background(!isFullService ?  Color(.lightPurble) : .gray)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.bottom , 30)
                
                Button(action: {
                    isFullService = true
                }) {
                    Text("FULL_SERVICE")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(height: 60 )
                .background(isFullService ?  Color(.lightPurble) : .gray)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.bottom , 30)
            }
        }
    }
    
    @ViewBuilder private func makeSubmitButton() -> some View {
        Button(action: {
            newRequestViewModel.addReturnRequest(serviceType: isFullService ? "EXPRESS_SERVICE" : "FULL_SERVICE", wholeSalerId: selectedID)
            coordinator?.pop()
        }) {
            Text("Submit")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(selectedID != 0 ?  Color(.lightPurble) : .gray)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .padding(.bottom , 30)
        .disabled(selectedID == 0 ? true : false)
    }
    
    @ViewBuilder private func makeWholeSalerView() -> some View {
        VStack {
            HStack {
                Text("WholeSalers:")
                    .foregroundColor(.lightPurble)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
                Spacer()
            }
            
            VStack(spacing: 10) {
                Button(action: {
                    self.isExpanded.toggle()
                }) {
                    HStack {
                        Text(selectedName)
                            .foregroundColor(selectedName == "Select a name" ? .gray : .black)
                        Spacer()
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                if isExpanded {
                    VStack(spacing: 0) {
                        ForEach(newRequestViewModel.wholeSalers ?? [] , id: \.id) { wholeSaler in
                            Button(action: {
                                
                                self.selectedName = wholeSaler.name ?? ""
                                self.selectedID = wholeSaler.id ?? 0
                                self.isExpanded = false
                            }) {
                                Text(wholeSaler.name ?? "")
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
            }
            .padding()
        }
    }
}
