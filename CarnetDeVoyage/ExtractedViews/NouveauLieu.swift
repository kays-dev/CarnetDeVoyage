//
//  NouveauLieu.swift
//  CarnetDeVoyage
//
//  Created by Apprenant174 on 08/06/2026.
//

import SwiftUI

struct NouveauLieu: View {
    @Binding var lieux : [Lieu]
    
    @State private var nouveau = ""
    @State private var paysNouveau = ""
    @State private var continentNouveau = ""
    @State private var detailNouveau = ""
    @State private var dejaVisite = false
    @State private var note = 0
    
    @State private var showingImagePicker = false
    @State private var selectedImage: Image?
    @State private var inputImage: UIImage?
    func loadImage() {
        guard let inputImage else { return }
        selectedImage = Image(uiImage: inputImage)
    }
    
    @State private var isUploading = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.brown.opacity(0.2), .brown.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Spacer()
                
                Text("Créer un nouveau lieu")
                    .font(.custom("Futura", size: 24, relativeTo: .title3))
                
                
                Button {
                    showingImagePicker = true
                } label: {
                    VStack{
                        if selectedImage != nil {
                            selectedImage!
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       minHeight: 0,
                                       maxHeight: .infinity
                                )
                                .aspectRatio(1/1 , contentMode: .fill)
                                .clipShape(.rect(cornerRadius: 16))
                            
                        } else {
                            Image("cover")
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       minHeight: 0,
                                       maxHeight: .infinity
                                )
                                .aspectRatio(1/1 , contentMode: .fill)
                                .clipShape(.rect(cornerRadius: 16))
                        }
                    }
                    .aspectRatio(1/1 , contentMode: .fit)
                    .shadow(color: .brown.opacity(0.2), radius: 4, x: 0, y: 4)
                }
                
                VStack{
                    TextField("Nom d'un lieu", text: $nouveau)
                        .textFieldStyle(.plain)
                    
                    Divider()
                    
                    TextField("Pays du lieu", text: $paysNouveau)
                        .textFieldStyle(.plain)
                    
                    Divider()
                    
                    TextField("Continent du lieu", text: $continentNouveau)
                        .textFieldStyle(.plain)
                    
                    Divider()
                    
                    TextField("Détail du lieu", text: $detailNouveau)
                        .textFieldStyle(.plain)
                    
                }
                .font(.custom("Gill Sans", size: 16, relativeTo: .callout))
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(alignment: .center){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .stroke(.accent.opacity(0.1), lineWidth: 1)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.brown)
                        .opacity(0.1)
                }
                
                
                
                HStack(alignment: .center) {
                    Toggle("Visité", systemImage: dejaVisite ? "checkmark.circle.fill" : "checkmark.circle" , isOn: $dejaVisite)
                        .toggleStyle(.button)
                        .font(.custom("Gill Sans", size: 18, relativeTo: .callout))
                        .foregroundStyle(.indigo.opacity(0.8))
                        .tint(.indigo)
                        .background{
                            Capsule()
                                .stroke(.indigo.opacity(0.8), lineWidth: 1)
                            
                        }
                    
                    Spacer()
                    
                    ForEach(1...5, id: \.self) { i in
                        Image(systemName: i <= note ? "star.fill" : "star")
                            .font(.title3)
                            .foregroundStyle(.indigo)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.25)) {
                                    note = i
                                }
                            }
                    }
                }
                .padding()
                
                Spacer()
                
                Button("Ajouter") {
                    lieux.insert(Lieu(image :  inputImage?.toPngString() ?? "cover", pays: paysNouveau, ville: nouveau, continent: continentNouveau, detail: detailNouveau, note: note, visited: dejaVisite), at: 0)
                    
                    
                    nouveau = ""
                    paysNouveau = ""
                    continentNouveau = ""
                    detailNouveau = ""
                    note = 0
                    
                    dismiss()
                }
                .font(.custom("Futura Bold", size: 16, relativeTo: .callout))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background{
                    Capsule()
                        .fill(.indigo)
                        .shadow(color: .indigo.opacity(0.2), radius: 4, x: 0, y: 0)
                }
                .foregroundStyle(.white)
                
                
            }
            .padding(.horizontal, 32)
            .foregroundStyle(.accent)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) {
                Task {
                    isUploading = true
                    await MainActor.run {
                        loadImage()
                        isUploading = false
                    }
                }
            }
        }
    }
    
}

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
    
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

#Preview {
    struct PreviewVar : View {
        @State private var lieux = mockData.sorted{ $0.ville.lowercased() < $1.ville.lowercased() }
        
        var body : some View {
            
            NouveauLieu(lieux: $lieux)
        }
    }
    
    return PreviewVar()
}
