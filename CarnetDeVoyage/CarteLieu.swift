//
//  CarteLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CarteLieu: View {
    var pays : String
    var icone : String
    var ville : String
    
    var etoile1 : String = "star.fill"
    var etoile2 : String = "star.fill"
    var etoile3 : String = "star.fill"
    var etoile4 : String = "star.fill"
    var etoile5 : String = "star.fill"
    
    var visited :  Bool = true
    
    var body: some View {
        
        VStack{
            //Icône
            Image(systemName: "\(icone)")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(36)
            
            //Détails
            VStack(alignment: .leading, spacing: 4){
                Text("\(ville)")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .bold()
                
                Label("\(pays)", systemImage: "map.circle.fill")
                
                HStack(spacing: 0) {
                    Image(systemName: "\(etoile1)")
                    Image(systemName: "\(etoile2)")
                    Image(systemName: "\(etoile3)")
                    Image(systemName: "\(etoile4)")
                    Image(systemName: "\(etoile5)")
                }
                .foregroundStyle(.yellow)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16).fill(.black).opacity(0.8)
            )
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topTrailing){
            BadgeComponent()
                .padding()
                .opacity(visited ? 1 : 0)
        }
        
        
        
        
    }
}

#Preview {
    CarteLieu(pays: "Portugal", icone: "circle.badge.checkmark.fill", ville: "Lisbonne")
}
