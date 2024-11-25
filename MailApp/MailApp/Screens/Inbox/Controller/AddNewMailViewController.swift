import UIKit
import SnapKit

class AddNewMailViewController: UIViewController {
    //    MARK: - Clouser
    var onFinish: ((Message) -> Void)?
    
    //    MARK: - UI
    let nameSurnameTextField = UITextField()
    let emailTextField = UITextField()
    let subjectTextField = UITextField()
    let letterTextView = UITextView()
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(nameSurnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(subjectTextField)
        view.addSubview(letterTextView)

        configureNavigationBar()
        configureTextFields()
        makeConstraints()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Add new mail"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissThirdScreen))
        let sendImage = UIImage(systemName: "arrow.up.circle.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: sendImage, style: .plain, target: self, action: #selector(sendButtonTapped))
            
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTextFields() {
        nameSurnameTextField.placeholder = "Enter your name"
        nameSurnameTextField.borderStyle = .none
        nameSurnameTextField.setLeftIcon(" To: ")
        nameSurnameTextField.textColor = .blue
        
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .none
        emailTextField.setLeftIcon(" Email: ")
        
        subjectTextField.placeholder = "Enter your subject"
        subjectTextField.borderStyle = .none
        subjectTextField.setLeftIcon(" Subject: ")
        
        letterTextView.layer.borderColor = UIColor.lightGray.cgColor
        letterTextView.layer.borderWidth = 1.0
        letterTextView.layer.cornerRadius = 8
        letterTextView.font = UIFont.systemFont(ofSize: 14.0)
        letterTextView.text = "Enter your letter"
        letterTextView.textColor = .lightGray
        
        letterTextView.delegate = self
    }
    
    func gatherEmailData() -> Message {
        let name = nameSurnameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        _ = subjectTextField.text ?? ""
        let body = letterTextView.text ?? ""
        
        return Message(title: name, subtitle: email, letter: body, iconName: "", isRead: true, time: "10:10", category: .primary)
    }
    
    func makeConstraints() {
        nameSurnameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameSurnameTextField.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        subjectTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        letterTextView.snp.makeConstraints { make in
            make.top.equalTo(subjectTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        
    }

    @objc func dismissThirdScreen() {
        self.dismiss(animated: true)
    }
    
    @objc func sendButtonTapped() {
        let newMessage = gatherEmailData()
        onFinish?(newMessage)
        self.dismiss(animated: true)
    }
}

extension AddNewMailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter your letter"
            textView.textColor = .lightGray
        }
    }
    
    
    
}

