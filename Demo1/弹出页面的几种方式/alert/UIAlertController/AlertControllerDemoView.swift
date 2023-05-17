//
//  AlertControllerDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

// 报错： Cannot convert value of type 'AlertController' to closure result type 'Alert'

struct AlertControllerDemoView: View {
  
  @State private var showAlert = false
  
  var body: some View {
//      Button("Show Alert") {
//          self.showAlert = true
//      }
//      .alert(isPresented: $showAlert) {
//          AlertController(title: "Title", message: "Message", preferredStyle: .alert, actions: [
//              UIAlertAction(title: "OK", style: .default) { _ in
//                  // 处理OK按钮点击事件
//              },
//              UIAlertAction(title: "Cancel", style: .cancel) { _ in
//                  // 处理Cancel按钮点击事件
//              }
//          ])
//      }
    Text("")
  }
  
}

struct AlertControllerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AlertControllerDemoView()
    }
}
