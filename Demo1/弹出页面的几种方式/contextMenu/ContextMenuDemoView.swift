//
//  ContextMenuDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ContextMenuDemoView: View {
  var items: [Item]
  @State private var selection = Set<Item.ID>()

  var body: some View {
    
    if #available(iOS 16.0.0, *) {
      List(selection: $selection) {
          ForEach(items) { item in
              Text(item.name)
          }
      }
      .contextMenu(forSelectionType: Item.ID.self) { items in
          if items.isEmpty { // Empty area menu.
              Button("New Item") { }

          } else if items.count == 1 { // Single item menu.
              Button("Copy") { }
              Button("Delete", role: .destructive) { }

          } else { // Multi-item menu.
              Button("Copy") { }
              Button("New Folder With Selection") { }
              Button("Delete Selected", role: .destructive) { }
          }
      }
    }
      
  }
}

struct ContextMenuDemoView_Previews: PreviewProvider {
    static var previews: some View {
      ContextMenuDemoView(items: [Item(id: 1, name: "aaaaaa"), Item(id: 2, name: "bbbb")])
    }
}

struct Item: Identifiable {
  var id: Int
  
  var name: String
}
