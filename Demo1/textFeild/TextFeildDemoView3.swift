//
//  TextFeildDemoView3.swift
//  Demo1
//
//  Created by visit on 2023/5/21.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct TextFeildDemoView3: View {
  @State private var username = ""
  @State private var password = ""
  @State private var isUsernameValid = false
  @State private var isPasswordValid = false

  @FocusState private var focusedField: Field?
  
  enum Field {
      case username
      case password
  }
  
  var body: some View {
    VStack {
        TextField("Username", text: $username)
            .focused($focusedField, equals: .username)
            .frame(height: 100)
            .border (Color.red, width: (focusedField == .username && !isUsernameValid) ? 2 : 0)
            .background(Color.gray)
            .padding()

        
        SecureField("Password", text: $password)
            .focused($focusedField, equals: .password)
            .frame(height: 100)
            .border (Color.red, width: (focusedField == .password && !isPasswordValid) ? 2 : 0)
    }
    .onSubmit {
      
    }
  }
}

struct TextFeildDemoView3_Previews: PreviewProvider {
    static var previews: some View {
      if #available(iOS 15.0, *) {
        TextFeildDemoView3()
      } else {
        // Fallback on earlier versions
      }
    }
}
