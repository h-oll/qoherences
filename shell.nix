with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "std-python";
  buildInputs = [
    # System requirements.
    readline

    # Python requirements (enough to get a virtualenv going).
    python38Full
    python38Packages.virtualenv
    python38Packages.pip
    python38Packages.setuptools
    # python38Packages.numpy
    # python38Packages.pandas
    python38Packages.scipy
    #python37Packages.Nikola
  ];
  src = null;
  shellHook = ''
    # Allow the use of wheels.
    SOURCE_DATE_EPOCH=$(date +%s)
    # Augment the dynamic linker path
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${R}/lib/R/lib:${readline}/lib
  '';
}
