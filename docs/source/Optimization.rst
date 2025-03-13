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
The fzero function in CCL-Math is a powerful tool for finding the roots of nonlinear equations. It is particularly useful when you need to find a point where a given function equals zero. Here's a brief overview of how it works and some of its key features:

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
   using CypherCrescent.MathematicsLibrary;
   using static CypherCrescent.MathematicsLibrary.Math;

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
   using CypherCrescent.MathematicsLibrary;
   using static CypherCrescent.MathematicsLibrary.Math;

   static double fun(double x) => Pow(x, 3) - 2 * x - 5;
   var ops = SolverSet(Display: true);
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


.. tabs::
   
   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#

         // import libraries
         using System;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

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

   .. tab:: Python

      Python Implementation

      .. code-block:: python

         import numpy as np
         from scipy.optimize import fsolve

         # define function
         def func(x):
             x1 = x[0]; x2 = x[1]; x3 = x[2]; pi = np.pi;
             return [3 * x1 - np.cos(x2 * x3) - 0.5,
                     x1 * x1 - 81*(x2 + 0.1)**2 + np.sin(x3) + 1.06,
                     np.exp(-x1 * x2) + 20 * x3 + (10 * pi - 3) / 3]


         # set inigial guess
         x0 = [0.1, 0.1, -0.1]

         # call the solver
         x = fsolve(func, x0)
            
         # display the result
         print(x)

      Output: 
      
         .. code-block:: python
 
            [ 5.00000000e-01  1.38102142e-13 -5.23598776e-01]

   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         f = @(x)[3*x(1) - cos(x(2)*x(2)) - 1/2;
                  x(1)^2 - 81*(x(2)+0.1)^2 + sin(x(3)) + 1.06;
                  exp(x(1)*x(2)) + 20*x(3) + (10 * pi - 3)/3 ];
         
         % set initial guess
         x0 = [0.1; 0.1; -0.1];

         % call the solver
         x = fsolve(f, x0);

         % display the result
         disp(x);

      Output: 
      
         .. code-block:: matlab

             0.5000
             0.0000
            -0.5236


Linear Programming
-------------------

Sequential Quadratic Programming
--------------------------------
fmincon function is a versatile tool for solving constrained nonlinear optimization problems. It finds the minimum of a scalar function subject to various constraints, including linear, nonlinear, and bound constraints using sequential quadratic programming:


   .. code-block:: C#

      // import libraries
      using System;
      using CypherCrescent.MathematicsLibrary;
      using static CypherCrescent.MathematicsLibrary.Math;

      
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