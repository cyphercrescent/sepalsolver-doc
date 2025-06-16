

Hist
====
   Description: 
       Generates a histogram representation of a data vector.
       This method bins the input values into intervals and returns the histogram data,
       including counts per bin, positions (typically bin centers), bin size, and min/max of the data range.
       Suitable for visualizing data distributions.

       .. code-block:: CSharp 

          (List<int> Counts, List<double> Positions, double BinSize, double Vmin, double Vmax) Hist(ColVec V, int bin)
   Param: 
      | V:  A column vector (ColVec) containing the numerical data to be analyzed.
      | bin:  The number of bins to divide the data range into. More bins provide finer granularity.
   Returns: 
       A tuple containing:
       - Counts: Number of elements in each bin
       - Positions: Center positions of each bin
       - BinSize: Width of each bin
       - Vmin: Minimum value in the dataset
       - Vmax: Maximum value in the dataset
   Example: 
       Create a histogram of 1,000 samples drawn from a normal distribution.

       .. code-block:: CSharp 

          // Generate sample data
          var rand = new Random();
          var data = Enumerable.Range(0, 1000).Select(_ => rand.NextDouble() * 10).ToList();
          var vector = new ColVec(data);
      
          // Compute histogram
          var result = Hist(vector, 20);
      
          Console.WriteLine("Bin Counts: " + string.Join(", ", result.Counts));
          Console.WriteLine("Bin Centers: " + string.Join(", ", result.Positions));

      Output: 


       .. code-block:: Terminal 

          Bin Counts: 47, 45, 40, 57, 47, 49, 52, 51, 50, 44, 55, 49, 53, 63, 39, 53, 44, 54, 47, 61
          Bin Centers: 0.25344698280706046, 0.7530616086946283, 1.2526762345821962, 1.7522908604697642, 2.251905486357332, 2.7515201122449, 3.251134738132468, 3.750749364020036, 4.250363989907604, 4.749978615795172, 5.2495932416827396, 5.749207867570307, 6.248822493457875, 6.748437119345443, 7.248051745233011, 7.747666371120578, 8.247280997008145, 8.746895622895714, 9.24651024878328, 9.74612487467085


Meshgrid
========
   Description: 
       Generates coordinate matrices from coordinate vectors.
       This method creates two 2D arrays representing all pairs of x and y coordinates from the input vectors, which is often used for evaluating functions over a grid.

       .. code-block:: CSharp 

          (Matrix X, Matrix Y) Meshgrid(ColVec x, ColVec y)
          (Matrix X, Matrix Y) Meshgrid(ColVec x)
   Param: 
      | x:  The vector representing X-axis values.
      | y:  The vector representing Y-axis values.
   Returns: 
       A tuple of two 2D arrays:
       - The first array contains copies of the x vector arranged in rows.
       - The second array contains copies of the y vector arranged in columns.
   Example: 
       Generate a 2D grid from x = [1, 2, 3] and y = [10, 20]

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math
      
          // Define input vectors
          ColVec x =new double[]{ 1, 2, 3 };
          ColVec y = new double[] { 10, 20 };
      
          // Call meshgrid function
          var (X, Y) = Meshgrid(x, y);
      
          // Print result
          for (int i = 0; i < Y.Numel; i++) {
              for (int j = 0; j < X.Numel; j++) {
                  Console.Write($"({X[i,j]},{Y[i,j]}) ");
              }
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          (1,10) (1,20) 
          (2,10) (2,20)
          (3,10) (3,20)


ReadMatrix
==========
   Description: 
       Reads a two-dimensional integer matrix from a file.
       This method loads space-separated integers from each line of the specified file and constructs a matrix representation.

       .. code-block:: CSharp 

          Matrix ReadMatrix(string filename)
   Param: 
      | filename:  The path to the input file containing the matrix data.
   Returns: 
       A two-dimensional integer array containing the values read from the file.
   Example: 
       Read a matrix from a file named "matrix.txt":

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math
       
          string path = "matrix.txt";
      
          // Load matrix
          Matrix matrix = ReadMatrix(path);
      
          // Display contents
          for (int i = 0; i < matrix.Rows; i++)
          {
              for (int j = 0; j < matrix.Cols; j++)
                  Console.Write(matrix[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          1 2 3  
          4 5 6  
          7 8 9


Reshape
=======
   Description: 
       Reshapes a one-dimensional array of input into a matrix with specified dimensions.
       This method returns a output with the given dimensions, populated with the data from the input array.

       .. code-block:: CSharp 

          Matrix Reshape(double[] data, int[] Size)
          Matrix Reshape(List<double> data, int[] Size)
          Matrix Reshape(Matrix data, int[] Size)
   Param: 
      | data:  The one-dimensional or multi-dimensional array to be reshaped.
      | Size:  An array containing the dimensions [rows, columns] for the new matrix.
   Returns: 
       A output with the specified dimensions.
   Example: 
          // Reshape a one-dimensional array into a 2x3 matrix

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
      
          // Reshape array
          double[] data = { 1, 2, 3, 4, 5, 6 };
          int[] size = { 2, 3 };
          var result = Reshape(data, size);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

             1.0000    3.0000    5.0000
             2.0000    4.0000    6.0000


Hypot
=====
   Description: 
       Calculates the length of the hypotenuse of a right-angled triangle given the lengths of the other two sides.This method computes z = Sqrt(Pow(x, 2) + Pow(y, 2)) by avoiding underflow and overflow.

       .. math::
          \text{hypot}(x,y) = \sqrt{x^2 + y^2}
          

       .. code-block:: CSharp 

          double Hypot(double x, double y)
          ColVec Hypot(ColVec x, double y)
          ColVec Hypot(double x, ColVec y)
          RowVec Hypot(RowVec x, double y)
          RowVec Hypot(double x, RowVec y)
          Matrix Hypot(Matrix x, double y)
          Matrix Hypot(double x, Matrix y)
          ColVec Hypot(ColVec x, ColVec y)
          RowVec Hypot(RowVec x, RowVec y)
          Matrix Hypot(Matrix x, Matrix y)
          Matrix Hypot(RowVec x, ColVec y)
          Matrix Hypot(ColVec x, RowVec y)
          Matrix Hypot(RowVec x, Matrix y)
          Matrix Hypot(Matrix x, RowVec y)
          Matrix Hypot(Matrix x, ColVec y)
          Matrix Hypot(ColVec x, Matrix y)
   Param: 
      | x:  The length of one side of the triangle.
      | y:  The length of the other side of the triangle.
   Returns: 
       The length of the hypotenuse.
   Example: 
       Compute the hypotenus of a triangle with sides 3 and 4

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute the hypotenus
          var hypotenuse = Hypot(3, 4);
          Console.WriteLine(hypotenuse);

      Output: 


       .. code-block:: Terminal 

          5
   Example: 
       Compute the hypotenus of a triangle with sides :math:`[2,3,4,5]` and :math:`[7,6]^T`

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute the hypotenus
          RowVec X = new double[]{2,3,4,5};
          ColVec Y = new double[]{7,6};
          var hypotenuse = Hypot(X, Y);
          Console.WriteLine(hypotenuse); 

      Output: 


       .. code-block:: Terminal 

          7.2801    7.6158    8.0623    8.6023
          6.3246    6.7082    7.2111    7.8102


Abs
===
   Description: 
       Calculates the absolute value of an input.
       This method returns the absolute value of the given input, which is the non-negative value of the input without regard to its sign.

       .. code-block:: CSharp 

          int Abs(int x)
          double Abs(double x)
          double Abs(Complex x)
          ColVec Abs(ColVec x)
          RowVec Abs(RowVec x)
          Matrix Abs(Matrix x)
          SparseColVec Abs(SparseColVec x)
          SparseRowVec Abs(SparseRowVec x)
          SparseMatrix Abs(SparseMatrix x)
   Param: 
      | x:  The input value for which the absolute value is to be calculated.
   Returns: 
       The absolute value of the input.
   Example: 
       Compute the absolute value of -5

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
       
          // Compute Absolute
          var result = Abs(-5);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          5


BesselJ
=======
   Description: 
       Computes the Bessel function of the first kind.
       This method calculates the Bessel function of the first kind for a given order and value.

       .. math::
          J_i(x)

       .. code-block:: CSharp 

          double BesselJ(int i, double x)
          Complex BesselJ(int i, Complex x)
          Matrix BesselJ(int i, Matrix x)
          ColVec BesselJ(int i, ColVec x)
          RowVec BesselJ(int i, RowVec x)
          SparseMatrix BesselJ(int i, SparseMatrix x)
          SparseColVec BesselJ(int i, SparseColVec x)
          SparseRowVec BesselJ(int i, SparseRowVec x)
   Param: 
      | i:  The order of the Bessel function.
      | x:  The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Bessel function of the first kind at the given order and value.
   Example: 
       Compute the Bessel function of the first kind for order 0 and value 2.5

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute besselj function
          var result = BesselJ(0, 2.5);
          
          // Print result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          -0.0483837764681979
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 3.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute besselj function
          var result = BesselJ(1, 3.0);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          0.339058958525936
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 3.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute Besselj function
          ColVec x = Linspace(0, 10);
          Matrix y = Enumerable.Range(0, 10).Select(i=>BesselJ(i, x)).ToList();
          
         // Plot result
         Plot(x, y); Xlabel("x-axis"); Ylabel("y-axis"); Title("Bessel function J");
         

      Output: 

       .. figure:: images/BesselfunctionPlot.png
          :align: center
          :alt: BesselfunctionPlot.png




BesselI
=======
   Description: 
       Computes the modified Bessel function of the first kind Iₙ(x).
       This method evaluates the exponentially scaled modified Bessel function of the first kind for a given order and value.

       .. math::
          J_i(x)

       .. code-block:: CSharp 

          double BesselI(int i, double x)
          Complex BesselI(int i, Complex x)
          Matrix BesselI(int i, Matrix x)
          ColVec BesselI(int i, ColVec x)
          RowVec BesselI(int i, RowVec x)
          SparseMatrix BesselI(int i, SparseMatrix x)
          SparseColVec BesselI(int i, SparseColVec x)
          SparseRowVec BesselI(int i, SparseRowVec x)
   Param: 
      | i:  The order of the Bessel function.
      | x:  The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Bessel function of the first kind at the given order and value.
   Example: 
       Compute the Bessel function of the first kind for order 0 and value 2.5

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselI function
          var result = Besseli(0, 2.5);
          
          // Print result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          3.28983914405
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 2.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselI function
          var result = BesselI(1, 2.0);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          1.590637
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 3.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselI function
          ColVec x = Linspace(0, 10);
          Matrix y = Enumerable.Range(0, 10).Select(i=>BesselI(i, x)).ToList();
          
          // Plot result
          Plot(x, y); Xlabel("x-axis"); Ylabel("y-axis"); Title("Bessel function I");
         

      Output: 

       .. figure:: images/BesselfunctionPlotI.png
          :align: center
          :alt: BesselfunctionPlotI.png




BesselY
=======
   Description: 
       Computes the Bessel function of the second kind Yₙ(x).
       This method evaluates the Weber or Neumann Bessel function of the first kind for a given order and value.

       .. math::
          Y_n(x)

       .. code-block:: CSharp 

          double BesselY(int i, double x)
          Complex BesselY(int i, Complex x)
          Matrix BesselY(int i, Matrix x)
          ColVec BesselY(int i, ColVec x)
          RowVec BesselY(int i, RowVec x)
          SparseMatrix BesselY(int i, SparseMatrix x)
          SparseColVec BesselY(int i, SparseColVec x)
          SparseRowVec BesselY(int i, SparseRowVec x)
   Param: 
      | i:  The order of the Bessel function.
      | x:  The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Bessel function of the second kind at the given order and value (must be positive).
   Example: 
       Compute the Bessel function of the first kind for order 0 and value 2.5

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselY function
          var result = BesselY(0, 2.5);
          
          // Print result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          0.4980703596
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 2.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselY function
          var result = BesselY(1, 2.0);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          -0.1070324315
   Example: 
       Compute the Bessel function of the second kind for order 1 and value 3.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute bessely function
          ColVec x = Linspace(0, 10);
          Matrix y = Enumerable.Range(0, 10).Select(i=>BesselY(i, x)).ToList();
          
         // Plot result
         Plot(x, y); Xlabel("x-axis"); Ylabel("y-axis"); Title("Bessel function I");
         

      Output: 

       .. figure:: images/BesselfunctionPlotY.png
          :align: center
          :alt: BesselfunctionPlotY.png




BesselK
=======
   Description: 
       Computes the Bessel function of the second kind Kₙ(x).
       This method evaluates the exponentially scaled modified Bessel function for a given order and value.

       .. math::
          K_n(x)

       .. code-block:: CSharp 

          double BesselK(int i, double x)
          Complex BesselK(int i, Complex x)
          Matrix BesselK(int i, Matrix x)
          ColVec BesselK(int i, ColVec x)
          RowVec BesselK(int i, RowVec x)
          SparseMatrix BesselK(int i, SparseMatrix x)
          SparseColVec BesselK(int i, SparseColVec x)
          SparseRowVec BesselK(int i, SparseRowVec x)
   Param: 
      | i:  The order of the Bessel function.
      | x:  The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Bessel function of the second kind at the given order and value (must be positive).
   Example: 
       Compute the Bessel function of the first kind for order 0 and value 2.5

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselK function
          var result = BesselK(0, 2.5);
          
          // Print result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          0.0623475532
   Example: 
       Compute the Bessel function of the first kind for order 1 and value 2.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselK function
          var result = BesselK(1, 2.0);
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          0.1398658818
   Example: 
       Compute the Bessel function of the second kind for order 1 and value 2.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Compute BesselK function
          ColVec x = Linspace(0, 10);
          Matrix y = Enumerable.Range(0, 10).Select(i=>BesselK(i, x)).ToList();
          
         // Plot result
         Plot(x, y); Xlabel("x-axis"); Ylabel("y-axis"); Title("Bessel function K");
         

      Output: 

       .. figure:: images/BesselfunctionPlotKwww.png
          :align: center
          :alt: BesselfunctionPlotKwww.png




Gamma
=====
   Description: 
       Computes the Gamma function Γ(z), which generalizes the factorial function to real and complex numbers.
       This method evaluates the Gamma function Γ(x), for a given real positive numbers or complex numbers.

       .. code-block:: CSharp 

          double Gamma(double z)
          Complex Gamma(Complex z)
          Matrix Gamma(Matrix x)
          ColVec Gamma(ColVec x)
          RowVec Gamma(RowVec x)
          SparseMatrix Gamma(SparseMatrix x)
          SparseColVec Gamma(SparseColVec x)
          SparseRowVec Gamma(SparseRowVec x)
          double Gamma(double z, double tolerance = 1e-10)
   Param: 
      | z:  The input value (real or complex). For positive integers, Γ(n) = (n-1)!.
   Returns: 
       The value of the Gamma function at z.
   Example: 
       Compute Γ(4) (equivalent to 3!):
       

       .. math::
          
          \Gamma(4) = 6
          

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // compute Gamma(4)
          double result = Gamma(4);
          
          // display the result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          
          6.0000


SolverSet
=========
   Description: 
       Creates and returns a configuration object for solver settings.
       This method allows customization of solver behavior such as step size, tolerance levels, iteration limits, and parallel execution. It also supports a user-defined Jacobian function to improve solver efficiency and accuracy.

       .. code-block:: CSharp 

           Solvers.Set SolverSet(bool? Display = false, double? StepFactor = null, double? RelTol = null, double? AbsTol = null, 
           int? MaxIter = null, int? MaxFunEvals = null, bool? UseParallel = null, Func<ColVec, SparseMatrix> UserDefinedJac = null)
   Param: 
      | Display:  Optional. If <c>true</c>, enables display of solver progress and results during execution. Defaults to <c>false</c>.
      | StepFactor:  Optional. A scaling factor for the initial step size used in iterative solvers.
      | RelTol:  Optional. Relative tolerance. The solver stops when the relative change in the solution is below this threshold.
      | AbsTol:  Optional. Absolute tolerance. The solver stops when the absolute change in the solution is below this threshold.
      | MaxIter:  Optional. Maximum number of iterations allowed for the solver.
      | MaxFunEvals:  Optional. Maximum number of function evaluations allowed.
      | UseParallel:  Optional. If <c>true</c>, enables parallel computation for supported solvers.
      | UserDefinedJac:  Optional. A user-defined function that returns the Jacobian matrix of the system. This can improve convergence speed and accuracy.
   Returns: 
       Information about the problem solved like, number of iteration, number of function call and other estimated parameters.
   Example: 
       Consider the root of the function below and evaluation information displayed using SolverSet. You can set your desired number of iteration and other parameters. It displaced information like number of iteration, number of function call and other estimated parameters. This information provides an insight about the 
       activities that takes inside the method during and after evaluation of the set function.
       
       Compute the root of :math:`x^3 - 10 = 0`
       

       .. code-block:: CSharp 

          using SepalSolver;
          using static SepalSolver.Math;
      
          // Define an objective function
          static double fun(double x) => Pow(x, 3) - 10;
          
          // Call the SolverSet method and set initial guess
          var opts = SolverSet(Display: true);
          double x0 = 1.5;
          
          // Solve the optimization problem and display of runtime information by SolverSet
          Console.WriteLine($"Information during Fzero Calculation displayed by SolverSet");
          double root = Fzero(fun, x0, opts);
          Console.WriteLine($"Root of the function, F(x) is : {root.T}");

      Output: 


       .. code-block:: Terminal 

          Information during Fzero Calculation displayed by SolverSet
      
          Search for an interval around 1.5 containing a sign change:
          
          fun-count  a          f(a)           b f(b)     Procedure
             1       1.5e+0    -6.625e+0       1.5e+0    -6.625e+0   initial interval
             3    1.4576e+0   -6.9034e+0    1.5424e+0   -6.3304e+0   search
             5      1.44e+0    -7.014e+0      1.56e+0   -6.2036e+0   search
             7    1.4151e+0    -7.166e+0    1.5849e+0   -6.0192e+0   search
             9      1.38e+0   -7.3719e+0      1.62e+0   -5.7485e+0   search
             11    1.3303e+0   -7.6458e+0    1.6697e+0    -5.345e+0   search
             13      1.26e+0   -7.9996e+0      1.74e+0    -4.732e+0   search
             15    1.1606e+0   -8.4367e+0    1.8394e+0   -3.7765e+0   search
             17      1.02e+0   -8.9388e+0      1.98e+0   -2.2376e+0   search
             19    8.2118e-1   -9.4463e+0    2.1788e+0    3.4345e-1   search
      
          Solving for solution between 0.821177 and 2.178823
           
          fun-count x         f(x)       Procedure
             19    2.1788e+0    3.4345e-1    initial
             20    2.1312e+0   -3.2017e-1    interpolation
             21    2.1542e+0   -3.6617e-3    interpolation
             22    2.1544e+0    7.4508e-7    interpolation
             23    2.1544e+0  -9.0964e-11    interpolation
             24    2.1544e+0   1.7764e-15    interpolation
      
          Root of the function, F(x) is:   2.154434690031884


OptimSet
========
   Description: 
       Configures and returns a set of optimization parameters.
       This method allows users to customize various solver settings such as tolerances, iteration limits, and display options. These settings influence the behavior and performance of optimization algorithms.

       .. code-block:: CSharp 

           Optimizers.Set OptimSet(bool? Display = false, double? FuncTol = null, double? OptimalityTol = null, double? StepTol = null, double? ConstraintTol = null,
           ColVec Weight = null, int? MaxIter = null, int? MaxFunEvals = null, bool? UseParallel = null, dynamic Pltfun = null, int? PopulationSize = null,
           LevenbergeMaquardt_UpdateType? LMUpdate = null)
   Param: 
      | Display:  Optional. If set to <c>true</c>, displays solver progress and results during and after execution. Defaults to <c>false</c>.
      | FuncTol:  Optional. Function tolerance. The solver stops when the change in the objective function value is less than this threshold.
      | OptimalityTol:  Optional. Optimality tolerance. Determines the acceptable level of optimality for the solution.
      | StepTol:  Optional. Step tolerance. The solver stops if the step size becomes smaller than this value.
      | ConstraintTol:  Optional. Constraint tolerance. Specifies the acceptable violation level for constraints.
      | Weight:  Optional. A vector of weights used in weighted optimization problems.
      | MaxIter:  Optional. Maximum number of iterations allowed for the solver.
      | MaxFunEvals:  Optional. Maximum number of function evaluations allowed.
      | UseParallel:  Optional. If set to <c>true</c>, enables parallel computation for supported solvers.
      | Pltfun:  Optional. A plotting function or delegate that visualizes the optimization process.
      | PopulationSize:  Optional. Specifies the population size for population-based algorithms (e.g., genetic algorithms).
      | LMUpdate:  Optional. Specifies the update strategy for the Levenberg-Marquardt algorithm.
   Returns: 
          Information about the problem solved like, number of iteration, number of function call and other estimated parameters.
   Example: 
       Consider the optimization of a Rosenbrock function below and evaluation information displayed using OptimSet. You can set your desired number of iteration and other parameters. It displaced information like number of iteration, number of function call and other estimated parameters. This information provides an insight about the 
       activities that takes inside the method during and after the estimation of the Rosenbrock problem.

       .. code-block:: CSharp 

          using SepalSolver;
          using static SepalSolver.Math;
      
          // Define the Rosenbrock function
          Func<ColVec, double> objective = x =>
          Pow(1 - x[0], 2) + 100 * Pow(x[1] - Pow(x[0], 2), 2);
           
          // Call the OptimSet method and set initial guess
          var opts = OptimSet(Display: true, MaxIter: 200, StepTol: 1e-6, OptimalityTol: 1e-6);
          double[] x0 = new double[] { -1.2, 1 };
      
          // Solve the optimization problem and display of runtime information by OptimSet
          var solution = Fminsearch(objective, x0, null, null, null, null, opts);
          Console.WriteLine($"Optimized Solution: {solution.T}");

      Output: 


       .. code-block:: Terminal 

              fun-count a          f(a)           b f(b)     Procedure
          1         2e+0        -1e+0         2e+0        -1e+0   initial interval
          3    1.9434e+0   -1.5467e+0    2.0566e+0   -4.1493e-1   search
          5      1.92e+0   -1.7621e+0      2.08e+0   -1.6109e-1   search
          7    1.8869e+0    -2.056e+0    2.1131e+0    2.0962e-1   search
      
          Solving for solution between 1.886863 and 2.113137
          fun-count x         f(x)       Procedure
              7    2.1131e+0    2.0962e-1    initial
              8    2.0922e+0   -2.6189e-2    interpolation
              9    2.0945e+0   -2.7259e-4    interpolation
             10    2.0946e+0    6.4152e-9    interpolation
             11    2.0946e+0  -8.9706e-14    interpolation
             12    2.0946e+0  -8.8818e-16    interpolation
            Iteration  fun-count f(x)     Procedure
               0          1      24.2000
               1          3      20.0500    initial simplex
               2          5       5.1618    expand
               3          7       4.4978    reflect
               4          8       4.4978    reflect
               5         10       4.4978    contract inside
               6         12       4.3814    contract inside
               7         14       4.2453    contract inside
               8         16       4.2176    reflect
               9         18       4.2113    contract inside
              10         20       4.1356    expand
              11         22       4.1356    contract inside
              12         24       4.0127    expand
              13         26       3.9374    expand
              14         28       3.6026    expand
              15         29       3.6026    reflect
              16         31       3.4662    reflect
              17         33       3.2161    expand
              18         35       3.1649    reflect
              19         37       2.7069    expand
              20         38       2.7069    reflect
              21         40       2.0022    expand
              22         42       2.0022    contract inside
              23         44       2.0022    contract inside
              24         46       1.8154    expand
              25         47       1.8154    reflect
              26         49       1.7348    contract inside
              27         51       1.3170    expand
              28         52       1.3170    reflect
              29         53       1.3170    reflect
              30         55       1.1595    reflect
              31         57       1.0767    contract inside
              32         59       0.8835    reflect
              33         61       0.8835    contract inside
              34         63       0.6692    expand
              35         65       0.6692    contract inside
              36         66       0.6692    reflect
              37         68       0.5367    reflect
              38         70       0.5367    contract inside
              39         72       0.4233    expand
              40         73       0.4233    reflect
              41         75       0.4233    contract inside
              42         77       0.3985    reflect
              43         79       0.3145    expand
              45         82       0.1903    expand
              46         84       0.1903    contract inside
              47         85       0.1903    reflect
              48         87       0.1370    reflect
              49         88       0.1370    reflect
              50         90       0.1370    contract inside
              51         91       0.1370    reflect
              52         93       0.1131    contract inside
              53         95       0.1105    contract inside
              54         97       0.1023    reflect
              55         99       0.1012    contract inside
              56        101       0.0795    expand
              57        102       0.0795    reflect
              58        103       0.0795    reflect
              59        105       0.0569    expand
              60        107       0.0569    contract inside
              61        109       0.0345    expand
              62        111       0.0180    expand
              63        112       0.0180    reflect
              64        114       0.0169    contract inside
              65        116       0.0040    reflect
              66        118       0.0040    contract inside
              67        119       0.0040    reflect
              68        121       0.0004    reflect
              69        123       0.0004    contract inside
              70        124       0.0004    reflect
              71        126       0.0004    contract inside
              72        127       0.0004    reflect
              73        129       0.0001    contract inside
              74        131       0.0000    contract inside
              75        132       0.0000    reflect
              76        134       0.0000    contract inside
              77        135       0.0000    reflect
              78        137       0.0000    contract inside
              79        139       0.0000    contract inside
              80        141       0.0000    contract inside
              81        142       0.0000    reflect
              82        144       0.0000    contract inside
              83        146       0.0000    contract inside
              84        148       0.0000    contract inside
              85        149       0.0000    reflect
              86        151       0.0000    contract inside
              87        153       0.0000    contract inside
              88        155       0.0000    contract inside
              89        157       0.0000    contract inside
              90        159       0.0000    contract inside
              91        161       0.0000    contract inside
              92        162       0.0000    reflect
              93        164       0.0000    contract inside
              94        166       0.0000    contract inside
              95        167       0.0000    reflect
              96        169       0.0000    contract inside
              97        171       0.0000    contract inside
              98        173       0.0000    contract inside
              99        174       0.0000    reflect
             100        176       0.0000    contract inside
             101        178       0.0000    contract inside
             102        179       0.0000    reflect
             103        181       0.0000    contract inside
             104        183       0.0000    contract inside
             105        185       0.0000    contract inside
             106        187       0.0000    reflect
             107        189       0.0000    contract inside
             108        190       0.0000    reflect
             109        192       0.0000    contract inside
             110        194       0.0000    contract inside
             111        196       0.0000    contract inside
             
          Optimized Solution: 1.0000    1.0000


Fzero
=====
   Description: 
       Computes the root of a nonlinear equation.
       This method finds the root (zero) of the specified nonlinear function, starting from an initial guess. An optional parameter allows customization of solver settings.

       .. code-block:: CSharp 

          double Fzero(Func<double, double> fun, double x0)
          double Fzero(Func<double, double> fun, double[] x0)
          double Fzero(Func<double, double> fun, double x0, Solvers.Set options)
   Param: 
      | fun:  The nonlinear function whose root is to be computed. The function must take a double and return a double.
      | x0:  The initial guess for the root or the interval bounding the root.
      | options:  Optional. Solver settings that specify parameters like tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
   Returns: 
       The computed root of the nonlinear equation.
   Example: 
       Compute the root of :math:`x^3 - 10 = 0`

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
      
          // Define the function
          Func<double, double> function = x => Pow(x,3) - 10;
      
          // Compute the root with default options
          var root = Fzero(function, 2.0);
          Console.WriteLine($"Root: {root}");

      Output: 


       .. code-block:: Terminal 

          Root: 2.154434690031884


Fsolve
======
   Description: 
       Finds the roots of nonlinear equations.
       This method computes the root (zero) of the specified system of nonlinear functions, starting from an initial guess. Optional solver settings can be provided to customize the process.

       .. code-block:: CSharp 

          double Fsolve(Func<double, double> fun, double x0, Solvers.Set options = null)
          Complex Fsolve(Func<Complex, Complex> fun, Complex x0, Solvers.Set options = null)
          ColVec Fsolve(Func<ColVec, ColVec> fun, ColVec x0, Solvers.Set options = null)
          ColVec Fsolve(Func<double[], double[]> fun, ColVec x0, Solvers.Set options = null)
   Param: 
      | fun:  The nonlinear function whose root is to be computed. The function can take a double or complex scalar or array values as input and return a scaler or complex or array values.
      | x0:  The initial guess for the root of the function.
      | options:  Optional. Solver settings that specify parameters such as tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
   Returns: 
       The computed root or root(s) of the nonlinear equations.
   Example: 
       Compute the root of the equation 
       

       .. math::
          
          \begin{matrix}
          3x_1 - \cos(x_2 x_3) - \frac{1}{2} = 0 \\
          x_1^2 - 81(x_2+0.1)^2 + \sin(x_3) + 1.06 = 0 \\
          e^{x_1x_2 } + 20x_3 + \frac{10\pi-3}{ 3} = 0 \\
          \end{matrix}
          

       .. math::
       
          x_0 = [0.1, 0.1, -0.1]^T
          

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          double[] x0, res; ColVec x
          // define the function
          ColVec fun(ColVec x)
          {
               double x1 = x[0], x2 = x[1], x3 = x[2];
               res = [3 * x1 - Cos(x2 * x3) - 0.5,
               x1 * x1 - 81*Pow(x2 + 0.1, 2) + Sin(x3) + 1.06,
               Exp(-x1 * x2) + 20 * x3 + (10 * pi - 3) / 3];
               return res;
          };
          
          // set initial guess
          x0 = [0.1, 0.1, -0.1];
          
          // call the solver
          x = Fsolve(fun, x0);
          
          // display the result
          Console.WriteLine(x);
          
         // display the result
         Console.WriteLine(x);

      Output: 


       .. code-block:: Terminal 

          
          0.5000
          0.0000
         -0.5236


Linprog
=======
   Description: 
       Solves a linear programming problem using the Linprog method.
       This method optimizes a linear objective function under constraints defined by 
       inequality and equality systems, as well as variable bounds.

       .. code-block:: CSharp 

          ColVec Linprog(RowVec c, Matrix AInEq = null, ColVec bInEq = null, Matrix AEq = null, ColVec bEq = null, 
          ColVec Lb = null, ColVec Ub = null, Optimizers.Set options = null)
   Param: 
      | c:  The row vector representing the coefficients of the linear objective function to be minimized.
      | AInEq:  Optional. The matrix representing inequality constraint coefficients.
              If null, no inequality constraints are applied.
      | bInEq:  Optional. The column vector representing the right-hand side values of the inequality constraints.
              If null, no inequality constraints are applied.
      | AEq:  Optional. The matrix representing equality constraint coefficients.
            If null, no equality constraints are applied.
      | bEq:  Optional. The column vector representing the right-hand side values of the equality constraints.
            If null, no equality constraints are applied.
      | Lb:  Optional. The column vector representing the lower bounds for the variables.
           If null, the variables are unbounded below.
      | Ub:  Optional. The column vector representing the upper bounds for the variables.
           If null, the variables are unbounded above.
      | options:  Optional. Solver settings that allow customization of parameters such as 
                tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
   Returns: 
       A column vector representing the optimized solution to the linear programming problem.
   Example: 
       Solve a linear programming problem with the objective function

       .. math::
          \begin{array}{rl}
                Maximize: & \\
                         &C = -x + 2y \\
                Subject~to:& \\
                         & x + y \leq 4  \\
                         &-x + 2y \leq 2 \\
                Bounds: & \\
                        & 0 \leq x, y \leq 3 \\   
          \end{array}

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Define the coefficients
          RowVec c = new double [] { -1.0, -2.0 };
          Matrix AInEq = new double[,] { { 1.0, 1.0 }, { -1.0, 2.0 } });
          ColVec bInEq = new[] { 4.0, 2.0 };
          ColVec Lb = new[] double{ 0.0, 0.0 }; // Lower bounds
          ColVec Lb = new double[] { 3.0, 3.0 }; // Upper bounds
          
          // Solve the problem
          ColVec solution = Linprog(c, AInEq, bInEq, null, null, Lb, Ub);
          Console.WriteLine($"Solution: {solution}");

      Output: 


       .. code-block:: Terminal 

        0    1


Intlinprog
==========
   Description: 
       Solves an Integer Linear Programming (ILP) problem using the Intlinprog method.
       This method optimizes a linear objective function under constraints defined by 
       inequality and equality systems, variable bounds, and ensures that specific variables 
       are integers.

       .. code-block:: CSharp 

          ColVec Intlinprog(RowVec c, int[] IntVar, Matrix AInEq = null, ColVec bInEq = null, 
          Matrix AEq = null, ColVec bEq = null, ColVec Lb = null, ColVec Ub = null, 
          Optimizers.Set options = null)
   Param: 
      | c:  The row vector representing the coefficients of the linear objective function to be minimized.
      | IntVar:  The array of indices specifying which variables must be integers.
      | AInEq:  Optional. The matrix representing inequality constraint coefficients.
              If null, no inequality constraints are applied.
      | bInEq:  Optional. The column vector representing the right-hand side values of the inequality constraints.
              If null, no inequality constraints are applied.
      | AEq:  Optional. The matrix representing equality constraint coefficients.
            If null, no equality constraints are applied.
      | bEq:  Optional. The column vector representing the right-hand side values of the equality constraints.
            If null, no equality constraints are applied.
      | Lb:  Optional. The column vector representing the lower bounds for the variables.
           If null, the variables are unbounded below.
      | Ub:  Optional. The column vector representing the upper bounds for the variables.
           If null, the variables are unbounded above.
      | options:  Optional. Solver settings that allow customization of parameters such as 
                tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
   Returns: 
       A column vector representing the optimized integer solution to the Integer Linear Programming problem.
   Example: 
       Solve an Integer Linear Programming problem with the objective function:

       .. math::
       
          \begin{array}{rl}
                Maximize:& \\
                         & c = 60x_1 + 40x_2 + 70x_3\\
                Subject~to:& \\
                           & 4x_1 + 2x_2 + 3x_2 \leq 60 \\
                           & 3x_1 + 2x_2 + 2x_3 \leq 40 \\
                           & 2x_1 + x_2 + 4x_3 \leq 36 \\ 
                           & x_1, x_2, x_3 \geq 0 ~\text{and are integers} \\
          \end{array}

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Define the coefficients
          RowVec c = new double[] { -60, -40, -70 };
          Matrix AInEq = new double [,] { { 4, 2, 3 }, { 3, 2, 2 }, { 2, 1, 4 } };
          ColVec bInEq = new double [] { 60, 40, 36 };
          
          int[] IntVar = [0, 1, 2]; // x1, x2, x3 are an integers
          
          // Solve the problem
          ColVec solution = Intlinprog(c, IntVar, AInEq, bInEq, null, null, Zeros(3));
          Console.WriteLine($"Integer Solution: {solution}");

      Output: 


       .. code-block:: Terminal 

        0    5    15


Fminsearch
==========
   Description: 
       Finds the local minimum of a nonlinear scalar objective function.
       This method uses an iterative solver to minimize the given function, optionally subject to constraints and bounds.

       .. code-block:: CSharp 

          (ColVec x, double fval, int exitflag, ColVec fineq, ColVec feq, List<IterationState> history) 
          Fminsearch(Func<ColVec, double> fun, ColVec x0, Func<ColVec, ColVec> funInEq = null, 
                            Func<ColVec, ColVec> funEq = null, ColVec lb = null, ColVec ub = null, Optimizers.Set options = null)
   Param: 
      | fun:  The nonlinear scalar objective function to be minimized. Must take a column vector of decision variables and return a double.
      | x0:  The initial guess for the decision variables.
      | funInEq:  Optional. A function defining nonlinear inequality constraints.
                Takes a column vector and returns a column vector of constraint values.
      | funEq:  Optional. A function defining nonlinear equality constraints.
              Takes a column vector and returns a column vector of constraint values.
      | lb:  Optional. The column vector representing the lower bounds for decision variables.
      | ub:  Optional. The column vector representing the upper bounds for decision variables.
      | options:  Optional. Solver settings such as tolerance and maximum iterations.
                Defaults to null if not provided.
   Returns: 
       A column vector representing the decision variables that minimize the objective function.
   Example: 
       Solve the Rosenbrock function optimization problem:

       .. math::
          Minimize: f(x, y) = (1 - x)^2 + 100 (y - x^2)^2

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
      
          // Define the Rosenbrock function
          Func<ColVec, double> objective = x => 
              Pow(1 - x[0], 2) + 100 * Pow(x[1] - Pow(x[0], 2), 2);
      
          // Set initial guess
          ColVec x0 = new double[] { -1.2, 1.0 };
      
          // Solve the optimization problem
          ColVec solution = Fminsearch(objective, x0);
          Console.WriteLine($"Optimized Solution: {solution}");

      Output: 


       .. code-block:: Terminal 

          Optimized Solution:  1    1


Fmincon
=======
   Description: 
       Finds the minimum of a scalar objective function subject to various constraints, 
       including inequality, equality, and bound constraints using sequential quadratic programming.

       .. code-block:: CSharp 

          ColVec Fmincon(Func<ColVec, double> fun, ColVec x0, 
                         Func<ColVec, ColVec> funInEq = null, 
                         Func<ColVec, ColVec> funEq = null, 
                         ColVec lb = null, ColVec ub = null, 
                         Optimizers.Set options = null)
   Param: 
      | fun:  The scalar objective function to be minimized. It must take a column vector of decision variables and return a double.
      | x0:  The initial guess for the decision variables.
      | funInEq:  Optional. A function that defines nonlinear inequality constraints.
                Takes a column vector and returns a column vector of constraint values.
      | funEq:  Optional. A function that defines nonlinear equality constraints.
              Takes a column vector and returns a column vector of constraint values.
      | lb:  Optional. The column vector representing the lower bounds for decision variables.
      | ub:  Optional. The column vector representing the upper bounds for decision variables.
      | options:  Optional. Solver settings such as tolerance and maximum iterations.
                Defaults to null if not provided.
   Returns: 
       The optimized decision variables that minimize the objective function within the specified constraints.
   Example: 
       Solve a constrained nonlinear optimization problem:

       .. math::
          \begin{array}{rl}
                Minimize:& \\
                         & f(x, y) = x^2 + y^2 \\
              Subject~to:& \\
                         & x + y \geq 1 \\
                         & x^2 + y^2 \leq 4 \\
                         & 0 \leq x, y \leq 3 \\
          \end{array}

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          
          // Define the objective function
          double objective (ColVec x)
          {
              return Pow(x[0], 2) + Pow(x[1], 2);
          }
          
          // Define inequality constraints
          ColVec constraints (ColVec x)
          {
             return new double[]{ -(x[0] + x[1] - 1), // x + y >= 1
              Pow(x[0], 2) + Pow(x[1], 2) - 4 };// x^2 + y^2 <= 4
          };
          
          // Set bounds
          ColVec lb = new double[] { 0.0, 0.0 };
          ColVec ub = new double[] { 3.0, 3.0 };
          
          // Initial guess
          ColVec x0 = new double[] { 0.5, 0.5 });
          
          // Solve the optimization problem
          ColVec solution = Fmincon(objective, x0, constraints, null, lb, ub);
          Console.WriteLine($"Optimized Solution: {solution.T}");

      Output: 


       .. code-block:: Terminal 

          Optimized Solution: 0.6    0.4    


Bfgs
====
   Description: 
       Finds the minimum of a multivariable objective function using the BFGS quasi-Newton method.
       The method utilizes gradient-based optimization to iteratively improve the solution to unconstrained problems. It is optionally subject to constraints and bounds.

       .. code-block:: CSharp 

          ColVec Bfgs(Func<ColVec, double> fun, ColVec x0, 
                      Func<ColVec, ColVec> funInEq = null, 
                      Func<ColVec, ColVec> funEq = null, 
                      ColVec lb = null, ColVec ub = null, 
                      Optimizers.Set options = null)
   Param: 
      | fun:  The nonlinear scalar objective function to be minimized. Must take a column vector of decision variables and return a scalar point value.
      | x0:  The initial guess for the decision variables.
      | funInEq:  Optional. A function defining nonlinear inequality constraints.
                Takes a column vector and returns a column vector of constraint values.
      | funEq:  Optional. A function defining nonlinear equality constraints.
              Takes a column vector and returns a column vector of constraint values.
      | lb:  Optional. The column vector representing the lower bounds for decision variables.
      | ub:  Optional. The column vector representing the upper bounds for decision variables.
      | options:  Optional. Solver settings such as tolerance and maximum iterations.
                Defaults to null if not provided.
   Returns: 
       A column vector representing the decision variables that minimize the objective function.
   Example: 
       **Unconstrained Optimization: Solve the Rosenbrock Function**

        .. math::
           Minimize: ~f(x, y) = (1 - x)^2 + 100(y - x^2)^2

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
      
          // Define the Rosenbrock function
          Func<ColVec, double> objective = x => 
              Pow(1 - x[0], 2) + 100 * Pow(x[1] - Pow(x[0], 2), 2);
      
          // Set initial guess
          ColVec x0 = new ColVec(new[] { -1.2, 1.0 });
      
          // Solve the optimization problem
          ColVec solution = Bfgs(objective, x0);
          Console.WriteLine($"Optimized Decision Variables: {solution.T}");

      Output: 


       .. code-block:: Terminal 

          Optimized Decision Variables: 1    1
   Example: 

        .. math::
           \begin{array}{rl}
                 Maximize:& \\
                 & f(x, y) = xy \\
                 Subject~to:& \\
                 & x^2 + 4 y^2 = 1 \\
           \end{array}

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
      
          // Define the quadratic objective function
          double Objective(ColVec V)
          {
              double x = V[0], y = V[1];
              return x*y;
          }
      
          // Define equality constraint
          ColVec eqconstraints(ColVec V)
          {
              double x = V[0], y = V[1];
              return Pow(x, 2) + 4 * Pow(y, 2) - 1;
          }
      
          // Initial guess
          ColVec x0 = new ColVec(new[] { 1, 1 });
      
          // Solve the optimization problem
          ColVec solution = Bfgs(objective, x0, null, eqconstraints, null, null);
          Console.WriteLine($"Optimized Decision Variables: {solution.T}");

      Output: 


       .. code-block:: Terminal 

          Optimized Decision Variables:
                -0.7310    0.3631


Lsqcurvefit
===========
   Description: 
       Performs nonlinear least squares curve fitting using the Levenberg-Marquardt algorithm.
       The function optimizes model parameters to best fit measured data by minimizing the residuals.

       .. code-block:: CSharp 

          (ColVec x, int exitflag, double resnorm, ColVec sigma_x, ColVec y_hat, ColVec sigma_y, List<IterationState> history) Lsqcurvefit(Func<ColVec, ColVec, ColVec> Model, ColVec x0, ColVec IndVar, ColVec Measured, Func<ColVec, ColVec> funInEq = null, Func<ColVec, ColVec> funEq = null,  ColVec lb = null, ColVec ub = null, Optimizers.Set options = null);
          (ColVec  Lsqnonlin(Func<ColVec, ColVec> Model, ColVec x0, Func<ColVec, ColVec> funInEq = null, Func<ColVec, ColVec> funEq = null, ColVec lb = null, ColVec ub = null, Optimizers.Set options = null)
   Param: 
      | Model:  The nonlinear model function to be fitted. Takes an independent variable and parameter vector
              as inputs and returns computed values.
      | x0:  Initial guess for model parameters.
      | IndVar:  The independent variable values.
      | Measured:  The observed dependent variable values.
      | funInEq:  Optional. Function defining inequality constraints on parameters.
      | funEq:  Optional. Function defining equality constraints on parameters.
      | lb:  Optional. Lower bound constraints for parameters.
      | ub:  Optional. Upper bound constraints for parameters.
      | options:  Optional solver settings such as tolerance and maximum iterations.
   Returns: 
       Returns a tuple containing the optimized parameter values, exit flag, residual norm, parameter uncertainties,
       estimated model output, output uncertainties, and iteration history.
   Example: 
       Fitting a given data points to time dependant model given below:
       

       .. math::
      
          y(x, t) = x_3\exp(x_1t) + x_4\exp(-x_2t) 
       

       .. code-block:: CSharp 

          using System;
          using SepalSolver;
           
           ColVec xdata, ydata, times, y_est, filltime, sgy, filly, lower, upper;
           ColVec noise = Rand(100); double[] x0;
           xdata = Linspace(0, 1);
           
           // Create the model
           static ColVec fun(ColVec x, ColVec xdata) => x[2] * Exp(x[0] * xdata) + x[3] * Exp(x[1] * xdata); 
           
           // Define observed measurement data
           ydata = fun(x0 = [-4, -5, 4, -4], xdata) + 0.02 * noise;
           
           // Initial parameter guess
           x0 = [-1, -2, 1, -1];
           var opts = OptimSet(Display: true, MaxIter: 200, StepTol: 1e-6, OptimalityTol: 1e-6);
           
           // Fit the model
           var ans = Lsqcurvefit(fun, x0, xdata, ydata, options: opts);
           AnimateHistory(fun, xdata, ydata, ans.history);

      Output: 


       .. code-block:: Terminal 

          Optimized Parameters:  -3.3736    -5.6652    1.7698    -1.7599


Ga
==
   Description: 
       Performs optimization using the Genetic Algorithm (GA), a technique inspired by natural selection.
       GA evolves a population of solutions iteratively to find near-optimal solutions for nonlinear problems.

       .. code-block:: CSharp 

          ColVec Ga(Func<ColVec, double> fun, ColVec lb, ColVec ub, int[] IntVar = null, 
                    Func<ColVec, ColVec> funInEq = null, Func<ColVec, ColVec> funEq = null, 
                    Optimizers.Set options = null);
          ColVec Ga(Func<ColVec, ColVec> fun, ColVec Measured, ColVec lb, ColVec ub, Func<ColVec,
                    ColVec> funInEq = null, Func<ColVec, ColVec> funEq = null, Optimizers.Set options = null)
   Param: 
      | fun:  The objective function to optimize. Takes a ColVec parameter and returns a double representing its fitness value.
      | lb:  Lower bound constraints for the optimization parameters.
      | ub:  Upper bound constraints for the optimization parameters.
      | IntVar:  Optional. Specifies indices of variables that should be treated as integers.
      | Measured:  The observed dependent variable values.
      | funInEq:  Optional. Function defining inequality constraints on parameters.
      | funEq:  Optional. Function defining equality constraints on parameters.
      | options:  Optional settings such as mutation rate, population size, and maximum iterations.
   Returns: 
       Returns a scalar value or an array containing the optimized parameter values.
   Example: 
       Optimizing a quadratic function.
       

       .. math::
      
          \begin{array}{rl}
                      f(x) = -x_1^2 - x_2^2 + 10
          \end{array}
      

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
      
          // Define the objective function
          Func<ColVec, double> objectiveFunc = (x) => 
               -Pow(x[0], 2) - Pow(x[1], 2) + 10; // Maximization problem
      
          // Define bounds
          ColVec lb = new double[] { -5, -5 };
          ColVec ub = new double[] { 5, 5 };
      
          // Optimize using Genetic Algorithm
          ColVec optimalSolution = Ga(objectiveFunc, lb, ub);
               
          // Output results
          Console.WriteLine($"Optimized Solution: {optimalSolution.T}");
      

      Output: 


       .. code-block:: Terminal 

          Optimized Solution: 2.1    -1.3
   Example: 
       Time-Dependant Parameter Estimation for a Nonlinear System.
       

       .. math::  
      
          \begin{array}{rl}
                    & y(x, t) = x_3 * \exp(-x_1 t) + x_4 * \exp(-x_2 t) \\
                \text{Given dataset:} & \\
                    & t\_data = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1 ] \\
                    & y\_data = [ 1.75, 1.5, 1.3, 1.1, 1, 0.83, 0.72, 0.65, 0.55, 0.5] \\
          \end{array}
      

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
      
          // Define the nonlinear model
          ColVec t = new double[] { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1};
          ColVec y = new double[]{ 1.75, 1.5, 1.3, 1.1, 1, 0.83, 0.72, 0.65, 0.55, 0.5 }
          
          double modelFunc(ColVec x)
          {   
              ColVec absdiff = y - (x[2] * Exp(-x[0] * t) + x[3] * Exp(-x[1] * t)); // Minimization Problem
              return absdiff.SumSq();
           }
      
          // Define bounds
          ColVec lb = new double[] { -2, 1, -1, 1 };
          ColVec ub = new double[] { -1, 3, 2, 4 };
      
          // Optimize parameters using GA
          ColVec optimalParams = Ga(modelFunc, y, lb, ub);
      
          // Output results
          Console.WriteLine($"Optimized Parameters: {optimalParams.T}");
      

      Output: 


       .. code-block:: Terminal 

          Optimized Parameters:
                -1.7982    3.000    -0.0289    2.6850


decic
=====
   Description: 
       Compute consistent initial conditions for ODE45I.
   Param: 
      | fun:  The function that represents the implicit ODE. The function should accept three doubles (time, state, and its derivative) and return a double representing the derivative of the state.
      | t0:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | y0:  The initial value of the dependent variable (state).
      | ytruth:  An array of intergers indicating which component of y0 is fixed and which is not.
      | yp0:  The initial time derivative of the dependent variable (state).
      | yptruth:  An array of intergers indicating which component yp0 is fixed and which is not.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * double y0: modified initial state.
          * double yp0: modified initial rate of change.
   Remark: 
      |  decic changes as few components of the guess as possible. You can specify that certain components are to be held fixed by setting ytruth(i) = 1 if no change is permitted 
      |  in the guess for Y0(i) and 0 otherwise.An empty array for yptruth is interpreted as allowing changes in all entries.yptruth is handled similarly. 
      |  You cannot fix more than length(Y0) components.Depending on the problem, it may not be possible to fix this many.It also may not be possible to fix certain components of Y0 or YP0.
      |  It is recommended that you fix no more components than necessary.
   Example: 
        Determine the consistent initial condition for the implicit ODE :math:`~ty^2y'^3 - y^3y'^2 + t(t^2 + 1)y' - t^2y = 0~` with initial condition :math:`~y(0) = \sqrt{1.5}~`.
          

       .. code-block:: CSharp 

         // import libraries
         using System;
         using SepalSolver.Math;
      
         //define ODE
         static double fun(double t, double y, double yp) =>
            t * y * y * yp * yp * yp - y * y * y * yp * yp + t * (t * t + 1) * yp - t * t * y;
            var opts = Odeset(Stats: true);
            double t0 = 1, y0 = Sqrt(t0 * t0 + 1 / 2.0), yp0 = 0;
            (y0, yp0) = decic(fun, t0, y0, 1, yp0, 0);
             
         // print result to console
         Console.WriteLine($"y0 = {y0}");
         Console.WriteLine($"yp0 = {yp0}");

      Output: 


       .. code-block:: Terminal 

         y0 = 1.2247
         yp0 = 0.8165
|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode23
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Bogacki-Shampine method (Ode23).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Bogacki-Shampine method (Ode23) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 2]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode23(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE23");
          SaveAs("Van-der-Pol-(μ=1)-Ode23.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode23.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode23.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Dormand-Prince method (Ode45).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Dormand-Prince method (Ode45) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 2]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode45(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE45");
          SaveAs("Van-der-Pol-(μ=1)-Ode45.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode45.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode45.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode56
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 5th and 6th order pair method (Ode56).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 5th and 6th order pair method (Ode56) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode56(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE56");
          SaveAs("Van-der-Pol-(μ=1)-Ode56.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode56.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode56.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode78
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 7th and 8th order pair method (Ode78).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 7th and 8th order pair method (Ode78) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode78(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE78");
          SaveAs("Van-der-Pol-(μ=1)-Ode78.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode78.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode78.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode89
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 8th and 9th order pair method (Ode89).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 8th and 9th order pair method (Ode89) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode89(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE89");
          SaveAs("Van-der-Pol-(μ=1)-Ode89.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode89.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode89.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45s
======
   Description: 
       Solves stiff ordinary differential equations (ODE) using Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45s).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45s) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = 10^{5}((1 - y^2)y' - y)~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 6.3]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& 10^{5}((1 - y^2)v - y)
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp2(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], 1e5*((1 - y[0] * y[0]) * y[1] - y[0])];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode45s(vdp2, [2, 0], [0, 6.3]);
          // Plot the result
          Plot(T, Y);
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1e5) with ODE45s");
          SaveAs("Van-der-Pol-(μ=1e5)-Ode45s");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1e5)-Ode45s.png
       :align: center
       :alt: Van-der-Pol-(μ=1e5)-Ode45s.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45i
======
   Description: 
       Solves inmplicit ordinary differential equations (ODE) using Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i).
   Param: 
      | fun:  The function that represents the implicit ODE. The function should accept three doubles (time, state, and its derivative) and return a double representing the derivative of the state.
      | initcon:  A tuple containing two elements:
                   * double y0:  initial state.
                   * double yp0: initial rate of change.
      | tspan:  The initial value of the dependent variable (state).
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~ty^2y'^3 - y^3y'^2 + t(t^2 + 1)y' - t^2y = 0~` with initial condition :math:`~y(0) = \sqrt{1.5}~`.
          

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static double fun(double t, double y, double yp) =>
             t* y * y* yp * yp* yp - y* y * y* yp * yp + t* (t* t + 1) * yp - t* t * y;
             
          var opts = Odeset(Stats: true);
          double t0 = 1, y0 = Sqrt(t0 * t0 + 1 / 2.0), yp0 = 0;
          (y0, yp0) = decic(fun, t0, y0, 1, yp0, 0);
          (ColVec T, Matrix Y) = Ode45i(fun, (y0, yp0), [t0, 10], opts);
          ColVec Y_exact = T.Select(t => Sqrt(t * t + 0.5)).ToList();
          Console.WriteLine(Hcart(Y, Y_exact));
          Plot(T, Y, "*"); hold = true;
          Plot(T, Y_exact, "-o"); hold = false;
          Title("Implicit differential (weissinger) equation with ODE45i");
          Xlabel("Time t");
          Ylabel("Solution y");
          SaveAs("Weissinger-Ode45i.png");

      Output: 


       .. code-block:: Terminal 

       Summary of statistics by Ode45i
               13 successful steps
               0 failed attempts
               335 function evaluations
               52 partial derivatives
               52 LU decompositions
               174 solutions of linear systems
      
          1.2247    1.2247
          1.2993    1.2993
          1.4536    1.4536
          1.7767    1.7768
          2.3227    2.3229
          3.1865    3.1869
          4.0689    4.0694
          4.9575    4.9582
          5.8496    5.8504
          6.7437    6.7447
          7.6392    7.6403
          8.5357    8.5368
          9.4327    9.4340
         10.0236   10.0250

      Output: 

    .. figure:: images/Weissinger-Ode45i.png
       :align: center
       :alt: Weissinger-Ode45i.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Polyfit
=======
   Description: 
       Fits a polynomial of degree N to the data points specified by the arrays X and Y.
       Mathematically, this can be represented as finding the coefficients of the polynomial:

       .. math::
          P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_N x^N
       that best fits the given data points (X, Y).
   Param: 
      | X:  The x-coordinates of the data points.
      | Y:  The y-coordinates of the data points.
      | N:  The degree of the polynomial to fit.
   Returns: 
       An array containing the coefficients of the fitted polynomial, starting with the coefficient of the highest degree term.
   Example: 

          .. math::
             X = [1, 2, 3, 4],~ Y = [1, 4, 9, 16],~ N = 2
       In this example, we fit a polynomial of degree 2 to the data points.
       The x-coordinates are represented by the array { 1, 2, 3, 4 } and the y-coordinates by { 1, 4, 9, 16 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of fitting a polynomial
          double[] X = { 1, 2, 3, 4 };
          double[] Y = { 1, 4, 9, 16 };
          int N = 2;
          double[] coefficients = Polyfit(X, Y, N);
          // Print the result
          Console.WriteLine($"Coefficients: {string.Join(", ", coefficients)}");

      Output: 


       .. code-block:: Terminal 

          Coefficients: 1, 0, 0


Roots
=====
   Description: 
       Calculates the roots of a polynomial given its coefficients.
       Mathematically, this can be represented as:

       .. math::
          P(x) = 0
       where P(x) is the polynomial.

       .. code-block:: CSharp 

          Complex[] Roots(double[] Coeffs)
          Complex[] Roots(Complex[] Coeffs)
   Param: 
      | Coeffs:  The coefficients of the polynomial, ordered from the highest degree to the constant term.
   Returns: 
       An array of Complex numbers representing the roots of the polynomial.
   Example: 

          .. math::
             P(x) = 2x^5 + 3x^4 + 5x^3 + 2x^2 + 7x + 4
       In this example, we find the roots of the polynomial represented by the coefficients { 2, 3, 4, 2, 7, 4 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
      
          // Example of finding roots of a polynomial
          double[] Coeffs = [2, 3, 4, 2, 7, 4];
          Complex[] roots = Roots(Coeffs);
          // Print the result
          Console.WriteLine($"Roots:\n {string.Join("\n ", roots)}");

      Output: 


       .. code-block:: Terminal 

          Roots:
            -0.5854 + 0.0000i
             0.5737 - 1.0415i
             0.5737 + 1.0415i
            -1.0310 - 1.1635i
            -1.0310 + 1.1635i

   ..note::

       The coefficients can be real or complex.



   Example: 

       .. math::
          \begin{array}{rcl}
          P(x) &=& (5 + 2i)x^4 + (3 + 7i)x^3 + (5 + 8i)x^2 + (3 + 7i)x + (7 + 4i)
          \end{array}
          
       In this example, we find the roots of the polynomial with complex coefficients.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
      
          // Example of finding roots of a polynomial with complex coefficients
          Complex[] Coeffs = [new(5, 2), new(3, 7), new(5, 8), new(3, 7), new(7, 4)];
          Complex[] roots = Roots(Coeffs);
      
          // Print the result
          Console.WriteLine($"Roots:\n {string.Join("\n ", roots)}");

      Output: 


       .. code-block:: Terminal 

          Roots:
             0.2097 + 0.7705i
            -0.7572 + 0.6704i
            -0.7626 - 0.9963i
             0.3102 - 1.4446i


Deconv
======
   Description: 
       Performs polynomial deconvolution (division) of two polynomials and returns the quotient and remainder.
       Mathematically, this can be represented as:

       .. math::
          P(x) = D(x) \times Q(x) + R(x)
       where P(x) is the dividend polynomial, D(x) is the divisor polynomial, Q(x) is the quotient polynomial, and R(x) is the remainder polynomial.

       .. code-block:: CSharp 

          (double[] Quotient, double[] Remainder) Deconv(double[] Polynomial, double[] Divisor)
          (Complex[] Quotient, Complex[] Remainder) Deconv(Complex[] Polynomial, Complex[] Divisor)
   Param: 
      | Polynomial:  The coefficients of the dividend polynomial (numerator).
      | Divisor:  The coefficients of the divisor polynomial (denominator).
   Returns: 
       A tuple containing two arrays:
          - Quotient: The coefficients of the quotient polynomial.
          - Remainder: The coefficients of the remainder polynomial.
   Example: 

          .. math::
             P(x) = x^5 + 2x^4 + 3x^3 + 4x^2 + 5x + 6,~ D(x) = x^2 + 2x + 3
       In this example, we perform polynomial deconvolution on two polynomials.
       The dividend polynomial is represented by the coefficients { 1, 2, 3, 4, 5, 6 } and the divisor polynomial by { 1, 2, 3 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial deconvolution
          double[] Polynomial = [1, 2, 3, 4, 5, 6];
          double[] Divisor = [1, 2, 3];
          var result = Deconv(Polynomial, Divisor);
          // Print the result
          Console.WriteLine($"Quotient: {string.Join(", ", result.Quotient)}");
          Console.WriteLine($"Remainder: {string.Join(", ", result.Remainder)}");

      Output: 


       .. code-block:: Terminal 

          Quotient: 1, 0, 0, 4
          Remainder: 0, 0, 0, 0, -3, -6

   ..note::

       Both polynomial and the divisor can be real or complex as demonstrated below



   Example: 

       .. math::
          \begin{array}{rcl}
          P(x) &=& (7+3i)x^3 + (9+10i)x^2 + (10+4i)x + (2+7i) \\
          D(x) &=& (3+2i)x^2 + (4+2i)x + (3+i)
          \end{array}
          
       In this example, we perform polynomial deconvolution on two polynomials with complex coefficients.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial deconvolution
          Complex[] P = [new(7,3), new(9,10), new(10,4), new(2,7)], 
          Complex[] D = [new(3,2), new(4,2), new(3,1)];
          (Complex[]Q, Complex[]R) = Deconv(P, D);
      
          // Print the result
          Console.WriteLine("Q = \n" + string.Join(", ", Q)); 
          Console.WriteLine("R = \n" + string.Join(", ", R));

      Output: 


       .. code-block:: Terminal 

          Q = 
              2.0769 - 0.3846i ,  1.1183 + 1.7160i
          R =
              0.0000 + 0.0000i ,  0.0000 + 0.0000i ,  2.3432 - 6.0237i ,  0.3609 + 0.7337i


Conv
====
   Description: 
       Performs polynomial convolution (multiplication) of two polynomials and returns the resulting polynomial.
       Mathematically, this can be represented as:

       .. math::
          C(x) = P(x) \times M(x)
       where P(x) is the first polynomial, M(x) is the second polynomial, and C(x) is the resulting polynomial.

       .. code-block:: CSharp 

          double[] Conv(double[] Polynomial, double[] Multiplier)
          Complex[] Conv(Complex[] Polynomial, Complex[] Multiplier)
   Param: 
      | Polynomial:  The coefficients of the first polynomial.
      | Multiplier:  The coefficients of the second polynomial.
   Returns: 
       An array containing the coefficients of the resulting polynomial.
   Example: 

          .. math::
             P(x) = x^2 + 2x + 3,~ M(x) = x + 1
       In this example, we perform polynomial convolution on two polynomials.
       The first polynomial is represented by the coefficients :math:`[1, 2, 3]` and the second polynomial by :math:`[1, 1]`.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial convolution
          double[] Polynomial = [ 1, 2, 3 ];
          double[] Multiplier = [ 1, 1 ];
          double[] Product = Conv(Polynomial, Multiplier);
          // Print the result
          Console.WriteLine($"Product: {string.Join(", ", Product)}");

      Output: 


       .. code-block:: Terminal 

          Product: 1, 3, 5, 3
   Example: 

          .. math::
             P(x) = (2+3i)x^2 + (5-i)x + 3+7i,~ M(x) = (-3+2i)x + 2-i
       In this example, we perform polynomial convolution on two polynomials.
       The first polynomial is represented by the coefficients :math:`[2+3i, 5-i, 3+7i]` and the second polynomial by :math:`[-3+2i, 2-i]`.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial convolution
          Complex[] Polynomial = [ new(2,3), new(5,-1), new(3,7) ];
          Complex[] Multiplier = [ new(-3,2), new(2,-1) ];
          var Product = Conv(Polynomial, Multiplier);
          // Print the result
          Console.WriteLine($"Product: {string.Join(", ", Product)}");

      Output: 


       .. code-block:: Terminal 

          Product: -12 - 5i ,  -6 + 17i, -14 - 22i,  13 + 11i


Integral
========
   Description: 
       Computes the definite integral of a function using adaptive Gauss-LegendreP quadrature.
   Param: 
      | fun:  The function to integrate. The function should accept a double and return a double.
      | x_1:  The lower bound of the integration interval.
      | x_2:  The upper bound of the integration interval.
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the definite integral.
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration interval.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x) = x^2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} x^2 \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double> f = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral(f, x_1, x_2);
          // Print the result
          Console.WriteLine($"The integral of x^2 is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral of x^2 is approximately: 0.333333333321056
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


Integral
========
   Description: 
       Computes the definite integral of a function using adaptive Gauss-LegendreP quadrature.
   Param: 
      | fun:  The function to integrate. The function should accept a double and return a double.
      | x_1:  The lower bound of the integration interval.
      | x_2:  The upper bound of the integration interval.
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the definite integral.
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration interval.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x) = x^2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} x^2 \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double> f = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral(f, x_1, x_2);
          // Print the result
          Console.WriteLine($"The integral of x^2 is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral of x^2 is approximately: 0.333333333321056
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


Integral2
=========
   Description: 
       Computes the definite double integral of a function over a region where both y-bounds are defined by functions of x, using adaptive Gauss-LegendreP quadrature.
       Mathematically, this can be represented as:

       .. math::
          I = \int_{x_1}^{x_2}\int_{y_1}^{y_2} f(x,y) dydx

       .. code-block:: CSharp 

          double Integral2( Func<double, double, double> fun, double x_1, double x_2, double y_1, double y_2)
          double Integral2( Func<double, double, double> fun, double x_1, double x_2, double y_1, Func<double, double> y_2)
          double Integral2( Func<double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, double y_2)
          double Integral2( Func<double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, Func<double, double> y_2)
   Param: 
      | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
      | x_1:  The lower bound of the x integration.
      | x_2:  The upper bound of the x integration.
      | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
      | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite double integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the double integral.
      |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2(x).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{\sqrt{x}} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral is approximately: 0.0833333333277262

   ..note::

       If the any of the boundary of y is a constant, it can be defined as a lambda function that returns the constant value as shown below:



   Example: 
        Integrate the function f(x, y) = x * y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{1}^{2} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the lower bound of y
          Func<double, double> y_1 = x => 1;
          // Set the upper bound of y
          Func<double, double> y_2 = x => 2;
          // Calculate the integral
          double integral = Integral2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral of x*y is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral of x*y is approximately: 0.749999999948747
   Example: 
        Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from x^2 to 2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the upper bound of y
          double y_2 = 2;
          // Calculate the integral
          double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral is approximately: 0.916666666604556
   Example: 
        Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from 1 to x^2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the lower bound of y
          double y_1 = 1;
          // Calculate the integral
          double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral is approximately: -0.166666666655809
   Example: 
        Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using static System.Math
          using System;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral is approximately: 0.0833333333277262
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentException is Thrown when y_1(x) is greater than y_2(x) for any x in the interval [x_1, x_2].


Integral3
=========
   Description: 
       Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-LegendreP quadrature.
       Mathematically, this can be represented as:

       .. math::
          I = \int_{x_1}^{x_2}\int_{y_1}^{y_2}\int_{z_1}^{z_2} f(x,y, z) dzdydx

       .. code-block:: CSharp 

          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, double y_2, double z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, Func<double, double> y_2, double z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, double y_2, double z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, Func<double, double> y_2, double z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, double y_2, Func<double, double, double> z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, Func<double, double> y_2, Func<double, double, double> z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, double y_2, Func<double, double, double> z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, Func<double, double> y_2, Func<double, double, double> z_1, double z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, double y_2, double z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, Func<double, double> y_2, double z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, double y_2, double z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, Func<double, double> y_2, double z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, double y_2, Func<double, double, double> z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, double y_1, Func<double, double> y_2, Func<double, double, double> z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, double y_2, Func<double, double, double> z_1, Func<double, double, double> z_2)
          double Integral3( Func<double, double, double, double> fun, double x_1, double x_2, Func<double, double> y_1, Func<double, double> y_2, Func<double, double, double> z_1, Func<double, double, double> z_2)
   Param: 
      | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
      | x_1:  The lower bound of the x integration.
      | x_2:  The upper bound of the x integration.
      | y_1:  A double or function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
      | y_2:  A double or  function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
      | z_1:  A double or  function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
      | z_2:  A double or function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite triple integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the triple integral.
      |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, y_1(x), y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions. 
      |  Ensure that y_1(x) <= y_2(x) and z_1(x, y) <= z_2(x, y) throughout the integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from 2 to 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the lower bound of y
          double y_1 = 1;
          // Set the upper bound of y
          double y_2 = 2;
          // Set the lower bound of z
          double z1 = 2;
          // Set the upper bound of z
          double z2 = 3;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z1, z2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 1.8749999998078
       <example>
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using static System.Math
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Set the lower bound of z
          double z_1 = 2;
          // Set the upper bound of z
          double z_2 = 3;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 0.208333333312197
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from 2 to 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the lower bound of y
          double y_1 = 1;
          // Set the lower bound of z
          double z_1 = 2;
          // Set the upper bound of z
          double z_2 = 3;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: -0.416666666625285
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from 2 to 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the upper bound of y
          double y_2 = 2;
          // Set the lower bound of z
          double z_1 = 2;
          // Set the upper bound of z
          double z_2 = 3;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 2.29166666643309
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{\sqrt{x}}  \int_{xy}^{x+y} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 0.0641203694008985

   ..note::

       If any of boundaries of y or z is a constant, it can be defined as a lambda function that returns the constant value as shown below:



   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{2}  \int_{xy}^{x+y} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the upper bound of y
          Func<double, double> y_2 = (x) => 2;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately:  1.56851851820977
   Example: 
        Integrate the function f(x, y, z) = x * x * y * y * z over the region where x ranges from -1 to 1, y ranges from -1 to 1, and z ranges from x*y to 2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x, y)}^{z_2} (x^2 y^2 z) \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * x * y * y * z;
          // Set the lower bound of y
          double y_1 = -1;
          // Set the upper bound of y
          double y_2 = 1;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Set the upper bound of z
          double z_2 = 2;
          // Set the lower bound of x
          double x_1 = -1;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x^2*y^2*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x^2*y^2*z is approximately: 0.808888888786791
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the upper bound of y
          double y_2 = 2;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Set the upper bound of z
          double z_2 = 3;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 3.63541666602461
   Example: 
        Integrate the function f(x, y, z) = x + y + z over the region where x ranges from 0 to 1, y ranges from 1 to x + 2, and z ranges from x*y to 4, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x, y)}^{z_2} (x + y + z) \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x + y + z;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => x + 2;
          // Set the lower bound of y
          double y_1 = 1;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Set the upper bound of z
          double z_2 = 4;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x+y+z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x+y+z is approximately: 20.7166666645573
   Example: 
        Integrate the function f(x, y, z) = x * x + y * y + z * z over the region where x ranges from 0 to 1, y ranges from 0 to sqrt(x), and z ranges from x+y to 5, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x, y)}^{z_2} (x^2 + y^2 + z^2) \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using static System.Math
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * x + y * y + z * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => 0;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x + y;
          // Set the upper bound of z
          double z_2 = 5;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x^2+y^2+z^2 is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x^2+y^2+z^2 is approximately: 29.0252572989997
   Example: 
        Integrate the function f(x, y, z) = 1 / (1 + x + y + z) over the region where x ranges from 0 to 1, y ranges from 0 to 2, and z ranges from 1 to x*x + y*y + 3, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2(x, y)} \frac{1}{1 + x + y + z} \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => 1.0 / (1.0 + x + y + z);
          // Set the lower bound of y
          double y_1 = 0;
          // Set the upper bound of y
          double y_2 = 2;
          // Set the lower bound of z
          double z_1 = 1;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x * x + y * y + 3;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of 1/(1+x+y+z) is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of 1/(1+x+y+z) is approximately: 1.40208584910316
   Example: 
        Integrate the function f(x, y, z) = x * y + z over the region where x ranges from 0 to 2, y ranges from sin(x) to 3, and z ranges from -1 to x*x + y + 2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2(x, y)} (x y + z) \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y + z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => Sin(x);
          // Set the upper bound of y
          double y_2 = 3;
          // Set the lower bound of z
          double z_1 = -1;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x * x + y + 2;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 2;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of xy+z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of xy+z is approximately: 119.271742284841
   Example: 
        Integrate the function f(x, y, z) = x - y + 2*z over the region where x ranges from 1 to 3, y ranges from -2 to x*x, and z ranges from 0 to x + y + 1, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2(x, y)} (x - y + 2z) \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x - y + 2 * z;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => x * x;
          // Set the lower bound of y
          double y_1 = -2;
          // Set the lower bound of z
          double z_1 = 0;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y + 1;
          // Set the lower bound of x
          double x_1 = 1;
          // Set the upper bound of x
          double x_2 = 3;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x-y+2z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x-y+2z is approximately: 353.666666629263
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to x+y, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2(x,y)} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using stati System.Math;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Set the lower bound of z
          double z_1 = 2;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately:   -0.0921296305735099
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Set the lower bound of y
          double y_1 = 1;
          // Set the upper bound of y
          double y_2 = 2;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately:  1.43402777762941
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the upper bound of y
          double y_2 = 2;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately:  1.56851851820977
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => x * x;
          // Set the lower bound of y
          double y_1 = 1;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: -0.134490740716508
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using SepalSolver;
          using static System.Math;
          using System;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 0.0641203694008985
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


Integral4
=========
   Description: 
       Computes the definite quadruple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-LegendreP quadrature.
   Param: 
      | fun:  The function to integrate. The function should accept four doubles (w, x, y, z) and return a double.
      | w_1:  The lower bound of the w integration.
      | w_2:  The upper bound of the w integration.
      | x_1:  A function that defines the lower bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
      | x_2:  A function that defines the upper bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
      | y_1:  A function that defines the lower bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
      | y_2:  A function that defines the upper bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
      | z_1:  A function that defines the lower bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
      | z_2:  A function that defines the upper bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite triple integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the quadruple integral.
      |  The integration is performed over the region defined by w_1 <= w <= w_2, x_1(w) <= x <= x_2(w), y_1(w, x) <= y <= y_2(w, x), and z_1(w, x, y) <= z <= z_2(w, x, y).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, x_1(w), x_2(w),  y_1(w, x), y_2(w, x), z_1(w, x, y), and z_2(w, x, y) should be smooth functions. 
      |  Ensure that x_1(w) <= x_2(w),  y_1(w, x) <= y_2(w, x) and z_1(w, x, y) <= z_2(w, x, y) throughout the integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        To compute the volume of a sphere in 4D: :math:`f(w, x, y, z) = 1` over the region where w ranges from -1 to 1, x ranges from :math:`-\sqrt{1-w^2}` to :math:`\sqrt{1-w^2}`, y ranges from :math:`-\sqrt{1-w^2-x^2}` to :math:`\sqrt{1-w^2-x^2}`, and z ranges from :math:`-\sqrt{1-w^2-x^2-y^2}` to :math:`\sqrt{1-w^2-x^2-y^2}`, which can be expressed as:

       .. math::
          \int_{-1}^{1}\int_{-\sqrt{1-w^{2}}}^{\sqrt{1-w^{2}}} \int_{-\sqrt{1-w^{2}-x^{2}}}^{\sqrt{1-w^{2}-x^{2}}} \int_{-\sqrt{1-w^{2}-x^{2}-y^{2}}}^{\sqrt{1-w^{2}-x^{2}-y^{2}}} \, dz \, dy \, dx \, dw

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double, double> f = (w, x, y, z) => 1;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double, double> z_1 = (w, x, y) => -Sqrt(1 - w*w - x*x - y*y);
          // Define the upper bound of z as a function of x and y
          Func<double, double, double, double> z_2 = (w, x, y) => Sqrt(1 - w*w - x*x - y*y);
          // Define the lower bound of y as a function of x
          Func<double, double, double> y_1 = (w, x) => -Sqrt(1 - w*w - x*x);
          // Define the upper bound of y as a function of x
          Func<double, double, double> y_2 = (w, x) => Sqrt(1 - w*w - x*x);
          // Define the lower bound of x as a function of w
          Func<double, double> x_1 = (w) => -Sqrt(1 - w*w);
          // Define the upper bound of x as a function of w
          Func<double, double> x_2 = (w) => Sqrt(1 - w*w);
          // Set the lower bound of w
          double w_1 = -1;
          // Set the upper bound of w
          double w_2 = 1;
          // Calculate the integral
          double integral = Integral4(f, w_1, w_2, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The approximate volume of a 4D sphere: {integral}");
          Console.WriteLine($"The exact volume of a 4D sphere: {pi*pi/2}");

      Output: 


       .. code-block:: Terminal 

          The approximate volume of a 4D sphere: 4.93483151454187
          The exact volume of a 4D sphere: 4.93480220054468
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  x_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  x_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.
