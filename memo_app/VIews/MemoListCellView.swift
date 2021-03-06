//
//  MemoListCellView.swift
//  memo_app
//
//  Created by jinho on 2020/02/10.
//  Copyright © 2020 jinho. All rights reserved.
//

/*
 로컬 영역에 저장된 메모를 읽어 리스트 형태로 화면에 표시합니다.
 리스트에는 메모에 첨부되어있는 이미지의 썸네일, 제목, 글의 일부가 보여집니다. (이미지가 n개일 경우, 첫 번째 이미지가 썸네일이 되어야 함)
 리스트의 메모를 선택하면 메모 상세 보기 화면으로 이동합니다.
 새 메모 작성하기 기능을 통해 메모 작성 화면으로 이동할 수 있습니다.
 */

import UIKit

class MemoListCellView: UITableViewCell {
    var titleText = ""
    var contentText = ""
    
    /* 최상위 스택 뷰 입니다 */
    let rowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    func setupRowStackView(_ stackView: UIStackView) {
       stackView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
           stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
           stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
           stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
       ])
        
        stackView.addArrangedSubview(cellBoxStackView)
        setupCellBoxStackView(cellBoxStackView)
    }
    
    let cellBoxStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    func setupCellBoxStackView(_ cellBoxStackView: UIStackView) {
        cellBoxStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cellBoxStackView.isLayoutMarginsRelativeArrangement = true
        
        cellBoxStackView.addArrangedSubview(imagePreView)
        setupimagePreView(imagePreView)
        
        cellBoxStackView.addArrangedSubview(cellTextPartStackView)
        setupCellTextPartStackView(cellTextPartStackView)
    }
    
    /* 제목과 내용이 위치하는 파트입니다. */
    let cellTextPartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    func setupCellTextPartStackView(_ cellTextPartStackView: UIStackView) {
        cellTextPartStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        cellTextPartStackView.isLayoutMarginsRelativeArrangement = true
        
        cellTextPartStackView.addArrangedSubview(cellTitleView)
        setupCellTitleView(cellTitleView)
        cellTextPartStackView.addArrangedSubview(cellContentPreviewView)
        setupCellContentPreviewView(cellContentPreviewView)
    }
    
    /* 제목과 내용 셀입니다. */
    let cellTitleView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    func setupCellTitleView(_ cellTitleView: UILabel) {
        cellTitleView.text = titleText
        cellTitleView.translatesAutoresizingMaskIntoConstraints = false
        cellTitleView.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            cellTitleView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    let cellContentPreviewView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        return label
    }()
    
    func setupCellContentPreviewView(_ cellContentPreviewView: UILabel) {
        cellContentPreviewView.text = contentText
        cellContentPreviewView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellContentPreviewView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    /* 화면 좌측에 보이는 프리뷰 이미지입니다. */
    let imagePreView: UIImageView = {
        let imageView = UIImageView()
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = "User Memo First Photo Preview".localized()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    func setupimagePreView(_ imageView: UIImageView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    // Edit 버튼 클릭 시 인덴테이션
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutMargins.left = CGFloat(1) * 50
        contentView.layoutIfNeeded()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(rowStackView)
        setupRowStackView(rowStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
