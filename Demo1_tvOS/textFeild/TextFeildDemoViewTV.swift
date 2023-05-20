//
//  TextFeildDemoViewTV.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct TextFeildDemoViewTV: View {
  @State private var username = ""
  @State private var password = ""
  @FocusState private var focusedField: Field?
  
  enum Field {
      case username
      case password
  }
  
  var body: some View {
    if #available(tvOS 16.0, *) {
      VStack {
          TextField("Username", text: $username)
              .focused($focusedField, equals: .username)
              .frame(height: 200)
          
          SecureField("Password", text: $password)
              .focused($focusedField, equals: .password)
              .frame(height: 200)

      }
      .defaultFocus($focusedField, .password)

    }
  }
}

struct TextFeildDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        TextFeildDemoViewTV()
    }
}
