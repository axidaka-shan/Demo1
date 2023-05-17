//
//  ListDemoView4.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListDemoView4: View {
  @State private var items = ["Item 1", "Item 2", "Item 3"]
  
  var body: some View {
      List {
          ForEach(items, id: \.self) { item in
              Text(item)
          }
      }
      .onAppear {
          setupRefreshControl()
      }
  }
  
  private func setupRefreshControl() {
//      let refreshControl = UIRefreshControl()
//      refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//      UITableView.appearance().refreshControl = refreshControl
  }
  
  private func refreshData() {
//      // 在此处添加刷新逻辑
//      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//          items.append("Item \(items.count + 1)")
//      }
  }
}

struct ListDemoView4_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView4()
    }
}
