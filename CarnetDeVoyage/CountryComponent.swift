//
//  BadgeComponent.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CountryComponent: View {
    var body: some View {
        HStack {
            Image(systemName: "map.circle.fill")
            Text("Pays")
        }
        .font(.title3)
    }
}

#Preview {
    CountryComponent()
}
