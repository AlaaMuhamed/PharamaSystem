//
//  ItemBanner.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed on 21/07/2024.
//

import Foundation
import SwiftUI

struct ItemBanner: View {
    let ndc: String
    let desc: String
    let manufacturer: String
    let fullQuantity: String
    let partialQuantity: String
    let expirationDate: String
    let lotNumber: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                CustomCellRow(textTitle: "NDC", text: ndc)
                CustomCellRow(textTitle: "Description:", text: desc)
                CustomCellRow(textTitle: "Manufacturer:", text: manufacturer)
                CustomCellRow(textTitle: "Full Quantity:", text: fullQuantity)
                CustomCellRow(textTitle: "Partial Quantity:", text: partialQuantity)
                CustomCellRow(textTitle: "Expiration Date:", text: expirationDate)
                CustomCellRow(textTitle: "Lot Number:", text: lotNumber)
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
        .frame(height: 250)
    }
}
