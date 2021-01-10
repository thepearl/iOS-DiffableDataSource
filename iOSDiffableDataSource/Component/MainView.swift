//
//  View.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 9/1/2021.
//

import UIKit
import Combine

class MoviesTableViewDiffableDataSource: UITableViewDiffableDataSource<String?, Result> {}

class MainView: UIViewController
{
    var cancellables: Set<AnyCancellable> = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    @Published var keyStroke: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerCell()
        setupObservers()
    }
}

//MARK: - Observers
extension MainView
{
    func setupObservers()
    {
        // MONITOR search bar textfield keystrokes
        $keyStroke
            .receive(on: RunLoop.main)
            .sink { (keyWordValue) in
                print(keyWordValue)
                self.viewModel.keyWordSearch = keyWordValue
        }.store(in: &cancellables)
        
        // DIFFABLE DS
        viewModel.diffableDataSource = MoviesTableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, model) -> UITableViewCell? in
            
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as? MovieCell
            else { return UITableViewCell() }
            
            cell.movieObject = model
            return cell
        }
    }
}

// MARK: - Setup UI & Cells
extension MainView
{
    func registerCell()
    {
        let movieCell = UINib(nibName: MovieCell.reuseIdentifier, bundle: nil)
        tableView.register(movieCell, forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
}

//MARK: - UISearchBar Delegate
extension MainView: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.keyStroke = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.keyStroke = ""
    }
}


