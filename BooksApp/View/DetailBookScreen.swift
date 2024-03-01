//
//  DetailBookScreen.swift
//  BooksApp
//
//  Created by Sonun on 26/2/24.
//

import SwiftUI
import Kingfisher
import Alamofire

struct DetailBookScreen: View {
    
    let pdfURL: String?
    let description: String
    let imageURL: String
    let title: String
    var isAvailable: Bool
    @State var pdfTapped = false
    @State var showAlert = false
    @State var showSuccessAlert = false
    
    var body: some View {
    
            VStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .padding(.leading, 16)
                        .cornerRadius(10)
                        .multilineTextAlignment(.leading)
                        .frame(width: 160, height: 200)
                    
                    
                    Text(description)
                        .foregroundColor(Color.black)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .padding(16)
                }
                
                Spacer()
                
            }.padding(.top, 16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if isAvailable == true {
                            downloadPDF()
                            showSuccessAlert = true
                        } else {
                            showAlert = true
                        }
                       
                    } label: {
                        Text("PDF")
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Ошибка"), message: Text("Невозможно загрузить PDF"), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $showSuccessAlert) {
                        Alert(title: Text("Успешно"), message: Text("Загружен PDF"), dismissButton: .default(Text("OK")))
                    }
                }
            }.background(Color.white)
    }
    
    
    private func downloadPDF() {
        guard let url = pdfURL else {
            print("Invalid URL")
            return
        }
        
        AF.download(url).responseData { response in
            switch response.result {
            case .success(let data):
                print(data)
                savePDF(data: data)
            case .failure(let error):
                print("Failed to download PDF:", error.localizedDescription)
            }
        }
        
        print(url)
    }
    
    private func savePDF(data: Data) {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let destinationURL = documentsDirectory.appendingPathComponent("book.pdf")
            try data.write(to: destinationURL)
            print("Книга успешно загружена и сохранена по следующему пути:", destinationURL)
        } catch {
            print("Ошибка сохранения книги:", error.localizedDescription)
        }
    }
}

struct DetailBookScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailBookScreen(pdfURL: "", description: "", imageURL: "", title: "", isAvailable: true)
    }
}
