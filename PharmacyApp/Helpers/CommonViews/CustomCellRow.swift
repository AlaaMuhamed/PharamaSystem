//
//  CustomCellRow.swift
//  PharmacyApp
//
//  Created by Alaa Mohamed .
//

import Foundation
import SwiftUI

struct CustomCellRow: View {
    
    let textTitle: String
    let text: String
    
    var body: some View {
        HStack {
            Text(textTitle)
                .fontWeight(.medium)
                .foregroundColor(.lightPurble)
            Text(text)
                .font(.subheadline)
        }
    }
}
