//
//  ContentView.swift
//  BooksApp
//
//  Created by Sonun on 21/2/24.
//

import SwiftUI
import Alamofire
import Kingfisher

struct ContentView: View {
    
    @StateObject private var viewModel = BooksViewModel()
    @State var isSearchTapped = false
    @State private var searchText = ""
    @State private var scrollOffset: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.bookResults, id: \.id) { item in
                                
                                let description = item.volumeInfo.description ?? ""
                                let image = item.volumeInfo.imageLinks?.smallThumbnail ?? ""
                                let title = item.volumeInfo.title ?? ""
                                let pdfURL = item.accessInfo.epub.acsTokenLink ?? ""
                                 let isAvalable =  item.accessInfo.epub.isAvailable ?? false
                                
                                NavigationLink( destination: DetailBookScreen(pdfURL: pdfURL, description: description, imageURL: image, title: title, isAvailable: isAvalable, pdfTapped: true)) {
                                        VStack (alignment: .center) {
                                        KFImage(URL(string: item.volumeInfo.imageLinks?.smallThumbnail ?? ""))
                                            .onSuccess { _ in
                                                print("Image loaded successfully")
                                            }
                                            .onFailure { error in
                                                print("Error loading image: \(error)")
                                            }
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 180, height: 240)
                                            .cornerRadius(10)
                                            .padding(16)

                                        if let title = item.volumeInfo.title {
                                            Text(title)
                                                .padding(.top, 16)
                                                .font(.system(size: 24))
                                                .foregroundColor(.black)
                                                .lineLimit(2)
                                            
                                        } else {
                                            Text("koko")
                                        }
                                    }
                                }.frame(width: 220)
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search")
                    
                    Spacer()
                    
                    Button (action: {
                        viewModel.getBooks(searchText: searchText)
                    })  {
                        Text("Найти")
                            .foregroundColor(.black)
                    }
                    .padding(16)
                    .background(Color.orange)
                    .cornerRadius(20)
                    .padding(16)
                    
                }.background(Color.white)
            }.navigationBarTitle("iBooks").foregroundColor(Color.black)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
