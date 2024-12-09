//
//  JobListView.swift
//  UserInterviewDemo
//
//  Created by Jason Emanuel on 09/12/24.
//

import SwiftUI

struct JobListView: View {
    @StateObject private var viewModel = JobViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 16) {
                    ForEach(viewModel.jobs) { job in
                        JobCardView(job: job)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Lowongan Pekerjaan")
            .onAppear {
                viewModel.fetchJobs()
            }
        }
    }
}

#Preview {
    JobListView()
}
