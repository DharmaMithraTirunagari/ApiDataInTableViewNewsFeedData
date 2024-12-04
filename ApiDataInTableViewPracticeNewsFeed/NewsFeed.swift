//
//  NewsFeed.swift
//  ApiDataInTableViewPracticeNewsFeed
//
//  Created by Srikanth Kyatham on 12/3/24.
//


struct NewsFeed: Codable{
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
struct Article: Codable{
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
struct Source: Codable{
    let id: String?
    let name: String?
}
