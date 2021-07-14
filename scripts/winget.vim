function CreateWingetYaml()
  let vers=expand("$APPVEYOR_REPO_TAG_NAME")[1:]
  let gvim="gvim_" .. vers .. "_x64.exe"
  let sha256=systemlist("sha256sum " .. gvim)
  let sha256hash=toupper(split(sha256[0])[0])

  let gvim_x86="gvim_" .. vers .. "_x86.exe"
  let sha256_x86=systemlist("sha256sum " .. gvim_x86)
  let sha256hash_x86=toupper(split(sha256[0])[0])

  %s/<version>/\=vers/g
  "if expand("$ARCH") == 'x64'
  %s/<sha256hash>/\=sha256hash/
  "else
  %s/<sha256hash_x86>/\=sha256hash/
  "endif

  exe ":saveas! gvim_" .. vers ..".yml"
endfunction


call CreateWingetYaml()
quit
