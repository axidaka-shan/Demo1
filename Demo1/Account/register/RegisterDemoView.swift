//
//  RegisterDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct RegisterDemoView: View {
  @State var birthDate = Date()
  
  var body: some View {
      VStack {
          Text("Register")
              .font(.largeTitle)
              .fontWeight(.bold)
              .padding()
          
          Form {
              Section(header: Text("Personal Information")) {
                  TextField("Full Name", text: .constant(""))
                  DatePicker("Birth Date", selection: $birthDate, in: ...Date(), displayedComponents: .hourAndMinute)
              }
              
              Section {
                  Button("Register") {
                      // Register action
                  }
              }
          }
      }
  }
}

struct RegisterDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterDemoView()
    }
}
