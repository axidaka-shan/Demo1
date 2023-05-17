//
//  VGridDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/23.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct VGridDemoView: View {
  let data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  let columns = [
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible())
  ]
  
  // 列间距
  let columnSpace: CGFloat = 10
  
  var body: some View {
      ScrollView {
          LazyVGrid(columns: columns, spacing: columnSpace) {
              ForEach(data, id: \.self) { item in
                  Text(item)
                      .frame(maxWidth: .infinity, minHeight: 100)
                      .background(Color.gray)
              }
          }
          .padding()
      }
  }
}

struct VGridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VGridDemoView()
    }
}
