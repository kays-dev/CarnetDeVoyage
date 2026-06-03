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
        .font(.callout)
        .foregroundStyle(.white)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background{
            Capsule()
                .fill(.indigo).opacity(0.8)
        }

    }
}

#Preview {
    BadgeComponent()
}
