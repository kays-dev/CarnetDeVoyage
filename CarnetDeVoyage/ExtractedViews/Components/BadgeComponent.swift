//
//  BadgeComponent.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct BadgeComponent: View {
    var dejaVisite : Bool = true
    
    var body: some View {
        HStack {
            Image(systemName: dejaVisite ? "checkmark.circle.fill" : "circle" )
            
            Text("Visité")
        }
        .font(.callout)
        .bold()
        .foregroundStyle(dejaVisite ? .white  :  .indigo)
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
        .background{
            Capsule()
                .fill(dejaVisite ? .indigo :  .brown).opacity(dejaVisite ? 0.8 : 0.3)
        }

    }
}

#Preview {
    BadgeComponent(dejaVisite: false)
}
