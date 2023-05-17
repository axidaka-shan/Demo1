//
//  StorageDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

/**
 defaultAppStorage(UserDefaults)是一个在SwiftUI中使用的方法，它允许我们在应用程序中存储和检索用户的偏好设置。这个方法返回一个视图，可以在视图层次结构中使用。

 这个方法接受一个UserDefaults对象作为参数，该对象用于存储和检索偏好设置。
 
 在这个示例中，我们使用@AppStorage属性包装器将username属性绑定到UserDefaults中的键"username"。这意味着当用户更改他们的用户名时，我们的应用程序将自动更新。

 我们可以在应用程序的任何视图中使用 @AppStorage 属性包装器来存储和检索偏好设置。这使得在整个应用程序中保持一致的用户体验变得更加容易。

 */

struct StorageDemoView: View {
  @AppStorage("username") var username = "Guest"
  @State private var text1 = ""

  var body: some View {
    VStack {
      Text("Welcome, \(username)!")

      TextField("Enter text1", text: $text1)
        .onChange(of: text1, perform: { newValue in
          username = text1
        })
          .padding()
          .background(Color.gray.opacity(0.2))
          .cornerRadius(10)
          .padding()
    }
  }
}

struct StorageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StorageDemoView()
    }
}
