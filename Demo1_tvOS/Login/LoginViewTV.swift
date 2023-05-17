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
  @State private var errorMessage = ""
  var body: some View {
    VStack {
        
        VStack {
          Text(("nl.login.title"))
            .font(Font(UIFont.systemFont(ofSize: 60)))
            .foregroundColor(Color(.white))
          
          Spacer().frame(height: 30)

          Text(("nl.login.description"))
            .font(Font(UIFont.systemFont(ofSize: 30)))
            .foregroundColor(Color(.white))
          
          Spacer().frame(height: 50)
        }
        
      VStack {
        TextField("Username", text: $username)
          .frame(width: 720,height: 200)
          .textFieldStyle(PlainTextFieldStyle())

        Spacer().frame(height: 30)
        SecureField("Password", text: $password)
          .frame(width: 720,height: 100)
      }
      
      VStack {
        Button("Login") {
            if username == "admin" && password == "password" {
                // TODO: Login success
            } else {
                errorMessage = "Username or password is incorrect"
            }
        }
        .frame(minWidth: 300)
        
        CustomButton()
          .frame(height: 200)
     }
      VStack {
              Text(errorMessage)
                  .foregroundColor(.red)
          }
      }
      .foregroundColor(Color(.black))

  }
}

struct LoginViewTV_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewTV()
    }
}
