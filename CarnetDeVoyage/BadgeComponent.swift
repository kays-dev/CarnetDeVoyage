//
//  BadgeComponent.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct BadgeComponent: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
            
            Text("Visité")
        }
        .font(.subheadline)
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .background{
            Capsule()
                .fill(.green)
        }
        .bold()

    }
}

#Preview {
    BadgeComponent()
}
