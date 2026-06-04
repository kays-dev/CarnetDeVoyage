//
//  Lieux.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct ListeLieux: View {
    let continents = ["Europe", "Amérique", "Asie", "Océanie", "Afrique"]
    var cols = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var lieux = mockData
    
    var body: some View {
        
        List {
            
            Section(header: Text("Lieux visités")){
                    ForEach(lieux){ lieu in
                        if lieu.visited {
                            Image(systemName: "\(lieu.icone)")
                        }
                    }
            }
            .headerProminence(.increased)
            .listRowSeparator(.hidden)
                
                ForEach(continents, id: \.self) { continent in
                    
                    Section(header: Text("\(continent)")){
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(lieux){ lieu in
                                    if lieu.continent == continent{
                                        CarteLieu(lieu: lieu)
                                    }}}
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                    .headerProminence(.increased)
                }
        }
        .listStyle(.plain)
        .navigationTitle("Prochains lieux")
        .scrollIndicators(.hidden)
        .padding(.top, 0)
        .padding(.leading, 24)
    }
    
}


#Preview {
    ListeLieux()
}
