//
//  Job.swift
//  UserInterviewDemo
//
//  Created by Jason Emanuel on 09/12/24.
//

import Foundation

struct Job: Codable, Identifiable {
    let id = UUID()
    let jobVacancyCode: String
    let positionName: String
    let corporateName: String
    let status: String
    let descriptions: String
    let salaryFrom: Int
    let salaryTo: Int
    let postedDate: String?
    let corporateLogo: String
    let applied: Bool?
}
