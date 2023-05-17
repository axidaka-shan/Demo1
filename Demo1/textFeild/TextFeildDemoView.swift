//
//  TextFeildDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/4/12.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

/**
 在SwiftUI中，.ignoresSafeArea(.keyboard) 修饰符用于告诉系统在显示键盘时忽略安全区域。这意味着您的应用程序内容将被允许延伸到键盘后面，而不是被推到键盘上面。

 当您的视图包含位于屏幕底部的文本字段或其他输入控件时，此修饰符非常有用。如果没有.ignoresSafeArea(.keyboard) 修饰符，键盘将推动整个视图，可能会将输入控件从用户隐藏。通过使用此修饰符，您可以确保输入控件在显示键盘时仍然可见且可访问。
 */

struct TextFeildDemoView: View {
  @State private var text1 = ""
  @State private var text2 = ""
  @State private var myDouble: Double = 0.673
  @State private var myMoney: Double? = 300.0

  var body: some View {
    
    ScrollViewReader { _ in
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 0, content: {
          TextField("Enter text1", text: $text1)
            .onChange(of: text1, perform: { newValue in
              print ("new1: \(newValue)")
            })
              .padding()
              .background(Color.gray.opacity(0.2))
              .cornerRadius(10)
              .padding()
    //              .ignoresSafeArea(.keyboard)

          if #available(iOS 15.0, *) {
            TextField("Enter text2", text: $text2, prompt: Text("ad"))
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            TextField(text: $text2) {
              Image(systemName: "square.and.arrow.up")
                .foregroundColor(Color.red)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            
            VStack {
              TextField(
                  "Double",
                  value: $myDouble,
                  format: .number
              )
              .padding()
              .background(Color.gray.opacity(0.2))
              .cornerRadius(10)
              .padding()
        
              Text(myDouble, format: .number)
              Text(myDouble, format: .number.precision(.significantDigits(5)))
              Text(myDouble, format: .number.notation(.scientific))
            }
            
            TextField(
                "Currency (USD)",
                value: $myMoney,
                format: .currency(code: "USD")
            )
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            .onChange(of: myMoney) { newValue in
              print ("myMoney: \(String(describing: newValue))")
            }
          }
        })
      }
    }
  }
}

struct TextFeildDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TextFeildDemoView()
    }
}
