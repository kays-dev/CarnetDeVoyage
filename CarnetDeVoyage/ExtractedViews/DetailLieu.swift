//
//  DetailLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 09/06/2026.
//

import SwiftUI

struct DetailLieu: View {
    var lieu : Lieu
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.indigo.opacity(0.1), .indigo.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                VStack{
                    
                    if let image = lieu.image.toImage(){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   minHeight: 0,
                                   maxHeight: .infinity
                            )
                            .aspectRatio(1/1 , contentMode: .fill)
                            .clipShape(.rect(cornerRadius: 16))
                            .overlay(alignment: .bottomLeading) {
                                VStack(alignment: .leading){
                                    Text(lieu.ville)
                                        .font(.custom("Futura", size: 24, relativeTo: .title3))
                                    
                                    
                                    Text(!lieu.pays.isEmpty ? "\(lieu.pays), \(lieu.continent)" : "")
                                        .font(.custom("Gill Sans", size: 20, relativeTo: .title3))
                                        .foregroundStyle(.indigo)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(
                                    ZStack{
                                        UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 100)
                                            .fill(.white)
                                            .opacity(0.9)
                                        UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 100)
                                            .fill(.brown)
                                            .opacity(0.2)
                                    }
                                        .opacity(0.8)
                                )
                            }
                            .overlay(alignment: .topTrailing) {
                                ZStack{
                                    UnevenRoundedRectangle(bottomLeadingRadius: 100, topTrailingRadius: 16)
                                        .fill(.white.opacity(0.9))
                                        .stroke(.indigo, lineWidth : lieu.visited ? 0 : 1)
                                    
                                    UnevenRoundedRectangle(bottomLeadingRadius: 100, topTrailingRadius: 16)
                                        .fill(lieu.visited ? .indigo : .brown.opacity(0.2))
                                    
                                    
                                    HStack{
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                    .padding([.leading, .bottom], 4)
                                }
                                .foregroundStyle(lieu.visited ? .white : .indigo)
                                .padding([.leading, .bottom], 280)
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
                            .aspectRatio(1/1 , contentMode: .fill)
                            .clipShape(.rect(cornerRadius: 16))
                            .overlay(alignment: .bottomLeading) {
                                VStack(alignment: .leading){
                                    Text(lieu.ville)
                                        .font(.custom("Futura", size: 24, relativeTo: .title3))
                                    
                                    
                                    Text(!lieu.pays.isEmpty ? "\(lieu.pays), \(lieu.continent)" : "")
                                        .font(.custom("Gill Sans", size: 20, relativeTo: .title3))
                                        .foregroundStyle(.indigo)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(
                                    ZStack{
                                        UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 100)
                                            .fill(.white)
                                            .opacity(0.9)
                                        UnevenRoundedRectangle(bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 100)
                                            .fill(.brown)
                                            .opacity(0.2)
                                    }
                                        .opacity(0.8)
                                )
                            }
                            .overlay(alignment: .topTrailing) {
                                ZStack{
                                    UnevenRoundedRectangle(bottomLeadingRadius: 100, topTrailingRadius: 16)
                                        .fill(.white.opacity(0.9))
                                        .stroke(.indigo, lineWidth : lieu.visited ? 0 : 1)
                                    
                                    UnevenRoundedRectangle(bottomLeadingRadius: 100, topTrailingRadius: 16)
                                        .fill(lieu.visited ? .indigo : .brown.opacity(0.2))
                                    
                                    
                                    HStack{
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                    .padding([.leading, .bottom], 4)
                                }
                                .foregroundStyle(lieu.visited ? .white : .indigo)
                                .padding([.leading, .bottom], 280)
                            }
                    }
                    
                }
                .aspectRatio(1/1 , contentMode: .fit)
                .shadow(color: .indigo.opacity(0.4), radius: 8, x: 0, y: 2)
                .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 8){
                        Text("Note")
                            .font(.custom("Futura", size: 24, relativeTo: .title3))
                        
                        HStack(spacing: 0){
                            ForEach(1...5, id: \.self) { i in
                                Image(systemName: i <= lieu.note ? "star.fill" : "star")
                                    .font(.callout)
                            }
                            
                            Text("\(lieu.note) / 5")
                                .padding(.leading, 12)
                                .font(.custom("Gill Sans", size: 16, relativeTo: .callout))
                                .bold()
                            
                        }
                        .foregroundStyle(.indigo)
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Détails")
                            .font(.custom("Futura", size: 24, relativeTo: .title3))
                        
                        Text("""
                    \(lieu.detail)
                    """)
                        .lineLimit(10, reservesSpace: true)
                        .multilineTextAlignment(.leading)
                        .multilineTextAlignment(strategy: .layoutBased)
                        .font(.custom("Gill Sans", size: 16, relativeTo: .callout))
                    }
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Détail - \(lieu.ville)")
            .padding(.horizontal, 30)
            .foregroundStyle(.accent)
            
        }
    }
}


#Preview {
    DetailLieu(lieu : mockData[1])
}
