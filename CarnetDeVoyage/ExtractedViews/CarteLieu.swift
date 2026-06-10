//
//  CarteLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CarteLieu: View {
    @Binding var lieu : Lieu
    @State var showPop : Bool = false
    
    var body: some View {
        
        HStack(alignment: .center,spacing: 8){
            
            Button {
                showPop = true
            } label: {
                Image(systemName: "star")
                    .symbolVariant(.fill)
                    .foregroundStyle(.indigo)
                    .opacity(0.8)
            }
            .popover(isPresented: $showPop){
                HStack(spacing: 0) {
                    ForEach(1...5, id: \.self) { i in
                        Image(systemName: i <= lieu.note ? "star.fill" : "star")
                            .font(.callout)
                    }
                }
                .contentShape(.rect)
                .foregroundStyle(.indigo)
                .font(.callout)
                .padding()
                .presentationCompactAdaptation(.popover)
            }
            
            if let image = lieu.image.toImage() {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity
                    )
                    .aspectRatio(1/1 , contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 16))
                    .overlay{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.secondary)
                            .opacity(0.1)
                    }
            } else {
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
                    .overlay{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.secondary)
                            .opacity(0.1)
                    }
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text("\(lieu.ville)")
                    .font(.custom("Gill Sans", size: 20, relativeTo: .title2))
                
                Text("\(lieu.pays)")
                    .font(.custom("Gill Sans", size: 16, relativeTo: .callout))
                    .lineLimit(1)
                    .foregroundStyle(.indigo)
                    .opacity(0.8)
                
            }
            .padding(.leading, 4)
            
            Spacer()
            
            Button {
                lieu.visited.toggle()
            } label: {
                Toggle("Visité", systemImage: lieu.visited ? "checkmark.circle.fill" : "checkmark.circle" , isOn: $lieu.visited)
                    .toggleStyle(.button)
                    .font(.custom("Gill Sans", size: 18, relativeTo: .callout))
                    .foregroundStyle(.indigo.opacity(0.8))
                    .tint(.indigo)
                    .background{
                        Capsule()
                            .stroke(.indigo.opacity(0.8), lineWidth: 1)
                        
                    }
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 70)
        
    }
    
}

#Preview {
    struct PreviewVar : View {
        @State private var lieux = mockData.sorted{ $0.ville.lowercased() < $1.ville.lowercased() }
        
        var body : some View {
            
            CarteLieu(lieu: $lieux[1])
        }
    }
    
    return PreviewVar()
}
