//
//  DragDemoView3.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct DragDemoView3: View {
  @State private var isDropTargeted = false

  var body: some View {
    VStack {
      if #available(iOS 16.0.0, *) {
        Color.pink
            .frame(width: 400, height: 400)
            .dropDestination(for: String.self) { items, location in
              return true
            } isTargeted: { test in
              isDropTargeted = test
            }
            
      }
    }
      
  }

  func process(titles: [String]) {
    
  }
  func animateDrop(at: CGPoint) {
    
  }
}

struct DragDemoView3_Previews: PreviewProvider {
    static var previews: some View {
        DragDemoView3()
    }
}

