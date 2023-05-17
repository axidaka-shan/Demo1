//
//  ButtonDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
      
      ScrollViewReader { _ in
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center) {
            
            // 1.定制Button样式
            Group {
              Text("1.定制Button样式")
              Spacer().frame(height: 20)

              ButtonDemoView.BaseButton(
                title: "Sign In 1",
                action: {
                },
                isEnabled: true,
                isLoading: false
              )
              .disabled(false)
              .frame(height: 50)
              .cornerRadius(25)
              
              Spacer().frame(height: 20)
              
              ButtonDemoView.BaseButton(
                title: "Sign Up 1",
                action: {
                },
                isEnabled: true,
                primary: false,
                isLoading: false
              )
              .disabled(false)
              .frame(height: 50)
              .padding(.horizontal, 15)
              .border(.orange, width: 2)
              .cornerRadius(25)
            }
            
            
            //  2.设置圆角
            // 2.1 使用 cornerRadius 设置圆角
            Group {
              Spacer().frame(height: 20)
              Text("2.圆角 \n2.1 使用 cornerRadius 设置圆角")
              Spacer().frame(height: 20)

              Button("登录 2.1") {
              }
      //        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
      //        .border(.orange, width: 2)
              .cornerRadius(15)
              .frame(width: 100, height: 60)
              .background(Color.gray)

              // 2.2 使用 clipShape 设置正圆角
              Spacer().frame(height: 20)
              Text("2.2 使用 clipShape 设置正圆角")
              Spacer().frame(height: 20)
              
              Button("登录/注册 2.2") {
              }
              .foregroundColor(.white)
              .padding(EdgeInsets(top: 38, leading: 15, bottom: 38, trailing: 15))
              .background(Color.gray)
               .clipShape(Circle())
              
              Spacer().frame(height: 20)
              
              Button("adasd 2.2") {
              }
              .foregroundColor(.black)
              .font(Font(UIFont.systemFont(ofSize: 30)))
              .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
              .background(Color.red)
              .frame(width: 80, height: 80)
              .clipShape(Circle())
            }
            
            
            // 3.设置边框
            // 3.1 使用 border 设置边框
            Group {
              Spacer().frame(height: 20)
              Text("3.设置边框 \n3.1 使用 border 设置边框")
              Spacer().frame(height: 20)
              
              Button("登录/注册 3.1") {
              }
              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .border(.orange, width: 2)
            }
            
            
            //        4.如果你想设置一个弧形的边框线，使用cornerRadius、和border 组合可以不可以呢？
            //        大概会因为顺序的原因，出现一下这两种效果
            Group {
              Spacer().frame(height: 20)
              Text("4.如果你想设置一个弧形的边框线，使用cornerRadius、和border 组合可以不可以呢？\n大概会因为顺序的原因，出现一下这两种效果 \n\n4.1 先设置 cornerRadius 再设置 border")
              Spacer().frame(height: 20)
              
              // 4.1 先设置 cornerRadius 再设置 border
              Button("登录/注册 4.1") {
              }
              .background(Color.gray)

              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .background(Color.gray)
              .cornerRadius(20)
              .border(.orange, width: 2)
              
              Spacer().frame(height: 20)
              Text("4.2 先设置 border 再设置 cornerRadius")
              Spacer().frame(height: 20)
              
              // 4.2 先设置 border 再设置 cornerRadius
              Button("登录/注册 4.2") {
              }
              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .background(Color.gray)
              .border(.orange, width: 2)
              .cornerRadius(20)
            }
            
            
            /*
             5.但是这种圆角边框要怎么设置呢？
             以下这两种方法仅仅是设置圆角边框

             5.1 使用 RoundedRectangle 设置圆角，stroke 设置边框颜色和宽度，当然如果当前view有背景色需要设置 cornerRadius, 否则不需要
             */
            Group {
              Spacer().frame(height: 20)
              Text("5.但是这种圆角边框要怎么设置呢？\n以下这两种方法仅仅是设置圆角边框 \n\n5.1 使用 RoundedRectangle 设置圆角，stroke 设置边框颜色和宽度，当然如果当前view有背景色需要设置 cornerRadius, 否则不需要")
              Spacer().frame(height: 20)
              
              Button("登录/注册 5.1") {
              }
              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .background(Color.gray)
              .cornerRadius(20)
              .overlay(
                  RoundedRectangle(cornerRadius: 20, style: .continuous)
                       .stroke(.orange, lineWidth: 2)
              )
              
              Spacer().frame(height: 20)

              Button("登录/注册 5.1") {
                // 这里可以整个范围响应点击事件
              }
              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .cornerRadius(20)
              .overlay(
                  RoundedRectangle(cornerRadius: 20, style: .continuous)
                       .stroke(.orange, lineWidth: 2)
              )
              .background(Color.gray)
              .onTapGesture {
                // 这样可以整个范围响应点击事件
              }
              
              Spacer().frame(height: 20)
              Text("5.2 如果是正园的话，使用 Circle 替换 RoundedRectangle 就好 ，当然 cornerRadius 有背景的话也要设置")
              Spacer().frame(height: 20)

              // 5.2 如果是正园的话，使用 Circle 替换 RoundedRectangle 就好 ，当然 cornerRadius 有背景的话也要设置
              Button("登录/注册 5.2") {
              }
              .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
              .background(Color.gray)
              .cornerRadius(20)
              .overlay(Circle().stroke(.orange, lineWidth: 2))
            }
          }
        }
      }
      .padding(.horizontal, 30)
    }
}

struct ButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView()
    }
}


