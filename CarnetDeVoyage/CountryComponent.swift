//
//  BadgeComponent.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CountryComponent: View {
    var pays : String
    var capitale : String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(capitale)")
                .foregroundStyle(.primary)
                .padding(.bottom, 4)
                .font(.title3)
                .bold()
            
            Label("\(pays)", systemImage: "map.circle.fill")
            
        }
        .padding()
        .frame(width: 300, alignment: .leading)
        .background(
            UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16)
                .fill(.secondary)
        )
    }
}

#Preview {
    CountryComponent(pays: "Portugal", capitale: "Lisbonne")
}
