//
//  NotificationDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct NotificationDemoView: View {
  @State var notificationCount = 0
  
  var body: some View {
      VStack {
          Text("Notification count: \(notificationCount)")
          
        Spacer().frame(height: 30)
        
          Button("Send Notification") {
              NotificationCenter.default.post(name: Notification.Name("TestNotification"), object: nil)
          }
      }
      .onReceive(NotificationCenter.default.publisher(for: Notification.Name("TestNotification"))) { _ in
          notificationCount += 1
      }
  }
}

struct NotificationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationDemoView()
    }
}
