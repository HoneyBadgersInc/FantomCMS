using build
class Build : build::BuildPod
{
  new make()
  {
    podName = "firstDemoPageExt"
    version   = Version( [ 1, 0, 0 ] )
    summary = ""
    srcDirs   = [`fan/`, `fan/ui/`]
    outPodDir = Env.cur.homeDir.uri + `lib/fan/`
    depends   = ["sys 1.0",
                 "fui 1.0",
                 "fwt 1.0",
                 "gfx 1.0",
                 "proj 1.0",
                 "sql 1.0",
                 "util 1.0",
                 "web 1.0",
                 "webfwt 1.0",
                 "webmod 1.0"]
    index    = ["proj.ext": "firstDemoPageExt::FirstDemoPageExt"]
  }
}
