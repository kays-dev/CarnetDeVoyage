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
                    
                    Text("Carnet de voyage")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        
                    
                }
                
                HStack{
                    
                    Text("Welcome to my Swift journey !")
                    
                    Image(systemName: "star.bubble")
                        .imageScale(.large)
                        .foregroundStyle(.purple)
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
