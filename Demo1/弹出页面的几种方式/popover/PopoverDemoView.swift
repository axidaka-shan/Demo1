//
//  PopoverDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI
// .popover: 弹出一个气泡窗口，通常用于显示选项或者菜单。

struct PopoverDemoView: View {
  @State private var popoverShown = false
  
  var body: some View {
      Button("Show Popover") {
          popoverShown = true
      }
      .popover(isPresented: $popoverShown, attachmentAnchor: .rect(.bounds), arrowEdge: .trailing) {
          Text("Popover Content")
              .padding()
              .background(Color.secondary)
              .cornerRadius(10)
      }
  }
}

struct PopoverDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverDemoView()
    }
}
