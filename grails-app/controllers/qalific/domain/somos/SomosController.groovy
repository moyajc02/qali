package qalific.domain.somos

class SomosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [somosInstanceList: Somos.list(params), somosInstanceTotal: Somos.count()]
    }

    def create = {
        def somosInstance = new Somos()
        somosInstance.properties = params
        return [somosInstance: somosInstance]
    }

    def save = {
        def somosInstance = new Somos(params)
        if (somosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'somos.label', default: 'Somos'), somosInstance.id])}"
            redirect(action: "show", id: somosInstance.id)
        }
        else {
            render(view: "create", model: [somosInstance: somosInstance])
        }
    }

    def show = {
        def somosInstance = Somos.get(params.id)
        if (!somosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
            redirect(action: "list")
        }
        else {
            [somosInstance: somosInstance]
        }
    }

    def edit = {
        def somosInstance = Somos.get(params.id)
        if (!somosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [somosInstance: somosInstance]
        }
    }

    def update = {
        def somosInstance = Somos.get(params.id)
        if (somosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (somosInstance.version > version) {
                    
                    somosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'somos.label', default: 'Somos')] as Object[], "Another user has updated this Somos while you were editing")
                    render(view: "edit", model: [somosInstance: somosInstance])
                    return
                }
            }
            somosInstance.properties = params
            if (!somosInstance.hasErrors() && somosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'somos.label', default: 'Somos'), somosInstance.id])}"
                redirect(action: "show", id: somosInstance.id)
            }
            else {
                render(view: "edit", model: [somosInstance: somosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def somosInstance = Somos.get(params.id)
        if (somosInstance) {
            try {
                somosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'somos.label', default: 'Somos'), params.id])}"
            redirect(action: "list")
        }
    }
}
