package require Tk

# Window title
wm title . "Digital Logic Simulator"

# Labels and Inputs
label .l1 -text "Input A (0 or 1)"
entry .e1

label .l2 -text "Input B (0 or 1)"
entry .e2

# Result label
label .result -text "Output will appear here"

# ---------- FUNCTIONS ----------

proc validate {a b} {
    if {($a != 0 && $a != 1) || ($b != 0 && $b != 1)} {
        .result config -text "❌ Enter only 0 or 1"
        return 0
    }
    return 1
}

proc and_gate {} {
    set a [.e1 get]
    set b [.e2 get]

    if {![validate $a $b]} { return }

    set res [expr {$a & $b}]
    .result config -text "AND Output: $res"
}

proc or_gate {} {
    set a [.e1 get]
    set b [.e2 get]

    if {![validate $a $b]} { return }

    set res [expr {$a | $b}]
    .result config -text "OR Output: $res"
}

proc not_gate {} {
    set a [.e1 get]

    if {($a != 0 && $a != 1)} {
        .result config -text "❌ Enter only 0 or 1 for A"
        return
    }

    set res [expr {!$a}]
    .result config -text "NOT Output: $res"
}

proc xor_gate {} {
    set a [.e1 get]
    set b [.e2 get]

    if {![validate $a $b]} { return }

    set res [expr {$a ^ $b}]
    .result config -text "XOR Output: $res"
}

# ---------- BUTTONS ----------

button .b1 -text "AND" -command and_gate
button .b2 -text "OR" -command or_gate
button .b3 -text "NOT" -command not_gate
button .b4 -text "XOR" -command xor_gate

# ---------- LAYOUT ----------

pack .l1
pack .e1
pack .l2
pack .e2

pack .b1
pack .b2
pack .b3
pack .b4

pack .result