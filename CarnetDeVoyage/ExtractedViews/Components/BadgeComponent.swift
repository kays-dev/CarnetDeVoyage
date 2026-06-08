//
//  BadgeComponent.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct BadgeComponent: View {
    @State var dejaVisite : Bool
    
    var body: some View {
        
        Toggle("Visité", systemImage: dejaVisite ? "checkmark.circle.fill" : "checkmark.circle" , isOn: $dejaVisite)
            .toggleStyle(.button)
            .font(.callout)
            .tint(.indigo)
            .foregroundStyle(.indigo)
            .background{
                Capsule()
                    .stroke(.indigo, lineWidth: 1)
                    
            }
        
    }
}

#Preview {
    BadgeComponent(dejaVisite: false)
}
