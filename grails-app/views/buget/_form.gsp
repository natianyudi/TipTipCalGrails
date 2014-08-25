<%@ page import="com.jyp.data.Buget" %>



<div class="fieldcontain ${hasErrors(bean: bugetInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="buget.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: bugetInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bugetInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="buget.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${bugetInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: bugetInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="buget.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${bugetInstance?.startDate}"  />

</div>

