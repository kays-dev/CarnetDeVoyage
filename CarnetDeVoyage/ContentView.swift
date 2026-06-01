//
//  ContentView.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 01/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack{
                
                VStack{
                    
                    Image("paintedFlower")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(height: 100)
                        .opacity(0.7)
                    
                    Text("Carnet de voyage")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .bold()
                    
                }
                
                HStack{
                    Text("Welcome to my Swift journey !")
                    
                    Image(systemName: "star.bubble")
                        .imageScale(.large)
                        .foregroundStyle(.mint)
                }
                .padding(.top)
                .font(.callout)
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }

    }
}

#Preview {
    ContentView()
}
