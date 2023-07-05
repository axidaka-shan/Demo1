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
    
    AnyView(ButtonDemoView()),
    AnyView(ButtonDemoView2()),

    AnyView(FocusDemoView()),
    AnyView(FocusDemoView2()),
    AnyView(FocusSectionDemoView()),
    AnyView(FocusScopeDemoView()),
    
    AnyView(TextFeildDemoViewTV()),
    AnyView(TextFeildDemoViewTV2()),

    AnyView(LoginViewTV()),
    
    AnyView(MoreViewTV()),
    AnyView(MoreViewTV2())

  ]
  
  let textArray: [String] = [
    
    "ButtonDemoView",
    "ButtonDemoView2",

    "FocusDemoView",
    "FocusDemoView2",
    "FocusSectionDemoView",
    "FocusScopeDemoView",


    "TextFeildDemoViewTV",
    "TextFeildDemoViewTV2",
    
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
