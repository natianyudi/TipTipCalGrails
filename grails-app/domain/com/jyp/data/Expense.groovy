package com.jyp.data

class Expense {
	double amount
	Date date
	String memo
    static constraints = {
		memo nullable: true
    }
}
