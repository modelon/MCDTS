# Modelica Class Dependency Test Suite
The Modelica Class Dependency Test Suite (MCDTS) is a test suite for class dependency analysis in Modelica.

Every line in a .in file corresponds to a class in the .mo file with the same name. If dependency analysis is run on that class, dependencies to all classes in .expected file on the same line should be found.

The OperatorRecord test case requires the file <span>Complex.mo</span> from the Modelica Standard Library (https://github.com/modelica/ModelicaStandardLibrary).
