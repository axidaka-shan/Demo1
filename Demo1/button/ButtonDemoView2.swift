//
//  ButtonDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/5/10.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ButtonDemoView2: View {

    var body: some View {
      
      ScrollViewReader { _ in
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center) {
            Group {
              
              // 第1种：对Button本身设置背景色无效，只能对label设置，label为范型
              Button {
                
              } label: {
                Text("Sign in")
                  .background(Color.red)
              }
              .background(Color.green)

              Spacer().frame(height: 20)

              // 第2种：这种默认label为Text类型，相当于对Text设置背景色
              Button("注册萨达撒打算打算的") {
                
              }
              .background(Color.green)

              if #available(iOS 15.0.0, *) {
                // 第3种：
                Button(action: {
                    // Your action here
                }) {
                    Text("destructive Button")
                }
                .buttonStyle(CustomButtonStyle(role: .destructive))
                
                Button(action: {
                    // Your action here
                }) {
                    Text("cancel Button")
                }
                .buttonStyle(CustomButtonStyle(role: .cancel))
                
                Button(role: .destructive) {
                  
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                
                Button(role: .cancel) {
                  
                } label: {
                    Label("Delete", systemImage: "trash")
                }
              }
              
            }
            
            Group {
              Button {
                
              } label: {
                Text("登录")
              }
              .frame(maxWidth: .infinity)
              .frame(height: 50)
              .padding([.leading, .trailing], 20)
              .background(Color.gray)
              .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.red)
                  .foregroundColor(.clear)
              )
              .font(Font(UIFont.systemFont(ofSize: 17)))

              Button {
                
              } label: {
                Text("登录2")
              }
              .frame(maxWidth: .infinity)
              .frame(height: 50)
              .padding([.leading, .trailing], 20)
              .background(Color.gray)
              .cornerRadius(10)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.red)
                  .foregroundColor(.clear)
              )
              .font(Font(UIFont.systemFont(ofSize: 17)))
              .buttonStyle(CustomRemoveHighlightStyle())

            }
          }
        }
      }
      .padding(.horizontal, 30)
    }
}

struct ButtonDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView2()
    }
}

@available(iOS 15.0, *)
struct CustomButtonStyle: ButtonStyle {
    var role: ButtonRole
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(role == .destructive ? Color.blue : Color.gray)
            .foregroundColor(.white)
//            .cornerRadius(10)
    }
}

struct CustomRemoveHighlightStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0) // 去掉高亮效果
    }
}
