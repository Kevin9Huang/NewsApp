//
//  News.swift
//  NewsApp
//
//  Created by CMP2024008 on 15/11/24.
//

struct NewsItem: Codable {
    let id: Int
    let slug: String
    let url: String
    let title: String
    let content: String
    let image: String
    let thumbnail: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int
}
