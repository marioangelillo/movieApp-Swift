//
//  MovieDetailsDTO.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

struct MovieDetailsDTO: Decodable {
    
    let id: Int?
    let title: String?
    let overview: String?
    let adult: Bool?
    let budget: Int?
    let original_language: String?
    let vote_average: Double?
    let popularity: Double?
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String?
    let genres: [Genre]?
        
}
    
struct Genre: Decodable {
    let id: Int
    let name: String
}
