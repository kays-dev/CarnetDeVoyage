//
//  AlbumLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 08/06/2026.
//

import SwiftUI

struct AlbumLieu: View {
    @State private var lieux = mockData.sorted{ $0.ville.lowercased() < $1.ville.lowercased() }
    @State private var lieuxVisites : [Lieu] = []
    
    enum Continents : String, CaseIterable, Identifiable {
        case all = "Tous"
        case europe = "Europe"
        case america = "Amérique"
        case asia = "Asie"
        case oceany = "Océanie"
        case africa = "Afrique"
        
        var id: Self { self }
    }
    
    @State private var selectedContinent : Continents = .all
    
    @State private var isVisited :  Bool = false
    @State private var ajouterLieu : Bool = false
    
    @State private var saisie : String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 16){
                    
                    //Titre principal
                    Text("Carnet de voyage")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 24)
                    
                    Spacer()
                    
                    //Informations
                    VStack(spacing: 4){
                        Text("Voyages jusqu'à 2026")
                            .font(.title3)
                            .bold()
                        
                        Text("Krystal Babel")
                            .font(.default)
                        
                        Text("last added")
                            .font(.caption)
                    }
                    
                    HStack(alignment: .center){
                        
                        //Filtre pour lieux visités
                        Button{
                            isVisited.toggle()
                            
                            if isVisited == true {
                                lieuxVisites = lieux.filter{ $0.visited == true }
                            }
                        } label : {
                            Image(systemName: "figure.walk.suitcase.rolling")
                                .symbolRenderingMode(.palette)
                                .symbolVariant(.fill.circle)
                                .font(.title)
                                .foregroundStyle(.white, isVisited ?  .indigo : .brown.opacity(0.5))
                        }
                        //
                        
                        //Filtre pour continents
                        Picker("Continents", selection: $selectedContinent){
                            ForEach(Continents.allCases){cont in
                                Text(cont.rawValue)
                            }
                        }
                        .tint(.white)
                        .background{
                            Capsule()
                                .fill(.indigo)
                        }
                        //
                        
                        //Modale pour ajout d'un lieu
                        Button {
                            ajouterLieu = true
                        }
                        label : {
                            Image(systemName: "plus")
                                .symbolVariant(.circle.fill)
                                .font(.title)
                                .foregroundStyle(.brown).opacity(0.5)
                        }
                        .sheet(isPresented: $ajouterLieu) {
                            NouveauLieu()
                        }
                        //
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 4)
                    
                }
                .frame(width: .infinity, height: 350, alignment: .top)
                .background{
                    Image("cover")
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(1/1 , contentMode: .fill)
                        .blur(radius: 3)
                        .ignoresSafeArea()
                }
                
                
                List(isVisited ? lieuxVisites : lieux){ lieu in
                    if selectedContinent == .all || selectedContinent.rawValue == lieu.continent{
                        NavigationLink(value: lieu){
                            CarteLieu(lieu: lieu)
                        }
                    }
                }
                .listStyle(.inset)
                .scrollIndicators(.hidden)
                .navigationDestination(for: Lieu.self) { lieu in
                    DetailLieu()
                }
                
            }
        }
    }
}


#Preview {
    AlbumLieu()
}
