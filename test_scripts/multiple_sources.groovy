ruleStore([
    rule('SelectedTransitions2Text')
        .in("a", flowchartPk.Action)
        .filter {
            !a.outgoing.isEmpty()
        }
        .in("d", flowchartPk.Decision)
        .in("t", flowchartPk.Transition)
        .filter{                        
                a.outgoing.name[0] == t.name || d.outgoing.name.contains(t.name)
            }
        .out("p", htmlPk.P, {
            if(a.outgoing.name[0] == t.name) {
                p.value = "Source: ${a.name}; Transition: ${t.name}; Target: ${t.target.name}".toString()
            } else if(d.outgoing.name[0] == t.name) {
                p.value = "Source: ${d.name}; Transition: ${t.name}; Target: ${t.target.name}".toString()
            } else if(d.outgoing.name[1] == t.name) {
                p.value = "Source: ${d.name}; Transition: ${t.name}; Target: ${t.target.name}".toString()
            }
        })
])
