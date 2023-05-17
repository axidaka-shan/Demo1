//
//  NotificationDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI
import Combine

struct NotificationDemoView2: View {
  @State var notificationCount = 0
  
  var body: some View {
      VStack {
        Spacer().frame(height: 30)

          Text("Notification count: \(notificationCount)")

        Spacer().frame(height: 30)

          Button("Send Notification 1") {
              NotificationCenter.default.post(name: Notification.Name("TestNotification1"), object: nil)
          }

        Spacer().frame(height: 30)

          Button("Send Notification 2") {
              NotificationCenter.default.post(name: Notification.Name("TestNotification2"), object: nil)
          }
        
        Spacer().frame(height: 30)

      }
      .onReceive(
          Publishers.MergeMany(
              NotificationCenter.default.publisher(for: Notification.Name("TestNotification1")),
              NotificationCenter.default.publisher(for: Notification.Name("TestNotification2"))
          )
      ) { _ in
          notificationCount += 1
      }
  }
}

struct NotificationDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        NotificationDemoView2()
    }
}
