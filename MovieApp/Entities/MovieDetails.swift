//
//  MovieDetails.swift
//  MovieApp
//
//  Created by Mario Angelillo on 30/12/2021.
//

import Foundation

struct MovieDetails {
    
    let id: Int
    let title: String
    let overview: String
    let adult: Bool
    let budget: Int
    let originalLanguage: String
    let voteAverage: Double
    let popularity: Double
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    let genres: [Genre]
    let imageUrl: String
    
    init(dto: MovieDetailsDTO) {
        self.id = dto.id ?? 0
        self.title = dto.title ?? ""
        self.overview = dto.overview ?? ""
        self.adult = dto.adult ?? false
        self.budget = dto.budget ?? 0
        self.originalLanguage = dto.original_language ?? ""
        self.voteAverage = dto.vote_average ?? 0.0
        self.popularity = dto.popularity ?? 0.0
        self.backdropPath = dto.backdrop_path ?? ""
        self.posterPath = dto.poster_path ?? ""
        self.releaseDate = dto.release_date ?? ""
        self.genres = dto.genres ?? []
        self.imageUrl = (URLApplication.Movie.imageURL + (dto.poster_path ?? ""))
    }
}
