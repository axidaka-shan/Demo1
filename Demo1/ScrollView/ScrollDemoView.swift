//
//  ScrollDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/21.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ScrollDemoView : View {
    @ObservedObject var selectedOption = SelectedApplicationState()
    
    var body: some View {
        VStack {
            View1(application: selectedOption)
            View2(application: selectedOption)
        }
    }
}

class SelectedApplicationState: ObservableObject {
    @Published var selectedApplication = "application1"
    
    var applications = ["application1", "application2", "application3", "application4", "application5", "application6", "application7", "application8", "application9", "application10"]
}

struct View1: View {
    @ObservedObject var application: SelectedApplicationState

    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(application.applications, id: \.self) { item in
                        Button(action: {
                            self.application.selectedApplication = item
                        }) {
                            VStack(alignment: .center){
                                Text(item)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct View2: View {
    
    @ObservedObject var application: SelectedApplicationState
    
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader{ scroll in
                    HStack{
                        ForEach(application.applications, id: \.self) { item in
                            Button(action: {
                                application.selectedApplication = item
                            }) {
                                Text(item)
                                    .saturation(application.selectedApplication == item ? 1.0 : 0.05)
                            }
                        }
                    }.onReceive(application.$selectedApplication) { (app) in
                        withAnimation {
                            scroll.scrollTo(app, anchor: .leading)
                        }
                    }
                }
            }
        }
    }
}
