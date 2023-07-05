//
//  EnvironmentDemoView2.swift
//  Demo1
//
//  Created by visit on 2023/6/8.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct EnvironmentDemoView2: View {
    var body: some View {
      
      VStack {
        Spacer()
        
        EnvironmentDemoView2SubView()
          .environment(\.layoutDirection, .rightToLeft)
        
        Spacer()

        HStack {
            Button("111") {

            }
            Button("2222") {

            }
            Button("3333") {

            }
        }
        
        Spacer()
        
      }
      
    }
}

struct EnvironmentDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentDemoView2()
    }
}

struct EnvironmentDemoView2SubView: View {
    var body: some View {
        HStack {
            Button("previous111") {

            }
            Button("play222") {

            }
            Button("next3333") {

            }
        }
    }
}
