//
//  ContentView.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 01/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack{
                    
                    VStack{
                        
                        Text("Carnet de voyage")
                            .font(.largeTitle)
                            .padding(.top, 12)
                            .foregroundStyle(.black)
                            .background (alignment : .topTrailing){
                                Image("paintedFlower")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                    .clipShape(.circle)
                                    .opacity(0.7)
                            }
                        
                    }
                    
                    Label("Welcome to my Swift journey !", systemImage: "moon.stars.circle.fill")
                        .font(.caption)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    NavigationLink(destination: ListeLieux()){
                        Text("Tous les lieux")
                            .font(.default)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(.indigo)
                            )
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                }
                .padding(.top)
                .font(.callout)
            }
            .padding(.horizontal, 16)
        }
    }
    
}


#Preview {
    ContentView()
}
