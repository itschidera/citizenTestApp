protocol testQuestion {
    var question: String { get }
    var options: [String] { get }
    var correctAnswer: Int { get }
    func sectionQuestion()
    func isOptionCorrect(answer: Int) -> Bool
}

class HistorySection: testQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int

    init(question: String, options: [String], correctAnswer: Int) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }

    func sectionQuestion() {
        print(question)
        for (index, option) in options.enumerated() {
            let symbol = index == correctAnswer ? "*" : ""
            print("\(index + 1). \(option) \(symbol)")
        }
    }

    func isOptionCorrect(answer: Int) -> Bool {
        var isValid = false
        var userAnswer: Int? = nil

        while !isValid {
            print("Enter your answer (1 or 2):")
            
            if let userInput = readLine(), let parsedAnswer = Int(userInput), parsedAnswer == 1 || parsedAnswer == 2 {
                userAnswer = parsedAnswer
                isValid = true
            } else {
                print("Choose a valid option (1 or 2).")
            }
        }

        return userAnswer == (correctAnswer + 1)
    }
}

class PoliticsSection: testQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int

    init(question: String, options: [String], correctAnswer: Int) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }

    func sectionQuestion() {
        print(question)
        for (index, option) in options.enumerated() {
            let symbol = index == correctAnswer ? "*" : ""
            print("\(index + 1). \(option) \(symbol)")
        }
    }

    func isOptionCorrect(answer: Int) -> Bool {
        var isValid = false
        var userAnswer: Int? = nil

        while (!isValid) {
            print("Enter your answer (1 or 2):")
            if let userInput = readLine(), let parsedAnswer = Int(userInput), parsedAnswer == 1 || parsedAnswer == 2 {
                userAnswer = parsedAnswer
                isValid = true
            } else {
                print("Choose a valid option (1 or 2).")
            }
        }
        
        return userAnswer == (correctAnswer + 1)
    }
}

class CultureSection: testQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int

    init(question: String, options: [String], correctAnswer: Int) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }

    func sectionQuestion() {
        print(question)
        for (index, option) in options.enumerated() {
            let symbol = index == correctAnswer ? "*" : ""
            print("\(index + 1). \(option) \(symbol)")
        }
    }

    func isOptionCorrect(answer: Int) -> Bool {
        var isValid = false
        var userAnswer: Int? = nil

        while (!isValid) {
            print("Enter your answer (1 or 2):")
            if let userInput = readLine(), let parsedAnswer = Int(userInput), parsedAnswer == 1 || parsedAnswer == 2 {
                userAnswer = parsedAnswer
                isValid = true
            } else {
                print("Choose a valid option (1 or 2).")
            }
        }

        return userAnswer == (correctAnswer + 1)
    }
}

class canadianQuiz {
    var questions: [String: [testQuestion]] = [:]
    var correctAnswers: [String: Int] = ["History": 0, "Politics": 0, "Culture": 0]
    var currentQuestionIndex = 0

    init(historySection: [testQuestion], politicsSection: [testQuestion], cultureSection: [testQuestion]) {
        self.questions["History"] = historySection
        self.questions["Politics"] = politicsSection
        self.questions["Culture"] = cultureSection
    }

    func startQuiz() {
        print("Welcome to the Canadian Citizenship Quiz!")
        print("To pass you need a minimum of 1 in History, 2 in Politics and 3 in Culture")
        print("If you're ready, we will start with History")
        
        if !askQuestions(category: "History", correctAnswer: 1) {
            print("Oops! You failed the History category. Try again!")
            return print("History: \(correctAnswers["History"]!) out of 3")
        }
        
        print("Great! Now, let's move on to Politics.")
        if !askQuestions(category: "Politics", correctAnswer: 2) {
            print("Oops! You failed the Politics category. Try again!")
            return print("Politics: \(correctAnswers["Politics"]!) out of 3")
        }
        
        print("Excellent! Finally, let's do Culture.")
        if !askQuestions(category: "Culture", correctAnswer: 3) {
            print("Oops! You failed the Culture category. Try again!")
            return print("Culture: \(correctAnswers["Culture"]!) out of 3")
        }
        
        print("Congratulations! You've completed the quiz.")
    }

    func askQuestions(category: String, correctAnswer: Int) -> Bool {
        guard let questions = questions[category] else { return false }
        for (index, question) in questions.enumerated() {
            print("Question \(index + 1) out of \(questions.count)")
            question.sectionQuestion()
            print("Please enter your answer (1 or 2): ", terminator: "")
            if let input = readLine(), let answer = Int(input), question.isOptionCorrect(answer: answer) {
                correctAnswers[category]! += 1
            }
        }
        let score = correctAnswers[category]!
        print("You got \(score) out of \(questions.count) correct in \(category).")
        return score >= correctAnswer
    }
}

let historyQuestions: [testQuestion] = [
    HistorySection(question: "Who are the three founding peoples of Canada?", options: ["Aboriginal, French and British", "Aboriginal, Americans and French"], correctAnswer: 0),
    HistorySection(question: "What year was the Magna Carta signed?", options: ["1215", "1321"], correctAnswer: 0),
    HistorySection(question: "Which war was fought by Canadian soldiers?", options: ["World War I", "Vietnam War"], correctAnswer: 0)
]

let politicsQuestions: [testQuestion] = [
    PoliticsSection(question: "Canada citizen's rights and responsibilities are secured by", options: ["Canadian law", "French law"], correctAnswer: 0),
    PoliticsSection(question: "Who proclaimed the amended constitution of Canada in 1982?", options: ["Queen Elizabeth II", "Queen Victoria"], correctAnswer: 0),
    PoliticsSection(question: "Which political party is currently in power?", options: ["Liberal Party", "Conservative Party"], correctAnswer: 0)
]

let cultureQuestions: [testQuestion] = [
    CultureSection(question: "What is the national sport of Canada?", options: ["Hockey", "Basketball"], correctAnswer: 0),
    CultureSection(question: "What is a popular Canadian dish?", options: ["Poutine", "Sushi"], correctAnswer: 0),
    CultureSection(question: "What is the symbol on the Canadian flag?", options: ["Maple Leaf", "Eagle"], correctAnswer: 0)
]

let quiz = canadianQuiz(historySection: historyQuestions, politicsSection: politicsQuestions, cultureSection: cultureQuestions)
quiz.startQuiz()


