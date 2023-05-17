//
//  BindingDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/20.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct BindingDemoView: View {
  @State var text: String? = nil
  
  var body: some View {
    let binding = Binding<String>(get: { self.text ?? "" }, set: { self.text = $0.isEmpty ? nil : $0 })

      VStack {
          TextField("Enter some text", text: binding)
        
        Spacer().frame(height: 30)
        
          Text("Text: \(String(describing: text))")
      }
  }
}

struct BindingDemoView_Previews: PreviewProvider {
    static var previews: some View {
        BindingDemoView()
    }
}
