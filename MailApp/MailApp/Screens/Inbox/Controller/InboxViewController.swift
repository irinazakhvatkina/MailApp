//
//  InboxViewController.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 09/10/24.
//

import UIKit
import SnapKit

class InboxViewController: UIViewController{

    //    MARK: - InboxModel
    let model: InboxModel
    
    //    MARK: - Init
    init(model:InboxModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - UI
    let tableView = UITableView(frame: .zero)
    var collectionView: UICollectionView!

    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupCollectionView()
        configureEditNavigationButton()
        configureNavigationTitle()
        configureTableView()
        makeConstraints()
    }
    
    // MARK: - Navigation
    func configureNavigationTitle() {
        navigationItem.title = "Inbox"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        toolbarItems = [
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .done, target: self, action: #selector(presentThirdScreen))
        ]
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    func configureEditNavigationButton() {
        let item = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEditButtonTap))
        navigationItem.rightBarButtonItem = item
    }
    
    // MARK: - TableView
    func configureTableView() {
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
        
        view.addSubview(tableView)
    }

    // MARK: - Action
    @objc func handleEditButtonTap() {
        // Обработка нажатия кнопки "Edit"
    }
    
    @objc func presentThirdScreen() {
        let vc = AddNewMailViewController()
        vc.onFinish = { email in
            self.model.messages.append(email)
            self.tableView.reloadData()
        }
        let nc = UINavigationController(rootViewController: vc)
        navigationController?.present(nc, animated: true)
    }
    
    // MARK: - CollectionView
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoriesHeaderViewCell.self, forCellWithReuseIdentifier: "CategoriesHeaderViewCell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
    }
    
    // MARK: - Constraints
    func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension InboxViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = model.cellForRowAt(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        cell.updateCell(content: content)
        return cell
    }
}
// MARK: - UITableViewDelegate
extension InboxViewController: UITableViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension InboxViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MessageCategory.allCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesHeaderViewCell", for: indexPath) as! CategoriesHeaderViewCell
        let category = MessageCategory.allCategories[indexPath.item]
        cell.configure(with: category.titleCategory, imageName: category.icon, isExpanded: (category.icon != " "))
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension InboxViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let category = MessageCategory.allCategories[indexPath.item]
        let itemText = category.titleCategory
        let itemWidth = (itemText as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)]).width

        let iconWidth: CGFloat = 24
        let horizontalPadding: CGFloat = 20
        let totalWidth = iconWidth + itemWidth + horizontalPadding

        return .init(width: totalWidth, height: 46)
    }
}
