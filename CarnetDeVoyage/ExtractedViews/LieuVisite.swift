//
//  LieuVisite.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 03/06/2026.
//

import SwiftUI

struct LieuVisite: View {
    @State private var lieu : Lieu
    
    @State private var noteLieu : Double = 0
    
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
    
    var trackNumber : Int
    @State var estVisite : Bool = false
    
    var body: some View {
        HStack(spacing: 16){
            
            Text("0\(trackNumber)")
                .font(.callout)
            HStack(spacing: -10){
                
                //Disque
                ZStack{
                    Circle()
                        .fill(.white)
                        .frame(width: 80, alignment: .leading)
                        .padding(.leading, 10)
                    
                    Image("\(lieu.image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .clipShape(Circle())
                    
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(.black)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(.white)
                }
                
                //Titre (lieu et nb d'étoiles)
                HStack{
                    VStack(alignment: .leading, spacing: 0){
                        Text("\(lieu.ville)")
                        
                        Text("\(lieu.pays)")
                            .font(.callout)
                            .opacity(0.7)
                    }
                    
                    Spacer()
                    Image(systemName: "star")
                    
                    //                    Slider(value: $noteLieu, in: 0...5, step: 1) {
                    //
                    //                    }
                    
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            
            //Ajout à la playlist (lieux visités)
            Button{
                lieu.visited.toggle()
            } label : {
                Image(systemName: "text.badge.plus")
            }
            
        }
        .font(.title2)
        .foregroundStyle(.black)
    }
}

#Preview {
    LieuVisite(lieu: mockData[1], trackNumber: 1)
}
