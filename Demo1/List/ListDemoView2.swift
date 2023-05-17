//
//  ListDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListDemoView2: View {
  let items = [
      ("Image 1", "circle.fill"),
      ("Image 2", "circle")
  ]
  
  var body: some View {
      List {
          ForEach(items, id: \.0) { item in
              HStack {
                  ZStack {
                      Circle()
                          .fill(Color.gray)
                          .frame(width: 70, height: 70)
                      Image(systemName: item.1)
                          .resizable()
                          .frame(width: 50, height: 50)
                          .foregroundColor(.white)
                  }
                  Text(item.0)
                      .padding(.leading, 10)
              }
          }
      }
      .listStyle(PlainListStyle())
      .background(Color.clear)
  }
}

struct ListDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView2()
    }
}
