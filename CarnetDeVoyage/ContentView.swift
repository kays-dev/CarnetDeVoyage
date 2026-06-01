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
            Color.indigo
                .ignoresSafeArea()
                .opacity(0.3)
            
            VStack{
                
                ZStack{
                    
                    Image("cover")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.ellipse)
                        .frame(height: 250)
                        .opacity(0.6)
                    
                    Text("Logbook")
                        .font(.largeTitle)
                        .foregroundStyle(.indigo)
                        .bold()
                    
                }
                
                HStack{
                    Text("Welcome to my Swift journey !")
                    
                    Image(systemName: "star.bubble")
                        .imageScale(.large)
                        .foregroundStyle(.orange)
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
