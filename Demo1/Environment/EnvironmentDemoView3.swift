//
//  EnvironmentDemoView3.swift
//  Demo1
//
//  Created by visit on 2023/6/8.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

class MyEnvironmentObject: ObservableObject {
    @Published var myVariable: String = "default value"
}

struct EnvironmentDemoView3: View {
  @EnvironmentObject var myEnvironmentObject: MyEnvironmentObject

    var body: some View {
      VStack {
        Spacer()
        
        Text(myEnvironmentObject.myVariable)
        Button("父 Change Value") {
            myEnvironmentObject.myVariable = "父 new value"
        }
        
        Spacer()

        EnvironmentDemoView3ChildView()
        Spacer()

      }
    }
}

struct EnvironmentDemoView3_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentDemoView3()
    }
}

struct EnvironmentDemoView3ChildView: View {
    @EnvironmentObject var myEnvironmentObject: MyEnvironmentObject
    
    var body: some View {
      VStack {
        Button("子Change Value") {
                    myEnvironmentObject.myVariable = "子 new value"
                }
        Text(myEnvironmentObject.myVariable)
      }
    }
}
