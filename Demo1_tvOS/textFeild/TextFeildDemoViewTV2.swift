//
//  TextFeildDemoViewTV2.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/7/3.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct TextFeildDemoViewTV2: View {
  @State private var text: String = ""
  @State private var password: String = ""
  @State private var text2: String = ""
  @State private var password2: String = ""
  @State private var needChange: Bool = false

  @FocusState private var focusedField: Field?
  
  enum Field {
      case username
      case password
    case username2
    case password2
  }
  
  var body: some View {
    VStack(spacing: 30) {
      VStack {
        TextField("请输入用户名", text: $text)
          .foregroundColor(needChange ? .red : .green)
          .font(Font.system(size: 50))
            .textFieldStyle(IconTextFieldStyle(icon: "person.fill"))
            .focused($focusedField, equals: .username)

        
        TextField("请输入密码", text: $password)
          .foregroundColor(needChange ? .red : .green)
          .font(Font.system(size: 50))
            .textFieldStyle(IconTextFieldStyle(icon: "lock.fill"))
            .focused($focusedField, equals: .password)

      }
      
      VStack {
        TextField("请输入用户名2", text: $text2)
          .foregroundColor(needChange ? .red : .green)
          .font(Font.system(size: 50))
            .textFieldStyle(CustomTextFieldStyle())
            .focused($focusedField, equals: .username2)

        
        TextField("请输入密码2", text: $password2)
          .foregroundColor(needChange ? .red : .green)
          .font(Font.system(size: 50))
            .textFieldStyle(CustomTextFieldStyle())
            .focused($focusedField, equals: .password2)
            .foregroundColor(.red)

      }
      
      Button("Change color") {
        needChange.toggle()
      }
      
    }
    .padding()

  }
}

struct TextFeildDemoViewTV2_Previews: PreviewProvider {
    static var previews: some View {
        TextFeildDemoViewTV2()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .foregroundColor(.red)
            .padding(10)
            .background(Color.clear)
            .cornerRadius(5)
            .foregroundColor(.red)
            .font(Font.system(size: 50))
    }
}

struct IconTextFieldStyle: TextFieldStyle {
    let icon: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            configuration
            .foregroundColor(.red)
                .padding(10)
                .background(Color.clear)
                .cornerRadius(5)
                .foregroundColor(.red)
                .font(Font.system(size: 50))

        }
    }
}
