//
//  Lieux.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct ListeLieux: View {
    var body: some View {
        VStack{
            ScrollView {
                ForEach(lieux){ lieu in
                    CarteLieu(lieu: lieu)
                        .padding(.bottom, 16)
                }
            }
            
        }
        .navigationTitle("Liste des lieux")
        .scrollIndicators(.hidden)
        .padding(.top, 0)
        .padding(.horizontal, 24)
    }

}

#Preview {
    ListeLieux()
}
