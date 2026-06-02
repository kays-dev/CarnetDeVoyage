//
//  CarteLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 02/06/2026.
//

import SwiftUI

struct CarteLieu: View {
    var body: some View {

        VStack {
            Image(systemName: "sun.fill")
                .font(.title)
            
            Text("Why isn't it working. oh okay it is")
        }
        .frame(width: .infinity, height: 250)
        .background(
            RoundedRectangle(cornerRadius: 24)
        )
    }
}

#Preview {
    CarteLieu()
}
