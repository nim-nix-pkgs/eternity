{
  description = ''A library to humanize elapsed times'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-eternity-master.flake = false;
  inputs.src-eternity-master.owner = "hiteshjasani";
  inputs.src-eternity-master.ref   = "master";
  inputs.src-eternity-master.repo  = "nim-eternity";
  inputs.src-eternity-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-eternity-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-eternity-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}