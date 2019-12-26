
fun! snipMate#complete#snips(...)

  let comps = []

  if exists('g:snippets')
    let comps = keys(g:snippets)
  endif

  let res = join(comps,"\n")

  return res
endf

fun! snipMate#complete#snips_all(...)

  let comps = []

  if exists('g:snippets_dir')
    let dirs = split(g:snippets_dir,',')
    let snip_files = base#find({ 
      \ "dirs"    : dirs,
      \ "exts"    : base#qw('snippets'),
      \ "relpath" : 1,
      \ "subdirs" : 1,
      \ "fnamemodify" : ':r',
      \ })
    let snip_exts = base#uniq(snip_files)
    let comps = snip_exts
  endif

  let res = join(comps,"\n")

  return res
endf

if 0
  call tree
    called by
      SnipIns
      snipMate#SnippetInsert
endif

fun! snipMate#complete#snippetNames(...)
  let ft = exists('g:snippet_ft') ? g:snippet_ft : &ft

  let comps = []

  if exists('g:snippets_dir')
    call GetSnippets(g:snippets_dir,ft)
  endif

  if exists('g:snippets')
    let snips = get(g:snippets,ft,{})
    let snippetNames = sort(keys(snips))
    call extend(comps,snippetNames)
  endif

  let res = join(comps,"\n")

  return res
endf
