
import Foundation
import SwiftUI

struct PharmacyBannerView: View {
    var isProfileAvailable = true
    var name: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    if isProfileAvailable {
                        Image( "pharmacy-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                HStack {
                    Text("Pharmacy name:")
                        .fontWeight(.medium)
                    Text(name)
                        .font(.subheadline)
                }
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
        .frame(height: isProfileAvailable ? 150 : 120)
    }
}
