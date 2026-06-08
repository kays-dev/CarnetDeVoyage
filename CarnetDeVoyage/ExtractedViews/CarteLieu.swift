//
//  CarteLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CarteLieu: View {
    @State var lieu : Lieu
    @State var showPop : Bool = false
    
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
        
        HStack(alignment: .center,spacing: 8){
            
            Button {
                showPop = true
            } label: {
                Image(systemName: "star")
                    .symbolVariant(.fill)
                    .foregroundStyle(.indigo)
            }
            .popover(isPresented: $showPop){
                HStack(spacing: 0) {
                    ForEach(0..<lieu.note){ i in
                        Image(systemName: "star").symbolVariant(.fill)

                    }
                    ForEach(0..<(5 - lieu.note)){ i in
                        Image(systemName: "star")
                    }
                }
                .contentShape(.rect)
                .foregroundStyle(.yellow)
                .font(.callout)
                .padding()
                .presentationCompactAdaptation(.popover)
            }
            .contentShape(.circle)

            HStack(spacing: 12){
                Image(lieu.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity
                    )
                    .aspectRatio(1/1 , contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 16))
                    .opacity(1)
                
                
                VStack(alignment: .leading, spacing: 4){
                    Text("\(lieu.ville)")
                        .foregroundStyle(.primary)
                        .font(.title3)
                        .bold()
                    
                    Text("\(lieu.pays)")
                        .foregroundStyle(.primary)
                        .font(.callout)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            Button {
                lieu.visited.toggle()
            } label: {
                BadgeComponent(dejaVisite: lieu.visited)
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 70)
    }
}


#Preview {
    CarteLieu(lieu: mockData[1])
}
