//
//  ReturnRequestBanner.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation
import SwiftUI

struct ReturnRequestBanner: View {
    let id: String
    let createdAt: String
    let noOfItems: String
    let status: String
    let serviceType: String
    let onItemsNavigationHandler: (()->())
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                CustomCellRow(textTitle: "Pharmacy id:", text: id)
                CustomCellRow(textTitle: "Created At:", text: createdAt)
                HStack {
                    Button(action: onItemsNavigationHandler) {
                        HStack {
                            Text("Items:")
                                .fontWeight(.medium)
                                .foregroundColor(.lightPurble)
                            
                            Text(noOfItems)
                                .font(.subheadline)
                            Spacer()
                            Text("see all")
                                .fontWeight(.medium)
                                .foregroundColor(.lightPurble)
                            
                        }
                    }
                }
                CustomCellRow(textTitle: "Status:", text: status)
                CustomCellRow(textTitle: "Service Type:", text: serviceType)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.lightGray, lineWidth: 2)
        )
        .frame(height: 200)
    }
}
