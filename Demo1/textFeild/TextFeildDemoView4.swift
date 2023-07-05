//
//  TextFeildDemoView4.swift
//  Demo1
//
//  Created by visit on 2023/7/3.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct TextFeildDemoView4: View {
  @State private var text: String = ""
  @State private var password: String = ""
  @State private var text2: String = ""
  @State private var password2: String = ""
  @State private var edress: String = ""

  var body: some View {
    VStack(spacing: 30) {
      VStack {
        TextField("请输入用户名", text: $text)
           //设置键盘类型
          .keyboardType(.emailAddress)
          //设置对齐方式
          .multilineTextAlignment(.leading)
          //设置光标颜色，默认纯白色光标
          .accentColor(.green)
          //输入字体颜色
          .foregroundColor(.red)
          //字体大小
          .font(.system(size: 14))
          .textFieldStyle(IconTextFieldStyle(icon: "person.fill"))
        
        TextField("请输入密码", text: $password)
            .textFieldStyle(IconTextFieldStyle(icon: "lock.fill"))
      }
      
      VStack {
        TextField("请输入用户名2", text: $text2)
            .textFieldStyle(CustomTextFieldStyle())
        
        TextField("请输入密码2", text: $password2)
            .textFieldStyle(CustomTextFieldStyle())
        
        TextEditor(text: $edress)
          .background(Color.gray.opacity(0.2))

      }
    }
    .padding()
    .onAppear {
      UITextView.appearance().backgroundColor = .yellow

    }

  }
}

struct TextFeildDemoView4_Previews: PreviewProvider {
    static var previews: some View {
        TextFeildDemoView4()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.gray)
            .cornerRadius(5)
            .foregroundColor(.white)
    }
}

struct IconTextFieldStyle: TextFieldStyle {
    let icon: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            configuration
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
        }
    }
}
