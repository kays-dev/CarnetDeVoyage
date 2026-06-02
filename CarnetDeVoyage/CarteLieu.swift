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
    var capitale : String
    
    var body: some View {
        
        VStack{
            //Icône
            Image(systemName: "\(icone)")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(36)
            
            //Détails
            VStack(alignment: .leading, spacing: 4){
                Text("\(capitale)")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .bold()
                
                Label("\(pays)", systemImage: "map.circle.fill")
                
                HStack(spacing: 0) {
                    Image(systemName: "star").symbolVariant(.fill)
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
                .foregroundStyle(.yellow)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16).fill(.black)
            )
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(alignment: .topTrailing){
            BadgeComponent()
                .padding()
        }
        
        
        
    }
}

#Preview {
    CarteLieu(pays: "Portugal", icone: "circle.badge.checkmark.fill", capitale: "Lisbonne")
}
