//
//  ActionSheetDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

// .actionSheet: 弹出一个操作表单，通常用于显示选项或者菜单。

struct ActionSheetDemoView: View {
  @State private var actionSheetShown = false
  
  var body: some View {
      Button("Show ActionSheet") {
          actionSheetShown = true
      }
      .actionSheet(isPresented: $actionSheetShown) {
          ActionSheet(title: Text("Actions"), message: Text("Choose an action"), buttons: [
              .default(Text("Option 1")),
              .default(Text("Option 2")),
              .destructive(Text("Delete")),
              .cancel()
          ])
      }
  }
}


struct ActionSheetDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetDemoView()
    }
}
