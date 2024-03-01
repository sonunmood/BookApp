//
//  MainButton.swift
//  BooksApp
//
//  Created by Sonun on 28/2/24.
//

import SwiftUI

struct MainButton: View {
    
    @State var buttonText  = ""
    var buttonColor: Color = .blue
    let action: () -> Void

    
    var body: some View {
        VStack(spacing: .zero) {
            Button {
                action()
            } label: {
                Text(buttonText)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(.vertical, 11)
                    .foregroundColor(.black)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 44
                    )
            }
            .background(buttonColor)
            .cornerRadius(1000)
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(buttonText: "", buttonColor: .blue, action: {})
    }
}
