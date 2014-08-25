
<%@ page import="com.jyp.data.Expense" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'expense.label', default: 'Expense')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container theme-showcase">
  		
  		<a href="#list-expense" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div>
			<ul>
			<li>123123</li>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-expense" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'expense.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'expense.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="memo" title="${message(code: 'expense.memo.label', default: 'Memo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${expenseInstanceList}" status="i" var="expenseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${expenseInstance.id}">${fieldValue(bean: expenseInstance, field: "amount")}</g:link></td>
					
						<td><g:formatDate date="${expenseInstance.date}" /></td>
					
						<td>${fieldValue(bean: expenseInstance, field: "memo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${expenseInstanceCount ?: 0}" />
			</div>
		</div>
		</div>
		
	</body>
</html>
