//
//  Lieux.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct Lieux: View {
    var body: some View {
        VStack {
            ScrollView {
                CarteLieu(pays: "Portugal", icone: "thermometer.sun.circle.fill", ville: "Lisbonne")
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                    .padding(.bottom, 24)
                
                CarteLieu(pays: "Japon", icone: "sunrise.circle.fill", ville: "Tokyo", etoile5: "star", visited: false)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                    .padding(.bottom, 24)
                
                CarteLieu(pays: "Corée du Sud", icone: "sunrise.circle.fill", ville: "Séoul", etoile4: "star", etoile5: "star", visited: false)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(LinearGradient(colors: [.orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                    .padding(.bottom, 24)
            }

        }
        .navigationTitle("Liste des lieux")
        .padding(.top, 0)
        .padding(.horizontal, 24)
    }
}

#Preview {
    Lieux()
}
