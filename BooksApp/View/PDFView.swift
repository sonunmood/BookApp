//
//  PDFView.swift
//  BooksApp
//
//  Created by Sonun on 29/2/24.
//

import SwiftUI
import PDFKit
import Alamofire

//struct PDFView: View {
//    
//    @State private var pdfData: Data?
//    
//    var body: some View {
//        VStack {
//            if let pdfData = pdfData,
//                let pdf = PDFView(data: pdfData ) {
//                pdf
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            } else {
//                Button("Загрузить PDF") {
//                    downloadPDF()
//                }
//            }
//        }
//        .padding()
//    }
//    
//    private func downloadPDF() {
//           guard let url = URL(string: "http://books.google.kg/books/download/Core_Java_SE_9_for_the_Impatient-sample-pdf.acsm?id=fbM1DwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api") else {
//               print("Invalid URL")
//               return
//           }
//
//           AF.download(url).responseData { response in
//               switch response.result {
//               case .success(let data):
//                   self.pdfData = data
//               case .failure(let error):
//                   print("Failed to download PDF:", error.localizedDescription)
//               }
//           }
//       }
//}
//
//struct PDFView_Previews: PreviewProvider {
//    static var previews: some View {
//        PDFView()
//    }
//}
