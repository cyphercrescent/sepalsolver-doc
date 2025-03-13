Complex
-------


Complex::
   Description: 
       Represents a complex number with real and imaginary parts.
   Example: 
       In this example, we demonstrate various arithmetic operations on complex numbers.
       

       .. code-block:: CSharp 

          // import libraries
          using CypherCrescent.MathematicsLibrary;
          using static System.Math;
          using System;
          
          // Create complex numbers
          Complex c1 = new Complex(1.0, 2.0);
          Complex c2 = new Complex(3.0, 4.0);
          Complex c3 = new Complex(0.5, 0.5);
          
          // Addition
          Complex sum = c1 + c2;
          Console.WriteLine($"Sum: {sum}");
          
          // Subtraction
          Complex difference = c1 - c2;
          Console.WriteLine($"Difference: {difference}");
          
          // Multiplication
          Complex product = c1 * c2;
          Console.WriteLine($"Product: {product}");
          
          // Division
          Complex quotient = c1 / c2;
          Console.WriteLine($"Quotient: {quotient}");
          
          // Power (c1 - c2)^c3
          Complex power = Complex.Pow(difference, c3);
          Console.WriteLine($"(c1 - c2)^c3: {power}");
       

      Output: 


       .. code-block:: Terminal 

          Sum: 4 + 6i
          Difference: -2 - 2i
          Product: -5 + 10i
          Quotient: 0.44 + 0.08i
          (c1 - c2)^c3: 0.7692 - 0.6366i


   Real::
      Description: 
          Returns the real part of the complex number.


   Imaginary::
      Description: 
          Returns the imaginary part of the complex number.


   Magnitude::
      Description: 
          Returns the magnitude of the complex number.


   MagnitudeSq::
      Description: 
          Returns the square of the magnitude of the complex number.


   Argument::
      Description: 
          Returns the inclination (in radians) of the complex number with positive real number axis.


   Complex::
      Description: 
          Initializes a new instance of the Complex class with the specified real and imaginary parts.
      Param: 
         | real:  The real part of the complex number.
         | imaginary:  The imaginary part of the complex number.
      Example: 
          In this example, we create a complex number with a real part of 3.0 and an imaginary part of 4.0.
          Mathematically, this can be represented as:

          .. math::
             z = 3 + 4i

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
         
             // Example of creating a Complex instance
             Complex complex = new Complex(3.0, 4.0);
             // Print the result
             Console.WriteLine($"z = {complex}");

         Output: 


          .. code-block:: Terminal 

             z =   3.0000 + 4.0000i


   Complex::
      Description: 
          Initializes a new instance of the Complex class with the specified real part and an imaginary part of 0.
      Param: 
         | real:  The real part of the complex number.
      Example: 
          In this example, we create a complex number with a real part of 5.0 and an imaginary part of 0.
          Mathematically, this can be represented as:

          .. math::
             z = 5 + 0i

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
         
             // Example of creating a Complex instance
             Complex complexNumber = new Complex(5.0);
             // Print the result
             Console.WriteLine($"z = {complex}");

         Output: 


          .. code-block:: Terminal 

             z =   5.0000 + 0.0000i


   CompareTo::
      Description: 
          Compares the current complex number to another complex number.
      Param: 
         | other:  The complex number to compare with this instance.
      Returns: 
          A value less than zero if this instance is less than <paramref name="other"/>,
          zero if this instance is equal to <paramref name="other"/>, or 
          a value greater than zero if this instance is greater than <paramref name="other"/>.
      Remark: 
         |  Complex numbers are compared first by their magnitude, and then by their argument.


   Max::
      Description: 
          Returns the maximum of two Complex numbers.
      Param: 
         | A:  The first complex number to compare.
         | B:  The second complex number to compare.
      Returns: 
          The complex number that is greater.
      Example: 
          In this example, we compare two complex numbers and return the greater one.
          Mathematically, if we have:

          .. math::
             \begin{array}{rcl}
              A &=& 3 + 4i  \\
              B &=& 5 + 2i
              \end{array}
          The method will return B as it is greater.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Max method
             Complex A = new Complex(3.0, 4.0);
             Complex B = new Complex(5.0, 2.0);
             // find the maximum
             Complex maxComplex = Complex.Max(A, B);
             // print the result
             Console.WriteLine($"Max Complex = {maxComplex}");

         Output: 


          .. code-block:: Terminal 

             Max Complex =   5.0000 + 2.0000i


   Min::
      Description: 
          Returns the minimum of two Complex numbers.
      Param: 
         | A:  The first complex number to compare.
         | B:  The second complex number to compare.
      Returns: 
          The complex number that is smaller.
      Example: 
          In this example, we compare two complex numbers and return the smaller one.
          Mathematically, if we have:

          .. math::
             \begin{array}{rcl}
              A &=& 3 + 4i  \\
              B &=& 5 + 2i
              \end{array}
          The method will return A as it is smaller.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Min method
             Complex A = new Complex(3.0, 4.0);
             Complex B = new Complex(5.0, 2.0);
             // find the minimum
             Complex minComplex = Complex.Min(A, B);
             // print the result
             Console.WriteLine($"Min Complex = {minComplex}");

         Output: 


          .. code-block:: Terminal 

             Min Complex =   3.0000 + 4.0000i


   Cart::
      Description: 
          Converts polar coordinates (magnitude and angle) to a complex number in Cartesian coordinates.
      Param: 
         | mag:  The magnitude of the complex number.
         | angle:  The angle (in radians) of the complex number.
      Returns: 
          A complex number represented in Cartesian coordinates.
      Example: 
          In this example, we convert polar coordinates to a complex number.
          Mathematically, if we have:

          .. math::
             \text{Magnitude} = 5, \text{Angle} = \frac{\pi}{4}
          The Cartesian coordinates are:

          .. math::
             \begin{array}{rcl}
             \text{Real} &=& 5 \cdot \cos\left(\cfrac{\pi}{4}\right) \\
             \text{Imaginary} &=& 5 \cdot \sin\left(\cfrac{\pi}{4}\right)
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Cart method
             double magnitude = 5.0;
             double angle = Math.PI / 4;
             Complex cartesianComplex = Complex.Cart(magnitude, angle);
             // print the result
             Console.WriteLine($"Cartesian Complex = {cartesianComplex}");

         Output: 


          .. code-block:: Terminal 

             Cartesian Complex =   3.5355 + 3.5355i


   static::
      Description: 
          Returns the polar coordinates (magnitude and argument) of a complex number.
      Param: 
         | c:  The complex number to convert to polar coordinates.
      Returns: 
          A tuple containing the magnitude and argument of the complex number.
      Example: 
          In this example, we convert a complex number to its polar coordinates.
          Mathematically, if we have:

          .. math::
             z = 3 + 4i
          The polar coordinates are:

          .. math::
             \begin{array}{rcl}
             \text{Magnitude} &=& 5  \\
             \text{Argument} &=& \arctan\left(\cfrac{4}{3}\right)
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Pol method
             Complex c = new Complex(3.0, 4.0);
             var polarCoordinates = Complex.Pol(c);
             // print the result
             Console.WriteLine($"Magnitude = {polarCoordinates.Mag}, Argument = {polarCoordinates.Arg}");

         Output: 


          .. code-block:: Terminal 

             Magnitude = 5, Argument = 0.9273


   Root::
      Description: 
          Calculates the Nth roots of a complex number.
      Param: 
         | c:  The complex number for which to calculate the roots.
         | N:  The number of roots to calculate.
      Returns: 
          An array of complex numbers representing the Nth roots of the input complex number.
   |   cref=ArgumentException is 
      Example: 
          In this example, we calculate the 3rd roots of a complex number.
          Mathematically, if we have:

          .. math::
             z = 8 + 0i, N = 3
          The roots are:

          .. math::
             \begin{array}{rcl}
             \text{Root}_1 &=& 2 + 0i \\
             \text{Root}_2 &=& -1 + \sqrt{3}i \\
             \text{Root}_3 &=& -1 - \sqrt{3}i
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             using System.Linq;
             
             // Example of using the Root method
             Complex c = new Complex(8.0, 0.0);
             int N = 3;
             Complex[] roots = Complex.Root(c, N);
             // print the results
             foreach (var root in roots)
             {
                 Console.WriteLine($"Root = {root}");
             }

         Output: 


          .. code-block:: Terminal 

             Root =   2.0000 + 0.0000i
             Root =  -1.0000 + 1.7321i
             Root =  -1.0000 - 1.7321i


   Random::
      Description: 
          Generates a random complex number with real and imaginary parts between 0 and 1.
      Param: 
         | random:  An optional Random object to use for generating the random numbers. If null, a new Random object is created.
      Returns: 
          A complex number with random real and imaginary parts.
      Example: 
          In this example, we generate a random complex number.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Random method
             Complex randomComplex = Complex.Random();
             // print the result
             Console.WriteLine($"Random Complex = {randomComplex}");

         Output: 


          .. code-block:: Terminal 

             Random Complex =   0.1234 + 0.5678i


   Sqrt::
      Description: 
          Calculates the square root of a complex number.
      Param: 
         | c:  The complex number for which to calculate the square root.
      Returns: 
          A complex number representing the square root of the input complex number.
      Example: 
          In this example, we calculate the square root of a complex number.
          Mathematically, if we have:

          .. math::
             z = 3 + 4i
          The square root is:

          .. math::
             \sqrt{z} = \sqrt{3 + 4i}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Sqrt method
             Complex c = new Complex(3.0, 4.0);
             Complex sqrtComplex = Complex.Sqrt(c);
             // print the result
             Console.WriteLine($"Sqrt Complex = {sqrtComplex}");

         Output: 


          .. code-block:: Terminal 

             Sqrt Complex =   2.0000 + 1.0000i


   Exp::
      Description: 
          Calculates the exponential of a complex number.
      Param: 
         | c:  The complex number for which to calculate the exponential.
      Returns: 
          A complex number representing the exponential of the input complex number.
      Example: 
          In this example, we calculate the exponential of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The exponential is:

          .. math::
             e^z = e^{1 + i}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Exp method
             Complex c = new Complex(1.0, 1.0);
             Complex expComplex = Complex.Exp(c);
             // print the result
             Console.WriteLine($"Exp Complex = {expComplex}");

         Output: 


          .. code-block:: Terminal 

             Exp Complex =   1.4687 + 2.2874i


   Log::
      Description: 
          Calculates the natural logarithm of a complex number.
      Param: 
         | c:  The complex number for which to calculate the natural logarithm.
      Returns: 
          A complex number representing the natural logarithm of the input complex number.
      Example: 
          In this example, we calculate the natural logarithm of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The natural logarithm is:

          .. math::
             \ln(z) = \ln(1 + i)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Log method
             Complex c = new Complex(1.0, 1.0);
             Complex logComplex = Complex.Log(c);
             // print the result
             Console.WriteLine($"Log Complex = {logComplex}");

         Output: 


          .. code-block:: Terminal 

             Log Complex =   0.3466 + 0.7854i


   Log::
      Description: 
          Calculates the logarithm of a complex number to the base of another complex number.
      Param: 
         | c:  The complex number for which to calculate the logarithm.
         | num:  The base complex number.
      Returns: 
          A complex number representing the logarithm of the input complex number to the specified base.
      Example: 
          In this example, we calculate the logarithm of a complex number to the base of another complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i, \text{base} = 2 + i
          The logarithm is:

          .. math::
             \log_{\text{base}}(z) = \frac{\ln(z)}{\ln(\text{base})}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Log method with a base
             Complex c = new Complex(1.0, 1.0);
             Complex baseNum = new Complex(2.0, 1.0);
             Complex logComplex = Complex.Log(c, baseNum);
             // print the result
             Console.WriteLine($"Log Complex = {logComplex}");

         Output: 


          .. code-block:: Terminal 

             Log Complex =   0.2310 + 0.3218i


   Sin::
      Description: 
          Calculates the sine of a complex number.
      Param: 
         | c:  The complex number for which to calculate the sine.
      Returns: 
          A complex number representing the sine of the input complex number.
      Example: 
          In this example, we calculate the sine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The sine is:

          .. math::
             \sin(z) = \frac{e^{i z} - e^{-i z}}{2 i}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Sin method
             Complex c = new Complex(1.0, 1.0);
             Complex sinComplex = Complex.Sin(c);
             // print the result
             Console.WriteLine($"Sin Complex = {sinComplex}");

         Output: 


          .. code-block:: Terminal 

             Sin Complex =   1.2985 + 0.6350i


   Cos::
      Description: 
          Calculates the cosine of a complex number.
      Param: 
         | c:  The complex number for which to calculate the cosine.
      Returns: 
          A complex number representing the cosine of the input complex number.
      Example: 
          In this example, we calculate the cosine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The cosine is:

          .. math::
             \cos(z) = \frac{e^{i z} + e^{-i z}}{2}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Cos method
             Complex c = new Complex(1.0, 1.0);
             Complex cosComplex = Complex.Cos(c);
             // print the result
             Console.WriteLine($"Cos Complex = {cosComplex}");

         Output: 


          .. code-block:: Terminal 

             Cos Complex =   0.8337 - 0.9889i


   Tan::
      Description: 
          Calculates the tangent of a complex number.
      Param: 
         | c:  The complex number for which to calculate the tangent.
      Returns: 
          A complex number representing the tangent of the input complex number.
      Example: 
          In this example, we calculate the tangent of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The tangent is:

          .. math::
             \tan(z) = -i \frac{e^{i z} - e^{-i z}}{e^{i z} + e^{-i z}}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Tan method
             Complex c = new Complex(1.0, 1.0);
             Complex tanComplex = Complex.Tan(c);
             // print the result
             Console.WriteLine($"Tan Complex = {tanComplex}");

         Output: 


          .. code-block:: Terminal 

             Tan Complex =   0.2718 + 1.0839i


   Sinh::
      Description: 
          Calculates the hyperbolic sine of a complex number.
      Param: 
         | c:  The complex number for which to calculate the hyperbolic sine.
      Returns: 
          A complex number representing the hyperbolic sine of the input complex number.
      Example: 
          In this example, we calculate the hyperbolic sine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The hyperbolic sine is:

          .. math::
             \sinh(z) = \frac{e^z - e^{-z}}{2}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Sinh method
             Complex c = new Complex(1.0, 1.0);
             Complex sinhComplex = Complex.Sinh(c);
             // print the result
             Console.WriteLine($"Sinh Complex = {sinhComplex}");

         Output: 


          .. code-block:: Terminal 

             Sinh Complex =   0.6350 + 1.2985i


   Cosh::
      Description: 
          Calculates the hyperbolic cosine of a complex number.
      Param: 
         | c:  The complex number for which to calculate the hyperbolic cosine.
      Returns: 
          A complex number representing the hyperbolic cosine of the input complex number.
      Example: 
          In this example, we calculate the hyperbolic cosine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The hyperbolic cosine is:

          .. math::
             \cosh(z) = \frac{e^z + e^{-z}}{2}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Cosh method
             Complex c = new Complex(1.0, 1.0);
             Complex coshComplex = Complex.Cosh(c);
             // print the result
             Console.WriteLine($"Cosh Complex = {coshComplex}");

         Output: 


          .. code-block:: Terminal 

             Cosh Complex =   0.8337 + 0.9889i


   Tanh::
      Description: 
          Calculates the hyperbolic tangent of a complex number.
      Param: 
         | c:  The complex number for which to calculate the hyperbolic tangent.
      Returns: 
          A complex number representing the hyperbolic tangent of the input complex number.
      Example: 
          In this example, we calculate the hyperbolic tangent of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The hyperbolic tangent is:

          .. math::
             \tanh(z) = \frac{\sinh(z)}{\cosh(z)}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Tanh method
             Complex c = new Complex(1.0, 1.0);
             Complex tanhComplex = Complex.Tanh(c);
             // print the result
             Console.WriteLine($"Tanh Complex = {tanhComplex}");

         Output: 


          .. code-block:: Terminal 

             Tanh Complex =   1.0839 + 0.2718i


   Asin::
      Description: 
          Calculates the inverse sine (arcsine) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse sine.
      Returns: 
          A complex number representing the inverse sine of the input complex number.
      Example: 
          In this example, we calculate the inverse sine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse sine is:

          .. math::
             \sin^{-1}(z) = -i \ln\left(i z + \sqrt{1 - z^2}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Asin method
             Complex c = new Complex(1.0, 1.0);
             Complex asinComplex = Complex.Asin(c);
             // print the result
             Console.WriteLine($"Asin Complex = {asinComplex}");

         Output: 


          .. code-block:: Terminal 

             Asin Complex = 0.6662 + 1.0613i


   Acos::
      Description: 
          Calculates the inverse cosine (arccosine) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse cosine.
      Returns: 
          A complex number representing the inverse cosine of the input complex number.
      Example: 
          In this example, we calculate the inverse cosine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse cosine is:

          .. math::
             \cos^{-1}(z) = -i \ln\left(z + i \sqrt{1 - z^2}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Acos method
             Complex c = new Complex(1.0, 1.0);
             Complex acosComplex = Complex.Acos(c);
             // print the result
             Console.WriteLine($"Acos Complex = {acosComplex}");

         Output: 


          .. code-block:: Terminal 

             Acos Complex = 0.9046 - 1.0613i


   Atan::
      Description: 
          Calculates the inverse tangent (arctangent) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse tangent.
      Returns: 
          A complex number representing the inverse tangent of the input complex number.
      Example: 
          In this example, we calculate the inverse tangent of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse tangent is:

          .. math::
             \tan^{-1}(z) = \frac{i}{2} \ln\left(\frac{1 - i z}{1 + i z}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Atan method
             Complex c = new Complex(1.0, 1.0);
             Complex atanComplex = Complex.Atan(c);
             // print the result
             Console.WriteLine($"Atan Complex = {atanComplex}");

         Output: 


          .. code-block:: Terminal 

             Atan Complex = 1.0172 + 0.4024i


   Asinh::
      Description: 
          Calculates the inverse hyperbolic sine (arsinh) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse hyperbolic sine.
      Returns: 
          A complex number representing the inverse hyperbolic sine of the input complex number.
      Example: 
          In this example, we calculate the inverse hyperbolic sine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse hyperbolic sine is:

          .. math::
             \sinh^{-1}(z) = \ln\left(z + \sqrt{z^2 + 1}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Asinh method
             Complex c = new Complex(1.0, 1.0);
             Complex asinhComplex = Complex.Asinh(c);
             // print the result
             Console.WriteLine($"Asinh Complex = {asinhComplex}");

         Output: 


          .. code-block:: Terminal 

             Asinh Complex = 1.0613 + 0.6662i


   Acosh::
      Description: 
          Calculates the inverse hyperbolic cosine (arcosh) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse hyperbolic cosine.
      Returns: 
          A complex number representing the inverse hyperbolic cosine of the input complex number.
      Example: 
          In this example, we calculate the inverse hyperbolic cosine of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse hyperbolic cosine is:

          .. math::
             \cosh^{-1}(z) = \ln\left(z + \sqrt{z^2 - 1}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Acosh method
             Complex c = new Complex(1.0, 1.0);
             Complex acoshComplex = Complex.Acosh(c);
             // print the result
             Console.WriteLine($"Acosh Complex = {acoshComplex}");

         Output: 


          .. code-block:: Terminal 

             Acosh Complex = 1.0613 + 0.9046i


   Atanh::
      Description: 
          Calculates the inverse hyperbolic tangent (artanh) of a complex number.
      Param: 
         | c:  The complex number for which to calculate the inverse hyperbolic tangent.
      Returns: 
          A complex number representing the inverse hyperbolic tangent of the input complex number.
      Example: 
          In this example, we calculate the inverse hyperbolic tangent of a complex number.
          Mathematically, if we have:

          .. math::
             z = 1 + i
          The inverse hyperbolic tangent is:

          .. math::
             \tanh^{-1}(z) = \frac{1}{2} \ln\left(\frac{1 + z}{1 - z}\right)

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Atanh method
             Complex c = new Complex(1.0, 1.0);
             Complex atanhComplex = Complex.Atanh(c);
             // print the result
             Console.WriteLine($"Atanh Complex = {atanhComplex}");

         Output: 


          .. code-block:: Terminal 

             Atanh Complex = 0.4024 + 1.0172i
