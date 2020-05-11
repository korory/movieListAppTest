//
//  MovieListViewController.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import UIKit

protocol MovieListViewControllerProtocol:class {
    func tableViewReload()
}

class MovieListViewController: BaseViewController<MovieListPresenterProtocol> {
    
    @IBOutlet weak var tableAllMoviesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTableViewCell()
    }
    
    func setupView() {
        self.presenter?.getDataItunesFromPresenter()
        self.setDelegates()
    }
    
    func setDelegates () {
        self.tableAllMoviesList.delegate = self
        self.tableAllMoviesList.dataSource = self
    }
    
    func setupTableViewCell() {
        self.tableAllMoviesList.register(UINib(nibName: NibName.movieListCell,
                                               bundle: nil),
                                         forCellReuseIdentifier: NibName.movieListCell)
    }
}

extension MovieListViewController: MovieListViewControllerProtocol{
    
    func tableViewReload() {
        self.tableAllMoviesList.reloadData()
    }
}

//MARK: - ProfileNotificationsViewController: UITableViewDelegate, UITableViewDataSource
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource  {
    
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.getNumberArrayAllMovies())!
    }
    
    //Tipo de celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.movieListCell) as? MovieListCell
        
        guard let viewModel = self.presenter?.requestModelForRowAt(indexPathRow: indexPath.row) as? Result else { return UITableViewCell()}
        
        cell?.configureCell(viewModel: viewModel)
        
        return cell!
    }
    
    //Se ha seleccionado la celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = self.presenter?.arrayAllMovies?[indexPath.row] else { return }
        
        let movieInformationDTO = PassMovieInformationToDetailScreenDTO(model: cell)
        
        self.presenter?.navigateToDetailScreen(dto: movieInformationDTO)
    }
    
    //Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
    
    
}

