//
//  MovieListPresenter.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

protocol MovieListPresenterProtocol: class {
    func getDataItunesFromPresenter()
    func requestModelForRowAt(indexPathRow: Int) -> Any
    func getNumberArrayAllMovies() -> Int
    func reloadTableview()
    func reloadDataArray(data: [Result])
    func navigateToDetailScreen(dto: PassMovieInformationToDetailScreenDTO)
    
    var arrayAllMovies: [Result]? { get }
}

class MovieListPresenterImplementation: BasePresenter<MovieListViewController, MovieListRouterProtocol> {
    
    var interactor: MovieListInteractorProtocol?
    var arrayAllMovies: [Result]? = []
    
}

extension MovieListPresenterImplementation: MovieListPresenterProtocol {
    
    func getNumberArrayAllMovies() -> Int {
        return self.arrayAllMovies?.count ?? 0
    }
    
    func getDataItunesFromPresenter() {
        self.arrayAllMovies = self.interactor?.getDataFromItunes()
    }
    
    func requestModelForRowAt(indexPathRow: Int) -> Any {
        return self.arrayAllMovies?[indexPathRow]
    }
    
    func reloadTableview() {
        self.viewController?.tableViewReload()
    }
    
    func reloadDataArray(data: [Result]) {
        self.arrayAllMovies = data
    }
    
    func navigateToDetailScreen(dto: PassMovieInformationToDetailScreenDTO) {
        self.router?.navigateToDetailScreen(dto: dto)
    }
}
