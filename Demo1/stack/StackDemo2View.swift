//
//  StackDemo2View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct StackDemo2View: View {
    var body: some View {
      VStack(spacing: 30) {
        HStack {
            Button("Left Button") {
                // Button action
            }
            Spacer()
            Text("Center Text")
                .font(.headline) // Set the font style and size
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable() // Make the image resizable
                .frame(width: 20, height: 20) // Set the size of the image
        }
        
        HStack {
            Button("Left Button") {
                // Button action
            }
          Spacer()

            Text("Center")
                .font(.headline) // Set the font style and size
          Spacer()
          Spacer()

        }
        HStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.leading, 0)
                .padding(.trailing, 10)
          
//          Spacer()
//            .frame(width: 10)

                
            Text("Never miss a moment! Share your email to receive our newsletter and updates.")
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding(.trailing, 0)
          Spacer()

          
        }
        .alignmentGuide(.leading) { _ in
          return 0
        }
      }
      

    }
}

struct StackDemo2View_Previews: PreviewProvider {
    static var previews: some View {
        StackDemo2View()
    }
}
