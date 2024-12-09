//
//  ContentView.swift
//  UserInterviewDemo
//
//  Created by Jason Emanuel on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            JobListView()
                .tabItem {
                    Label("Lowongan Kerja", systemImage: "person.crop.circle.fill")
                }
            SentView()
                .tabItem {
                    Label("Lowongan Terkirim", systemImage: "paperplane.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
