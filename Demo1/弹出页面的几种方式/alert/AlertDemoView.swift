//
//  AlertDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

// .alert: 弹出一个警告对话框，通常用于提示用户错误或者警告信息。

struct AlertDemoView: View {
  @State private var showAlert = false
  
  var body: some View {
      Button("Show Alert") {
          showAlert = true
      }
      .alert(isPresented: $showAlert) {
          Alert(
              title: Text("Hello, world!"),
              message: Text("This is an alert."),
              dismissButton: .default(Text("OK"))
          )
      }
  }
}

struct AlertDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AlertDemoView()
    }
}
