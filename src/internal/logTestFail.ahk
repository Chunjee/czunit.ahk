_logTestFail(param_actual, param_expected, param_msg:="") {
	if (A_IsCompiled) {
		return 0
	}

	; create
	this.failTotal++
	if (param_msg != "") {
		this.labelVar := param_msg
	}
	if (this.labelVar != this.lastlabel) {
		this.lastlabel := this.labelVar
		if (this.groupVar) {
			this.log.push("## " this.groupVar "")
		}
		this.log.push("- Test Number: " this.failTotal "  ")
		if (this.labelVar != "") {
			this.log.push(this.labelVar "  ")
		}
		this.log.push("Expected: " param_expected "  ")
		this.log.push("Actual: " param_actual "  ")
	}
	groupStr := ""
	if (this.groupVar != "") {
		groupStr := this.groupVar "; "
	}

	msg := "not ok " this.testTotal " - " groupStr this.labelVar "`n"
	msg .= "    ---`n"
	msg .= "    Expected: " param_expected "`n"
	msg .= "    Got: " param_actual "`n"
	msg .= "    ..."
	this._stdOut(msg)
}
