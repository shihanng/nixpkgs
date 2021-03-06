{ lib
, buildPythonPackage
, fetchPypi
, pytest
, pytest-doctestplus
, pytest-remotedata
, pytest-openfiles
, pytest-arraydiff
}:

buildPythonPackage rec {
  pname = "pytest-astropy";
  version = "0.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "619800eb2cbf64548fbea25268efe7c6f6ae206cb4825f34abd36f27bcf946a2";
  };

  propagatedBuildInputs = [
    pytest
    pytest-doctestplus
    pytest-remotedata
    pytest-openfiles
    pytest-arraydiff
  ];

  # pytest-astropy is a meta package and has no tests
  doCheck = false;

  meta = with lib; {
    description = "Meta-package containing dependencies for testing";
    homepage = "https://astropy.org";
    license = licenses.bsd3;
    maintainers = [ maintainers.costrouc ];
  };
}
