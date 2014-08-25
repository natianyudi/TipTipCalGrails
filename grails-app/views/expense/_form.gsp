<%@ page import="com.jyp.data.Expense" %>



<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="expense.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: expenseInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="expense.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${expenseInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'memo', 'error')} required">
	<label for="memo">
		<g:message code="expense.memo.label" default="Memo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="memo" required="" value="${expenseInstance?.memo}"/>

</div>

