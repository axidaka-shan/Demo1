//
//  ListDemoView3.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListDemoView3: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
      if #available(iOS 15.0, *) {
        List {
          ForEach(items, id: \.self) { item in
            Text(item)
          }
        }
        .refreshable {
          // 在此处添加刷新逻辑
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            items.append("Item \(items.count + 1)")
          }
        }
        
      } else {
        // Fallback on earlier versions
      }
    }
}
