//
//  MoreViewTV.swift
//  Demo1_tvOS
//
//  Created by axidaka on 2023/5/5.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct MoreViewTV: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    NavigationLink(destination: DetailView()) {
                        ListItem()
                            .focusable(true) { isFocused in
                                print(isFocused)
                            }
                    }
                }
            }
            .navigationTitle("List")
        }
    }
}
struct ListItem: View {
    var body: some View {
        HStack {
            Text("Title")
                .frame(maxWidth: .infinity, alignment: .leading)
          Spacer()

            Image(systemName: "chevron.right")
                .frame(width: 80, height: 80)
        }
        .frame(height: 80)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(Color.clear)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}
struct DetailView: View {
    var body: some View {
        Text("Detail View")
    }
}
