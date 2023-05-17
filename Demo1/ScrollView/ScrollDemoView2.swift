//
//  ScrollDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ScrollDemoView2: View {
  
  @State private var items = (1...50).map { Item3(id: $0, title: "Item \($0)") }
  @State private var scrollOffset: CGFloat = 0.0
  
  var body: some View {
      List {
          ForEach(items.indices, id: \.self) { index in
              Text("Item \(index)")
          }
      }
      .background(GeometryReader { geo in
          Color.clear.onAppear {
              self.scrollOffset = geo.frame(in: .global).minY
          }
      })
      .onChange(of: scrollOffset) { offset in
          self.scrollOffset = offset
          print("List offset: \(self.scrollOffset)")
      }
  }
}

struct ScrollDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDemoView2()
    }
}
