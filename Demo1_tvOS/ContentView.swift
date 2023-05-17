//
//  ContentView.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let destinations: [AnyView] = [

    AnyView(FocusSectionDemoView()),
    
    AnyView(FocusScopeDemoView()),
    
    AnyView(TextFeildDemoViewTV()),
    
    AnyView(LoginViewTV()),
    
    AnyView(MoreViewTV()),
    AnyView(MoreViewTV2())

  ]
  
  let textArray: [String] = [
    "FocusSectionDemoView",
    
    "FocusScopeDemoView",


    "TextFeildDemoViewTV",
    
    "LoginViewTV",
    
    "MoreViewTV",
    "MoreViewTV2"
]
  
 
  
  var body: some View {
      NavigationView {
          List {
            ForEach(self.destinations.indices, id: \.self) { index in
                  NavigationLink(destination: self.destinations[index]) {
                      Text(textArray[index])
                  }
              }
          }
          .navigationBarTitle("列表")
      }
  }
  
}
