//  ViewController.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 02/10/24.
//

import UIKit
import SnapKit

/// TODO: Provide TableViewData
///
/// 1. insetGroup UITableView style.
/// 2. Configure custom UITableViewCell named MainTableViewCell
/// 3. Handle Section enum. Handle SectionItem enum. It should provide: systemImageName, systemImageColor, title, titleColor, totalRecords, totalRecordsColor.
/// 4. Reload UITableView with data from Section enum.
/// 5. Push a MailListViewController when an inbox row is selected.
///
class MainViewController: UIViewController {
    // MARK: -MainModel
    let model: MainModel
    
    //    MARK: - UI
    let tableView = UITableView(frame: .zero, style: .insetGrouped)


    //    MARK: - Init
    init(model:MainModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        configureEditNovigationButton()
        configureNovigationTitle()
        configureTableView()
        makeCoonstraints()
    }
    
    // MARK: -Navigation
    func configureNovigationTitle(){
        navigationItem.title = "Mailboxes"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureEditNovigationButton(){
        let item = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handEditButtonTap))
        navigationItem.rightBarButtonItem = item
    }
    
    
    // MARK: -Action
    @objc func handEditButtonTap(){
        
    }
    
    // MARK: - Constraints
    func makeCoonstraints(){
        tableView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
    }
    
    // MARK: - TableView
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainViewTableViewCell.self, forCellReuseIdentifier: "MainViewTableViewCell")
        view.addSubview(tableView)
    }
    

    @objc func headerTapped(_ sender: UIButton) {
         let section = sender.tag
         model.expandedSections[section].toggle()
         tableView.reloadSections(IndexSet(integer: section), with: .automatic)
     }
    
    
    func navigateToInbox(){
        let indexViewController = InboxViewController(model: InboxModel())
        navigationController?.pushViewController(indexViewController, animated: true)
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black

        let arrowButton = UIButton()
        arrowButton.contentMode = .scaleAspectFit
        arrowButton.addTarget(self, action: #selector(headerTapped(_:)), for: .touchUpInside)
        arrowButton.tag = section
        
        switch section {
        case 0: return nil
        default:
            label.text = "Gmail"
            if model.expandedSections[section] == true {
                arrowButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                arrowButton.tintColor = .systemBlue
            }
           else  {
               arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
               arrowButton.tintColor = .lightGray
            }
        }
        
        headerView.addSubview(label)
        headerView.addSubview(arrowButton)
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(headerView)
            make.centerY.equalTo(headerView)
        }

        arrowButton.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing).offset(8)
            make.centerY.equalTo(headerView)
            make.trailing.equalTo(headerView).offset(-16)
            make.width.height.equalTo(20)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        default: return 40
        }
    }
    // MARK: - Selection Handling
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = model.didSelectRowAt(indexPath: indexPath)
        if section == .inbox{
            navigateToInbox()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource{
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewTableViewCell", for: indexPath) as! MainViewTableViewCell
        let content = model.cellForRowAt(indexPath: indexPath)
        cell.updateCell(content: content)
        return cell
    }
}

