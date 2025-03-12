//
//  CreditModel.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

/// The `CreditAccount` structure represents a user's credit account details.
/// Although only `score` and `maxScoreValue` are needed for this test, all fields are included for scalability.

public struct CreditAccount: Codable, Sendable {
    public let accountIDVStatus: String
    public let creditReportInfo: CreditReportInfo
    public let dashboardStatus: String
    public let personaType: String
    public let coachingSummary: CoachingSummary
    public let augmentedCreditScore: Int?

    public init(
        accountIDVStatus: String,
        creditReportInfo: CreditReportInfo,
        dashboardStatus: String,
        personaType: String,
        coachingSummary: CoachingSummary,
        augmentedCreditScore: Int?
    ) {
        self.accountIDVStatus = accountIDVStatus
        self.creditReportInfo = creditReportInfo
        self.dashboardStatus = dashboardStatus
        self.personaType = personaType
        self.coachingSummary = coachingSummary
        self.augmentedCreditScore = augmentedCreditScore
    }
}

public struct CoachingSummary: Codable, Sendable {
    public let activeTodo: Bool
    public let activeChat: Bool
    public let numberOfTodoItems: Int
    public let numberOfCompletedTodoItems: Int
    public let selected: Bool

    public init(
        activeTodo: Bool,
        activeChat: Bool,
        numberOfTodoItems: Int,
        numberOfCompletedTodoItems: Int,
        selected: Bool
    ) {
        self.activeTodo = activeTodo
        self.activeChat = activeChat
        self.numberOfTodoItems = numberOfTodoItems
        self.numberOfCompletedTodoItems = numberOfCompletedTodoItems
        self.selected = selected
    }
}

public struct CreditReportInfo: Codable, Sendable {
    public let score: Int
    public let scoreBand: Int
    public let clientRef: String
    public let status: String
    public let maxScoreValue: Int
    public let minScoreValue: Int
    public let monthsSinceLastDefaulted: Int
    public let hasEverDefaulted: Bool
    public let monthsSinceLastDelinquent: Int
    public let hasEverBeenDelinquent: Bool
    public let percentageCreditUsed: Int
    public let percentageCreditUsedDirectionFlag: Int
    public let changedScore: Int
    public let currentShortTermDebt: Int
    public let currentShortTermNonPromotionalDebt: Int
    public let currentShortTermCreditLimit: Int
    public let currentShortTermCreditUtilisation: Int
    public let changeInShortTermDebt: Int
    public let currentLongTermDebt: Int
    public let currentLongTermNonPromotionalDebt: Int
    public let currentLongTermCreditLimit: Int?
    public let currentLongTermCreditUtilisation: Int?
    public let changeInLongTermDebt: Int
    public let numPositiveScoreFactors: Int
    public let numNegativeScoreFactors: Int
    public let equifaxScoreBand: Int
    public let equifaxScoreBandDescription: String
    public let daysUntilNextReport: Int

    public init(
        score: Int,
        scoreBand: Int,
        clientRef: String,
        status: String,
        maxScoreValue: Int,
        minScoreValue: Int,
        monthsSinceLastDefaulted: Int,
        hasEverDefaulted: Bool,
        monthsSinceLastDelinquent: Int,
        hasEverBeenDelinquent: Bool,
        percentageCreditUsed: Int,
        percentageCreditUsedDirectionFlag: Int,
        changedScore: Int,
        currentShortTermDebt: Int,
        currentShortTermNonPromotionalDebt: Int,
        currentShortTermCreditLimit: Int,
        currentShortTermCreditUtilisation: Int,
        changeInShortTermDebt: Int,
        currentLongTermDebt: Int,
        currentLongTermNonPromotionalDebt: Int,
        currentLongTermCreditLimit: Int?,
        currentLongTermCreditUtilisation: Int?,
        changeInLongTermDebt: Int,
        numPositiveScoreFactors: Int,
        numNegativeScoreFactors: Int,
        equifaxScoreBand: Int,
        equifaxScoreBandDescription: String,
        daysUntilNextReport: Int
    ) {
        self.score = score
        self.scoreBand = scoreBand
        self.clientRef = clientRef
        self.status = status
        self.maxScoreValue = maxScoreValue
        self.minScoreValue = minScoreValue
        self.monthsSinceLastDefaulted = monthsSinceLastDefaulted
        self.hasEverDefaulted = hasEverDefaulted
        self.monthsSinceLastDelinquent = monthsSinceLastDelinquent
        self.hasEverBeenDelinquent = hasEverBeenDelinquent
        self.percentageCreditUsed = percentageCreditUsed
        self.percentageCreditUsedDirectionFlag = percentageCreditUsedDirectionFlag
        self.changedScore = changedScore
        self.currentShortTermDebt = currentShortTermDebt
        self.currentShortTermNonPromotionalDebt = currentShortTermNonPromotionalDebt
        self.currentShortTermCreditLimit = currentShortTermCreditLimit
        self.currentShortTermCreditUtilisation = currentShortTermCreditUtilisation
        self.changeInShortTermDebt = changeInShortTermDebt
        self.currentLongTermDebt = currentLongTermDebt
        self.currentLongTermNonPromotionalDebt = currentLongTermNonPromotionalDebt
        self.currentLongTermCreditLimit = currentLongTermCreditLimit
        self.currentLongTermCreditUtilisation = currentLongTermCreditUtilisation
        self.changeInLongTermDebt = changeInLongTermDebt
        self.numPositiveScoreFactors = numPositiveScoreFactors
        self.numNegativeScoreFactors = numNegativeScoreFactors
        self.equifaxScoreBand = equifaxScoreBand
        self.equifaxScoreBandDescription = equifaxScoreBandDescription
        self.daysUntilNextReport = daysUntilNextReport
    }
}
