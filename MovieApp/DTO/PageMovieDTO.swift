//
//  MovieDTO.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

struct PageMovieDTO: Decodable {
    let results : [MovieDTO]
}

extension PageMovieDTO {
    
    struct MovieDTO: Decodable {
        
        let id: Int?
        let title: String?
        let overview: String?
        let backdrop_path: String?
        let poster_path: String?
    }
}
