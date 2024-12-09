//
//  JobCardView.swift
//  UserInterviewDemo
//
//  Created by Jason Emanuel on 09/12/24.
//

import SwiftUI

struct JobCardView: View {
    let job: Job
    @State private var isApplied: Bool = false
    
    var body: some View {
        HStack {
            
            // Corporate Logo
            AsyncImage(url: URL(string: job.corporateLogo)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 50, height: 50)
                     .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
            
            // Job Info
            VStack(alignment: .leading, spacing: 6) {
                Text(job.positionName)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(job.corporateName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(job.status)
                    .font(.caption)
                    .foregroundColor(.blue)
                
                Text(job.postedDate != nil ? "\(job.postedDate!) ago" : "N/A")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Action Button
            VStack {
                if isApplied {
                    // Tombol abu-abu setelah lamaran terkirim
                    Text("LAMARAN TERKIRIM")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                } else {
                    // Tombol "Lamar"
                    Button(action: {
                        // Perbarui state isApplied menjadi true
                        isApplied = true
                        print("Lamaran untuk \(job.positionName) terkirim")
                    }) {
                        Text("LAMAR")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct JobCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Contoh data dummy
        let dummyJob = Job(
            jobVacancyCode: "CRP000235",
            positionName: "ADMIN HRD",
            corporateName: "Move Forward",
            status: "Karyawan Kontrak",
            descriptions: "Melakukan penerimaan karyawan baru dari proses screening hingga rekruitmen.",
            salaryFrom: 1000000,
            salaryTo: 5000000,
            postedDate: "12 days",
            corporateLogo: "https://via.placeholder.com/50",
            applied: false
        )
        
        JobCardView(job: dummyJob)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
