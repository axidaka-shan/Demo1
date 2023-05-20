//
//  SafeAreaDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/18.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct SafeAreaDemoView: View {
  var body: some View {
          VStack {
              Text("Hello, World!")
                  .padding()
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .cornerRadius(10)
                  .padding(.top, 150)
              
              Spacer()
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.yellow)
          .ignoresSafeArea(.keyboard, edges: .all)
      }
}

struct SafeAreaDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaDemoView()
    }
}
