//
//  HGridDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/23.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct HGridDemoView: View {
  let data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  let rows = [
      GridItem(.flexible()),
//      GridItem(.flexible()),
//      GridItem(.flexible())
  ]
  
  var body: some View {
      ScrollView {
          LazyHGrid(rows: rows, spacing: 10) {
              ForEach(data, id: \.self) { item in
                  Text(item)
                      .frame(maxWidth: .infinity, minHeight: 10)
                      .background(Color.gray)
              }
          }
          .padding()
      }
  }
}

struct HGridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        HGridDemoView()
    }
}
