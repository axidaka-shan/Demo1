//
//  LoginViewTV.swift
//  Demo1_tvOS
//
//  Created by axidaka on 2023/5/8.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct LoginViewTV: View {
  
  @State private var username = ""
  @State private var password = ""
  @State private var test = ""

  @State private var errorMessage = ""
  
  @FocusState private var focusedField: Field?
  
  enum Field {
      case username
      case password
  }
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.uiBgBlack(), Color.uiBgBlue()]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      
      VStack {
          
          VStack(spacing: 40) {
            Text(("nl.login.title"))
              .font(Font(UIFont.systemFont(ofSize: 60)))
              .foregroundColor(Color(.white))
            
            Spacer().frame(height: 10)

            
            Spacer().frame(height: 40)
          }
          
        VStack(alignment: .leading, spacing: 40) {
          
          TextField("Username", text: $username)
            .font(Font.system(size: 32))
            .foregroundColor(Color(uiColor: .black))
            .frame(width: 860,height: 100)
            .textFieldStyle(PlainTextFieldStyle())

          Spacer().frame(height: 30)
          
          SecureField("Password", text: $password)
            .font(Font.system(size: 32))
            .foregroundColor(Color(uiColor: .black))
            .frame(width: 860,height: 100)


//          HStack(spacing: 0) {
//            Spacer().frame(width: 40)
//            Image("ic_mail_tv")
//            Spacer().frame(width: 40)
//
//            TextField("Username", text: $username)
//              .foregroundColor(focusedField == .username ? .black : .black)
//              .font(Font.system(size: 32))
//              .focused($focusedField, equals: .username)
//  //            .frame(width: 760,height: 80)
//  //            .background(.blue)
//
//          }
//          .frame(width: focusedField == .username ? 1.05 * 860 : 860, height: focusedField == .username ? 1.05 * 80 : 80)
//          .background(.blue)
//          .cornerRadius(10)

        }

        Spacer().frame(height: 30)

        
        VStack {
          Button("Login") {
              if username == "admin" && password == "password" {
                  // TODO: Login success
              } else {
                  errorMessage = "Username or password is incorrect"
              }
          }
       }
        .frame(width: 860)

        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
        }
        
      }
      .frame(width: 860)

    }
    .foregroundColor(Color(.red))
    .onAppear {
      print("=========onAppear=============")
    }
    .onDisappear {
      print("=========onDisappear=============")
    }
  }
}

struct LoginViewTV_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewTV()
    }
}

extension Color {
  static func uiBgBlack() -> Color {
    return Color(hex: 0x060A0F)
  }
  static func uiBgBlue() -> Color {
    return Color(hex: 0x0F2C60)
  }
  static func uiTextColor() -> Color {
    return Color(hex: 0x040C19)
  }
  init(hex: UInt, alpha: Double = 1) {
    self.init(
        .sRGB,
        red: Double((hex >> 16) & 0xff) / 255,
        green: Double((hex >> 08) & 0xff) / 255,
        blue: Double((hex >> 00) & 0xff) / 255,
        opacity: alpha
    )
  }
}
