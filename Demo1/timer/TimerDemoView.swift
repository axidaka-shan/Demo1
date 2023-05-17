//
//  TimerDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/4/13.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct TimerDemoView: View {
  let colors = [Color.gray, Color.white, Color.orange]
  @State private var currentColorIndex = 0
  @State private var timer: Timer? = nil
  
  var body: some View {
      ZStack {
          colors[currentColorIndex].edgesIgnoringSafeArea(.all)
          Text("Hello, World!")
      }
      .onAppear {
          self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
              self.currentColorIndex = (self.currentColorIndex + 1) % self.colors.count
          }
      }
      .onDisappear {
          self.timer?.invalidate()
          self.timer = nil
      }
  }
}

struct TimerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemoView()
    }
}
