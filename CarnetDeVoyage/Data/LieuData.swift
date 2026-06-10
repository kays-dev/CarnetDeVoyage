//
//  LieuData.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 03/06/2026.
//

import Foundation

struct Lieu : Identifiable, Hashable {
    let id = UUID()
    
    var image : String
    
    let pays : String
    let ville : String
    let continent : String
    
    let detail :  String
    
    var note : Int
    
    var visited : Bool = false
}

var mockData = [
    Lieu(image: "amsterdam", pays: "Pays-Bas", ville: "Amsterdam", continent: "Europe", detail: """
Capitale des Pays-Bas, Amsterdam est célèbre pour ses canaux pittoresques, ses maisons étroites et son ambiance décontractée. La ville abrite des musées renommés comme le Rijksmuseum et le musée Van Gogh. Les déplacements à vélo font partie intégrante du mode de vie local. Son riche patrimoine historique se mêle à une culture moderne et dynamique.
""", note: 4),
    
    Lieu(image: "barcelone", pays: "Espagne", ville: "Barcelone", continent: "Europe", detail: """
Barcelone séduit par son architecture unique, notamment les œuvres de Gaudí comme la Sagrada Família. Située au bord de la Méditerranée, elle combine plages, culture et gastronomie. Les quartiers historiques côtoient des avenues modernes animées. Son atmosphère festive attire des visiteurs du monde entier.
""", note: 2),
    
    Lieu(image: "bruges", pays: "Belgique", ville: "Bruges", continent: "Europe", detail: """
Bruges est une ville médiévale parfaitement préservée traversée par de charmants canaux. Son centre historique classé à l’UNESCO offre un véritable voyage dans le temps. Les rues pavées, les bâtiments gothiques et les chocolateries font son charme. Elle est souvent surnommée la Venise du Nord.
""", note: 5, visited: true),
    
    Lieu(image: "bruxelles", pays: "Belgique", ville: "Bruxelles", continent: "Europe", detail: """
Capitale de la Belgique et de l’Union européenne, Bruxelles est une ville cosmopolite. La Grand-Place est l’un des plus beaux ensembles architecturaux d’Europe. Elle est réputée pour ses gaufres, ses chocolats et ses bières. Son mélange de cultures lui confère une identité unique.
""", note: 4, visited: true),
    
    Lieu(image: "dusseldorf", pays: "Allemagne", ville: "Düsseldorf", continent: "Europe", detail: """
Düsseldorf est une ville moderne située sur les rives du Rhin. Elle est connue pour son quartier d’affaires, ses boutiques de luxe et sa scène artistique dynamique. La promenade du Rhin offre de belles vues et une ambiance agréable. Son centre historique contraste avec son architecture contemporaine.
""", note: 5, visited: true),
    
    Lieu(image: "lisbonne", pays: "Portugal", ville: "Lisbonne", continent: "Europe", detail: """
Lisbonne est une capitale lumineuse construite sur plusieurs collines dominant le Tage. Ses tramways jaunes, ses ruelles pavées et ses points de vue panoramiques en font tout le charme. La ville possède une riche histoire maritime. Son ambiance chaleureuse et sa gastronomie séduisent les voyageurs.
""", note: 4),
    
    Lieu(image: "naples", pays: "Italie", ville: "Naples", continent: "Europe", detail: """
Naples est une ville vibrante située au pied du Vésuve. Berceau de la pizza, elle est réputée pour sa cuisine authentique et son patrimoine historique. Son centre ancien regorge d’églises et de palais. Elle constitue également une porte d’entrée vers Pompéi et la côte amalfitaine.
""", note: 4, visited: true),
    
    Lieu(image: "milan", pays: "Italie", ville: "Milan", continent: "Europe", detail: """
Milan est la capitale économique et de la mode en Italie. Elle abrite le célèbre Duomo et de nombreuses boutiques de luxe. Son dynamisme attire créateurs, entrepreneurs et touristes. La ville combine élégance moderne et héritage culturel remarquable.
""", note: 4, visited: true),
    
    Lieu(image: "prague", pays: "République tchèque", ville: "Prague", continent: "Europe", detail: """
Prague est l’une des plus belles villes d’Europe centrale grâce à son architecture préservée. Le château de Prague et le pont Charles dominent son paysage historique. Ses rues pavées et ses bâtiments colorés créent une atmosphère féerique. Elle offre un mélange fascinant d’histoire et de culture.
""", note: 4),
    
    Lieu(image: "buenosaires", pays: "Argentine", ville: "Buenos Aires", continent: "Amérique", detail: """
Buenos Aires est une métropole élégante souvent comparée aux grandes capitales européennes. Elle est célèbre pour le tango, ses cafés historiques et ses quartiers animés. Son architecture reflète une forte influence européenne. La ville possède une vie culturelle particulièrement riche.
""", note: 5),
    
    Lieu(image: "mexico", pays: "Mexique", ville: "Mexico City", continent: "Amérique", detail: """
Mexico est l’une des plus grandes villes du monde et le cœur culturel du Mexique. Elle mélange vestiges aztèques, architecture coloniale et gratte-ciels modernes. Ses musées et sa gastronomie sont mondialement reconnus. La ville offre une énergie urbaine impressionnante.
""", note: 3),
    
    Lieu(image: "miami", pays: "États-Unis", ville: "Miami", continent: "Amérique", detail: """
Miami est connue pour ses plages de sable fin, son climat tropical et son ambiance festive. Son quartier Art Déco de South Beach est emblématique. La ville est fortement influencée par les cultures latino-américaines. Elle attire aussi bien les amateurs de détente que de vie nocturne.
""", note: 4, visited: true),
    
    Lieu(image: "montreal", pays: "Canada", ville: "Montréal", continent: "Amérique", detail: """
Montréal est une ville bilingue qui combine charme européen et modernité nord-américaine. Son vieux quartier rappelle les villes françaises historiques. La scène culturelle y est particulièrement dynamique tout au long de l’année. Festivals, gastronomie et diversité caractérisent cette métropole canadienne.
""", note: 5),
    
    Lieu(image: "newyork", pays: "États-Unis", ville: "New York", continent: "Amérique", detail: """
New York est l’une des villes les plus influentes au monde. Ses gratte-ciels emblématiques, Central Park et Times Square attirent des millions de visiteurs. La diversité culturelle y est exceptionnelle. Chaque quartier possède sa propre identité et son atmosphère unique.
""", note: 4, visited: true),
    
    Lieu(image: "atlanta", pays: "États-Unis", ville: "Atlanta", continent: "Amérique", detail: """
Atlanta est un important centre économique et culturel du sud des États-Unis. La ville joue un rôle majeur dans l’histoire des droits civiques américains. Elle possède une scène musicale dynamique et de nombreux espaces verts. Son développement rapide en fait une métropole moderne et attractive.
""", note: 5, visited: true),
    
    Lieu(image: "rio", pays: "Brésil", ville: "Rio de Janeiro", continent: "Amérique", detail: """
Rio de Janeiro est célèbre pour ses plages mythiques, son carnaval et ses paysages spectaculaires. Le Christ Rédempteur domine la ville depuis le mont Corcovado. Entre montagnes et océan, son cadre naturel est exceptionnel. L’ambiance y est festive et chaleureuse toute l’année.
""", note: 5),
    
    Lieu(image: "bali", pays: "Indonésie", ville: "Bali", continent: "Asie", detail: """
Bali est une île paradisiaque réputée pour ses plages, ses temples et ses rizières en terrasses. La culture balinaise est profondément ancrée dans le quotidien. Les amateurs de surf, de nature et de bien-être y trouvent leur bonheur. Son atmosphère paisible attire des voyageurs du monde entier.
""", note: 5),
    
    Lieu(image: "melbourne", pays: "Australie", ville: "Melbourne", continent: "Océanie", detail: """
Melbourne est souvent considérée comme la capitale culturelle de l’Australie. Elle est réputée pour ses cafés, son art urbain et ses nombreux événements sportifs. La ville offre une excellente qualité de vie. Son ambiance cosmopolite séduit habitants et visiteurs.
""", note: 5),
    
    Lieu(image: "sydney", pays: "Australie", ville: "Sydney", continent: "Océanie", detail: """
Sydney est la ville la plus emblématique d’Australie grâce à son Opéra et son Harbour Bridge. Ses plages comme Bondi Beach sont mondialement connues. Elle combine nature, modernité et qualité de vie. Son port naturel est l’un des plus beaux du monde.
""", note: 5),
    
    Lieu(image: "lecap", pays: "Afrique du sud", ville: "Le Cap", continent: "Afrique", detail: """
Le Cap est une ville spectaculaire dominée par la célèbre montagne de la Table. Elle offre des paysages mêlant océan, montagnes et vignobles. Son histoire et sa diversité culturelle sont particulièrement riches. C’est l’une des destinations les plus visitées d’Afrique.
""", note: 2),
    
    Lieu(image: "marrakech", pays: "Maroc", ville: "Marrakech", continent: "Afrique", detail: """
Marrakech fascine par ses souks animés, ses palais et ses jardins luxuriants. La place Jemaa el-Fna constitue le cœur vivant de la ville. Son architecture traditionnelle et ses couleurs ocres lui donnent un caractère unique. L’atmosphère y est dépaysante et authentique.
""", note: 4),
    
    Lieu(image: "nairobi", pays: "Kenya", ville: "Nairobi", continent: "Afrique", detail: """
Nairobi est la capitale dynamique du Kenya et un important centre économique d’Afrique de l’Est. Elle est unique grâce à son parc national situé aux portes de la ville. La métropole mêle modernité et proximité avec la nature sauvage. Elle constitue souvent le point de départ des safaris kenyans.
""", note: 4),
    
    Lieu(image: "zanzibar", pays: "Tanzanie", ville: "Zanzibar", continent: "Afrique", detail: """
Zanzibar est un archipel réputé pour ses plages de sable blanc et ses eaux turquoise. Stone Town témoigne d’un riche passé marqué par les échanges commerciaux. L’île est également célèbre pour ses épices. Son ambiance tropicale en fait une destination idéale pour la détente.
""", note: 3)
]
