//
//  AlbumLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 08/06/2026.
//

import SwiftUI

struct AlbumLieu: View {
    @State private var lieux = mockData.sorted{ $0.ville.lowercased() < $1.ville.lowercased() }
    
    @State private var resultats : [Lieu] = []
    
    var bg : String = "airplane.cloud"
    
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
    
    func appliquerFiltres() {
        var liste = lieux
        
        if isVisited {
            liste = liste.filter { $0.visited }
        }
        
        if selectedContinent != .all {
            liste = liste.filter { $0.continent == selectedContinent.rawValue }
        }
        
        if !saisie.isEmpty {
            liste = liste.filter { $0.ville.localizedCaseInsensitiveContains(saisie) }
        }
        
        resultats = liste
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.indigo.opacity(0.15), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                LinearGradient(colors: [.brown.opacity(0.05), .brown.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack(spacing: 16){
                        //Titre principal
                        Text("Carnet de voyage")
                            .font(.custom("Futura", size: 32, relativeTo: .largeTitle))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 32)
                        
                        Spacer()
                        
                        //Informations
                        VStack(spacing: 2){
                            Text("Liste des lieux")
                                .font(.custom("Futura", size: 20, relativeTo: .title))
                                .bold()
                            
                            Text("Krystal Babel")
                                .font(.custom("Gill Sans", size: 20, relativeTo: .footnote))
                            
                            Text("2026")
                                .font(.custom("Gill Sans", size: 16, relativeTo: .callout))
                                .foregroundStyle(.indigo.opacity(0.8))
                        }
                        
                        HStack(alignment: .center){
                            
                            //Filtre pour lieux visités
                            Button{
                                isVisited.toggle()
                                appliquerFiltres()
                            } label : {
                                Image(systemName: "figure.walk.suitcase.rolling")
                                    .symbolRenderingMode(.palette)
                                    .symbolVariant(.fill.circle)
                                    .font(.title)
                                    .foregroundStyle(isVisited ? .white : .indigo, isVisited ?  .indigo : .brown.opacity(0.2))
                                    .shadow(color: .brown.opacity(0.5), radius: 4, x: 0, y: 0)
                            }
                            //
                            
                            //Filtre pour continents
                            Picker("Continents", selection: $selectedContinent){
                                ForEach(Continents.allCases){cont in
                                    Text(cont.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.white)
                            .background{
                                Capsule()
                                    .fill(.indigo)
                                    .shadow(color: .indigo.opacity(0.5), radius: 4, x: 0, y: 0)
                            }
                            .onChange(of: selectedContinent) {
                                appliquerFiltres()
                            }
                            //
                            
                            //Modale pour ajout d'un lieu
                            Button {
                                ajouterLieu = true
                            }
                            label : {
                                Image(systemName: "plus")
                                    .symbolVariant(.circle.fill)
                                    .symbolRenderingMode(.palette)
                                    .font(.title)
                                    .foregroundStyle(.indigo, .brown.opacity(0.2))
                                    .shadow(color: .brown.opacity(0.5), radius: 4, x: 0, y: 0)
                            }
                            .sheet(isPresented: $ajouterLieu, onDismiss: appliquerFiltres) {
                                NouveauLieu(lieux : $lieux)
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.large])
                            }
                            //
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 8)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 450, alignment: .top)
                    .background{
                        Image(systemName: bg)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .aspectRatio(1/1 , contentMode: .fill)
                            .foregroundStyle(.indigo)
                            .padding(.bottom, 80)
                    }
                    .foregroundStyle(.accent)
                    
                    
                    Divider()
                        .padding(.horizontal)
                    
                    //Liste des lieux
                    ForEach($resultats){ $lieu in
                        VStack{
                            NavigationLink{
                                DetailLieu(lieu: lieu)
                            } label: {
                                CarteLieu(lieu: $lieu)
                                    .onChange(of: lieu.visited) {
                                        if let index = lieux.firstIndex(where: { $0.id == lieu.id }) {
                                            lieux[index].visited = lieu.visited
                                        }
                                        appliquerFiltres()
                                    }
                      
                            }

                            Divider()
                                .padding(.leading, 112)
                        }
                        .contextMenu{
                                Button(role: .destructive) {
                                    lieux.removeAll{ $0.id == $lieu.id }
                                    
                                    appliquerFiltres()
                                } label : {
                                    Label("Supprimer", systemImage: "trash")
                                }
                        }
                        
                    }
                    .padding(.horizontal)
                    .searchable(
                        text: $saisie,
                        placement: .automatic,
                        prompt: "Chercher un lieu"
                    )
                    .onAppear{
                        appliquerFiltres()
                    }
                    .onChange(of: saisie) {
                        appliquerFiltres()
                    }
                }
                
            }
            .scrollIndicators(.hidden)
        }
    }
}



#Preview {
    AlbumLieu()
}
