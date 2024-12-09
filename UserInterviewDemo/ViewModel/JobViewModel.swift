//
//  JobViewModel.swift
//  UserInterviewDemo
//
//  Created by Jason Emanuel on 09/12/24.
//

import Foundation

class JobViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var isLoading = false
    
    func fetchJobs() {
        guard let url = URL(string: "https://test-server-klob.onrender.com/fakeJob/apple/academy") else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data else {
                print("No data received")
                return
            }
            
            do {
                let decodedJobs = try JSONDecoder().decode([Job].self, from: data)
                DispatchQueue.main.async {
                    self.jobs = decodedJobs
                }
            } catch {
                print("Error decoding jobs: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
