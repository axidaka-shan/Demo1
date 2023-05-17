//
//  AlertControllerDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct AlertControllerDemoView2: View {
  var body: some View {
      Button(action: showAlert) {
          Text("显示警告框")
      }
  }
  
  func showAlert() {
      let alertController = UIAlertController(title: "提示", message: "这是一个警告框", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "确定", style: .default) { (_) in
          // 点击确定按钮后执行的代码
      }
      alertController.addAction(okAction)
      UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
  }
}

struct AlertControllerDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        AlertControllerDemoView2()
    }
}
