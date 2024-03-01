//
//  BorderButton.swift
//  BooksApp
//
//  Created by Sonun on 28/2/24.
//

import SwiftUI

struct BorderButton: View {
    
    @State var buttonText = ""
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: .zero) {
            RoundedRectangle(cornerRadius: 1000)
                .fill(Color.clear)
                .overlay(
                    HStack(spacing: .zero) {
                        Button(action: {
                            action()
                        }) {
                            HStack(spacing: 4) {
                                Text(buttonText)
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.primary)
                            }
                        }
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 1000)
                        .stroke(
                            Color.primary,
                            lineWidth: 1
                        )
                )
            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 44
        )
    }
}


struct BorderButton_Previews: PreviewProvider {
    static var previews: some View {
        BorderButton(buttonText: "") {
        }
    }
}
