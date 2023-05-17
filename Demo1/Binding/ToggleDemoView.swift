//
//  ToggleDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/20.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI
/*
 在此示例中，我们使用 @State 属性包装器来存储isOn的值。我们还使用Binding属性包装器来创建一个 Binding<Bool?>，并将其传递给Toggle视图。
 在Binding的get闭包中，我们使用self.isOn ?? false来确保我们始终返回一个非空的布尔值。
 在Binding的set闭包中，我们使用self.isOn = $0 ? $0 : nil来将isOn设置为nil，如果$0为false。这将允许我们在isOn的值为nil时将Toggle设置为中间状态。
 */
// 关于Binding我们也可以这样传值： .constant(nil) 
struct ToggleDemoView: View {
  @State var isOn: Bool? = nil
  
  var body: some View {
      VStack {
          Toggle(isOn: Binding(
              get: { self.isOn ?? false },
              set: { self.isOn = $0 ? $0 : nil }
          )) {
              Text("Toggle")
          }
          
          Text("isOn: \(String(describing: isOn))")
      }
  }
}

struct ToggleDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDemoView()
    }
}
