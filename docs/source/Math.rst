

Reshape
=======
   Description: 
       Reshapes a one-dimensional array of input into a matrix with specified dimensions.
       This method returns a output with the given dimensions, populated with the data from the input array.

       .. code-block:: CSharp 

          Matrix Reshape(double[] data, int[] Size)
          Matrix Reshape(List<double> data, int[] Size)
          Matrix Reshape(Matrix data, int[] Size)
   Parameters: 
       data: 
            The one-dimensional or multi-dimensional array to be reshaped.
       Size: 
            An array containing the dimensions [rows, columns] for the new matrix.
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
   Parameters: 
       x: 
         The length of one side of the triangle.
       y: 
         The length of the other side of the triangle.
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
   Parameters: 
       x: 
         The input value for which the absolute value is to be calculated.
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
   Parameters: 
       i: 
         The order of the Bessel function.
       x: 
         The value at which to evaluate the Bessel function.
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
          
          // Compute besselj function
          ColVec x = Linspace(0, 10);
          Matrix y = Enumerable.Range(0, 10).Select(i=>BesselJ(i, x)).ToList();
          
         // Plot result
         Plot(x, y); Xlabel("x-axis"); Ylabel("y-axis"); Title("Bessel function J");
         

      Output: 

       .. figure:: images/BesselfunctionPlot.png
          :align: center
          :alt: BesselfunctionPlot.png




Fzero
=====
   Description: 
       Computes the root of a nonlinear equation.
       This method finds the root (zero) of the specified nonlinear function, starting from an initial guess. An optional parameter allows customization of solver settings.

       .. code-block:: CSharp 

          double Fzero(Func<double, double> fun, double x0)
          double Fzero(Func<double, double> fun, double[] x0)
          double Fzero(Func<double, double> fun, double x0, Solvers.Set options)
   Parameters: 
       fun: 
           The nonlinear function whose root is to be computed. The function must take a double and return a double.
       x0: 
          The initial guess for the root or the interval bounding the root.
       options: 
               Optional. Solver settings that specify parameters like tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
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
   Parameters: 
       fun: 
           The nonlinear function whose root is to be computed. The function can take a double or complex scalar or array values as input and return a scaler or complex or array values.
       x0: 
          The initial guess for the root of the function.
       options: 
               Optional. Solver settings that specify parameters such as tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
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
   Parameters: 
       c: 
         The row vector representing the coefficients of the linear objective function to be minimized.
       AInEq: 
             Optional. The matrix representing inequality constraint coefficients.
             If null, no inequality constraints are applied.
       bInEq: 
             Optional. The column vector representing the right-hand side values of the inequality constraints.
             If null, no inequality constraints are applied.
       AEq: 
           Optional. The matrix representing equality constraint coefficients.
           If null, no equality constraints are applied.
       bEq: 
           Optional. The column vector representing the right-hand side values of the equality constraints.
           If null, no equality constraints are applied.
       Lb: 
          Optional. The column vector representing the lower bounds for the variables.
          If null, the variables are unbounded below.
       Ub: 
          Optional. The column vector representing the upper bounds for the variables.
          If null, the variables are unbounded above.
       options: 
               Optional. Solver settings that allow customization of parameters such as 
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
   Parameters: 
       c: 
         The row vector representing the coefficients of the linear objective function to be minimized.
       IntVar: 
              The array of indices specifying which variables must be integers.
       AInEq: 
             Optional. The matrix representing inequality constraint coefficients.
             If null, no inequality constraints are applied.
       bInEq: 
             Optional. The column vector representing the right-hand side values of the inequality constraints.
             If null, no inequality constraints are applied.
       AEq: 
           Optional. The matrix representing equality constraint coefficients.
           If null, no equality constraints are applied.
       bEq: 
           Optional. The column vector representing the right-hand side values of the equality constraints.
           If null, no equality constraints are applied.
       Lb: 
          Optional. The column vector representing the lower bounds for the variables.
          If null, the variables are unbounded below.
       Ub: 
          Optional. The column vector representing the upper bounds for the variables.
          If null, the variables are unbounded above.
       options: 
               Optional. Solver settings that allow customization of parameters such as 
               tolerance, maximum iterations, or other configurations. Defaults to null if not provided.
   Returns: 
       A column vector representing the optimized integer solution to the Integer Linear Programming problem.
   Example: 
       Solve an Integer Linear Programming problem with the objective function:

       .. math::
       
          \begin{array}{rl}
                Maximize:& \\
                         & c = 60x_1 + 40x_2 + 70x_3 \\
                Subject to:& \\
                           & 4x_1 + 2x_2 + 3x_2 \leq 60 \\
                           & 3x_1 + 2x_2 + 2x_3 \leq 40 \\
                           & 2x_1 + x_2 + 4x_3 leq 36 \\ 
                           & x_1, x_2, x_3 >= 0 \text{and are integers} \\
          \end{array}

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          
          // Define the coefficients
          RowVec c = new double[] { 60, 40, 70 };
          Matrix AInEq = new double [,] { { 4, 2, 3 }, { 3, 2, 2 }, { 2, 1, 4 } };
          ColVec bInEq = new double [] { 60, 40, 36 };
          
          int[] IntVar = [0, 1, 2]; // x1, x2, x3 are an integers
          
          // Solve the problem
          ColVec solution = Intlinprog(c, IntVar, AInEq, bInEq, null, null, null, null);
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
   Parameters: 
       fun: 
           The nonlinear scalar objective function to be minimized. Must take a column vector of decision variables and return a double.
       x0: 
          The initial guess for the decision variables.
       funInEq: 
               Optional. A function defining nonlinear inequality constraints.
               Takes a column vector and returns a column vector of constraint values.
       funEq: 
             Optional. A function defining nonlinear equality constraints.
             Takes a column vector and returns a column vector of constraint values.
       lb: 
          Optional. The column vector representing the lower bounds for decision variables.
       ub: 
          Optional. The column vector representing the upper bounds for decision variables.
       options: 
               Optional. Solver settings such as tolerance and maximum iterations.
               Defaults to null if not provided.
   Returns: 
       A column vector representing the decision variables that minimize the objective function.
   Example: 
       Solve the Rosenbrock function optimization problem:

       .. math::
          Minimize: f(x, y) = (1 - x)^2 + 100 * (y - x^2)^2

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
   Parameters: 
       fun: 
           The scalar objective function to be minimized. It must take a column vector of decision variables and return a double.
       x0: 
          The initial guess for the decision variables.
       funInEq: 
               Optional. A function that defines nonlinear inequality constraints.
               Takes a column vector and returns a column vector of constraint values.
       funEq: 
             Optional. A function that defines nonlinear equality constraints.
             Takes a column vector and returns a column vector of constraint values.
       lb: 
          Optional. The column vector representing the lower bounds for decision variables.
       ub: 
          Optional. The column vector representing the upper bounds for decision variables.
       options: 
               Optional. Solver settings such as tolerance and maximum iterations.
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
   Parameters: 
       fun: 
           The nonlinear scalar objective function to be minimized. Must take a column vector of decision variables and return a scalar point value.
       x0: 
          The initial guess for the decision variables.
       funInEq: 
               Optional. A function defining nonlinear inequality constraints.
               Takes a column vector and returns a column vector of constraint values.
       funEq: 
             Optional. A function defining nonlinear equality constraints.
             Takes a column vector and returns a column vector of constraint values.
       lb: 
          Optional. The column vector representing the lower bounds for decision variables.
       ub: 
          Optional. The column vector representing the upper bounds for decision variables.
       options: 
               Optional. Solver settings such as tolerance and maximum iterations.
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
   Parameters: 
       Model: 
             The nonlinear model function to be fitted. Takes an independent variable and parameter vector
             as inputs and returns computed values.
       x0: 
          Initial guess for model parameters.
       IndVar: 
              The independent variable values.
       Measured: 
                The observed dependent variable values.
       funInEq: 
               Optional. Function defining inequality constraints on parameters.
       funEq: 
             Optional. Function defining equality constraints on parameters.
       lb: 
          Optional. Lower bound constraints for parameters.
       ub: 
          Optional. Upper bound constraints for parameters.
       options: 
               Optional solver settings such as tolerance and maximum iterations.
   Returns: 
       Returns a tuple containing the optimized parameter values, exit flag, residual norm, parameter uncertainties,
       estimated model output, output uncertainties, and iteration history.
   Example: 
       Fitting a given data points to time dependant model given below:
       

       .. math::
      
          y(x, t) = x_3 * \exp(x_1t) + x_4 *\exp(-x_2t) 
       

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
   Parameters: 
       fun: 
           The objective function to optimize. Takes a ColVec parameter and returns a double representing its fitness value.
       lb: 
          Lower bound constraints for the optimization parameters.
       ub: 
          Upper bound constraints for the optimization parameters.
       IntVar: 
              Optional. Specifies indices of variables that should be treated as integers.
       Measured: 
                The observed dependent variable values.
       funInEq: 
               Optional. Function defining inequality constraints on parameters.
       funEq: 
             Optional. Function defining equality constraints on parameters.
       options: 
               Optional settings such as mutation rate, population size, and maximum iterations.
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
   Parameters: 
       fun: 
           The function that represents the implicit ODE. The function should accept three doubles (time, state, and its derivative) and return a double representing the derivative of the state.
       t0: 
          An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       y0: 
          The initial value of the dependent variable (state).
       ytruth: 
              An array of intergers indicating which component of y0 is fixed and which is not.
       yp0: 
           The initial time derivative of the dependent variable (state).
       yptruth: 
               An array of intergers indicating which component yp0 is fixed and which is not.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       dydx: 
            The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
       initcon: 
               The initial value of the dependent variable (state).
       tspan: 
             An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
       options: 
               Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
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
   Parameters: 
       fun: 
           A function that represents the implicit ODE. 
                   | double fun(double t, double y, double yp);
                   | ColVec fun(double t, ColVec y, ColVec yp);
              * t: time.
              * y: state.
              * yp: derivative of the state.
              * Returns: the residual of the implicit ODE.
       initcon: 
               A tuple containing two elements:
                  * y0:  initial state.
                  * yp0: initial rate of change.
       tspan: 
             A two-element array [t0, tf] specifying the time interval for integration.
       options: 
               Optional parameters for the ODE solver, such as:
                   * RelTol: relative tolerance, 
                   * AbsTol: absolute tolerance, 
                   * MaxStep: maximum step size,
                   * Stats: Statistics toggle. 
                   Use Odeset(...) to configure
   Returns: 
       A tuple (T, Y) where:
          * T: Column vector of time points at which the solution was computed.
          * Y: Matrix of solution values; each row corresponds to the state at the respective time in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~ty^2y'^3 - y^3y'^2 + t(t^2 + 1)y' - t^2y = 0~` with initial condition :math:`~y(1) = \sqrt{1.5}~`.
          

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static double fun(double t, double y, double yp) =>
             t* y * y* yp * yp* yp - y* y * y* yp * yp + t* (t * t + 1) * yp - t* t * y;
             
          var opts = Odeset(Stats: true);
          double t0 = 1, y0 = Sqrt(t0 * t0 + 0.5), yp0 = 0;
          (y0, yp0) = decic(fun, t0, y0, 1, yp0, 0);
          (ColVec T, Matrix Y) = Ode45i(fun, (y0, yp0), [t0, 10], opts);
          
          // Compare with exact solution
          ColVec Y_exact = T.Select(t => Sqrt(t * t + 0.5)).ToList();
          Console.WriteLine(Hcart(Y, Y_exact));
          
          //Plotting
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


Ode45a
======
   Description: 
       Solves semi-explicit differential-algebraic equations (DAEs) of the form M(t, y) * y' = f(t, y)
       using an adaptive explicit Runge-Kutta method of 4th and 5th order (Ode45a).
   Parameters: 
       fun: 
           A function representing the right-hand side of the DAE. 
           Signature: ColVec fun(double t, ColVec y);
              * t: time.
              * y: state.
              * Returns: right-hand side of the DAE.
       Mass: 
            A function defining the mass matrix M(t, y). This matrix may be time- and state-dependent.
            Signature: Matrix Mass(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: the mass of the DAE.
       initcon: 
               An array of doubles representing the initial conditions for the state vector y.
               The length must match the dimension of the system.
       tspan: 
             A two-element array specifying the time interval for integration: [t0, tf].
       options: 
               Optional parameters for the ODE solver, such as:
                   * RelTol: relative tolerance, 
                   * AbsTol: absolute tolerance, 
                   * MaxStep: maximum step size, 
                   * Stats: Statistics toggle.
                   Use Odeset(...) to configure
   Returns: 
       A tuple (T, Y) where:
          * T: Column vector of time points at which the solution was computed.
          * Y: Matrix of solution values; each row corresponds to the state at the respective time in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
       Solve the Ascher Linear DAE:

       .. math::
       
          \begin{bmatrix} 
               1 & -t \\  0 & 0            
          \end{bmatrix} 
          \begin{bmatrix}
              y'(t)\\ z'(t)             
          \end{bmatrix} 
              =
          \begin{bmatrix}
              -1 & 1 + t \\
              \beta & -1-\beta t              
          \end{bmatrix}
          \begin{bmatrix}
              y(t) \\
              z(t)
          \end{bmatrix}
          +
          \begin{bmatrix}
              0\\
              \sin(t)
          \end{bmatrix}
      
       With initial condition :math:`y(0) = 1, z(0) = \beta`.

       .. code-block:: CSharp 

           using SepalSolver.Math;
      
           double beta = 50;
           ColVec AscherLinear(double t, ColVec y) => new double[]
           {
               -y[0] + (1 + t)*y[1],
               beta*y[0] - (1 + beta*t)*y[1] + Sin(t)
           };
      
           Matrix Mass(double t, ColVec y) => new double[,]{{1, -t}, {0, 0} };
      
           double[] y0 = [1, beta], tspan = [0, 2];
           var opts = Odeset(Stats: true, RelTol: 1e-5);
           (ColVec T, Matrix Y) = Ode45a(AscherLinear, Mass, y0, tspan, opts);
           Plot(T, Y);
           Title("AscherLinearDAE Ode45a");
           Xlabel("Time t");
           Ylabel("Solution y");
           SaveAs(Path + "AscherLinearDAE.png");
|   cref=System.ArgumentNullException is 
|   cref=System.ArgumentException is 


Polyfit
=======
   Description: 
       Fits a polynomial of degree N to the data points specified by the arrays X and Y.
       Mathematically, this can be represented as finding the coefficients of the polynomial:

       .. math::
          P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_N x^N
       that best fits the given data points (X, Y).
   Parameters: 
       X: 
         The x-coordinates of the data points.
       Y: 
         The y-coordinates of the data points.
       N: 
         The degree of the polynomial to fit.
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
   Parameters: 
       Coeffs: 
              The coefficients of the polynomial, ordered from the highest degree to the constant term.
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
   Parameters: 
       Polynomial: 
                  The coefficients of the dividend polynomial (numerator).
       Divisor: 
               The coefficients of the divisor polynomial (denominator).
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
   Parameters: 
       Polynomial: 
                  The coefficients of the first polynomial.
       Multiplier: 
                  The coefficients of the second polynomial.
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
   Parameters: 
       fun: 
           The function to integrate. The function should accept a double and return a double.
       x_1: 
           The lower bound of the integration interval.
       x_2: 
           The upper bound of the integration interval.
       eps: 
           The desired relative accuracy. The default value is 1e-6.
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
   Parameters: 
       fun: 
           The function to integrate. The function should accept a double and return a double.
       x_1: 
           The lower bound of the integration interval.
       x_2: 
           The upper bound of the integration interval.
       eps: 
           The desired relative accuracy. The default value is 1e-6.
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
   Parameters: 
       fun: 
           The function to integrate. The function should accept two doubles (x, y) and return a double.
       x_1: 
           The lower bound of the x integration.
       x_2: 
           The upper bound of the x integration.
       y_1: 
           A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
       y_2: 
           A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
       eps: 
           The desired relative accuracy. The default value is 1e-6.
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
   Parameters: 
       fun: 
           The function to integrate. The function should accept three doubles (x, y, z) and return a double.
       x_1: 
           The lower bound of the x integration.
       x_2: 
           The upper bound of the x integration.
       y_1: 
           A double or function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
       y_2: 
           A double or  function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
       z_1: 
           A double or  function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
       z_2: 
           A double or function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
       eps: 
           The desired relative accuracy. The default value is 1e-6.
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
   Parameters: 
       fun: 
           The function to integrate. The function should accept four doubles (w, x, y, z) and return a double.
       w_1: 
           The lower bound of the w integration.
       w_2: 
           The upper bound of the w integration.
       x_1: 
           A function that defines the lower bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
       x_2: 
           A function that defines the upper bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
       y_1: 
           A function that defines the lower bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
       y_2: 
           A function that defines the upper bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
       z_1: 
           A function that defines the lower bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
       z_2: 
           A function that defines the upper bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
       eps: 
           The desired relative accuracy. The default value is 1e-6.
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
