//
//  DragDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct DragDemoView: View {
  var title: String
  var body: some View {
    VStack {
      if #available(iOS 16.0.0, *) {
        Color.pink
            .frame(width: 200, height: 200)
            .draggable(title) {
                 Text("Drop me")
             }
      }
    }
  }
}

struct DragDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DragDemoView(title: "aaaaa")
    }
}
