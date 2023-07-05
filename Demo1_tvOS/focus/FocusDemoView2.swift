//
//  FocusDemoView2.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/7/3.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FocusDemoView2: View {
  
  var body: some View {
  VStack(alignment: .leading) {
              Text("Section 1")

              ScrollView(.horizontal) {
                  HStack {
                      ForEach(0..<10) { _ in
                          Button(action: {}) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }.focusSection()

              Text("Section 2")

              ScrollView(.horizontal) {
                  HStack {
                      ForEach(0..<2) { _ in
                          Button(action: {}) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }.focusSection()

              Text("Section 3")

              ScrollView(.horizontal) {
                  HStack {
                      ForEach(0..<3) { _ in
                          Button(action: {}) {
                              FocusableRectangle()
                          }.buttonStyle(CardButtonStyle())
                      }
                  }.padding(40)
              }.focusSection()

              Spacer()
          }
      }
  }


struct FocusDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        FocusDemoView2()
    }
}
