Integrators
-----------


Integrators::
   Description: 
       Performs numerical evaluation of definite integration of functions


   GaussLeg::
      Description: 
          Computes the definite integral of a function using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept a double and return a double.
         | x_1:  The lower bound of the integration interval.
         | x_2:  The upper bound of the integration interval.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the definite integral.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration interval.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x) = x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} x^2 \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double> f = (x) => x * x;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg(f, x_1, x_2);
             // Print the result
             Console.WriteLine($"The integral of x^2 is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The integral of x^2 is approximately: 0.333333333321056
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a rectangular region using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. It is assumed this is a constant.
         | y_2:  The upper bound of the y integration. It is assumed this is a constant.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1 <= y <= y_2.
         |  For best results, the function should be smooth within the integration region.
         |  If x_1 equals x_2 then the method will return 0. The y bounds are assumed to be constant (y_1 and y_2)
      Example: 
           Integrate the function f(x, y) = x * y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2} x y \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double> f = (x, y) => x * y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the lower bound of y
             double y_1 = 1;
             // Set the upper bound of y
             double y_2 = 2;
             // Calculate the integral
             double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral of x*y is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The integral of x*y is approximately: 0.749999999948747
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where the y-bounds are defined by a function and a constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration.  This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x) should be a smooth function.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from x^2 to 2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2} x y \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where the y-bounds are defined by a constant and a function, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1 <= y <= y_2(x).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_2(x) should be a smooth function.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from 1 to x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)} x y \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where both y-bounds are defined by functions of x, using adaptive Gauss-Legendre quadrature.
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
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2(x).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)} x y \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a rectangular cuboid region using adaptive Gauss-Legendre quadrature.  All bounds are constants.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z1:  The lower bound of the z integration. This is a constant value.
         | z2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z1 <= z <= z2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region.
         |  If x_1 equals x_2 then the method will return 0. All y and z bounds are assumed to be constant.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z1, z2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: 1.8749999998078
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1 <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x) should be a smooth function. The z bounds are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: 2.29166666643309
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a constant and a function of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1 <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_2(x) should be a smooth function. The z bounds are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: -0.416666666625285
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1 <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
         |  If x_1 equals x_2 then the method will return 0. The z bounds are assumed to be constant.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: 0.208333333312197
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentException is Thrown when y_1(x) is greater than y_2(x) for any x in the interval [x_1, x_2].
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the x and y bounds are constants, the lower z-bound is a function of x and y, and the upper z-bound is constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z_1(x, y) <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and z_1(x, y) should be a smooth function. The x and y bounds, and the upper z bound are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * x * y * y * z over the region where x ranges from -1 to 1, y ranges from -1 to 1, and z ranges from x*y to 2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x, y)}^{z_2} (x^2 y^2 z) \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x^2*y^2*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x^2*y^2*z is approximately: 0.808888888786791
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the lower z-bound is a function of x and y, and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1(x, y) <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, y_1(x) and z_1(x, y) should be smooth functions. Additionally, y_1(x) and z_1(x, y) must result in a valid intergration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: 3.63541666602461
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are a constant lower bound and a function of x upper bound, and the z-bounds are a function of x and y lower bound and a constant upper bound, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1(x, y) <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_2(x) and z_1(x, y) should be smooth functions. The y lower bound and z upper bound are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x + y + z over the region where x ranges from 0 to 1, y ranges from 1 to x + 2, and z ranges from x*y to 4, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x, y)}^{z_2} (x + y + z) \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x+y+z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x+y+z is approximately: 20.7166666645573
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, the lower z-bound is a function of x and y, and the upper z-bound is constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1(x, y) <= z <= z_2.
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x), y_2(x), and z_1(x, y) should be smooth functions. The upper z bound is assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * x + y * y + z * z over the region where x ranges from 0 to 1, y ranges from 0 to sqrt(x), and z ranges from x+y to 5, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x, y)}^{z_2} (x^2 + y^2 + z^2) \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x^2+y^2+z^2 is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x^2+y^2+z^2 is approximately: 29.0252572989997
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are constants, the lower z-bound is constant, and the upper z-bound is a function of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z_1 <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and z_2(x, y) should be a smooth function. The y and lower z bounds are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = 1 / (1 + x + y + z) over the region where x ranges from 0 to 1, y ranges from 0 to 2, and z ranges from 1 to x*x + y*y + 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2(x, y)} \frac{1}{1 + x + y + z} \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of 1/(1+x+y+z) is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of 1/(1+x+y+z) is approximately: 1.40208584910316
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the lower y-bound is a function of x, the upper y-bound is constant, the lower z-bound is constant, and the upper z-bound is a function of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1 <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x) and z_2(x, y) should be smooth functions. The upper y bound and lower z bound are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y + z over the region where x ranges from 0 to 2, y ranges from sin(x) to 3, and z ranges from -1 to x*x + y + 2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2(x, y)} (x y + z) \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y + z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => Math.Sin(x);
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of xy+z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of xy+z is approximately: 119.271742284841
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the lower y-bound is constant, the upper y-bound is a function of x, the lower z-bound is constant, and the upper z-bound is a function of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1 <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_2(x) and z_2(x, y) should be smooth functions. The lower y bound and lower z bound are assumed to be constant.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x - y + 2*z over the region where x ranges from 1 to 3, y ranges from -2 to x*x, and z ranges from 0 to x + y + 1, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2(x, y)} (x - y + 2z) \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x-y+2z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x-y+2z is approximately: 353.666666629263
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, the lower z-bound is a constant, and the upper z-bound is a function of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1 <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x), y_2(x) and z_2(x, y) should be smooth functions.
         |  Ensure that y_1(x) <= y_2(x) and z_1 <= z_2(x, y) throughout the integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately:   -0.0921296305735099
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by constants, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z_1(x, y) <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and z_1(x, y) and z_2(x, y) should be smooth functions. 
         |  Ensure that z_1(x,y) <= z_2(x, y) throughout the integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately:  1.43402777762941
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x for the lower bound and a constant for the upper bound, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1(x, y) <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, and y_1(x), z_1(x, y), and z_2(x, y) should be smooth functions.
         |  Ensure that y_1(x) <= y_2 and z_1(x,y) <= z_2(x, y) throughout the integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately:  1.56851851820977
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the lower y-bound is constant, the upper y-bound is a function of x, and the z-bounds are functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions.
         |  Ensure that y_1 is less than or equal to y_2(x) and z_1(x,y) is less than or equal to z_2(x, y) across the integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

         Output: 


          .. code-block:: Terminal 

             The triple integral of x*y*z is approximately: -0.134490740716508
   |   cref=System.ArgumentNullException is Thrown when the  fun is null.
   |   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
   |   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
   |   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
         |  This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
         |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
         |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
         |  For best results, the function should be smooth within the integration region, y_1(x), y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions. 
         |  Ensure that y_1(x) <= y_2(x) and z_1(x, y) <= z_2(x, y) throughout the integration region.
         |  If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
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
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
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
