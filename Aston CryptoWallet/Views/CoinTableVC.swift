//
//  CoinTableVC.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/28/23.
//

import UIKit
import SnapKit

final class CoinTableVC: UIViewController {
    
    //MARK: - UI Setting
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.appName
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    private lazy var sortByRankButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.rankButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(rankButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var sortByMarketCapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.marketcapButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(marketcapButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var sortByPriceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.priceButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(priceButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var sortByPercentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.percentButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(percentButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        return spinner
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .black
        tableView.backgroundColor = .black
        return tableView
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.reloadButton, for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(reloadButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private func setupView() {
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(50)
        }
        
        view.addSubview(sortByRankButton)
        sortByRankButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(40)
            make.height.equalTo(35)
        }
        
        view.addSubview(sortByPercentButton)
        sortByPercentButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        view.addSubview(sortByPriceButton)
        sortByPriceButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalTo(sortByPercentButton.snp.leading).offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        view.addSubview(sortByMarketCapButton)
        sortByMarketCapButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(sortByRankButton.snp.trailing).offset(10)
            make.trailing.equalTo(sortByPriceButton.snp.leading).offset(-10)
            make.height.equalTo(35)
        }
        
        view.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(sortByPercentButton.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        view.addSubview(reloadButton)
        reloadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(200)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.logoutButtonName,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(logoutButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    //MARK: - UI Logic
    
    var viewModel: (TableProtocolOut & TableProtocolIn)?
    private var sortedArray: [CryptoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CoinCellVC.self, forCellReuseIdentifier: Constants.cellIdentifier)
        
        startSpinner()
        listenViewModel()
        viewModel?.getArrayData(Constants.rankButton, true)
    }
    
    private func listenViewModel() {
        guard var viewModel = viewModel else { return }
        
        viewModel.getSortedArray = { [weak self] array in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.sortedArray = array
                if array.isEmpty {
                    self.reloadButton.isHidden = false
                } else {
                    self.reloadButton.isHidden = true
                }
                self.stopSpinner()
                self.tableView.reloadData()
            }
        }
    }
    
    private var isRankButtonPressed = false
    @objc private func rankButtonPressed() {
        startSpinner()
        if isRankButtonPressed {
            viewModel?.getArrayData(Constants.rankButton, true)
        } else {
            viewModel?.getArrayData(Constants.rankButton, false)
        }
        isRankButtonPressed = !isRankButtonPressed
    }
    
    private var isMarketcapButtonPressed = true
    @objc private func marketcapButtonPressed() {
        startSpinner()
        if isMarketcapButtonPressed {
            viewModel?.getArrayData(Constants.marketcapButton, true)
        } else {
            viewModel?.getArrayData(Constants.marketcapButton, false)
        }
        isMarketcapButtonPressed = !isMarketcapButtonPressed
    }
    
    private var isPriceButtonPressed = true
    @objc private func priceButtonPressed() {
        startSpinner()
        if isPriceButtonPressed {
            viewModel?.getArrayData(Constants.priceButton, true)
        } else {
            viewModel?.getArrayData(Constants.priceButton, false)
        }
        isPriceButtonPressed = !isPriceButtonPressed
    }
    
    private var isPercentButtonPressed = true
    @objc private func percentButtonPressed() {
        startSpinner()
        if isPercentButtonPressed {
            viewModel?.getArrayData(Constants.percentButton, true)
        } else {
            viewModel?.getArrayData(Constants.percentButton, false)
        }
        isPercentButtonPressed = !isPercentButtonPressed
    }
    
    @objc private func reloadButtonPressed() {
        startSpinner()
        viewModel?.getArrayData(Constants.rankButton, true)
        isRankButtonPressed = !isRankButtonPressed
    }
    
    private func startSpinner() {
        tableView.isHidden = true
        reloadButton.isHidden = true
        spinner.startAnimating()
    }
    
    private func stopSpinner() {
        spinner.stopAnimating()
        tableView.isHidden = false
    }
    
    @objc private func logoutButtonPressed() {
        let navController = UINavigationController(rootViewController: VCBuilder.buildAuthVC())
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = navController
        }
    }
    
}

//MARK: - UITableViewDataSource

extension CoinTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellsAmount = sortedArray.count
        return cellsAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arrayElement = sortedArray[indexPath.row]
        let cell = CoinCellVC(style: .default, reuseIdentifier: Constants.cellIdentifier)
        
        cell.rankLabel.text = arrayElement.rankString
        cell.coinView.backgroundColor = .white
        cell.coinView.image = UIImage(named: arrayElement.symbol)
        cell.symbolLabel.text = arrayElement.symbol
        cell.marketCapLabel.text = arrayElement.marketcapString
        cell.priceLabel.text = arrayElement.priceString
        if arrayElement.percentChange < 0 {
            cell.percentageChangeLabel.text = arrayElement.percentChangeString
            cell.percentageChangeLabel.textColor = .red
            cell.percentageChangeLabel.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        } else {
            cell.percentageChangeLabel.text = arrayElement.percentChangeString
            cell.percentageChangeLabel.textColor = .green
            cell.percentageChangeLabel.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        }
        return cell
    }
    
}
//MARK: - UITableViewDelegate

extension CoinTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrayElement = sortedArray[indexPath.row]
        let coinDetailVC = CoinDetailVC()
        
        coinDetailVC.navigationItem.title = arrayElement.symbol
        coinDetailVC.coinView.image = UIImage(named: arrayElement.symbol)
        coinDetailVC.nameLabel.text = arrayElement.name
        coinDetailVC.priceLabel.text = arrayElement.priceString + " US$"
        if arrayElement.percentChange < 0 {
            coinDetailVC.percentageChangeLabel.text = arrayElement.percentChangeString + " %"
            coinDetailVC.percentageChangeLabel.textColor = .red
            coinDetailVC.percentageChangeLabel.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        } else {
            coinDetailVC.percentageChangeLabel.text = arrayElement.percentChangeString + " %"
            coinDetailVC.percentageChangeLabel.textColor = .green
            coinDetailVC.percentageChangeLabel.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        }
        coinDetailVC.volumeValue.text = arrayElement.volumeString
        coinDetailVC.rankValue.text = "#" + arrayElement.rankString
        coinDetailVC.dominanceValue.text = arrayElement.marketDominanceString
        coinDetailVC.allTimeHighValue.text = arrayElement.allTimeHighString
        coinDetailVC.cycleLowValue.text = arrayElement.cycleLowString
        coinDetailVC.marketcapValue.text = arrayElement.marketcapString
        coinDetailVC.circulatingSupplyValue.text = "\(arrayElement.circulatingSupplyString) \(arrayElement.symbol)"
        coinDetailVC.projectedMarketcapValue.text = arrayElement.projectedMarketcapString
        coinDetailVC.projectedSupplyValue.text = "\(arrayElement.projectedSupplyString) \(arrayElement.symbol)"
        coinDetailVC.projectedIssueValue.text = arrayElement.projectedIssuedPercentString
        
        let navController = UINavigationController(rootViewController: coinDetailVC)
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        self.present(navController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.alpha = 0.7
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.alpha = 1
        }
    }
    
}

