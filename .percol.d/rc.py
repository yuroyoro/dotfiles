
# prompt
percol.view.PROMPT  = r"<bold><red>ʕ(#  ﾟ皿ﾟ )/</red></bold> %q"

# Emacs like
percol.import_keymap({
    "C-a" : lambda percol: percol.command.beginning_of_line(),
    "C-e" : lambda percol: percol.command.end_of_line(),
    "C-b" : lambda percol: percol.command.backward_char(),
    "C-f" : lambda percol: percol.command.forward_char(),
    "C-d" : lambda percol: percol.command.delete_forward_char(),
    "C-h" : lambda percol: percol.command.delete_backward_char(),
    #"C-k" : lambda percol: percol.command.kill_end_of_line(),
    "C-y" : lambda percol: percol.command.yank(),
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-j" : lambda percol: percol.finish(),
    "C-k" : lambda percol: percol.command.select_previous(),
    "C-v" : lambda percol: percol.command.select_next_page(),
    "M-v" : lambda percol: percol.command.select_previous_page(),
    "M-<" : lambda percol: percol.command.select_top(),
    "M->" : lambda percol: percol.command.select_bottom(),
    "C-m" : lambda percol: percol.finish(),
    "C-g" : lambda percol: percol.cancel(),
    "C-s" : lambda percol: percol.command.toggle_mark_and_next(),
    "C-u" : lambda percol: percol.command.unmark_all(),
    "M-c" : lambda percol: percol.command.toggle_case_sensitive(),
    "M-m" : lambda percol: percol.command.toggle_finder(FinderMultiQueryMigemo),
    "M-r" : lambda percol: percol.command.toggle_finder(FinderMultiQueryRegex)
})
