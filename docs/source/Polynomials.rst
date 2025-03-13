Polynomials
-----------


Polynomials::
   Description: 
       Handles all operations involving polynomials such as roots, convolution and deconvolution


   Roots::
      Description: 
          Calculates the roots of a polynomial given its coefficients.
      Param: 
         | Coeffs:  An array of doubles representing the coefficients of the polynomial.
      Returns: 
          An array of complex numbers representing the roots of the polynomial.
      Example: 
          In this example, we calculate the roots of a polynomial with given coefficients.
          

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Coefficients of the polynomial 7x^6 + 9x^5 - 7x^4 + 9x^3 + 3x^2 - 8x - 4
             double[] coeffs = [ 7,  9, -7, 9, 3, -8, -4 ];
             
             // Calculate the roots
             Complex[] roots = Complex.Roots(coeffs);
             
             // Print the roots
             foreach (Complex root in roots)
                 Console.WriteLine($"Root: {root}");
                 
          

         Output: 


          .. code-block:: Terminal 

             Root: -2.0000 + 0.0000i
             Root:  0.4370 + 0.9730i
             Root:  0.4370 - 0.9730i
             Root:  0.8530 + 0.0000i
             Root: -0.5064 + 0.1948i
             Root: -0.5064 - 0.1948i


   DeConv::
      Description: 
          Performs polynomial division, dividing one polynomial by another.
      Param: 
         | Coeffs_a:  An array of doubles representing the coefficients of the dividend polynomial.
         | Coeffs_d:  An array of doubles representing the coefficients of the divisor polynomial.
         | Coeffs_q:  When this method returns, contains the coefficients of the quotient polynomial.
         | Coeffs_r:  When this method returns, contains the coefficients of the remainder polynomial.
      Example: 
          In this example, we perform polynomial division.
          
          Mathematically, if we have:

          .. math::
             P(x) = -7x^5 + 10x^3 - 3x^2 + 2x - 5
          and

          .. math::
             D(x) =  6x^2 - 4x + 1
             

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Coefficients of the dividend polynomial -7x^5 + 10x^3 - 3x^2 + 2x - 5
             double[] coeffs_a = [-7,  0,  10,  -3,  2,  -5];
             
             // Coefficients of the divisor polynomial 6x^2 - 4x + 1
             double[] coeffs_d = [ 6,  -4,  1 ];
             
             // Perform polynomial division
             Polynomials.DeConv(coeffs_a, coeffs_d, out double[] coeffs_q, out double[] coeffs_r);
             
             // Print the quotient and remainder
             Console.WriteLine("Quotient: " + string.Join(", ", coeffs_q));
             Console.WriteLine("Remainder: " + string.Join(", ", coeffs_r));
          

         Output: 


          .. code-block:: Terminal 

             Quotient: -1.16666666666667, -0.777777777777778, 1.34259259259259, 0.524691358024691
             Remainder: 2.75617283950617, -5.52469135802469


   PolyVal::
      Description: 
          Evaluates a polynomial at a given point.
      Param: 
         | Coeffs_a:  An array of double or an array of complex representing the coefficients of the polynomial.
         | x:  The point (double or complex) at which to evaluate the polynomial.
      Returns: 
          The value (double or complex) of the polynomial at the given point.
      Example: 
          In this example, we evaluate a polynomial at a given point.
          
          Mathematically, if we have:

          .. math::
             P(x) = x^3 - 6x^2 + 11x - 6
          and we want to evaluate it at \(x = 4\):
          

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Coefficients of the polynomial x^3 - 6x^2 + 11x - 6
             double[] coeffs_a = [1, -6, 11, -6];
             
             // Evaluate the polynomial at x = 4
             double value = Polynomials.PolyVal(coeffs_a, 3);
             
             // Print the value
             Console.WriteLine($"P(4) = {value}");
          

         Output: 


          .. code-block:: Terminal 

             P(4) = 6.0000
