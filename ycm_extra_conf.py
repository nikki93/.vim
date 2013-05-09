import vim

def FlagsForFile(filename):
    filetype = vim.eval("&filetype")

    flags = []

    # c/c++
    if filetype == 'c' or filetype == 'cpp':
        try:
            flags = list(line.rstrip('\n') for line in open('.coptions', 'r'))
        except:
            pass
        try:
            flags = list(line.rstrip('\n') for line in open('.cppoptions', 'r'))
        except:
            pass

        syntasticvar = 'g:syntastic_c_compiler_options'
        if filetype == 'cpp':
            flags = flags + ['-x', 'c++'] # clang option to set language
            vim.command("let " + syntasticvar + "=' " + ' '.join(flags) + "'")

    return { 'flags': flags, 'do_cache': True}



