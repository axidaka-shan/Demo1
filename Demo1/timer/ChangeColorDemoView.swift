//
//  ChangeColorDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/21.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ChangeColorDemoView: View {
  @State var backgroundColor = Color.red
  @State var isToggled = false
  
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
      ZStack {
          backgroundColor
          .edgesIgnoringSafeArea(.all)
          
          Image(systemName: "swift")
              .resizable()
              .scaledToFit()
              .foregroundColor(.white)
              .padding()
          
          HStack {
              Button(action: {
                self.isToggled = true
              }) {
                  Text("Button 1")
                      .foregroundColor(.white)
                      .padding()
                      .background(Color.blue)
                      .cornerRadius(10)
              }
              
              Button(action: {
                self.isToggled = false
              }) {
                  Text("Button 2")
                      .foregroundColor(.white)
                      .padding()
                      .background(Color.green)
                      .cornerRadius(10)
              }
          }
          .padding()
          .offset(y: isToggled ? 0 : 100)
          .animation(.easeInOut(duration: 0.5))
      }
      .onReceive(timer) { _ in
          withAnimation {
              self.backgroundColor = self.backgroundColor == .red ? .blue : .red
          }
      }
      .onAppear {
      }
      .onDisappear {
        timer.upstream.connect().cancel()
      }
  }
}

struct ChangeColorDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColorDemoView()
    }
}
