package com.jyp.data



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BugetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Buget.list(params), model:[bugetInstanceCount: Buget.count()]
    }

    def show(Buget bugetInstance) {
        respond bugetInstance
    }

    def create() {
        respond new Buget(params)
    }

    @Transactional
    def save(Buget bugetInstance) {
        if (bugetInstance == null) {
            notFound()
            return
        }

        if (bugetInstance.hasErrors()) {
            respond bugetInstance.errors, view:'create'
            return
        }

        bugetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'buget.label', default: 'Buget'), bugetInstance.id])
                redirect bugetInstance
            }
            '*' { respond bugetInstance, [status: CREATED] }
        }
    }

    def edit(Buget bugetInstance) {
        respond bugetInstance
    }

    @Transactional
    def update(Buget bugetInstance) {
        if (bugetInstance == null) {
            notFound()
            return
        }

        if (bugetInstance.hasErrors()) {
            respond bugetInstance.errors, view:'edit'
            return
        }

        bugetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Buget.label', default: 'Buget'), bugetInstance.id])
                redirect bugetInstance
            }
            '*'{ respond bugetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Buget bugetInstance) {

        if (bugetInstance == null) {
            notFound()
            return
        }

        bugetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Buget.label', default: 'Buget'), bugetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'buget.label', default: 'Buget'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
