//.filter rule
ruleStore([
    rule('SelectedTransitions2Text')
        .in("t", flowchartPk.Transition).filter({})
        .filter{	
            //Filter input objects that satify this condition
            t.source.name == "Is it really too early?"		
        }
        .out("p", htmlPk.P, {
            p.value = t.name
        }) .filter({})
])