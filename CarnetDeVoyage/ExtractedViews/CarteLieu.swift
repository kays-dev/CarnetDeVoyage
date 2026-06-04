//
//  CarteLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CarteLieu: View {
    @State var lieu : Lieu
    
    
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
        
        VStack (spacing: 0){
            
            Image(lieu.image)
                .resizable()
                .scaledToFill()
                .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
                .opacity(1)

            
            //Détails
            HStack(alignment: .lastTextBaseline){
                VStack(alignment: .leading, spacing: 4){
                    Text("\(lieu.ville)")
                        .foregroundStyle(.primary)
                        .font(.title3)
                        .bold()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "map.circle.fill")
                        Text("\(lieu.pays)")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    ForEach(0..<lieu.note){ i in
                        Image(systemName: "star").symbolVariant(.fill)
                    }
                    ForEach(0..<(5 - lieu.note)){ i in
                        Image(systemName: "star")
                    }
                }
                .foregroundStyle(.yellow)
                .font(.caption2)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16).fill(.black).opacity(0.8)
            )
        }
        .foregroundStyle(.white)
        .frame(width: 300)
        .overlay(alignment: .topTrailing){
            Button {
                lieu.visited.toggle()
            } label: {
                BadgeComponent(dejaVisite: lieu.visited)
                    .padding()
            }


        }
        .background(RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: couleurCont, startPoint: .topLeading, endPoint: .bottomTrailing)))
        
    }
}


#Preview {
    CarteLieu(lieu: mockData[1])
}
