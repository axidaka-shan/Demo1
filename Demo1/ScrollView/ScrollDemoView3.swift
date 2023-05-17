//
//  ScrollDemoView3.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ScrollDemoView3: View {
  @State private var items = (1...50).map { Item3(id: $0, title: "Item \($0)") }
  @State private var scrollPosition: CGFloat = 0
  
  var body: some View {
      ScrollViewReader { scrollView in
          ScrollView {
              List {
                  ForEach(items) { item in
                      GeometryReader { geometry in
                          Text(item.title)
                      }
                      .padding(.vertical, 20)
                      .id(item.id)
                  }
              }

          }
        
      }
//      .onChange(of: scrollPosition) { offset in
//        scrollPosition = offset
//          print("Scroll position: \(scrollPosition)")
//      }
  }
}

struct ScrollDemoView3_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDemoView3()
    }
}

struct Item3: Identifiable {
    let id: Int
    let title: String
}
