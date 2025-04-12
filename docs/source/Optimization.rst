Optimization
============

Optimization is a fundamental area of mathematics and computer science that deals with finding the best possible solution to a given problem. This often involves maximizing or minimizing an objective function subject to certain constraints.

Key Concepts:

- Objective Function: The function that we aim to optimize (maximize or minimize).
- Constraints: Limitations or restrictions that must be satisfied by the solution.
- Optimization Algorithms: Iterative methods used to find the optimal solution. Common approaches include:
- Gradient Descent: A first-order iterative optimization algorithm that iteratively moves in the direction of the steepest descent of the objective function.
- Newton's Method: A second-order iterative optimization algorithm that uses the gradient and Hessian matrix of the objective function to find the optimal solution more quickly.
- Sequential Quadratic Programming (SQP): A powerful algorithm for constrained nonlinear optimization that solves a sequence of quadratic programming subproblems to approximate the original problem.
- Genetic Algorithms: Inspired by natural selection, these algorithms use concepts like mutation and crossover to evolve a population of solutions towards the optimal one.
- Particle Swarm Optimization: A nature-inspired algorithm that simulates the social behavior of bird flocks or fish schools to find the optimal solution.
- Linear Programming: A method for solving optimization problems where the objective function and constraints are linear.


Applications:

- Engineering: Designing structures, optimizing control systems, and finding the most efficient use of resources.
- Machine Learning: Training machine learning models, selecting optimal hyperparameters, and feature selection.
- Finance: Portfolio optimization, risk management, and algorithmic trading.
- Operations Research: Supply chain management, scheduling, and resource allocation.

Root Finding as Optimization:
Finding the roots of an equation can be viewed as an optimization problem. We can define an objective function as the square of the equation, and the optimization problem becomes finding the values of the variables that minimize this objective function to zero.

Least Squares Curve Fitting:
Least squares curve fitting is a technique used to find the best-fitting curve for a set of data points. It is an optimization problem where the objective function is the sum of the squared differences between the observed data points and the values predicted by the curve. The goal is to find the parameters of the curve that minimize this sum of squared errors.




Root of an Equation
-------------------
The fzero function in SepalSolver is a powerful tool for finding the roots of nonlinear equations. It is particularly useful when you need to find a point where a given function equals zero. Here's a brief overview of how it works and some of its key features:

Basic Usage
The basic syntax for fzero is:

.. code-block:: C#

   x = Fzero(fun, x0)


* fun: A handle to the function for which you want to find the root.
* x0: An initial guess or an interval where the function changes sign.

Example
Let's say you want to find the root of the function :math:`f(x) = x^3 - 2x - 5`. You can define this lambda expression and use fzero to find the root:

.. code-block:: C#

   // import libraries
   using System;
   using SepalSolver;
   using static SepalSolver.Math;

   static double fun(double x) => Pow(x, 3) - 2 * x - 5;
   double x0 = 2;
   double root = Fzero(fun, x0);

Output

.. code-block:: C#

   2.0946;


Advanced Options
fzero also allows for more advanced usage with additional options:

.. code-block:: C#
   
   var options = SolverSet(Display: true);


.. code-block:: C#

   // import libraries
   using System;
   using SepalSolver;
   using static SepalSolver.Math;

   static double fun(double x) => Pow(x, 3) - 2 * x - 5;
   var opts = SolverSet(Display: true);
   double x0 = 2;
   double root = Fzero(fun, x0, opts);

Output

.. code-block:: C#

       Summary of solutions of nonlinear equations
   fun-count     a          f(a)           b          f(b)     Procedure
       1     2.000000    -1.000000     2.000000    -1.000000   initial interval
       3     1.943431    -1.546666     2.056569    -0.414934   search
       5     1.920000    -1.762112     2.080000    -0.161088   search
       7     1.886863    -2.056019     2.113137     0.209619   search
   
    Solving for solution between 1.886863 and 2.113137
   fun-count     x         f(x)       Procedure
       7     2.113137     0.209619    initial
       8     2.092202    -0.026189    interpolation
       9     2.094527    -0.000273    interpolation
      10     2.094551     0.000000    interpolation
      11     2.094550    -0.000011    interpolation


Root of System of Nonlinear Equation
------------------------------------

.. math:: 3x_1 - \cos(x_2 x_3) - \frac{1}{2} = 0
.. math:: x_1^2 - 81(x_2+0.1)^2 + \sin(x_3) + 1.06 = 0
.. math:: e^{x_1x_2} + 20x_3 + \frac{10\pi-3}{3} = 0
.. math:: x_0 = [0.1, 0.1, -0.1]^T


.. code-block:: C#

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

   Output: 
      
   .. code-block:: C#

      0.5000
      0.0000
     -0.5236

   

Linear Programming
-------------------
    Linear programming is a method used to find the best possible outcome in a mathematical model whose requirements are represented by linear relationships. Sepal Solver provides robust tools and algorithms to efficiently solve these optimization problems.

Applications of Linear Programming with Sepal Solver
 - Engineering: Optimizing the design of structures, control systems, and resource allocation.
 - Finance: Portfolio optimization, risk management, and algorithmic trading.
 - Operations Research: Supply chain management, scheduling, and resource allocation.

Below are some examples of linear programming problems solved using SepalSolver Linear Programming tool.

Starting with just inequality conditions
   .. code-block:: C#

      // import libraries
      using System;
      using SepalSolver;
      using static SepalSolver.Math;
      
      double[,] A = new double[,]{{ 1.00,  1.00 },
                                  { 1.00,  0.25 },
                                  { 1.00, -1.00 },
                                  {-0.25, -1.00 },
                                  {-1.00, -1.00 },
                                  {-1.00,  1.00 }};

      double[] b = [ 2, 1, 2, 1, -1, 2 ];
      double[] f = [ -1, -0.3333 ];
      var result = Linprog(f, A, b);
      Console.WriteLine(result);

   Output:

   .. code-block:: C#

      Running HiGHS 1.9.0 (git hash: 66f735e): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
        
         0.6667
         1.3333

We can add the equality conditions
   .. code-block:: C#
      
      double[,] Aeq = new double[,] { { 1, 1.0 / 4 } };
      double[] beq = [1.0 / 2];
      result = Linprog(f, A, b, Aeq, beq);
      Console.WriteLine(result);

   Output:

   .. code-block:: C#

      Running HiGHS 1.9.0 (git hash: 66f735e): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
        
        -0.0000
         2.0000


We can add lower and upper bound for the variables
   .. code-block:: C#
      
      double[] Lb = [-1, -0.5], Ub = [1.5, 1.25];
      result = Linprog(f, A, b, Aeq, beq, Lb, Ub);
      Console.WriteLine(result);

   Output:

   .. code-block:: C#

      Running HiGHS 1.9.0 (git hash: 66f735e): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
        
         0.1875
         1.2500




Sequential Quadratic Programming
--------------------------------
fmincon function is a versatile tool for solving constrained nonlinear optimization problems. It finds the minimum of a scalar function subject to various constraints, including linear, nonlinear, and bound constraints using sequential quadratic programming:

   .. code-block:: C#

      // import libraries
      using System;
      using SepalSolver;
      using static SepalSolver.Math;

      
      static double fun(ColVec x) => 100 * Pow(x[1] - x[0]*x[0], 2) + Pow(1 - x[0], 2);
      double[] x0 = [0.5, 0];
      Matrix AInEq = new double[,]{ { 1, 2} };
      ColVec bInEq = 1;
      Matrix AEq = new double[,] { { 2, 1 } };
      ColVec bEq = 1;
      ColVec x = Fmincon(fun, x0, x => AInEq * x - bInEq, x => AEq * x - bEq);
      Console.WriteLine(x);

   Output:

   .. code-block:: C#

      Running HiGHS 1.7.1 (git hash: n/a): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
      Running HiGHS 1.7.1 (git hash: n/a): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
      Running HiGHS 1.7.1 (git hash: n/a): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
      Running HiGHS 1.7.1 (git hash: n/a): Copyright (c) 2024 HiGHS under MIT licence terms
      Optimal solution found
      
         0.4149
         0.1701

Least Square Fitting
---------------------
    Least squares fitting is a fundamental technique used in data analysis to find the best-fitting curve or line for a set of data points by minimizing the sum of the squares of the differences between the observed values and the values predicted by the model. 
    Sepal Solver, Lsqcurvefit is robust tool for performing least squares fitting efficiently.

Applications of Least Squares Fitting with Sepal Solver
 - Data Analysis: Fitting models to experimental data to identify trends and relationships.
 - Engineering: Modeling physical systems and processes to predict behavior under different conditions.
 - Finance: Analyzing financial data to forecast trends and make informed decisions.


   .. code-block:: C#

      // import libraries
      using System;
      using SepalSolver;
      using static SepalSolver.Math;

      
      ColVec xdata, ydata, x, y_est; double[] x0;
      xdata = new double[] { 0.9, 1.5, 13.8, 19.8, 24.1, 28.2, 35.2, 60.3, 74.6, 81.3 };
      ydata = new double[] { 455.2, 428.6, 124.1, 67.3, 43.2, 28.1, 13.1, -0.4, -1.3, -1.5 };
      
      x0 = [100, -1];
      static ColVec model(ColVec x, ColVec xdata) => x[0] * Exp(x[1] * xdata);
      var opts = OptimSet(Display: true, MaxIter: 200, StepTol: 1e-6, OptimalityTol: 1e-6);
      var ans = Lsqcurvefit(model, x0, xdata, ydata, options: opts);
      Console.WriteLine($"x = {ans.x.T}");
      
      x = Linspace(xdata.First(), xdata.Last());
      Scatter(xdata, ydata); hold = true;
      Plot(x, y_est = model(ans.x, x), "r", Linewidth: 2);
      Axis([xdata.Min()-0.01*xdata.Range(), xdata.Max()+0.01*xdata.Range(),
           ydata.Min()-0.1*ydata.Range(), ydata.Max()+0.1*ydata.Range()]);
       
      Xlabel("x"); Ylabel("y"); Legend(["Measured Data", "Model Estimate"], Alignment.UpperRight);
      Title("Example of CurveFitting using Lsqcurvefit");

   Output:

   .. code-block:: C#

                                                  Norm of      First-order
       Iteration   Func-count       Resnorm          step       optimality
           0            3          3.5968e5                       2.8768e4
           1            7          2.9148e5      4.5301e1         4.7091e1
           2           11          1.4328e5      7.0536e1         7.8426e1
           3           15          5.8838e4      8.1015e1         8.8027e1
           4           19          2.1604e4      7.9171e1         6.7359e1
           5           23          2.4371e3      8.1537e1         6.0719e1
           6           27          6.2429e1      3.5477e1         2.4062e1
           7           31          9.6405e0      5.5200e0         3.1853e0
           8           35          9.5049e0     2.7383e-1        1.3930e-1
           9           39          9.5049e0     3.5902e-3        2.1213e-3
          10           43          9.5049e0     9.0844e-6        8.8163e-6
      x =
       498.8309   -0.1013

   .. figure:: images/LMTest1.png
      :align: center
      :alt: LMTest1.png