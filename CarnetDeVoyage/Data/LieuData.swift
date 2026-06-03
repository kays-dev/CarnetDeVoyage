//
//  LieuData.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 03/06/2026.
//

import Foundation

struct Lieu {
    let id = UUID()
    
    let image : String = "cover"
    
    let pays : String
    let ville : String
    let continent : String
    
    let note : Int
    
    var visited :  Bool = false
}

var lieux : [Lieu] = [
 Lieu(pays: "Pays-Bas", ville: "Amsterdam", continent: "Europe", note: 4),
 Lieu(pays: "Espagne", ville: "Barcelone", continent: "Europe", note: 2),
 Lieu(pays: "Belgique", ville: "Bruges", continent: "Europe", note: 5, visited: true),
 Lieu(pays: "Belgique", ville: "Bruxelles", continent: "Europe", note: 4, visited: true),
 Lieu(pays: "Allemagne", ville: "Düsseldorf", continent: "Europe", note: 5, visited: true),
 Lieu(pays: "Portugal", ville: "Lisbonne", continent: "Europe", note: 4),
 Lieu(pays: "Italie", ville: "Naples", continent: "Europe", note: 4, visited: true),
 Lieu(pays: "Italie", ville: "Milan", continent: "Europe", note: 4, visited: true),
 Lieu(pays: "République tchèque", ville: "Prague", continent: "Europe", note: 4),
 Lieu(pays: "Argentine", ville: "Buenos Aires", continent: "Amérique", note: 5),
 Lieu(pays: "Mexique", ville: "Mexico", continent: "Amérique", note: 3),
 Lieu(pays: "États-Unis", ville: "Miami", continent: "Amérique", note: 4, visited: true),
 Lieu(pays: "Canada", ville: "Montréal", continent: "Amérique", note: 5),
 Lieu(pays: "États-Unis", ville: "New York", continent: "Amérique", note: 4, visited: true),
 Lieu(pays: "États-Unis", ville: "Philadelphie", continent: "Amérique", note: 5, visited: true),
 Lieu(pays: "Brésil", ville: "Rio de Janeiro", continent: "Amérique", note: 5),
 Lieu(pays: "Indonésie", ville: "Bali", continent: "Asie", note: 5),
 Lieu(pays: "Australie", ville: "Melbourne", continent: "Océanie", note: 5),
 Lieu(pays: "Australie", ville: "Sydney", continent: "Océanie", note: 5),
 Lieu(pays: "Maroc", ville: "Marrakech", continent: "Afrique", note: 4),
 Lieu(pays: "Tanzanie", ville: "Zanzibar", continent: "Afrique", note: 3)
]
