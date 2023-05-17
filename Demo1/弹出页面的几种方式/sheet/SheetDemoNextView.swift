//
//  SheetDemoNextView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/13.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct SheetDemoNextView: View {

    //用于退出该界面
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack(alignment: .center, spacing: nil, content: {
                Spacer()
                HStack(content: {
                    Spacer()
                })
                Button("点击按钮返回") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 30))
                .foregroundColor(.green)
                .background(Color.white)
                Spacer()
            })
            .background(Color.gray)
            .navigationBarTitle("presentView", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SheetDemoNextView_Previews: PreviewProvider {
    static var previews: some View {
      SheetDemoNextView()
    }
}

