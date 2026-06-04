//
//  LieuVisite.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 03/06/2026.
//

import SwiftUI

struct LieuVisite: View {
    var lieu : Lieu
    
    var couleurCont : [Color] {
        switch lieu.continent {
        case "Europe": return [.blue, .teal]
        case "Amérique": return [.red, .orange]
        case "Asie": return [.green, .cyan]
        case "Océanie": return [.purple, .pink]
        case "Afrique": return [.brown, .black]
        default: return [.indigo, .purple]
        }
    }
    
    
    var body: some View {
        HStack(spacing: 20){
            
            
            
            ZStack {
                Image(systemName: "\(lieu.icone)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80)
                    .clipShape(Circle())
                
                Circle()
                    .frame(width: 30)
                    .foregroundStyle(.white)
            }

            Text("\(lieu.ville)")
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
                .background(
                    Capsule().fill(LinearGradient(colors: couleurCont, startPoint: .topLeading, endPoint: .bottomTrailing))
                )
        }
        .font(.title2)
        .foregroundStyle(.black)
    }
}

#Preview {
    LieuVisite(lieu: mockData[1])
}
