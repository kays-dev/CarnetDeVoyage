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
                CarteLieu(lieu: lieux[0], couleurCont: [.indigo, .purple])
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                    
            }
            
        }
        .navigationTitle("Liste des lieux")
        .scrollIndicators(.hidden)
        .padding(.top, 0)
        .padding(.horizontal, 24)
    }
}

#Preview {
    Lieux()
}
