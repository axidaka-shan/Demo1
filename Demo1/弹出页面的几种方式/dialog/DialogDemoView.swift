//
//  DialogDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct DialogDemoView: View {
  @State private var isShowingDialog = false

    var body: some View {
      if #available(iOS 15.0.0, *) {
        
        Button("Empty Trash") {
                    isShowingDialog = true
                }
                .confirmationDialog(
                    "Permanently erase the items in the Trash?",
                    isPresented: $isShowingDialog
                ) {
                    Button("Empty Trash", role: .destructive) {
                        // Handle empty trash action.
                    }
                }
      } else {
        Text("Hello, World!")
      }
    }
}

struct DialogDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DialogDemoView()
    }
}
