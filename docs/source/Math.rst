

Hist
====
   Description: 
       Generates a histogram representation of a data vector.
       This method bins the input values into intervals and returns the histogram data,
       including counts per bin, positions (typically bin centers), bin size, and min/max of the data range.
       Suitable for visualizing data distributions.

       .. code-block:: CSharp 

          (List<int> Counts, List<double> Positions, double BinSize, double Vmin, double Vmax) Hist(ColVec V, int bin)
   Parameters: 
       V: 
         A column vector (ColVec) containing the numerical data to be analyzed.
       bin: 
           The number of bins to divide the data range into. More bins provide finer granularity.
   Returns: 
       A tuple (Counts, Positions, BinSize, Vmin, Vmax):
           * Counts: Number of elements in each bin
           * Positions: Center positions of each bin
           * BinSize: Width of each bin
           * Vmin: Minimum value in the dataset
           * Vmax: Maximum value in the dataset
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
   Parameters: 
       x: 
         The vector representing X-axis values.
       y: 
         The vector representing Y-axis values.
   Returns: 
       A tuple (X, Y):
           * X: first 2D array contains copies of the x vector arranged in rows.
           * Y: second 2D array contains copies of the y vector arranged in columns.
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
       Reads a two-dimensional elements in matrix from a file.
       This method loads space-separated integers from each line of the specified file and constructs a matrix representation.

       .. code-block:: CSharp 

          Matrix ReadMatrix(string filename)
   Parameters: 
       filename: 
                The path to the input file containing the matrix data.
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


ReadRowVec
==========
   Description: 
       Reads a row vector of numbers from a file.
       This method parses a single line of space-separated values from the specified file and constructs a one-dimensional matrix representation.

       .. code-block:: CSharp 

          RowVec ReadRowVec(string filename)
   Parameters: 
       filename: 
                The path to the input file containing the row vector data.
   Returns: 
       A one-dimensional matrix representing the row vector read from the file.
   Example: 
       Read a row vector from a file named "vector.txt":

       .. code-block:: CSharp 

      .   // import libraries 
          using System;
          using static SepalSolver.Math;
            
          string path = "vector.txt";
      
          // Load row vector
          RowVec rowVec = ReadRowVec(path);
      
          // Display contents
          for (int i = 0; i < rowVec.Cols; i++)
              Console.Write(rowVec[0, i] + " ");

      Output: 


       .. code-block:: Terminal 

          10 20 30 40


ReadColVec
==========
   Description: 
       Reads a column vector of numbers from a file.
       This method parses multiple lines of input from the specified file, with each line representing a single value in the column vector.

       .. code-block:: CSharp 

          ColVec ReadColVec(string filename)
   Parameters: 
       filename: 
                The path to the input file containing the column vector data.
   Returns: 
       A one-dimensional matrix representing the column vector read from the file.
   Example: 
       Read a column vector from a file named "colvec.txt":

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          string path = "colvec.txt";
      
          // Load column vector
          ColVec colVec = ReadColVec(path);
      
          // Output result
          for (int i = 0; i < colVec.Rows; i++)
              Console.WriteLine(colVec[i, 0]);

      Output: 


       .. code-block:: Terminal 

          11  
          22  
          33  
          44


WriteMatrix
===========
   Description: 
       Writes a two-dimensional matrix of integers to a file.
       This method serializes the matrix in space-separated format, with each row written on a new line in the target file.

       .. code-block:: CSharp 

          void WriteMatrix(Matrix A, string filename)
   Parameters: 
       A: 
         The matrix object to be written to the file.
       filename: 
                The path to the output file where the matrix will be saved.
   Returns: 
       This method does not return a value (being a void method)
   Example: 
       Write a matrix to a file named "matrixA.txt":

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          string path = "matrixA.txt";
      
          // Create a matrix
          Matrix A = new double[,]{{12, 18, 3}, {15, 25, 30}};
      
          // Write to file
          WriteMatrix(A, path);

      Output: 


       .. code-block:: Terminal 

          (Contents of "matrixA.txt")
              12 18 3  
              15 25 30


All
===
   Description: 
       Determines whether all values in a one-dimensional or two-dimensional array are true.
       This method checks each element in the input array and returns true only if all values are true; otherwise, false.

       .. code-block:: CSharp 

          bool All(bool[] A)
          bool All(bool[,] A)
   Parameters: 
       A: 
         The array of Boolean values to evaluate.
   Returns: 
       True, if all elements in the array are true; otherwise, false.
   Example: 
       Check if all values in a Boolean array or matrix are true:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          bool[] flags = { true, true, true };
      
          // Evaluate
          bool result = All(flags);
      
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          True


Any
===
   Description: 
       Determines whether any value in a one-dimensional or two-dimensional array is true.
       This method checks each element in the input array and returns true if at least one value is true; otherwise, false.

       .. code-block:: CSharp 

          bool Any(bool[] A)
          bool Any(bool[,] A)
   Parameters: 
       A: 
         The array of Boolean values to evaluate.
   Returns: 
       True, if at least one element in the array is true; otherwise, false.
   Example: 
       Check if any value in an array or matrix is true

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          bool[] flags = { false, false, true };
      
          // Evaluate
          bool result = Any(flags);
      
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          True


Find
====
   Description: 
       Returns the indices of true values in a Boolean array or matrix, up to a maximum of k matches.
       This method scans the input array and collects the positions of all values that evaluate to true, up to the specified limit.

       .. code-block:: CSharp 

          Indexer Find(bool[] A, int k = int.MaxValue)
          Indexer Find(bool[,] A, int k = int.MaxValue)
   Parameters: 
       A: 
         The Boolean array to search for matching true entries.
       k: 
         The maximum number of matching indices to return. Defaults to int.MaxValue if not specified.
   Returns: 
       An Indexer object representing the index where the array values are true, up to a maximum of k entries.
   Example: 
       Find up to 3 indices where values are true:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          bool[] mask = { false, true, false, true, true, true };
      
          // Find first 3 matching indices
          Indexer result = Find(mask, 3);
      
          // Display result
          foreach (int i in result)
              Console.Write(i + " ");

      Output: 


       .. code-block:: Terminal 

          1 3 4


DivRem
======
   Description: 
       Computes the quotient and remainder of integer division.
       This method performs an integer division of a dividend, a by a divisor, b and returns both the quotient and remainder as a tuple.

       .. code-block:: CSharp 

          (int, int) DivRem(int a, int b)
   Parameters: 
       a: 
         The dividend—value to be divided.
       b: 
         The divisor—value by which to divide.
   Returns: 
       A tuple containing the integer quotient and remainder:(quotient, remainder).
   Example: 
       Divide 17 by 5 and get both the quotient and remainder:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
      
          // Perform division
          (int q, int r) = DivRem(17, 5);
      
          Console.WriteLine($"Quotient: {q}, Remainder: {r}");

      Output: 


       .. code-block:: Terminal 

          Quotient: 3, Remainder: 2


Num2Str
=======
   Description: 
       Converts a double-precision floating-point number to its string representation.
       This method transforms the numeric input into a human-readable string format, suitable for display or formatting purposes.

       .. code-block:: CSharp 

          string Num2Str(double num)
          string Num2Str(int num)
          string Num2Str(Complex num)
   Parameters: 
       num: 
           The <c>double</c> value to be converted.
   Returns: 
       A <c>string</c> that represents the given double-precision number.
   Example: 
       Convert a double value to a string:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
      
          double pi = 3.14159;
          string result = Num2Str(pi);
      
          Console.WriteLine($"Pi as string: {result}");

      Output: 


       .. code-block:: Terminal 

          Pi as string: 3.14159


Arrayfun
========
   Description: 
       Applies a scalar function to each element of a column vector or row vector or matrix.
       This method maps a user-defined function across every element in the input array or matrix and produces a transformed array or matrix of the same size.

       .. code-block:: CSharp 

          ColVec Arrayfun(Func&lt;double, double&gt; fun, ColVec X)
          ColVec Arrayfun(Func<double, double, double> fun, ColVec X, ColVec Y)
          RowVec Arrayfun(Func<double, double> fun, RowVec X)
          RowVec Arrayfun(Func<double, double, double> fun, RowVec X, RowVec Y)
          Matrix Arrayfun(Func<double, double> fun, Matrix X)
          Matrix Arrayfun(Func<double, double, double> fun, Matrix X, Matrix Y)
   Parameters: 
       fun: 
           A unary function that defines how each element should be transformed.
       X: 
         The input column vector or row vector or matrix whose elements will be transformed.
       Y: 
         The second column vector or row vector or matrix of input values.
   Returns: 
       A new array or matrix with each element equal to function of inputed values where variable x is the corresponding element in variable X.
   Example: 
       Apply the square root function to a column vector:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
           
          // Create column vector
          ColVec vec = new double[] { 1.0, 9.0, 16 64.0 };
      
          // Apply transformation
          ColVec result = Arrayfun(Sqrt, vec);
      
          // Display result
          for (int i = 0; i < result.Rows; i++)
              Console.WriteLine(result[i, 0]);

      Output: 


       .. code-block:: Terminal 

          1  
          2  
          3  
          5


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


Zeros
=====
   Description: 
       Generates a one-dimensional  0r two-dimensional array of zeros with specified dimensions.
       This method creates a vector of M rows or matrix of M rows and N columns, where every element is initialized to zero.

       .. code-block:: CSharp 

          double[] Zeros(int N)
          double[,] Zeros(int M, int N)
          double[,] Zeros(int[] S)
   Parameters: 
       M: 
         The number of rows in the resulting matrix.
       N: 
         The number of columns in the resulting matrix.
       S: 
         The number of equal columns and rows in the resulting matrix.
   Returns: 
       An array of vector of size M or matrix of size M by N filled with zeros.
   Example: 
       Create a 3x4 matrix of zeros:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Generate 4 by 3 matrix 
          Matrix zeros = Zeros(3, 4);
      
          // Display matrix
          Console.WriteLine(zeros);
          

      Output: 


       .. code-block:: Terminal 

           0.0000    0.0000    0.0000    0.0000
           0.0000    0.0000    0.0000    0.0000
           0.0000    0.0000    0.0000    0.0000


Ones
====
   Description: 
       Generates a two-dimensional array of ones with specified dimensions.
       This method creates a matrix of M rows and N columns, where every element is initialized to 1.0.

       .. code-block:: CSharp 

          double[] Ones(int M)
          double[,] Ones(int M, int N)
          double[,] Ones(int[] S) 
   Parameters: 
       M: 
         The number of rows in the resulting matrix.
       N: 
         The number of columns in the resulting matrix.
       S: 
         Array of integer rows and columns in the resulting matrix.
   Returns: 
       An array of vector of size M or matrix of size M by N filled with ones.
   Example: 
       Create a 2x3 matrix of ones:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          //Generate Matrix 2 by 3 with all the element has 1.0
          Matrix ones = Ones(2, 3);
      
          // Display matrix
          Console.WriteLine(ones);
          

      Output: 


       .. code-block:: Terminal 

          1.0000    1.0000    1.0000
          1.0000    1.0000    1.0000


Repmat
======
   Description: 
       Replicates a scalar value across a one-dimensional array or two-dimensional matrix of specified size.
       This method returns a vector of size M or matrix of size M x N in which every element is initialized to the scalar value <c>A</c>.

       .. code-block:: CSharp 

          double[] Repmat(double A, int M)
          double[,] Repmat(double A, int M, int N)
          double[,] Repmat(double A, int[] S)
          Matrix Repmat(Matrix A, int M, int N)
          Matrix Repmat(Matrix A, int[] S)
   Parameters: 
       A: 
         The scalar value or matrix to replicate.
       M: 
         The number of rows in the resulting matrix.
       N: 
         The number of columns in the resulting matrix.
       S: 
         Array of integer rows and columns in the resulting matrix.
   Returns: 
       A matrix of dimensions M x N where all values are equal to A.
   Example: 
       Create a 2x4 matrix filled with the value 3.14:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Replicate all elements of a matrix same.
          Matrix replicated = Repmat(pi, 2, 4);
      
          // Display matrix
          Console.WriteLine(replicated);
          

      Output: 


       .. code-block:: Terminal 

          3.1416    3.1416    3.1416    3.1416
          3.1416    3.1416    3.1416    3.1416


Repelem
=======
   Description: 
       Replicates each element of a matrix a specified number of times along both axes.
       This method expands the input matrix by repeating each element M times row-wise (vertically) and N times column-wise (horizontally), returning the result as a new Matrix with repetitive elements.

       .. code-block:: CSharp 

          Matrix Repelem(Matrix A, int M, int N)
   Parameters: 
       A: 
         The input matrix whose elements will be replicated.
       M: 
         The number of times to repeat each element along the row (vertical) direction.
       N: 
         The number of times to repeat each element along the column (horizontal) direction.
   Returns: 
       A new Matrix instance containing the expanded result with replicated elements.
   Example: 
       Create a 4x6 matrix by replicating a 2x2 matrix:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Create a 2 by 2 matrix
          Matrix A  = new double[,]{{1, 2},{3,4}};
      
          // Apply element-wise replication
          Matrix expanded = Repelem(A, 2, 3);
      
          // Display result
          Console.WriteLine(expanded);

      Output: 


       .. code-block:: Terminal 

          1.0000    1.0000    1.0000    2.0000    2.0000    2.0000
          1.0000    1.0000    1.0000    2.0000    2.0000    2.0000
          3.0000    3.0000    3.0000    4.0000    4.0000    4.0000
          3.0000    3.0000    3.0000    4.0000    4.0000    4.0000


Kron
====
   Description: 
       Computes the Kronecker product of two matrices.
       This method generates a block matrix by multiplying each element of matrix X by the entire matrix Y, preserving the structure of X.

       .. code-block:: CSharp 

          Matrix Kron(Matrix X, Matrix Y)
   Parameters: 
       X: 
         The first matrix (left operand) of the Kronecker product.
       Y: 
         The second matrix (right operand) of the Kronecker product.
   Returns: 
       A Matrix representing the Kronecker product of X and Y.
   Example: 
       Compute the Kronecker product of two 2x2 matrices:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
           
          // create a 2 by 2 matrix
          Matrix A = new double[,]{{1, 2},{3, 4}};;
            
          // create a 2 by 2 matrix
          Matrix B = new double[,]{{0, 5},{6, 7}};
      
          // Compute Kronecker product
          Matrix result = Kron(A, B);
      
          // Display result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

           0.0000    5.0000    0.0000   10.0000
           6.0000    7.0000   12.0000   14.0000
           0.0000   15.0000    0.0000   20.0000
          18.0000   21.0000   24.0000   28.0000


Rand
====
   Description: 
       Generates a one-dimensional or two-dimensional matrix of random double-precision values between 0.0 (inclusive) and 1.0 (exclusive).
       This method creates a matrix with M rows and N columns, where each element is independently sampled from a uniform distribution.

       .. code-block:: CSharp 

          double[] Rand(int N)
          double[,] Rand(int M, int N)
          double[,] Rand(int[] Size)
   Parameters: 
       M: 
         The number of rows in the output matrix.
       N: 
         The number of columns in the output matrix.
       Size: 
            A vector of two integer elements.
   Returns: 
       An array (vector) of size M or matrix of size M x N populated with random values in the range [0.0, 1.0).
   Example: 
       Create a 3x3 matrix of random doubles:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
           
          Matrix randomMatrix = Rand(3, 3);
      
          // Print matrix contents
          Console.WriteLine(randomMatrix);

      Output: 


       .. code-block:: Terminal 

          0.7258    0.2380    0.9046
          0.4605    0.5800    0.3383
          0.5736    0.5158    0.6105


Randn
=====
   Description: 
       Generates an array (Vector) or matrix of normally distributed random double values.
       This method creates a vector of size M or M * N matrix with each element independently sampled from a normal distribution characterized by the specified <c>mean</c> and <c>standard deviation</c>.

       .. code-block:: CSharp 

          double[] Randn(int N, double mean = 0, double std = 1)
          double[,] Randn(int M, int N, double mean = 0, double standardDeviation = 1)
          double[,] Randn(int[] Size, double mean = 0, double std = 1) => Randn(Size[0], Size[1], mean, std);
   Parameters: 
       M: 
         The number of rows in the resulting matrix.
       N: 
         The number of columns in the resulting matrix.
       mean: 
            The mean (μ) of the normal distribution. Default is 0.
       standardDeviation: 
                         The standard deviation (σ) of the normal distribution. Default is 1.
   Returns: 
       An array (vector) of size M or matrix of dimensions M x N filled with normally distributed random values.
   Example: 
       Create a 2x3 matrix sampled from N(5, 2²):

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          Matrix randval = Randn(2, 3, 5.0, 2.0);
      
          // Display result
          Console.WriteLine(randval)

      Output: 


       .. code-block:: Terminal 

          7.0471    4.1810    1.8153
          3.1696    3.8715    4.8268
          7.8102    3.7101    6.7009


Randt
=====
   Description: 
       Generates a matrix of random double values from a triangular distribution.
       This method creates an M x N matrix where each element is independently sampled from a triangular distribution defined by minimum bound value, mode of distribution likely, and maximum bound value.

       .. code-block:: CSharp 

          double[] Randt(int N, double min = 0.0, double likely = 0.5, double max = 1.0)
          double[,] Randt(int M, int N, double min = 0.0, double likely = 0.5, double max = 1.0)
          double[,] Randt(int[] Size, double min = 0.0, double likely = 0.5, double max = 1.0) => RandTri(Size[0], Size[1], min, likely, max)
   Parameters: 
       M: 
         The number of rows in the resulting matrix.
       N: 
         The number of columns in the resulting matrix.
       min: 
           The minimum value of the triangular distribution (lower bound).
       likely: 
              The most likely (mode) value of the triangular distribution.
       max: 
           The maximum value of the triangular distribution (upper bound).
   Returns: 
       An array (vector) of dimension M or matrix of dimensions M x N populated with random values drawn from the specified triangular distribution.
   Example: 
       Create a 2x3 matrix sampled from a triangular distribution between 10 and 20 with a peak at 15:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          Matrix triMatrix = Randt(2, 3, 10, 15, 20);
      
          // Display result// Display result
          Console.WriteLine(triMatrix);

      Output: 


       .. code-block:: Terminal 

          13.2676   15.2280   17.8264
          13.2270   11.4989   17.5193


Linspace
========
   Description: 
       Generates a linearly spaced array of double values between two endpoints.
       This method produces a one-dimensional array of N evenly spaced values from a to b, inclusive. If N is 1, the array contains just a.

       .. code-block:: CSharp 

          double[] Linspace(double a, double b, int N = 100)
   Parameters: 
       a: 
         The starting value of the range.
       b: 
         The ending value of the range.
       N: 
         The number of evenly spaced points to generate. Default is 100.
   Returns: 
       An array containing N linearly spaced values between a and b.
   Example: 
       Generate 10 points from -1 to 1:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          //Generate point from -1 to 1
          RowVec line = Linspace(-1.0, 1.0, 10);
      
          // Display result
          Console.WriteLine(line);

      Output: 


       .. code-block:: Terminal 

           -1.0000   -0.7778   -0.5556   -0.3333   -0.1111    0.1111    0.3333    0.5556    0.7778    1.0000


Logspace
========
   Description: 
       Generates a logarithmically spaced array of double values between powers of 10.
       This method creates a one-dimensional array with N values spaced evenly on a logarithmic scale, ranging from <c>10^a</c> to <c>10^b</c>, inclusive.

       .. code-block:: CSharp 

          double[] Logspace(double a, double b, int N = 100)
   Parameters: 
       a: 
         The base-10 exponent of the starting value (10^a).
       b: 
         The base-10 exponent of the ending value (10^b).
       N: 
         The number of points to generate. Default is 100.
   Returns: 
       An array of N values logarithmically spaced between 10^a and 10^b.
   Example: 
       Generate 5 values from 10⁰ to 10²:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Generate logarithmically space between 1 and 100 inclusive
          RowVec freqs = Logspace(0, 2, 5);
      
          // Display result,
          Console.WriteLine(freqs);

      Output: 


       .. code-block:: Terminal 

          1.0000    3.1623   10.0000   31.6228  100.0000


Interp1
=======
   Description: 
       Performs one-dimensional linear interpolation.
       This method estimates the output value at a query point <c>x</c> by linearly interpolating between known data points in <c>X</c> and corresponding values in <c>Y</c>.

       .. code-block:: CSharp 

          double Interp1(ColVec X, ColVec Y, double x)
          ColVec Interp1(ColVec X, ColVec Y, ColVec x)
          double Interp1(RowVec X, RowVec Y, double x)
          RowVec Interp1(RowVec X, RowVec Y, RowVec x)
          RowVec Interp1(ColVec X, Matrix Y, double x)
          ColVec Interp1(RowVec X, Matrix Y, double x)
          double Interp2(ColVec X, RowVec Y, Matrix Z, double x, double y)
   Parameters: 
       X: 
         A column vector containing the known x-coordinates, which must be sorted in ascending order.
       Y: 
         A column vector containing the corresponding y-values.
       x: 
         The x-value at which to evaluate the interpolated result.
   Returns: 
       A scalar value representing the linearly interpolated value at the given point x.
   Example: 
       Estimate a y-value at x = 1.5 from lookup data using linear interpolation:

       .. math::
          \begin{array}{rl}
                &X = 0.0,   1.0,   2.0,   3.0 \\
                &Y = 0.0,   10.0,  20.0,  30.0 \\   
          \end{array}

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
       
          ColVec X = new ColVec(new double[] { 0.0, 1.0, 2.0, 3.0 });
          ColVec Y = new ColVec(new double[] { 0.0, 10.0, 20.0, 30.0 });
      
          double x = 1.5;
          double y = Interp1(X, Y, x);
      
          Console.WriteLine($"Interpolated value at x=1.5: {y}");

      Output: 


       .. code-block:: Terminal 

          Interpolated value: 15


Getcol
======
   Description: 
       Extracts a specified column from a two-dimensional array.
       This method retrieves the column at index j from the input matrix data and returns it as a one-dimensional array.

       .. code-block:: CSharp 

          double[] Getcol(int j, double[,] data)
   Parameters: 
       j: 
         The zero-based index of the column to extract.
       data: 
            The two-dimensional array from which the column will be retrieved.
   Returns: 
       An array representing the j_th column of the matrix data.
   Example: 
       Extract the first column from a 3x3 matrix:

       .. code-block:: CSharp 

          // import libraries 
          using System;
      
          using static SepalSolver.Math;
          
          // Create 3 by 3 matrix
          double[,] matrix = new double[,] {{ 1.0, 2.0, 3.0 },{ 4.0, 5.0, 6.0 }, { 7.0, 8.0, 9.0 }};
      
          // Get column 0 (first column)
          ColVec col = Getcol(0, matrix);
      
          // Display
          Console.WriteLine(col);

      Output: 


       .. code-block:: Terminal 

             1.0000
             4.0000
             7.0000


Getrow
======
   Description: 
       Extracts a specified row from a two-dimensional array.
       This method retrieves the row at index i from the input matrix data and returns it as a one-dimensional array.

       .. code-block:: CSharp 

          double[] Getrow(int i, double[,] data)
   Parameters: 
       i: 
         The index of the row to extract.
       data: 
            The two-dimensional array from which the row will be retrieved.
   Returns: 
       An array representing the i-th row of matrix data element.
   Example: 
       Extract the third row from a 4x3 matrix:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Create a 4 by 3 matrix
          double[,] matrix = {{ 1.0, 2.0, 3.0 },{ 4.0, 5.0, 6.0 },{ 7.0, 8.0, 9.0 },{ 10.0, 11.0, 12.0 }};
      
          // Get row 2 (third row)
          RowVec row = Getrow(2, matrix);
          
          // Output the matrix
          Console.WriteLine(row);

      Output: 


       .. code-block:: Terminal 

          7.0000    8.0000    9.0000


Getcols
=======
   Description: 
       Extracts specified columns from a two-dimensional array using an indexer.
       This method returns a new Matrix containing only the columns of data specified by the I-indexer.

       .. code-block:: CSharp 

          Matrix Getcols(indexer I, double[,] data)
   Parameters: 
       I: 
         An indexer object specifying the zero-based column indices to select.
       data: 
            The two-dimensional array from which columns are extracted.
   Returns: 
       A Matrix composed of the selected columns from the input matrix data, in the order defined by I-indexer.
   Example: 
       Extract columns 1 and 3 from a 3x4 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // Create a 3 by 4 matrix
          double[,] matrix = new double[,]
          {
              { 10, 20,  30,  40  },
              { 50, 60,  70,  80  },
              { 90, 100, 110, 120 }
          };
          
          // Extract the 2nd and 4th columns
          Matrix cols = Getcols([1,3], matrix);
          
          // Output the extracted matrix
          Console.WriteLine(cols);

      Output: 


       .. code-block:: Terminal 

           20.0000   40.0000
           60.0000   80.0000
          100.0000  120.0000


Getrows
=======
   Description: 
       Extracts specified rows from a two-dimensional array using an indexer.
       This method returns a new Matrix data composed of the rows from matrix data that correspond to the indices specified by I-indexer.

       .. code-block:: CSharp 

          Matrix Getrows(indexer I, double[,] data)
   Parameters: 
       I: 
         An indexer object that specifies the zero-based indices of the rows to extract.
       data: 
            The two-dimensional array from which rows will be selected.
   Returns: 
       A Matrix containing the rows of data specified by I-indexer, in the same order.
   Example: 
       Extract the 1st and 3rd rows from a 4x3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 4 by 3 matrix
          double[,] matrix = new double[,]
          {
              { 10, 20,  30,  40  },
              { 50, 60,  70,  80  },
              { 90, 100, 110, 120 }
          };
          
          // Extract the first and third rows
          Matrix rows = Getrows([0, 2], matrix);
      
          // Output the extracted matrix
          Console.WriteLine(rows);

      Output: 


       .. code-block:: Terminal 

          10.0000   20.0000   30.0000   40.0000
          90.0000  100.0000  110.0000  120.0000


Hcart
=====
   Description: 
       Horizontally concatenates a scalar with a row vector. Also concatenates a matrix with a matrix. The two matrices must have equal row count.
       This method concatenate a scalar value to a vector or matrix to a matrix and other combination returning a new vector or matrix with an additional leading element.

       .. code-block:: CSharp 

          RowVec Hcart(double a, RowVec B)
          RowVec Hcart(RowVec A, double b)
          RowVec Hcart(RowVec A, RowVec B
          RowVec Hcart(RowVec A, params RowVec[] RowVecs)
          Matrix Hcart(Matrix A, Matrix B)
          Matrix Hcart(Matrix A, params Matrix[] Matrices)
   Parameters: 
       a, b: 
            The scalar value to prepend.
       A, B: 
            The input array (row or column vector) or matrix to which a will be prepended.
   Returns: 
       A vector or matrix consisting of concatenated values.
   Example: 
       Concatenate the value 1.0 to a row vector:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
      
          // Create a row vector
          RowVec B = new RowVec(new double[] { 2.0, 3.0, 4.0 });
          
          // Concatenate the scaler value and the vector together.
          RowVec result = Hcart(1.0, B);
          
          // Output the result
          console.writeline($"The concatenated matrix is: {rows}")

      Output: 


       .. code-block:: Terminal 

          1 2 3 4
   Example: 
       Horizontally concatenate two 2x2 matrices:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // Create a 2 by 2 matrix
          Matrix A = new double[,] {
              { 1, 2 },
              { 3, 4 }
          };
          
          // Create a 2 by 2 matrix
          Matrix B = new double[,] {
              { 5, 6 },
              { 7, 8 }
          };
          Concatenate the two matrix together
          Matrix result = Hcart(A, B);
      
          // Output the result
          console.writeline($"The concatenated matrix is: {result}")

      Output: 


       .. code-block:: Terminal 

          1 2 5 6  
          3 4 7 8


Vcart
=====
   Description: 
       Vertically concatenates a scalar with a column vector or concatenates a matrix with a matrix. The two matrices must equal column count.
       concatenate a scalar value to a vector or matrix to a matrix and other combination returning a new vector or matrix with an additional leading element. 

       .. code-block:: CSharp 

          ColVec Vcart(double a, ColVec B)
          ColVec Vcart(ColVec A, double b)
          ColVec Vcart(ColVec A, ColVec B)
          ColVec Vcart(ColVec A, params ColVec[] ColVecs)
          Matrix Vcart(Matrix A, Matrix B)
          Matrix Vcart(Matrix A, params Matrix[] Matrices)
   Parameters: 
       a, b: 
            The scalar value to be placed at the top or below of the resulting vector.
       A, B: 
            The input column vector or matrix whose elements will appear before or after a.
   Returns: 
       A vector or matrix consisting of a followed by the entries of B.
   Example: 
       Prepend a scalar to a column vector:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a vector
          ColVec B = new double[] { 2.0, 3.0, 4.0 };
          
          // Concatenate the scalar value and the vector together
          ColVec result = Vcart(1.0, B);
      
          // Output the result
          console.writeline($"The concatenated matrix is: {result}")

      Output: 


       .. code-block:: Terminal 

          1  
          2  
          3  
          4
   Example: 
       Vertically concatenate two 2x2 matrices:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create 2 by 2 matrix
          Matrix A = new Matrix(new double[,] {
              { 1, 2 },
              { 3, 4 }
          });
          // Create 2 by 2 matrix
          Matrix B = new Matrix(new double[,] {
              { 5, 6 },
              { 7, 8 }
          });
      
          //Concatenate the two matrices
          Matrix result = Vcart(A, B);
      
          // Output the result
          console.writeline($"The concatenated matrix is: {result}")

      Output: 


       .. code-block:: Terminal 

          1 2  
          3 4  
          5 6  
          7 8


Pow
===
   Description: 
       Raises a real or complex numbers or elements in a vector or matrix to the power of another.
       This method computes the result of raising x to the power n, returning x^n.

       .. code-block:: CSharp 

          Pow(double x, double n)
          Pow(Complex x, double n)
          Pow(double x, Complex n)
          Pow(Complex x, Complex n)
   Parameters: 
       x: 
         The base value.
       n: 
         The exponent value (can be negative, fractional, or zero).
   Returns: 
       A value(s) representing x raised to the power n.
   Example: 
       Compute 2 raised to the power 3:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
      
          // Raise 2 to the power of 3
          double result = Pow(2.0, 3.0);
          Console.WriteLine($"2³ = {result}");

      Output: 


       .. code-block:: Terminal 

          2³ = 8


Diff
====
   Description: 
       Computes the first-order discrete difference of a one-dimensional or two-dimensional array.
       This method returns a new array where each element is the difference between consecutive elements of the input array X.

       .. code-block:: CSharp 

          double[] Diff(double[] X)
          ColVec Diff(ColVec X) 
          RowVec Diff(RowVec X) 
          double[,] Diff(double[,] X, int dim = 0)
          Matrix Diff(Matrix X, int dim = 0)
   Parameters: 
       X: 
         A one-dimensional or two-dimensional array of double values. Must contain at least two elements.
   Returns: 
       A new array of size less than 1 , where each element is the difference X[i+1] - X[i].
   Example: 
       Compute differences in a numeric sequence:'[ 1.0, 4.0, 9.0, 16.0]'

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a vector
          double[] values = new double[] { 1.0, 4.0, 9.0, 16.0 };
          
          // Calculate the vector differences 
          double[] delta = Diff(values);
      
          foreach (double d in delta)
              Console.Write(d + " ");

      Output: 


       .. code-block:: Terminal 

          3 5 7


Round
=====
   Description: 
       Rounds a floating-point number or complex number or each element in a vector or matrix to a specified number of decimal places.
       This method returns a double value rounded to the nearest number with the specified number of decimal places using standard rounding rules (round half to even).

       .. code-block:: CSharp 

          double Round(double x, int decP = 0)
          Complex Round(Complex c, int decP = 0)
          Matrix Round(Matrix x, int decP = 0)
          ColVec Round(ColVec x, int decP = 0)
          RowVec Round(RowVec x, int decP = 0)
          SparseMatrix Round(SparseMatrix x, int decP = 0)
          SparseColVec Round(SparseColVec x, int decP = 0)
          SparseRowVec Round(SparseRowVec x, int decP = 0)
   Parameters: 
       x: 
         The double-precision floating-point number or complex number or each element in a vector or matrix to be rounded.
       decP: 
            The number of decimal places to round to. Default is 0 (rounds to nearest integer). Must be between 0 and 15.
   Returns: 
       A double value rounded to the specified number of decimal places.
   Example: 
       Round a number, 3.14159 to the nearest integer:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a double value
          double value = 3.14159;
          
          // Round to nearest integer (default behavior)
          double result = Round(value, 0);
      
          // Output the result
          console.writeline($"The rounded value is: {result}")

      Output: 


       .. code-block:: Terminal 

          3


Sqrt
====
   Description: 
       Calculates the square root of a specified number.
       This method returns the positive square root of the input value. For negative inputs, the result is NaN (Not a Number).

       .. code-block:: CSharp 

          double Sqrt(double x)
          Complex Sqrt(Complex x)
          Matrix Sqrt(Matrix x)
          ColVec Sqrt(ColVec x)
          RowVec Sqrt(RowVec x)
          SparseMatrix Sqrt(SparseMatrix x)
          SparseColVec Sqrt(SparseColVec x)
          SparseRowVec Sqrt(SparseRowVec x)
   Parameters: 
       x: 
         The number whose square root is to be calculated. Must be non-negative for real results.
   Returns: 
       The positive square root of x. Returns NaN if x is negative, and positive infinity if x is positive infinity.
   Example: 
       Calculate the square root of a positive number, 25:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a double value
          double value = 25.0;
          
          // Calculate the square root
          double result = Sqrt(value);
      
          // Output the result
          console.writeline($"The square root is: {result}")

      Output: 


       .. code-block:: Terminal 

          5


Sqr
===
   Description: 
       Calculates the square of a specified number.
       This method returns the result of multiplying the input value by itself (x * x).

       .. code-block:: CSharp 

          double Sqr(double x)
          Complex Sqr(Complex x)
          Matrix Sqr(Matrix x)
          ColVec Sqr(ColVec x)
          RowVec Sqr(RowVec x)
          SparseMatrix Sqr(SparseMatrix x)
          SparseColVec Sqr(SparseColVec x)
          SparseRowVec Sqr(SparseRowVec x)
   Parameters: 
       x: 
         The number to be squared.
   Returns: 
       The square of x (x * x). Returns positive infinity if the result overflows.
   Example: 
       Calculate the square of a positive number:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a double value
          double value = 5.0;
          
          // Calculate the square
          double result = Sqr(value);
      
          // Output the result
          console.writeline($"The square is: {result}")

      Output: 


       .. code-block:: Terminal 

          25


Floor
=====
   Description: 
       Returns the largest integer less than or equal to the specified number.
       This method rounds down to the nearest integer, always moving toward negative infinity regardless of the sign of the input.

       .. code-block:: CSharp 

          double Floor(double x)
   Parameters: 
       x: 
         The double-precision floating-point number to floor.
   Returns: 
       The largest integer less than or equal to x. If x is already an integer, returns x unchanged.
   Example: 
       Floor a positive decimal number:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a positive decimal value
          double value = 4.7;
          
          // Calculate the floor
          double result = Floor(value);
      
          // Output the result
          console.writeline($"The floor is: {result}")

      Output: 


       .. code-block:: Terminal 

          4


Ceil
====
   Description: 
       Returns the smallest integer greater than or equal to the specified number.
       This method rounds up to the nearest integer, always moving toward positive infinity regardless of the sign of the input.

       .. code-block:: CSharp 

          double Ceil(double x)
   Parameters: 
       x: 
         The double-precision floating-point number to ceiling.
   Returns: 
       The smallest integer greater than or equal to x. If x is already an integer, returns x unchanged.
   Example: 
       Ceiling a positive decimal number:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a positive decimal value
          double value = 4.2;
          
          // Calculate the ceiling
          double result = Ceil(value);
      
          // Output the result
          console.writeline($"The ceiling is: {result}")

      Output: 


       .. code-block:: Terminal 

          5


Max
===
   Description: 
       Returns the larger of two or more real or, floating-point number or maximum among elelments of a vector or matrices.
       This method compares two integer values and returns the one with the greater value.

       .. code-block:: CSharp 

          int Max(int A, int B)
          Max(double A, double B)
          Complex Max(Complex A, Complex B)
          Complex Max(Complex A, Complex B)
   Parameters: 
       A: 
         The first scalar, array or matrix to compare.
       B: 
         The second scaler, array or matrix to compare.
   Returns: 
       The maximum number from two or more given vectors or matrices. If A and B are equal, returns either value.
   Example: 
       Find the maximum of two positive integers:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create two integer values
          int valueA = 15;
          int valueB = 23;
          
          // Find the maximum
          int result = Max(valueA, valueB);
      
          // Output the result
          console.writeline($"The maximum is: {result}")

      Output: 


       .. code-block:: Terminal 

          23
   Example: 
       Find the element-wise maximum of two 2x2 matrices:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create first 2x2 matrix
          Matrix A = new Matrix(new double[,] {
              { 1, 8 },
              { 5, 2 }
          });
          
          // Create second 2x2 matrix
          Matrix B = new Matrix(new double[,] {
              { 3, 4 },
              { 1, 7 }
          });
          
          // Find element-wise maximum
          Matrix result = Max(A, B);
      
          // Output the result
          console.writeline($"The maximum is: {result}")

      Output: 


       .. code-block:: Terminal 

          3 8
          5 7


Min
===
   Description: 
       Returns the smaller of two 32-bit signed integers.
       This method compares two integer values and returns the one with the lesser value.

       .. code-block:: CSharp 

          int Min(int A, int B)
          double Min(double A, double B)
          Complex Min(Complex A, Complex B)
          Matrix Min(Matrix A, Matrix B)
          Matrix Min(Matrix A, double b)
          Matrix Min(double b, Matrix A)
          ColVec Min(ColVec A, ColVec B)
          ColVec Min(ColVec A, double b)
          ColVec Min(double b, ColVec A)
          RowVec Min(RowVec A, RowVec B)
          RowVec Min(RowVec A, double b)
          RowVec Min(double b, RowVec A)
   Parameters: 
       A: 
         The first integer to compare.
       B: 
         The second integer to compare.
   Returns: 
       The smaller of the two input values. If A and B are equal, returns either value.
   Example: 
       Find the minimum of two positive integers:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create two integer values
          int valueA = 15;
          int valueB = 23;
          
          // Find the minimum
          int result = Min(valueA, valueB);
      
          // Output the result
          console.writeline($"The minimum is: {result}")

      Output: 


       .. code-block:: Terminal 

          15


Sin
===
   Description: 
       Calculates the sine of the specified angle in radians.
       This method returns the sine of the input angle, where the angle is measured in radians. The result is between -1 and 1.

       .. code-block:: CSharp 

          double Sin(double x)
          Complex Sin(Complex x)
          Matrix Sin(Matrix x)
          ColVec Sin(ColVec x)
          RowVec Sin(RowVec x)
          SparseMatrix Sin(SparseMatrix x)
          SparseColVec Sin(SparseColVec x)
          SparseRowVec Sin(SparseRowVec x)
   Parameters: 
       x: 
         The angle in radians for which to calculate the sine.
   Returns: 
       The sine of x, ranging from -1 to 1. Returns  0 if x is positive or negative infinity.
   Example: 
       Calculate the sine of common angles:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Calculate sine of π/2 radians (90 degrees)
          double angle = Pi / 2;
          double result = Sin(angle);
          
          // Output the result
          console.writeline($"Sin(π/2) = {result}")

      Output: 


       .. code-block:: Terminal 

          Sin(π/2) = 1


Asin
====
   Description: 
       Calculates the arcsine (inverse sine) of the specified value.
       This method returns the angle in radians whose sine is the specified value. The input must be between -1 and 1, and the result is between -π/2 and π/2.

       .. code-block:: CSharp 

          double Asin(double x)
          Complex Asin(Complex x)
          Matrix Asin(Matrix x)
          ColVec Asin(ColVec x)
          RowVec Asin(RowVec x)
          SparseMatrix Asin(SparseMatrix x)
          SparseColVec Asin(SparseColVec x)
          SparseRowVec Asin(SparseRowVec x)
   Parameters: 
       x: 
         The sine value for which to calculate the arcsine. Must be between -1 and 1 inclusive.
   Returns: 
       The angle in radians whose sine equals x, ranging from -π/2 to π/2. Returns NaN if x is outside the range [-1, 1].
   Example: 
       Calculate the arcsine of common values:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Calculate arcsine of 1 (which should be π/2)
          double value = 1.0;
          double result = Asin(value);
          
          // Output the result
          console.writeline($"Asin(1) = {result}")

      Output: 


       .. code-block:: Terminal 

          Asin(1) = 1.5707963267948966
   Example: 
       Calculate the arcsine of zero and negative values:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Calculate arcsine of 0 and -1
          double asinZero = Asin(0);
          double asinNegativeOne = Asin(-1);
      
          // Output the results
          console.writeline($"Asin(0) = {asinZero}")
          console.writeline($"Asin(-1) = {asinNegativeOne}")

      Output: 


       .. code-block:: Terminal 

          Asin(0) = 0
          Asin(-1) = -1.5707963267948966


Cos
===
   Description: 
       Calculates the cosine of the specified angle in radians.
       This method returns the cosine of the input angle, where the angle is measured in radians. The result is between -1 and 1.

       .. code-block:: CSharp 

          double Cos(double x)
          Complex Cos(Complex x)
          Matrix Cos(Matrix x)
          ColVec Cos(ColVec x)
          RowVec Cos(RowVec x)
          SparseMatrix Cos(SparseMatrix x)
          SparseColVec Cos(SparseColVec x)
          SparseRowVec Cos(SparseRowVec x)
   Parameters: 
       x: 
         The angle in radians for which to calculate the cosine.
   Returns: 
       The cosine of x, ranging from -1 to 1. Returns 0 if x is positive or negative infinity.
   Example: 
       Calculate the cosine of common angles:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Calculate cosine of 0 radians (0 degrees)
          double angle = 0;
          double result = Cos(angle);
          
          // Output the result
          console.writeline($"Cos(0) = {result}")

      Output: 


       .. code-block:: Terminal 

          Cos(0) = 1


Acos
====
   Description: 
       Calculates the arccosine (inverse cosine) of the specified value.
       This method returns the angle in radians whose cosine is the specified value. The input must be between -1 and 1, and the result is between 0 and π.

       .. code-block:: CSharp 

          double Acos(double x)
          Complex Acos(Complex x)
          Matrix Acos(Matrix x)
          ColVec Acos(ColVec x)
          RowVec Acos(RowVec x)
          SparseMatrix Acos(SparseMatrix x)
          SparseColVec Acos(SparseColVec x)
          SparseRowVec Acos(SparseRowVec x) 
   Parameters: 
       x: 
         A scalar number or one-dimensional or two-dimensional array for which to calculate the arccosine. Must be between -1 and 1 inclusive.
   Returns: 
       The angle in radians whose cosine equals x, ranging from 0 to π. Returns NaN if x is outside the range [-1, 1].
   Example: 
       Calculate the arccosine of common values:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Calculate arccosine of 1 (which should be 0)
          double value = 1.0;
          double result = Acos(value);
          
          // Output the result
          console.writeline($"Acos(1) = {result}")

      Output: 


       .. code-block:: Terminal 

          Acos(1) = 0


Tan
===
   Description: 
       Calculates the tangent of the specified angle in radians.
       This method returns the tangent of the input angle, where the angle is measured in radians. The tangent function has vertical asymptotes at odd multiples of π/2.

       .. code-block:: CSharp 

          double Tan(double x)
          Complex Tan(Complex x)
          Matrix Tan(Matrix x)
          ColVec Tan(ColVec x)
          RowVec Tan(RowVec x)
          SparseMatrix Tan(SparseMatrix x)
          SparseColVec Tan(SparseColVec x)
          SparseRowVec Tan(SparseRowVec x)
   Parameters: 
       x: 
         The angle in radians for which to calculate the tangent.
   Returns: 
       The tangent of x. Returns NaN if x is NaN. At odd multiples of π/2, the result approaches positive or negative infinity.
   Example: 
       Calculate the tangent of angle pi/3:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Calculate tangent of 0 radians (0 degrees)
          double angle = pi/3;
          double result = Tan(angle);
          
          // Output the result
          console.writeline($"Tan(pi/3) = {result}")

      Output: 


       .. code-block:: Terminal 

          Tan(0) = 1.7320508075688772


Atan
====
   Description: 
       Computes the arctangent (inverse tangent) of a specified number.
       This method returns the angle in radians whose tangent is the specified number. The angle is in the range -π/2 to π/2 radians.

       .. code-block:: CSharp 

          double Atan(double x)
          Complex Atan(Complex x)
          Matrix Atan(Matrix x)
          ColVec Atan(ColVec x)
          RowVec Atan(RowVec x)
          SparseMatrix Atan(SparseMatrix x)
          SparseColVec Atan(SparseColVec x)
          SparseRowVec Atan(SparseRowVec x)
   Parameters: 
       x: 
         A scalar number or one-dimensional or two-dimensional array representing a tangent value for which the arctangent is to be computed.
   Returns: 
       A double representing the arctangent of x in radians, in the range -π/2 ≤ atan(x) ≤ π/2.
   Example: 
       Calculate the arctangent of 1.0:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the input value
          double x = 1.0;
          
          // Calculate the arctangent
          double result = Atan(x);
      
          // Output the result
          Console.WriteLine($"Atan({x}) = {result} radians");
          Console.WriteLine($"Atan({x}) = {result * 180 / Math.PI} degrees");

      Output: 


       .. code-block:: Terminal 

          Atan(1) = 0.7853981633974483 radians
          Atan(1) = 45 degrees


Sinh
====
   Description: 
       Computes the hyperbolic sine of a specified number.
       This method returns the hyperbolic sine of x, defined as (e^x - e^(-x))/2. The hyperbolic sine function is an odd function with domain (-∞, +∞) and range (-∞, +∞).

       .. code-block:: CSharp 

          double Sinh(double x)
          Complex Sinh(Complex x)
          Matrix Sinh(Matrix x)
          ColVec Sinh(ColVec x)
          RowVec Sinh(RowVec x)
          SparseMatrix Sinh(SparseMatrix x)
          SparseColVec Sinh(SparseColVec x)
          SparseRowVec Sinh(SparseRowVec x)
   Parameters: 
       x: 
         A scalar number one-dimensional or two-dimensional array representing the value for which the hyperbolic sine is to be computed.
   Returns: 
       A double representing the hyperbolic sine of x.
       Returns PositiveInfinity if x is PositiveInfinity.
       Returns NegativeInfinity if x is NegativeInfinity.
       Returns NaN if x is NaN.
   Example: 
       Calculate the hyperbolic sine of a positive value:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the input value
          double x = 2.0;
          
          // Calculate the hyperbolic sine
          double result = Sinh(x);
      
          // Output the result
          Console.WriteLine($"Sinh({x}) = {result}");
          Console.WriteLine($"Verification: (e^{x} - e^(-{x}))/2 = {(Exp(x) - Exp(-x)) / 2}");

      Output: 


       .. code-block:: Terminal 

          Sinh(2) = 3.6268604078470186
          Verification: (e^2 - e^(-2))/2 = 3.6268604078470186


Cosh
====
   Description: 
       Computes the hyperbolic cosine of a specified number.
       This method returns the hyperbolic cosine of x, defined as (e^x + e^(-x))/2. The hyperbolic cosine function is an even function with domain (-∞, +∞) and range [1, +∞).

       .. code-block:: CSharp 

          double Cosh(double x)
          Complex Cosh(Complex x)
          Matrix Cosh(Matrix x)
          ColVec Cosh(ColVec x)
          RowVec Cosh(RowVec x)
          SparseMatrix Cosh(SparseMatrix x)
          SparseColVec Cosh(SparseColVec x)
          SparseRowVec Cosh(SparseRowVec x)
   Parameters: 
       x: 
         A scalar number or one-dimensional or two-dimensional array representing the value for which the hyperbolic cosine is to be computed.
   Returns: 
       A double representing the hyperbolic cosine of x, always greater than or equal to 1.
       Returns PositiveInfinity if x is PositiveInfinity or NegativeInfinity.
   Example: 
       Calculate the hyperbolic cosine of a positive value:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the input value
          double x = 1.5;
          
          // Calculate the hyperbolic cosine
          double result = Cosh(x);
      
          // Output the result
          Console.WriteLine($"Cosh({x}) = {result}");
          Console.WriteLine($"Verification: (e^{x} + e^(-{x}))/2 = {(Math.Exp(x) + Math.Exp(-x)) / 2}");

      Output: 


       .. code-block:: Terminal 

          Cosh(1.5) = 2.352409615243247
          Verification: (e^1.5 + e^(-1.5))/2 = 2.352409615243247


Tanh
====
   Description: 
       Computes the hyperbolic tangent of a given value.
       The hyperbolic tangent is defined as (e^x - e^(-x)) / (e^x + e^(-x)) and maps any real number to the range (-1, 1).

       .. code-block:: CSharp 

          double Tanh(double x)
          Complex Tanh(Complex x)
          Matrix Tanh(Matrix x)
          ColVec Tanh(ColVec x)
          RowVec Tanh(RowVec x)
          SparseMatrix Tanh(SparseMatrix x)
          SparseColVec Tanh(SparseColVec x)
          SparseRowVec Atanh(SparseRowVec x)   
   Parameters: 
       x: 
         A double-precision floating-point number representing the value for which to calculate the hyperbolic tangent.
   Returns: 
       The hyperbolic tangent of a number.
   Example: 
       Evaluate hyperbolic tangent of the number, 1

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Compute the hyperbolic tangent of a number
          double result = Tanh(1.0);
           
          // Output the result
          Console.WriteLine($"Tanh(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          Tanh(1.0) = 0.7615941559557649


Atanh
=====
   Description: 
       Calculates the inverse hyperbolic tangent (area hyperbolic tangent) of a specified value.
       The inverse hyperbolic tangent is defined as 0.5 * ln((1 + x) / (1 - x)).
       The function is undefined for values less than or equal to -1 and greater than or equal to 1.

       .. code-block:: CSharp 

          double Atanh(double x)
          Complex Atanh(Complex x)
          Matrix Atanh(Matrix x)
          ColVec Atanh(ColVec x)
          RowVec Atanh(RowVec x)
          SparseMatrix Atanh(SparseMatrix x)
          SparseColVec Atanh(SparseColVec x)
          SparseRowVec Atanh(SparseRowVec x)
   Parameters: 
       x: 
         A one-dimensional or two-dimensional array or double-precision floating-point number in the range (-1, 1), representing the value for which to compute the inverse hyperbolic tangent.
   Returns: 
       The inverse hyperbolic tangent of the number, x.
   Example: 
       Evaluate the inverse hyperbolic tangent of the number, 0.5.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Compute the inverse hyperbolic tangent of a number
          double result = Atanh(0.5);
           
          // Output the result
          Console.WriteLine($"Atanh(0.5) = {result}");

      Output: 


       .. code-block:: Terminal 

          Atanh(0.5) = 0.5493061443340549


Exp
===
   Description: 
       Computes the exponential function of the specified value.
       The exponential function is defined as e^x, where e is approximately 2.71828.

       .. code-block:: CSharp 

          double Exp(double x)
          Complex Exp(Complex x)
          Matrix Exp(Matrix x)
          ColVec Exp(ColVec x)
          RowVec Exp(RowVec x)
          SparseMatrix Exp(SparseMatrix x)
          SparseColVec Exp(SparseColVec x)
          SparseRowVec Exp(SparseRowVec x)
   Parameters: 
       x: 
         A one-dimensional or two-dimensional array or double-precision floating-point number representing the power to raise Euler's number (e) to.
   Returns: 
       The exponential of a number, i.e., e raised to the power x.
   Example: 
       Evaluate the exponential value of number, 2.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Compute the exponential of a number
          double result = Exp(2.0);
           
          // Output the result
          Console.WriteLine($"Exp(2.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          Exp(2.0) = 7.38905609893065


Log
===
   Description: 
       Calculates the natural (base e) logarithm of a specified value.
       The natural logarithm is the inverse of the exponential function. 

       .. code-block:: CSharp 

          double Log(double x)
          Complex Log(Complex x)
          Matrix Log(Matrix x)
          ColVec Log(ColVec x)
          RowVec Log(RowVec x)
          SparseMatrix Log(SparseMatrix x)
          SparseColVec Log(SparseColVec x)
          SparseRowVec Log(SparseRowVec x)
   Parameters: 
       x: 
         A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose logarithm is to be calculated.
   Returns: 
       The natural logarithm (ln) of a number.
   Example: 
       Evaluate the natural logaraithm of the number, 10

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Compute the natural logarithm of a number
          double result = Log(10.0);
           
          // Output the result
          Console.WriteLine($"Log(10.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          Log(10.0) = 2.302585092994046


Log2
====
   Description: 
       Computes the base-2 logarithm of the specified value.
       This means, to what power must 2 be raised to yield x?"

       .. code-block:: CSharp 

          double Log2(double x)
          Complex Log2(Complex x)
          Matrix Log2(Matrix x)
          ColVec Log2(ColVec x)
          RowVec Log2(RowVec x)
          SparseMatrix Log2(SparseMatrix x)
          SparseColVec Log2(SparseColVec x)
          SparseRowVec Log2(SparseRowVec x)
   Parameters: 
       x: 
         A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose base-2 logarithm is to be calculated.
   Returns: 
       The base-2 logarithm of the number, x.
   Example: 
       Evaluate log 16 to base 2.

       .. code-block:: CSharp 

           // import libraries
           using System;
           using static SepalSolver.Math;
           
           // Compute the base-2 logarithm of a number
           double result = Log2(16.0);
           
           // Output the result
           Console.WriteLine($"Log2(16.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          Log2(16.0) = 4


Log10
=====
   Description: 
       Computes the base-10 logarithm of the specified value.
       It is mean that to what power must 10 be raised to equal number x.  

       .. code-block:: CSharp 

          double Log10(double x)
          Complex Log10(Complex x)
          Matrix Log10(Matrix x)
          ColVec Log10(ColVec x)
          RowVec Log10(RowVec x)
          SparseMatrix Log10(SparseMatrix x)
          SparseColVec Log10(SparseColVec x)
          SparseRowVec Log10(SparseRowVec x)
   Parameters: 
       x: 
         A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose base-10 logarithm is to be calculated.
   Returns: 
       The base-10 logarithm (common logarithm) of the number, x.
   Example: 
       Evaluate the logarithm of 1000 to base 10.

       .. code-block:: CSharp 

           // import libraries
           using System;
           using static SepalSolver.Math;
           
           // Compute the base-10 logarithm of a number
           double result = Log10(1000.0);
           
           // Output the result
           Console.WriteLine($"Log10(1000.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          Log10(1000.0) = 3


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
          using static SepalSolver.PlotLib.Chart;
          using static SepalSolver.PlotLib.Chart.Location;
          
          // Compute besselj function
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
          I_i(x)

       .. code-block:: CSharp 

          double BesselI(int i, double x)
          Complex BesselI(int i, Complex x)
          Matrix BesselI(int i, Matrix x)
          ColVec BesselI(int i, ColVec x)
          RowVec BesselI(int i, RowVec x)
          SparseMatrix BesselI(int i, SparseMatrix x)
          SparseColVec BesselI(int i, SparseColVec x)
          SparseRowVec BesselI(int i, SparseRowVec x)
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
          
          // Compute BesselI function
          var result = Besseli(0, 2.5);
          
          // Print result
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          3.28983914405
   Example: 
       Compute the Modified Bessel function of the first kind for order 1 and value 2.0

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
       Compute the Modified Bessel function of the first kind for order 1 and value 3.0

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using SepalSolver;
          using static SepalSolver.Math;
          using static SepalSolver.PlotLib.Chart;
          using static SepalSolver.PlotLib.Chart.Location;
          
          // Compute BesselI function
          ColVec x = Linspace(0, 5);
          Matrix y = Enumerable.Range(0, 4).Select(i => BesselI(i, x)).ToList();
      
          // Plot result
          Plot(x, y);
          Axis([0, 5, 0, 15]);
          Xlabel("x-axis"); Ylabel("y-axis");
          Title("Bessel function I");
          Legend(Enumerable.Range(0, 4).Select(i => "I_"+ i + "(x)"));
          SaveAs("BesselfunctionPlotI.png");
         

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
   Parameters: 
       i: 
         The order of the Bessel function.
       x: 
         The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Bessel function of the second kind at the given order and value (must be positive).
   Example: 
       Compute the Bessel function of the second kind for order 0 and value 2.5

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
          using static SepalSolver.PlotLib.Chart;
          using static SepalSolver.PlotLib.Chart.Location;
          
          // Compute BesselY function
          ColVec x = Linspace(0.01, 10, 500);
          Matrix y = Enumerable.Range(0, 5).Select(i => BesselY(i, x)).ToList();
          
          // Plot result
          Plot(x, y);
          Axis([0, 10, -2, 1]);
          Xlabel("x-axis"); Ylabel("y-axis");
          Title("Bessel function Y");
          Legend(Enumerable.Range(0, 5).Select(i => "Y_"+ i + "(x)"), LowerRight);
          SaveAs(imagepath + "BesselfunctionPlotY.png");

      Output: 

       .. figure:: images/BesselfunctionPlotY.png
          :align: center
          :alt: BesselfunctionPlotY.png




BesselK
=======
   Description: 
       Computes the Modified Bessel function of the second kind Kₙ(x).
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
   Parameters: 
       i: 
         The order of the Bessel function.
       x: 
         The value at which to evaluate the Bessel function.
   Returns: 
       The value of the Modified Bessel function of the second kind at the given order and value (must be positive).
   Example: 
       Compute the Modified Bessel function of the first kind for order 0 and value 2.5

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
          ColVec x = Linspace(0.01, 5, 500);
          Matrix y = Enumerable.Range(0, 5).Select(i => BesselK(i, x)).ToList();
          
          // Plot result
          Plot(x, y);
          Axis([0, 5, 0, 5]);
          Xlabel("x-axis"); Ylabel("y-axis");
          Title("Bessel function K");
          Legend(Enumerable.Range(0, 5).Select(i => "K_"+ i + "(x)"));
          SaveAs(imagepath + "BesselfunctionPlotK.png");
         

      Output: 

       .. figure:: images/BesselfunctionPlotK.png
          :align: center
          :alt: BesselfunctionPlotK.png




ChebyshevT
==========
   Description: 
       Computes the Chebyshev polynomial of the first kind of degree n evaluated at x.
       This method returns the value of the nth Chebyshev polynomial T_n(x) at the specified point. Chebyshev polynomials of the first kind are defined by:
       .math: 'T_n(cos(θ)) = cos(nθ)' and satisfy the recurrence relation: 
       .math: 'T_0(x) = 1,' 
       .math: 'T_1(x) = x,'
       .math: 'T_n(x) = 2xT_{n-1}(x) - T_{n-2}(x)'

       .. code-block:: CSharp 

          double ChebyshevT(int n, double x)
          Complex ChebyshevT(int n, Complex x)
          Matrix ChebyshevT(int i, Matrix x)
          ColVec ChebyshevT(int i, ColVec x)
          RowVec ChebyshevT(int i, RowVec x)
          SparseMatrix ChebyshevT(int i, SparseMatrix x)
          SparseColVec ChebyshevT(int i, SparseColVec x)
          SparseRowVec ChebyshevT(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree of the Chebyshev polynomial. Must be a non-negative integer.
       x: 
         The single point or points within array or matrix at which to evaluate the Chebyshev polynomial. Typically in the range [-1, 1] for optimal numerical properties.
   Returns: 
       A scalar point of point in an array for matrix form representing the value of the nth Chebyshev polynomial of the first kind evaluated at x.
       Returns NaN if n is negative or if computation fails.
   Example: 
       Calculate the first few Chebyshev polynomials at x = 0.5:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the evaluation point
          double x = 0.5;
          
          // Calculate the first few Chebyshev polynomials
          double T0 = ChebyshevT(0, x);  // T_0(x) = 1
          double T1 = ChebyshevT(1, x);  // T_1(x) = x
          double T2 = ChebyshevT(2, x);  // T_2(x) = 2x² - 1
          double T3 = ChebyshevT(3, x);  // T_3(x) = 4x³ - 3x
      
          // Output the results
          Console.WriteLine($"Chebyshev polynomials evaluated at x = {x}:");
          Console.WriteLine($"T_0({x}) = {T0}");
          Console.WriteLine($"T_1({x}) = {T1}");
          Console.WriteLine($"T_2({x}) = {T2}");
          Console.WriteLine($"T_3({x}) = {T3}");

      Output: 


       .. code-block:: Terminal 

          Chebyshev polynomials evaluated at x = 0.5:
          T_0(0.5) = 1
          T_1(0.5) = 0.5
          T_2(0.5) = -0.5
          T_3(0.5) = -1


ChebyshevU
==========
   Description: 
       Computes the Chebyshev polynomial of the second kind of degree n evaluated at x.
       This method returns the value of the nth Chebyshev polynomial U_n(x) at the specified point. 
       Chebyshev polynomials of the second kind are defined by U_n(cos(θ)) = sin((n+1)θ)/sin(θ) and 
       satisfy the recurrence relation U_0(x) = 1, U_1(x) = 2x, U_n(x) = 2xU_{n-1}(x) - U_{n-2}(x).

       .. code-block:: CSharp 

          double ChebyshevU(int n, double x)
          Complex ChebyshevU(int n, Complex x)
          Matrix ChebyshevU(int i, Matrix x)
          ColVec ChebyshevU(int i, ColVec x)
          RowVec ChebyshevU(int i, RowVec x)
          SparseMatrix ChebyshevU(int i, SparseMatrix x)
          SparseColVec ChebyshevU(int i, SparseColVec x)
          SparseRowVec ChebyshevU(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree of the Chebyshev polynomial of the second kind. Must be a non-negative integer.
       x: 
         The point at which to evaluate the Chebyshev polynomial. Typically in the range [-1, 1] for optimal numerical properties.
   Returns: 
       A Scaler point or points in an array or matrix form representing the value of the nth Chebyshev polynomial of the second kind evaluated at x.
       Returns NaN if n is negative or if computation fails.
   Example: 
       Calculate the first few Chebyshev polynomials of the second kind at x = 0.5:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the evaluation point
          double x = 0.5;
          
          // Calculate the first few Chebyshev polynomials of the second kind
          double U0 = ChebyshevU(0, x);  // U_0(x) = 1
          double U1 = ChebyshevU(1, x);  // U_1(x) = 2x
          double U2 = ChebyshevU(2, x);  // U_2(x) = 4x² - 1
          double U3 = ChebyshevU(3, x);  // U_3(x) = 8x³ - 4x
      
          // Output the results
          Console.WriteLine($"Chebyshev polynomials of the second kind at x = {x}:");
          Console.WriteLine($"U_0({x}) = {U0}");
          Console.WriteLine($"U_1({x}) = {U1}");
          Console.WriteLine($"U_2({x}) = {U2}");
          Console.WriteLine($"U_3({x}) = {U3}");

      Output: 


       .. code-block:: Terminal 

          Chebyshev polynomials of the second kind at x = 0.5:
          U_0(0.5) = 1
          U_1(0.5) = 1
          U_2(0.5) = 0
          U_3(0.5) = -1


LegendreP
=========
   Description: 
       Computes the Legendre polynomial of degree n evaluated at x.
       This method returns the value of the nth Legendre polynomial P_n(x) at the specified point. Legendre polynomials are orthogonal polynomials on the interval [-1, 1] that satisfy the recurrence relation P_0(x) = 1, P_1(x) = x, and (n+1)P_{n+1}(x) = (2n+1)xP_n(x) - nP_{n-1}(x). They are solutions to Legendre's differential equation.

       .. code-block:: CSharp 

          double LegendreP(int n, double x)
          Complex LegendreP(int n, Complex x)
          Matrix LegendreP(int i, Matrix x)
          ColVec LegendreP(int i, ColVec x)
          RowVec LegendreP(int i, RowVec x)
          SparseMatrix LegendreP(int i, SparseMatrix x)
          SparseColVec LegendreP(int i, SparseColVec x)
          SparseRowVec LegendreP(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree of the Legendre polynomial. Must be a non-negative integer.
       x: 
         The point at which to evaluate the Legendre polynomial. Can be any real number, but orthogonality properties hold on [-1, 1].
   Returns: 
       A scalar point or points in an array or matrix form representing the value of the nth Legendre polynomial evaluated at x.
       Returns NaN if n is negative or if computation fails.
   Example: 
       Calculate the first few Legendre polynomials at x = 0.5:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the evaluation point
          double x = 0.5;
          
          // Calculate the first few Legendre polynomials
          double P0 = LegendreP(0, x);  // P_0(x) = 1
          double P1 = LegendreP(1, x);  // P_1(x) = x
          double P2 = LegendreP(2, x);  // P_2(x) = (3x² - 1)/2
          double P3 = LegendreP(3, x);  // P_3(x) = (5x³ - 3x)/2
          double P4 = LegendreP(4, x);  // P_4(x) = (35x⁴ - 30x² + 3)/8
      
          // Output the results
          Console.WriteLine($"Legendre polynomials evaluated at x = {x}:");
          Console.WriteLine($"P_0({x}) = {P0}");
          Console.WriteLine($"P_1({x}) = {P1}");
          Console.WriteLine($"P_2({x}) = {P2}");
          Console.WriteLine($"P_3({x}) = {P3}");
          Console.WriteLine($"P_4({x}) = {P4}");

      Output: 


       .. code-block:: Terminal 

          Legendre polynomials evaluated at x = 0.5:
          P_0(0.5) = 1
          P_1(0.5) = 0.5
          P_2(0.5) = -0.125
          P_3(0.5) = -0.4375
          P_4(0.5) = -0.2890625
   Example: 
       Verify the recurrence relation for Legendre polynomials:

       .. code-block:: CSharp 

          // Import libraries
          using System;
          using static SepalSolver.Math;
            
          // Test the recurrence relation: (n+1)P_{n+1}(x) = (2n+1)xP_n(x) - nP_{n-1}(x)
          double x = 0.8;
          int n = 3;
          
          // Calculate polynomials directly
          double Pn_1 = LegendreP(n - 1, x);  // P_2(x)
          double Pn = LegendreP(n, x);        // P_3(x)
          double Pn_plus1 = LegendreP(n + 1, x);  // P_4(x)
          
          // Calculate P_{n+1} using recurrence relation
          double recurrenceResult = ((2 * n + 1) * x * Pn - n * Pn_1) / (n + 1);
      
          // Output the results
          Console.WriteLine($"Recurrence relation verification at x = {x}:");
          Console.WriteLine($"P_{n-1}({x}) = P_2({x}) = {Pn_1}");
          Console.WriteLine($"P_{n}({x}) = P_3({x}) = {Pn}");
          Console.WriteLine($"P_{n+1}({x}) = P_4({x}) = {Pn_plus1}");
          Console.WriteLine($"Recurrence formula: [{(2*n+1)}x*P_3(x) - {n}*P_2(x)]/{n+1} = {recurrenceResult}");
          Console.WriteLine($"Recurrence relation satisfied: {Abs(Pn_plus1 - recurrenceResult) < 1e-14}");

      Output: 


       .. code-block:: Terminal 

          Recurrence relation verification at x = 0.8:
          P_2(0.8) = P_2(0.8) = 0.46
          P_3(0.8) = P_3(0.8) = 0.152
          P_4(0.8) = P_4(0.8) = -0.1712
          Recurrence formula: [7x*P_3(x) - 3*P_2(x)]/4 = -0.1712
          Recurrence relation satisfied: True


LegendreQ
=========
   Description: 
       Computes the Legendre function of the second kind (also known as Legendre Q function) of degree n at point x.
       The Legendre Q function is the second linearly independent solution to Legendre's differential equation and is used in engineering applications involving spherical coordinates and potential theory.

       .. code-block:: CSharp 

          double LegendreQ(int n, double x)
          Complex LegendreQ(int n, Complex x)
          Matrix LegendreQ(int i, Matrix x)
          ColVec LegendreQ(int i, ColVec x)
          RowVec LegendreQ(int i, RowVec x)
          SparseMatrix LegendreQ(int i, SparseMatrix x)
          SparseColVec LegendreQ(int i, SparseColVec x)
          SparseRowVec LegendreQ(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree (order) of the Legendre Q function. Must be a non-negative integer (n >= 0).
       x: 
         The argument at which to evaluate the Legendre Q function. Must satisfy |x| > 1 for real-valued results, as the function has singularities at x = ±1.
   Returns: 
       The value of the Legendre Q function of degree n evaluated at x. Returns a double-precision floating-point number or one-dimensional or two-dimensional array.
   Example: 
       Compute the Legendre Q function of degree 0 at x = 2.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the degree and argument
          int n = 0;
          double x = 2.0;
          
          // Calculate the Legendre Q function
          double result = LegendreQ(n, x);
      
          // Output the result
          Console.WriteLine($"Q_0(2.0) = {result});

      Output: 


       .. code-block:: Terminal 

          Q_0(2.0) = 0.549306
   Example: 
       Compute the Legendre Q function of degree 2 at x = 1.5:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the degree and argument
          int n = 2;
          double x = 1.5;
      
          // Calculate the Legendre Q function
          double result = LegendreQ(n, x);
      
          // Output the result
          Console.WriteLine($"Q_2(1.5) = {result});

      Output: 


       .. code-block:: Terminal 

          Q_2(1.5) = -0.581633
   Example: 
       Compare Legendre Q functions of different degrees at x = 3.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the argument
          double x = 3.0;
      
          // Calculate Legendre Q functions for degrees 0, 1, and 2
          double q0 = LegendreQ(0, x);
          double q1 = LegendreQ(1, x);
          double q2 = LegendreQ(2, x);
      
          // Output the results
          Console.WriteLine($"Q_0(3.0) = {q0}");
          Console.WriteLine($"Q_1(3.0) = {q1}");
          Console.WriteLine($"Q_2(3.0) = {q2}");

      Output: 


       .. code-block:: Terminal 

          Q_0(3.0) = 0.366204
          Q_1(3.0) = 0.098459
          Q_2(3.0) = -0.254648


HermiteH
========
   Description: 
       Computes the Hermite polynomial H_n(x) of degree n at point x using the physicists' convention.
       The Hermite polynomials are orthogonal polynomials that arise in quantum mechanics (harmonic oscillator wavefunctions), probability theory (Gaussian integrals), and numerical analysis. They satisfy the recurrence relation H_{n+1}(x) = 2xH_n(x) - 2nH_{n-1}(x).

       .. code-block:: CSharp 

          double HermiteH(int n, double x)
          Complex HermiteH(int n, Complex x)
          Matrix HermiteH(int i, Matrix x)
          ColVec HermiteH(int i, ColVec x)
          RowVec HermiteH(int i, RowVec x)
          SparseMatrix HermiteH(int i, SparseMatrix x)
          SparseColVec HermiteH(int i, SparseColVec x)
          SparseRowVec HermiteH(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree (order) of the Hermite polynomial. Must be a non-negative integer (n >= 0).
       x: 
         The argument at which to evaluate the Hermite polynomial. Can be any real scalar number or numbers in array or matrix form.
   Returns: 
       The value of the Hermite polynomial H_n(x) evaluated at x. Returns a double-precision floating-point number or one dimensional or two dimensional array.
   Example: 
       Compute the Hermite polynomial of degree 0 at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the degree and argument
          int n = 0;
          double x = 1.0;
          
          // Calculate the Hermite polynomial
          double result = HermiteH(n, x);
      
          // Output the result
          Console.WriteLine($"H_0(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          H_0(1.0) = 1.000000
   Example: 
       Compute the Hermite polynomial of degree 3 at x = 2.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the degree and argument
          int n = 3;
          double x = 2.0;
      
          // Calculate the Hermite polynomial
          double result = HermiteH(n, x);
      
          // Output the result
          Console.WriteLine($"H_3(2.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          H_3(2.0) = 40.000000


Laguerre
========
   Description: 
       Computes the Laguerre polynomial L_n(x) of degree n at point x.
       The Laguerre polynomials are orthogonal polynomials that arise in quantum mechanics (hydrogen atom wavefunctions), mathematical physics, and numerical analysis. They satisfy the recurrence relation L_{n+1}(x) = ((2n+1-x)L_n(x) - nL_{n-1}(x))/(n+1) and are solutions to Laguerre's differential equation.

       .. code-block:: CSharp 

          double Laguerre(int n, double x)
          Complex Laguerre(int n, Complex x)
          Matrix Laguerre(int i, Matrix x)
          ColVec Laguerre(int i, ColVec x)
          RowVec Laguerre(int i, RowVec x)
          SparseMatrix Laguerre(int i, SparseMatrix x)
          SparseColVec Laguerre(int i, SparseColVec x)
          SparseRowVec Laguerre(int i, SparseRowVec x)
   Parameters: 
       n: 
         The degree (order) of the Laguerre polynomial. Must be a non-negative integer (n >= 0).
       x: 
         The argument at which to evaluate the Laguerre polynomial. Can be any real number, though typically used for x >= 0 in physical applications.
   Returns: 
       The value of the Laguerre polynomial L_n(x) evaluated at x. Returns a double-precision floating-point number.
   Example: 
       Compute the Laguerre polynomial of degree 0 at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the degree and argument
          int n = 0;
          double x = 1.0;
          
          // Calculate the Laguerre polynomial
          double result = Laguerre(n, x);
      
          // Output the result
          Console.WriteLine($"L_0(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          L_0(1.0) = 1.000000
   Example: 
       Compute the Laguerre polynomial of degree 3 at x = 2.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the degree and argument
          int n = 3;
          double x = 2.0;
      
          // Calculate the Laguerre polynomial
          double result = Laguerre(n, x);
      
          // Output the result
          Console.WriteLine($"L_3(2.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          L_3(2.0) = -0.333333


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
   Parameters: 
       z: 
         The input value (real or complex). For positive integers, Γ(n) = (n-1)!.
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


LambertW
========
   Description: 
       Computes the Lambert W function (also known as the product logarithm) W_n(x), which is the inverse function of f(w) = w * e^w.
       The Lambert W function has multiple branches, where n specifies the branch number. The principal branch (n=0) is defined for x >= -1/e, and the -1 branch (n=-1) is defined for -1/e <= x < 0. This function appears in various mathematical contexts including delay differential equations, quantum field theory, and combinatorics.

       .. code-block:: CSharp 

          double LambertW(double n, double x)
          Complex LambertW(double n, Complex x)
   Parameters: 
       n: 
         The branch number of the Lambert W function. Typically 0 (principal branch) or -1 (secondary branch for negative arguments).
       x: 
         The argument at which to evaluate the Lambert W function. For branch 0: x >= -1/e ≈ -0.368. For branch -1: -1/e <= x < 0.
   Returns: 
       The value of the Lambert W function W_n(x) evaluated at x for the specified branch n. Returns a double-precision floating-point number.
   Example: 
       Compute the Lambert W function principal branch at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the branch and argument
          double n = 0;
          double x = 1.0;
          
          // Calculate the Lambert W function
          double result = LambertW(n, x);
      
          // Output the result
          Console.WriteLine($"W_0(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          W_0(1.0) = 0.567143
   Example: 
       Compute the Lambert W function -1 branch at x = -0.2:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the branch and argument
          double n = -1;
          double x = -0.2;
      
          // Calculate the Lambert W function
          double result = LambertW(n, x);
      
          // Output the result
          Console.WriteLine($"W_{{-1}}(-0.2) = {result}");

      Output: 


       .. code-block:: Terminal 

          W_{-1}(-0.2) = -2.542641


LnGamma
=======
   Description: 
       Computes the natural logarithm of the gamma function, ln(Γ(x)), for positive real arguments.
       The log-gamma function is numerically stable alternative to computing Γ(x) directly, especially for large values of x where Γ(x) would overflow. This function is widely used in statistics, probability theory, and numerical analysis.
       It satisfies the functional equation ln(Γ(x+1)) = ln(Γ(x)) + ln(x) and is related to Stirling's approximation for large x.

       .. code-block:: CSharp 

          double LnGamma(double x)
          Complex LnGamma(Complex x)
          Matrix LnGamma(Matrix x)
          ColVec LnGamma(ColVec x)
          RowVec LnGamma(RowVec x)
          SparseMatrix LnGamma(SparseMatrix x)
          SparseColVec LnGamma(SparseColVec x)
          SparseRowVec LnGamma(SparseRowVec x)
   Parameters: 
       x: 
         The argument at which to evaluate the log-gamma function. Must be a positive real number (x > 0) or one-dimensional or two-dimensional array.
   Returns: 
       The value of the natural logarithm of the gamma function ln(Γ(x)) evaluated at x. Returns a double-precision floating-point number or one-dimensional or two-dimensional array of numbers.
   Example: 
       Compute the log-gamma function at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the argument
          double x = 1.0;
          
          // Calculate the log-gamma function
          double result = LnGamma(x);
      
          // Output the result
          Console.WriteLine($"ln(Γ(1.0)) = {result}");

      Output: 


       .. code-block:: Terminal 

          ln(Γ(1.0)) = 0.000000
   Example: 
       Compute the log-gamma function at x = 5.5:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the argument
          double x = 5.5;
      
          // Calculate the log-gamma function
          double result = LnGamma(x);
      
          // Output the result
          Console.WriteLine($"ln(Γ(5.5)) = {result}");

      Output: 


       .. code-block:: Terminal 

          ln(Γ(5.5)) = 3.957813


Erf
===
   Description: 
       Computes the error function erf(x), which is defined as the integral (2/√π) ∫₀ˣ e^(-t²) dt.
       The error function is fundamental in probability theory, statistics, and physics. It is closely related to the cumulative distribution function of the normal distribution and appears in solutions to the heat equation and diffusion processes. The function is odd (erf(-x) = -erf(x)) and approaches ±1 as x approaches ±∞.

       .. code-block:: CSharp 

          double Erf(double x)
          Complex Erf(Complex x)
          Matrix Erf(Matrix x)
          ColVec Erf(ColVec x)
          RowVec Erf(RowVec x)
          SparseMatrix Erf(SparseMatrix x)
          SparseColVec Erf(SparseColVec x)
          SparseRowVec Erf(SparseRowVec x)
   Parameters: 
       x: 
         The argument at which to evaluate the error function. Can be any real number.
   Returns: 
       The value of the error function erf(x) evaluated at x. Returns a double-precision floating-point number in the range (-1, 1) or one-dimensional or two dimensional array.
   Example: 
       Compute the error function at x = 0.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the argument
          double x = 0.0;
          
          // Calculate the error function
          double result = Erf(x);
      
          // Output the result
          Console.WriteLine($"erf(0.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          erf(0.0) = 0.000000
   Example: 
       Compute the error function at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the argument
          double x = 1.0;
      
          // Calculate the error function
          double result = Erf(x);
      
          // Output the result
          Console.WriteLine($"erf(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          erf(1.0) = 0.842701


Erfc
====
   Description: 
       Computes the complementary error function erfc(x), which is defined as erfc(x) = 1 - erf(x) = (2/√π) ∫ₓ^∞ e^(-t²) dt.
       The complementary error function is widely used in probability theory, statistics, and physics for computing tail probabilities of the normal distribution. It provides better numerical accuracy than computing 1 - erf(x) directly, especially for large positive values of x where erf(x) approaches 1. The function satisfies erfc(0) = 1, erfc(∞) = 0, and erfc(-x) = 2 - erfc(x).

       .. code-block:: CSharp 

          double Erfc(double x)
          Complex Erfc(Complex x)
          Matrix Erfc(Matrix x)
          ColVec Erfc(ColVec x)
          RowVec Erfc(RowVec x)
          SparseMatrix Erfc(SparseMatrix x)
          SparseColVec Erfc(SparseColVec x)
          SparseRowVec Erfc(SparseRowVec x)
   Parameters: 
       x: 
         The argument at which to evaluate the complementary error function. Can be any real number.
   Returns: 
       The value of the complementary error function erfc(x) evaluated at x. Returns a double-precision floating-point number in the range (0, 2). It can also return one-dimensional or two-dimensional array of numbers
   Example: 
       Compute the complementary error function at x = 0.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the argument
          double x = 0.0;
          
          // Calculate the complementary error function
          double result = Erfc(x);
      
          // Output the result
          Console.WriteLine($"erfc(0.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          erfc(0.0) = 1.000000
   Example: 
       Compute the complementary error function at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the argument
          double x = 1.0;
      
          // Calculate the complementary error function
          double result = Erfc(x);
      
          // Output the result
          Console.WriteLine($"erfc(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          erfc(1.0) = 0.157299


Zeta
====
   Description: 
       Computes the Riemann zeta function ζ(x), which is defined as the infinite series ζ(x) = Σ(n=1 to ∞) 1/n^x for x > 1.
       The Riemann zeta function is one of the most important functions in number theory and mathematical analysis. It has deep connections to prime numbers through Euler's product formula and is central to the famous Riemann Hypothesis. The function can be analytically continued to the entire complex plane except for a simple pole at x = 1, where ζ(1) diverges to infinity.

       .. code-block:: CSharp 

          double Zeta(double x)
          Complex Zeta(Complex x)
          Matrix Zeta(Matrix x)
          ColVec Zeta(ColVec x)
          RowVec Zeta(RowVec x)
          SparseMatrix Zeta(SparseMatrix x)
          SparseColVec Zeta(SparseColVec x)
          SparseRowVec Zeta(SparseRowVec x)
   Parameters: 
       x: 
         The argument at which to evaluate the Riemann zeta function. Must be a real number with x ≠ 1 (the function has a pole at x = 1).
   Returns: 
       The value of the Riemann zeta function ζ(x) evaluated at x. Returns a double-precision floating-point number.
   Example: 
       Compute the Riemann zeta function at x = 2.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the argument
          double x = 2.0;
          
          // Calculate the Riemann zeta function
          double result = Zeta(x);
      
          // Output the result
          Console.WriteLine($"ζ(2.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          ζ(2.0) = 1.644934
   Example: 
       Compute the Riemann zeta function at x = 3.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the argument
          double x = 3.0;
      
          // Calculate the Riemann zeta function
          double result = Zeta(x);
      
          // Output the result
          Console.WriteLine($"ζ(3.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          ζ(3.0) = 1.202057


Psi
===
   Description: 
       Computes the polygamma function ψ^(m)(x), which is the m-th derivative of the digamma function ψ(x) = d/dx[ln(Γ(x))].
       The polygamma function is defined as ψ^(m)(x) = d^(m+1)/dx^(m+1)[ln(Γ(x))] for m ≥ 0. When m = 0, it returns the digamma function ψ(x). The polygamma functions appear in various areas of mathematics including number theory, probability theory, and mathematical physics. They satisfy the recurrence relation ψ^(m)(x+1) = ψ^(m)(x) + (-1)^m * m! / x^(m+1).

       .. code-block:: CSharp 

          double Psi(int m, double x)
   Parameters: 
       m: 
         The order of the polygamma function. Must be a non-negative integer (m ≥ 0). When m = 0, computes the digamma function ψ(x).
       x: 
         The argument at which to evaluate the polygamma function. Must be a positive real number (x > 0).
   Returns: 
       The value of the polygamma function ψ^(m)(x) evaluated at x. Returns a double-precision floating-point number.
   Example: 
       Compute the digamma function (m = 0) at x = 1.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the order and argument
          int m = 0;
          double x = 1.0;
          
          // Calculate the polygamma function
          double result = Psi(m, x);
      
          // Output the result
          Console.WriteLine($"ψ(1.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          ψ(1.0) = -0.577216
   Example: 
       Compute the trigamma function (m = 1) at x = 2.0:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the order and argument
          int m = 1;
          double x = 2.0;
      
          // Calculate the polygamma function
          double result = Psi(m, x);
      
          // Output the result
          Console.WriteLine($"ψ^(1)(2.0) = {result}");

      Output: 


       .. code-block:: Terminal 

          ψ^(1)(2.0) = 0.644934


HyperGeom
=========
   Description: 
       Computes the confluent hypergeometric function of the first kind, also known as Kummer's function M(a,b,x) or ₁F₁(a;b;x).
       This function is defined by the infinite series M(a,b,x) = Σ(n=0 to ∞) [(a)ₙ xⁿ] / [(b)ₙ n!] where (a)ₙ is the Pochhammer symbol.

       .. code-block:: CSharp 

          double HyperGeom(double a, double b, double x)
          Matrix HyperGeom(double a, double b, Matrix x)
          ColVec HyperGeom(double a, double b, ColVec x)
          RowVec HyperGeom(double a, double b, RowVec x)
          SparseMatrix HyperGeom(double a, double b, SparseMatrix x)
          SparseColVec HyperGeom(double a, double b, SparseColVec x)
          SparseRowVec HyperGeom(double a, double b, SparseRowVec x)
          double HyperGeom(double[] N, double[] D, double x)
          Matrix HyperGeom(double[] N, double[] D, Matrix x)
          ColVec HyperGeom(double[] N, double[] D, ColVec x)
          RowVec HyperGeom(double[] N, double[] D, RowVec x)
          SparseMatrix HyperGeom(double[] N, double[] D, SparseMatrix x)
          SparseColVec HyperGeom(double[] N, double[] D, SparseColVec x)
          SparseRowVec HyperGeom(double[] N, double[] D, SparseRowVec x)
          Complex HyperGeom(double a, double b, Complex x)
   Parameters: 
       a: 
         The first parameter of the hypergeometric function. It can be any real number.
       b: 
         The second parameter of the hypergeometric function. it must be a positive real number and cannot be zero or a negative integer.
       x: 
         The argument of the hypergeometric function. It can be any real number.
   Returns: 
       The value of the confluent hypergeometric function M(a,b,x) as a double.
   Example: 
       Compute the hypergeometric function M(1,1,x) which equals e^x:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Set parameters
          double a = 1.0;
          double b = 1.0;
          double x = 2.0;
          
          // Compute the hypergeometric function
          double result = HyperGeom(a, b, x);
      
          // Output the result
          Console.WriteLine($"M({a},{b},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          M(1,1,2) = 7.389056
   Example: 
       Compute the hypergeometric function with fractional parameters:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Set parameters for M(0.5, 1.5, 1.0)
          double a = 0.5;
          double b = 1.5;
          double x = 1.0;
      
          // Compute the hypergeometric function
          double result = HyperGeom(a, b, x);
      
          // Output the result
          Console.WriteLine($"M({a},{b},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          M(0.5,1.5,1) = 1.175201


GammaP
======
   Description: 
       Computes the regularized lower incomplete gamma function P(a,x), also known as the lower gamma function ratio.
       This function is defined as P(a,x) = γ(a,x) / Γ(a) where γ(a,x) is the lower incomplete gamma function and Γ(a) is the gamma function.

       .. code-block:: CSharp 

          double GammaP(double a, double x)
          Matrix GammaP(double a, Matrix x)
          ColVec GammaP(double a, ColVec x)
          RowVec GammaP(double a, RowVec x)
          SparseMatrix GammaP(double a, SparseMatrix x)
          SparseColVec GammaP(double a, SparseColVec x)
          SparseRowVec GammaP(double a, SparseRowVec x) 
   Parameters: 
       a: 
         The shape parameter of the gamma function. Must be a positive real number greater than zero.
       x: 
         The upper limit of integration. Must be a non-negative real number (x ≥ 0).
   Returns: 
       The value of the regularized lower incomplete gamma function P(a,x) as a double, ranging from 0 to 1.
   Example: 
       Compute the regularized lower incomplete gamma function P(2,1):

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Set parameters
          double a = 2.0;
          double x = 1.0;
          
          // Compute the regularized lower incomplete gamma function
          double result = GammaP(a, x);
      
          // Output the result
          Console.WriteLine($"P({a},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          P(2,1) = 0.264241
   Example: 
       Compute the regularized lower incomplete gamma function with fractional parameters:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Set parameters for P(0.5, 0.25)
          double a = 0.5;
          double x = 0.25;
      
          // Compute the regularized lower incomplete gamma function
          double result = GammaP(a, x);
      
          // Output the result
          Console.WriteLine($"P({a},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          P(0.5,0.25) = 0.520500


GammaQ
======
   Description: 
       Computes the regularized upper incomplete gamma function Q(a,x), also known as the upper gamma function ratio.
       GammaQ function is a compliment of GammaP fun defined as Q(a,x) = Γ(a,x) / Γ(a) where Γ(a,x) is the upper incomplete gamma function and Γ(a) is the gamma function.

       .. code-block:: CSharp 

          double GammaQ(double a, double x)
          Matrix GammaQ(double a, Matrix x)
          ColVec GammaQ(double a, ColVec x)
          RowVec GammaQ(double a, RowVec x)
          SparseMatrix GammaQ(double a, SparseMatrix x)
          SparseColVec GammaQ(double a, SparseColVec x)
          SparseRowVec GammaQ(double a, SparseRowVec x) 
   Parameters: 
       a: 
         The shape parameter of the gamma function. Must be a positive real number greater than zero.
       x: 
         The lower limit of integration. Must be a non-negative real number (x ≥ 0).
   Returns: 
       The value of the regularized upper incomplete gamma function Q(a,x) as a double, ranging from 0 to 1.
   Example: 
       Compute the regularized upper incomplete gamma function Q(2,1):

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Set parameters
          double a = 2.0;
          double x = 1.0;
          
          // Compute the regularized upper incomplete gamma function
          double result = GammaQ(a, x);
      
          // Output the result
          Console.WriteLine($"Q({a},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          Q(2,1) = 0.735759
   Example: 
       Compute the regularized upper incomplete gamma function with fractional parameters:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Set parameters for Q(0.5, 0.25)
          double a = 0.5;
          double x = 0.25;
      
          // Compute the regularized upper incomplete gamma function
          double result = GammaQ(a, x);
      
          // Output the result
          Console.WriteLine($"Q({a},{x}) = {result}")

      Output: 


       .. code-block:: Terminal 

          Q(0.5,0.25) = 0.479500


Full
====
   Description: 
       Converts a sparse matrix to a full (dense) matrix representation by explicitly storing all elements including zeros.
       This function takes a sparse matrix and returns a standard dense matrix where all elements are stored in memory.

       .. code-block:: CSharp 

          Matrix Full(SparseMatrix A)
          Matrix Full(SparseColVec A)
          Matrix Full(SparseRowVec A)
   Parameters: 
       A: 
         The sparse matrix to be converted to full matrix format. Can be any valid sparse matrix with defined dimensions.
   Returns: 
       A dense Matrix containing all elements from the sparse matrix, with zeros explicitly stored for non-specified elements.
   Example: 
       Convert a 3x3 sparse matrix to full matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3x3 sparse matrix with few non-zero elements
          SparseMatrix sparseA = new double[3, 3];
          sparseA[0, 0] = 1.0;
          sparseA[1, 2] = 5.0;
          sparseA[2, 1] = 3.0;
          
          // Convert to full matrix
          Matrix result = Full(sparseA);
      
          // Output the result
          Console.WriteLine($"Full matrix:\n{result}")

      Output: 


       .. code-block:: Terminal 

          Full matrix:
          1 0 0
          0 0 5
          0 3 0
   Example: 
       Convert a sparse column vector to full matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a sparse column vector
          SparseColVec sparseVec = new double[4];
          sparseVec[0] = 2.5;
          sparseVec[2] = 7.8;
      
          // Convert to full matrix
          Matrix result = Full(sparseVec);
      
          // Output the result
          Console.WriteLine($"Full matrix from sparse vector:\n{result}")

      Output: 


       .. code-block:: Terminal 

          Full matrix from sparse vector:
          2.5
          0
          7.8
          0


Sparse
======
   Description: 
       Converts a dense matrix to a sparse matrix representation by storing only non-zero elements to optimize memory usage.
       This function takes a standard dense matrix and returns a sparse matrix where only non-zero values are explicitly stored.

       .. code-block:: CSharp 

          SparseMatrix Sparse(Matrix A)
          SparseMatrix Sparse(int[] I, int[] J, double[] V)
          Sparse(int[] I, int[] J, double[] V, int M, int N)
   Parameters: 
       A: 
         The dense matrix to be converted to sparse matrix format. Can be any valid matrix with defined dimensions.
       I: 
         Array of row indices for non-zero elements. Must be zero-based and have the same length as J and V arrays.
       J: 
         Array of column indices for non-zero elements. Must be zero-based and have the same length as I and V.
       V: 
         Array of values for non-zero elements. Must have the same length as I and J arrays.
   Returns: 
       A SparseMatrix containing only the non-zero elements from the dense matrix, providing efficient storage for matrices with many zeros.
   Example: 
       Convert a 3x3 dense matrix to sparse matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3x3 dense matrix with many zero elements
          Matrix denseA = new Matrix(new double[,] {
              { 1.0, 0.0, 0.0 },
              { 0.0, 0.0, 5.0 },
              { 0.0, 3.0, 0.0 }
          });
          
          // Convert to sparse matrix
          SparseMatrix result = Sparse(denseA);
      
          // Output the result
          Console.WriteLine($"Sparse matrix:\n{result}")

      Output: 


       .. code-block:: Terminal 

          Sparse matrix:
          (0,0) = 1
          (1,2) = 5
          (2,1) = 3
   Example: 
       Create a 3x3 sparse matrix from triplet format:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define triplet arrays for a 3x3 matrix
          int[] I = new int[] { 0, 1, 2 };      // row indices
          int[] J = new int[] { 0, 2, 1 };      // column indices
          double[] V = new double[] { 1, 5, 3 };      // values
          
          // Create sparse matrix from triplet format
          SparseMatrix result = Sparse(I, J, V);
      
          // Output the result
          Console.WriteLine($"Sparse matrix from triplets:\n{result}")

      Output: 


       .. code-block:: Terminal 

          Sparse matrix from triplets:
          (0,0) = 1
          (1,2) = 5
          (2,1) = 3


Eye
===
   Description: 
       Creates an identity matrix of size N x N with ones on the main diagonal and zeros elsewhere.
       This function generates a square matrix where all diagonal elements are 1.0 and all off-diagonal elements are 0.0.

       .. code-block:: CSharp 

          Matrix Eye(int N)
          Matrix Eye(int[] Size)
          Matrix Eye(int M, int N)
   Parameters: 
       N: 
         The size of the square identity matrix. Must be a positive integer greater than zero.
   Returns: 
       A square Matrix of size N x N with ones on the main diagonal and zeros elsewhere, representing the identity matrix.
   Example: 
       Create a 3x3 identity matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3x3 identity matrix
          int N = 3;
          
          // Generate the identity matrix
          Matrix result = Eye(N);
      
          // Output the result
          Console.WriteLine($"3x3 Identity matrix:\n{result}")

      Output: 


       .. code-block:: Terminal 

          3x3 Identity matrix:
          1 0 0
          0 1 0
          0 0 1
   Example: 
       Create a 4x4 identity matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4x4 identity matrix
          int size = 4;
      
          // Generate the identity matrix
          Matrix result = Eye(size);
      
          // Output the result
          Console.WriteLine($"4x4 Identity matrix:\n{result}")

      Output: 


       .. code-block:: Terminal 

          4x4 Identity matrix:
          1 0 0 0
          0 1 0 0
          0 0 1 0
          0 0 0 1


Triu
====
   Description: 
       Extracts the upper triangular part of a matrix, setting all elements below the main diagonal to zero.
       This function returns a new matrix where A[i,j] = original A[i,j] if i ≤ j, and A[i,j] = 0 if i > j.
       The main diagonal and all elements above it are preserved from the original matrix.

       .. code-block:: CSharp 

          Matrix Triu(Matrix A)
          SparseMatrix Triu(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix from which to extract the upper triangular part. Can be any m×n matrix (not necessarily square).
   Returns: 
       A new matrix of the same dimensions as the input matrix A, containing the upper triangular part of A with all elements below the main diagonal set to zero.
   Example: 
       Extract the upper triangular part of a 3×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };
          
          // Extract upper triangular part
          Matrix result = Triu(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Upper triangular part:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3
          4  5  6
          7  8  9
          
          Upper triangular part:
          1  2  3
          0  5  6
          0  0  9
   Example: 
       Extract the upper triangular part of a rectangular 4×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×3 rectangular matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9},
              {10, 11, 12}
          };
      
          // Extract upper triangular part
          Matrix result = Triu(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Upper triangular part:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1   2   3
          4   5   6
          7   8   9
          10  11  12
          
          Upper triangular part:
          1  2  3
          0  5  6
          0  0  9
          0  0  0


Tril
====
   Description: 
       Extracts the lower triangular part of a matrix, setting all elements above the main diagonal to zero.
       This function returns a new matrix where A[i,j] = original A[i,j] if i ≥ j, and A[i,j] = 0 if i < j.
       The main diagonal and all elements below it are preserved from the original matrix.

       .. code-block:: CSharp 

          Matrix Tril(Matrix A)
          SparseMatrix Tril(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix from which to extract the lower triangular part. Can be any m×n matrix (not necessarily square).
   Returns: 
       A new matrix of the same dimensions as the input matrix A, containing the lower triangular part of A with all elements above the main diagonal set to zero.
   Example: 
       Extract the lower triangular part of a 3×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };
          
          // Extract lower triangular part
          Matrix result = Tril(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Lower triangular part:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3
          4  5  6
          7  8  9
          
          Lower triangular part:
          1  0  0
          4  5  0
          7  8  9
   Example: 
       Extract the lower triangular part of a rectangular 3×4 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 3×4 rectangular matrix
          Matrix A = new double[,] {
              {1, 2, 3, 4},
              {5, 6, 7, 8},
              {9, 10, 11, 12}
          };
      
          // Extract lower triangular part
          Matrix result = Tril(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Lower triangular part:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2   3   4
          5  6   7   8
          9  10  11  12
          
          Lower triangular part:
          1  0  0  0
          5  6  0  0
          9  10 11 0


Flipud
======
   Description: 
       Flips a matrix vertically (up-down), reversing the order of rows while preserving the order of columns.
       This function returns a new matrix where the first row becomes the last row, the second row becomes the second-to-last row, and so on.
       For a matrix A with m rows, the element A[i,j] becomes A[m-1-i,j] in the flipped matrix.

       .. code-block:: CSharp 

          Matrix Flipud(Matrix A)
          SparseMatrix Flipud(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be flipped vertically. Can be any m×n matrix or column vector.
   Returns: 
       A new matrix of the same dimensions as the input matrix A, with rows in reverse order (vertically flipped).
   Example: 
       Flip a 3×3 matrix vertically:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };
          
          // Flip matrix vertically
          Matrix result = Flipud(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Vertically flipped matrix:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3
          4  5  6
          7  8  9
          
          Vertically flipped matrix:
          7  8  9
          4  5  6
          1  2  3
   Example: 
       Flip a rectangular 4×2 matrix vertically:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×2 rectangular matrix
          Matrix A = new double[,] {
              {1, 2},
              {3, 4},
              {5, 6},
              {7, 8}
          };
      
          // Flip matrix vertically
          Matrix result = Flipud(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Vertically flipped matrix:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2
          3  4
          5  6
          7  8
          
          Vertically flipped matrix:
          7  8
          5  6
          3  4
          1  2


Fliplr
======
   Description: 
       Flips a matrix horizontally (left-right), reversing the order of columns while preserving the order of rows.
       This function returns a new matrix where the first column becomes the last column, the second column becomes the second-to-last column, and so on.
       For a matrix A with n columns, the element A[i,j] becomes A[i,n-1-j] in the flipped matrix.

       .. code-block:: CSharp 

          Matrix Fliplr(Matrix A)
          SparseMatrix Fliplr(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be flipped horizontally. Can be any m×n matrix or row vector.
   Returns: 
       A new matrix of the same dimensions as the input matrix A, with columns in reverse order (horizontally flipped).
   Example: 
       Flip a 3×3 matrix horizontally:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };
          
          // Flip matrix horizontally
          Matrix result = Fliplr(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Horizontally flipped matrix:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3
          4  5  6
          7  8  9
          
          Horizontally flipped matrix:
          3  2  1
          6  5  4
          9  8  7
   Example: 
       Flip a rectangular 2×4 matrix horizontally:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 2×4 rectangular matrix
          Matrix A = new double[,] {
              {1, 2, 3, 4},
              {5, 6, 7, 8}
          };
      
          // Flip matrix horizontally
          Matrix result = Fliplr(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Horizontally flipped matrix:");
          Console.WriteLine(result);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3  4
          5  6  7  8
          
          Horizontally flipped matrix:
          4  3  2  1
          8  7  6  5


Trireduce
=========
   Description: 
       Performs tridiagonal reduction of a symmetric matrix, decomposing it into the form A = U * T * U^T where T is a tridiagonal matrix.
       This function computes the tridiagonal decomposition using Householder transformations, where U is an orthogonal matrix
       and T is a symmetric tridiagonal matrix (non-zero elements only on the main diagonal and adjacent diagonals).
       The tridiagonal reduction is a key step in computing eigenvalues and eigenvectors of symmetric matrices efficiently.

       .. code-block:: CSharp 

          (Matrix U, Matrix T, Matrix V) Trireduce(Matrix A)
          (SparseMatrix U, SparseMatrix T, SparseMatrix V) Trireduce(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be reduced to tridiagonal form. Must be a symmetric n×n matrix for optimal results.
   Returns: 
       A tuple containing three matrices:
       - U: An n×n orthogonal matrix (transformation matrix)
       - T: An n×n symmetric tridiagonal matrix with non-zero elements only on the main diagonal and adjacent diagonals
       - V: An n×n orthogonal matrix (equal to U^T for symmetric input)
       The original matrix A can be reconstructed as A = U * T * U^T.
   Example: 
       Perform tridiagonal reduction on a 3×3 symmetric matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 symmetric matrix
          Matrix A = new double[,] {
              {4, 1, 2},
              {1, 3, 1},
              {2, 1, 5}
          };
          
          // Perform tridiagonal reduction
          var (U, T, V) = Trireduce(A);
      
          // Output the results
          Console.WriteLine("Original symmetric matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Orthogonal matrix U:");
          Console.WriteLine(U);
          Console.WriteLine("Tridiagonal matrix T:");
          Console.WriteLine(T);
          Console.WriteLine("Orthogonal matrix V:");
          Console.WriteLine(V);

      Output: 


       .. code-block:: Terminal 

          Original symmetric matrix A:
          4  1  2
          1  3  1
          2  1  5
          
          Orthogonal matrix U:
          1.000   0.000   0.000
          0.000  -0.447  -0.894
          0.000  -0.894   0.447
          
          Tridiagonal matrix T:
          4.000  -2.236   0.000
         -2.236   3.800  -0.894
          0.000  -0.894   4.200
          
          Orthogonal matrix V:
          1.000   0.000   0.000
          0.000  -0.447  -0.894
          0.000  -0.894   0.447
   Example: 
       Perform tridiagonal reduction on a 4×4 symmetric matrix and verify reconstruction:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×4 symmetric matrix
          Matrix A = new double[,] {
              {2, 1, 0, 1},
              {1, 3, 1, 0},
              {0, 1, 2, 1},
              {1, 0, 1, 4}
          };
      
          // Perform tridiagonal reduction
          var (U, T, V) = Trireduce(A);
      
          // Verify reconstruction: A_reconstructed = U * T * U^T
          Matrix A_reconstructed = U * T * U.Transpose();
      
          // Output the results
          Console.WriteLine("Original symmetric matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Tridiagonal matrix T:");
          Console.WriteLine(T);
          Console.WriteLine("Reconstructed matrix A:");
          Console.WriteLine(A_reconstructed);

      Output: 


       .. code-block:: Terminal 

          Original symmetric matrix A:
          2  1  0  1
          1  3  1  0
          0  1  2  1
          1  0  1  4
          
          Tridiagonal matrix T:
          2.000  -1.414   0.000   0.000
         -1.414   3.500  -1.155   0.000
          0.000  -1.155   1.667  -0.577
          0.000   0.000  -0.577   3.833
          
          Reconstructed matrix A:
          2.000  1.000  0.000  1.000
          1.000  3.000  1.000  0.000
          0.000  1.000  2.000  1.000
          1.000  0.000  1.000  4.000


Bireduce
========
   Description: 
       Performs bidiagonal reduction of a matrix, decomposing it into the form A = U * B * V^T where B is a bidiagonal matrix.
       This function computes the bidiagonal decomposition using Householder transformations, where U and V are orthogonal matrices
       and B is an upper bidiagonal matrix (non-zero elements only on the main diagonal and superdiagonal).
       The bidiagonal reduction is a key step in computing the Singular Value Decomposition (SVD) of a matrix.

       .. code-block:: CSharp 

          (Matrix U, Matrix B, Matrix V) Bireduce(Matrix A)
          (SparseMatrix U, SparseMatrix B, SparseMatrix V) Bireduce(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be reduced to bidiagonal form. Can be any m×n matrix with m ≥ n for optimal performance.
   Returns: 
       A tuple containing three matrices:
       - U: An m×m orthogonal matrix (left transformation matrix)
       - B: An m×n bidiagonal matrix with non-zero elements only on the main diagonal and superdiagonal
       - V: An n×n orthogonal matrix (right transformation matrix)
       The original matrix A can be reconstructed as A = U * B * V^T.
   Example: 
       Perform bidiagonal reduction on a 3×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };
          
          // Perform bidiagonal reduction
          var (U, B, V) = Bireduce(A);
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Left orthogonal matrix U:");
          Console.WriteLine(U);
          Console.WriteLine("Bidiagonal matrix B:");
          Console.WriteLine(B);
          Console.WriteLine("Right orthogonal matrix V:");
          Console.WriteLine(V);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  3
          4  5  6
          7  8  9
          
          Left orthogonal matrix U:
          -0.1231    0.9045    0.4082
          -0.4924    0.3015   -0.8165
          -0.8616   -0.3015    0.4082
          
          Bidiagonal matrix B:
          -8.1240   14.6598    0.0000
          -0.0000   -1.9595    0.5013
          -0.0000   -0.0000    0.0000
          
          Right orthogonal matrix V:
          1.0000    0.0000    0.0000
          0.0000   -0.6549   -0.7557
          0.0000   -0.7557    0.6549
   Example: 
       Perform bidiagonal reduction on a rectangular 4×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×3 rectangular matrix
          Matrix A = new double[,] {
              {1, 2, 1},
              {3, 4, 2},
              {5, 6, 3},
              {7, 8, 4}
          };
      
          // Perform bidiagonal reduction
          var (U, B, V) = Bireduce(A);
      
          // Verify reconstruction: A_reconstructed = U * B * V^T
          Matrix A_reconstructed = U * B * V.Transpose();
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Bidiagonal matrix B:");
          Console.WriteLine(B);
          Console.WriteLine("Reconstructed matrix A:");
          Console.WriteLine(A_reconstructed);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1  2  1
          3  4  2
          5  6  3
          7  8  4
          
          Bidiagonal matrix B:
          -9.1652   12.1988    0.0000
          -0.0000    1.0911    0.0000
          0.0000   -0.0000   -0.0000
          -0.0000   -0.0000    0.0000
          
          Reconstructed matrix A:
          1.000  2.000  1.000
          3.000  4.000  2.000
          5.000  6.000  3.000
          7.000  8.000  4.000


Diag
====
   Description: 
       Extracts the k-th diagonal from a matrix and returns it as a column vector.
       This function extracts diagonal elements from dense matrices, where k=0 represents the main diagonal,
       k>0 represents superdiagonals (above main diagonal), and k<0 represents subdiagonals (below main diagonal).
       All elements of the diagonal are returned, including zeros, making it suitable for dense matrix operations.

       .. code-block:: CSharp 

          ColVec Diag(Matrix A, int k = 0)
          Matrix Diag(ColVec A, int k = 0)
          Matrix Diag(double[] A, int k = 0)
          Matrix Diag(List<ColVec> Alist, List<int> klist)
   Parameters: 
       A: 
         The input matrix from which to extract the diagonal. Can be any m×n matrix.
       k: 
         The diagonal offset. Default value is 0 (main diagonal). Positive values extract superdiagonals, negative values extract subdiagonals.
         For an m×n matrix, valid range is -(m-1) ≤ k ≤ (n-1).
   Returns: 
       A column vector containing the elements of the k-th diagonal. The length of the vector is min(m, n-k) for k≥0 or min(m+k, n) for k<0.
       All elements are returned, including zeros.
   Example: 
       Extract the main diagonal from a 4×4 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 4×4 matrix
          Matrix A = new double[,] {
              {1, 2, 3, 4},
              {5, 6, 7, 8},
              {9, 10, 11, 12},
              {13, 14, 15, 16}
          };
          
          // Extract main diagonal (k=0)
          ColVec mainDiag = Diag(A, 0);
      
          // Output the results
          Console.WriteLine("Matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Main diagonal (k=0):");
          Console.WriteLine(mainDiag);

      Output: 


       .. code-block:: Terminal 

          Matrix A:
          1   2   3   4
          5   6   7   8
          9   10  11  12
          13  14  15  16
          
          Main diagonal (k=0):
          1
          6
          11
          16
   Example: 
       Extract different diagonals from a rectangular matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×5 rectangular matrix
          Matrix A = new double[,] {
              {1, 2, 3, 4, 5},
              {6, 7, 8, 9, 10},
              {11, 12, 13, 14, 15},
              {16, 17, 18, 19, 20}
          };
      
          // Extract different diagonals
          ColVec superDiag1 = Diag(A, 1);   // First superdiagonal
          ColVec superDiag2 = Diag(A, 2);   // Second superdiagonal
          ColVec mainDiag = Diag(A, 0);     // Main diagonal
          ColVec subDiag1 = Diag(A, -1);    // First subdiagonal
          ColVec subDiag2 = Diag(A, -2);    // Second subdiagonal
      
          // Output the results
          Console.WriteLine("Matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Superdiagonal k=1:");
          Console.WriteLine(superDiag1);
          Console.WriteLine("Superdiagonal k=2:");
          Console.WriteLine(superDiag2);
          Console.WriteLine("Main diagonal k=0:");
          Console.WriteLine(mainDiag);
          Console.WriteLine("Subdiagonal k=-1:");
          Console.WriteLine(subDiag1);
          Console.WriteLine("Subdiagonal k=-2:");
          Console.WriteLine(subDiag2);

      Output: 


       .. code-block:: Terminal 

          Matrix A:
          1   2   3   4   5
          6   7   8   9   10
          11  12  13  14  15
          16  17  18  19  20
          
          Superdiagonal k=1:
          2
          8
          14
          20
          
          Superdiagonal k=2:
          3
          9
          15
          
          Main diagonal k=0:
          1
          7
          13
          19
          
          Subdiagonal k=-1:
          6
          12
          18
          
          Subdiagonal k=-2:
          11
          17


Spdiag
======
   Description: 
       Extracts the k-th diagonal from a sparse matrix and returns it as a sparse column vector.
       This function efficiently extracts diagonal elements from sparse matrices, where k=0 represents the main diagonal,
       k>0 represents superdiagonals (above main diagonal), and k<0 represents subdiagonals (below main diagonal).
       Only non-zero elements are stored in the resulting sparse column vector, making it memory-efficient for large sparse matrices.

       .. code-block:: CSharp 

          SparseColVec Spdiag(SparseMatrix A, int k = 0)
          SparseMatrix Spdiag(ColVec A, int k = 0)
   Parameters: 
       A: 
         The input sparse matrix from which to extract the diagonal. Can be any m×n sparse matrix.
       k: 
         The diagonal offset. Default value is 0 (main diagonal). Positive values extract superdiagonals, negative values extract subdiagonals.
         For an m×n matrix, valid range is -(m-1) ≤ k ≤ (n-1).
   Returns: 
       A sparse column vector containing the elements of the k-th diagonal. The length of the vector is min(m, n-k) for k≥0 or min(m+k, n) for k<0.
       Only non-zero elements are stored in the sparse representation.
   Example: 
       Extract the main diagonal from a 4×4 sparse matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 4×4 sparse matrix
          SparseMatrix A = new SparseMatrix(4, 4);
          A[0, 0] = 1.0;
          A[1, 1] = 2.0;
          A[2, 2] = 3.0;
          A[3, 3] = 4.0;
          A[0, 2] = 5.0;
          A[1, 3] = 6.0;
          
          // Extract main diagonal (k=0)
          SparseColVec mainDiag = Spdiag(A, 0);
      
          // Output the results
          Console.WriteLine("Sparse matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Main diagonal (k=0):");
          Console.WriteLine(mainDiag);

      Output: 


       .. code-block:: Terminal 

          Sparse matrix A:
          1  0  5  0
          0  2  0  6
          0  0  3  0
          0  0  0  4
          
          Main diagonal (k=0):
          1
          2
          3
          4
   Example: 
       Extract different diagonals from a sparse matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 5×5 sparse matrix with various non-zero elements
          SparseMatrix A = new SparseMatrix(5, 5);
          A[0, 0] = 1.0; A[0, 1] = 2.0; A[0, 2] = 3.0;
          A[1, 1] = 4.0; A[1, 2] = 5.0; A[1, 3] = 6.0;
          A[2, 0] = 7.0; A[2, 2] = 8.0; A[2, 3] = 9.0;
          A[3, 1] = 10.0; A[3, 3] = 11.0; A[3, 4] = 12.0;
          A[4, 2] = 13.0; A[4, 4] = 14.0;
      
          // Extract different diagonals
          SparseColVec superDiag = Spdiag(A, 1);  // First superdiagonal
          SparseColVec mainDiag = Spdiag(A, 0);   // Main diagonal
          SparseColVec subDiag = Spdiag(A, -1);   // First subdiagonal
      
          // Output the results
          Console.WriteLine("Sparse matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Superdiagonal (k=1):");
          Console.WriteLine(superDiag);
          Console.WriteLine("Main diagonal (k=0):");
          Console.WriteLine(mainDiag);
          Console.WriteLine("Subdiagonal (k=-1):");
          Console.WriteLine(subDiag);

      Output: 


       .. code-block:: Terminal 

          Sparse matrix A:
          1  2  3  0  0
          0  4  5  6  0
          7  0  8  9  0
          0  10 0  11 12
          0  0  13 0  14
          
          Superdiagonal (k=1):
          2
          5
          9
          12
          
          Main diagonal (k=0):
          1
          4
          8
          11
          14
          
          Subdiagonal (k=-1):
          0
          7
          0
          13


Spdiags
=======
   Description: 
       Creates a sparse matrix from diagonal vectors and diagonal positions. This function extracts or creates sparse matrices 
       with specified diagonals from a list of sparse column vectors and their corresponding diagonal positions.
       The function places the vectors in Alist along the diagonals specified by klist to form a sparse matrix.

       .. code-block:: CSharp 

          SparseMatrix Spdiags(List<SparseColVec> Alist, List<int> klist)
          Spdiags(List<ColVec> Alist, List<int> klist) 
   Parameters: 
       Alist: 
             A list of sparse column vectors containing the diagonal elements. Each vector represents the elements 
             to be placed along the corresponding diagonal specified in klist. The vectors must have compatible 
             dimensions with the resulting matrix size.
       klist: 
             A list of integers specifying the diagonal positions where the vectors from Alist will be placed. 
             Positive values represent super-diagonals (above main diagonal), zero represents the main diagonal, 
             and negative values represent sub-diagonals (below main diagonal).
   Returns: 
       A sparse matrix with the specified diagonals populated from the input vectors. The matrix dimensions 
       are determined by the maximum diagonal position and vector lengths.
   Example: 
       Create a tridiagonal sparse matrix with main diagonal and adjacent diagonals:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Collections.Generic;
          using static SepalSolver.Math;
            
          // Create diagonal vectors
          var mainDiag = new SparseColVec(new double[] { 2, 2, 2, 2 });
          var upperDiag = new SparseColVec(new double[] { -1, -1, -1 });
          var lowerDiag = new SparseColVec(new double[] { -1, -1, -1 });
          
          // Specify diagonal positions
          var diagonals = new List<SparseColVec> { lowerDiag, mainDiag, upperDiag };
          var positions = new List<int> { -1, 0, 1 };
          
          // Create the sparse matrix
          SparseMatrix result = Spdiags(diagonals, positions);
      
          // Output the result
          Console.WriteLine("Tridiagonal matrix:");
          Console.WriteLine(result.ToString());

      Output: 


       .. code-block:: Terminal 

          Tridiagonal matrix:
          [ 2  -1   0   0 ]
          [-1   2  -1   0 ]
          [ 0  -1   2  -1 ]
          [ 0   0  -1   2 ]
   Example: 
       Create a sparse matrix with multiple super-diagonals:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Collections.Generic;
          using static SepalSolver.Math;
           
          // Create diagonal vectors
          var mainDiag = new SparseColVec(new double[] { 1, 1, 1, 1, 1 });
          var diag1 = new SparseColVec(new double[] { 2, 2, 2, 2 });
          var diag2 = new SparseColVec(new double[] { 3, 3, 3 });
      
          // Specify diagonal positions (main, first super, second super)
          var diagonals = new List<SparseColVec> { mainDiag, diag1, diag2 };
          var positions = new List<int> { 0, 1, 2 };
      
          // Create the sparse matrix
          SparseMatrix result = Spdiags(diagonals, positions);
      
          // Output the result
          Console.WriteLine("Matrix with super-diagonals:");
          Console.WriteLine(result.ToString());

      Output: 


       .. code-block:: Terminal 

          Matrix with super-diagonals:
          [ 1   2   3   0   0 ]
          [ 0   1   2   3   0 ]
          [ 0   0   1   2   3 ]
          [ 0   0   0   1   2 ]
          [ 0   0   0   0   1 ]


Lu
==
   Description: 
       Performs LU decomposition with partial pivoting on a matrix, decomposing it into the form P * A = L * U where L is lower triangular, U is upper triangular, and P is a permutation matrix.
       This function computes the LU factorization using Gaussian elimination with partial pivoting for numerical stability.
       L is a lower triangular matrix with ones on the diagonal, U is an upper triangular matrix, and P represents row permutations applied during the decomposition.
       The LU decomposition is fundamental for solving linear systems, computing determinants, and matrix inversion.

       .. code-block:: CSharp 

          (Matrix L, Matrix U, PermIndexer P) Lu(Matrix A)
          (SparseMatrix L, SparseMatrix U, PermIndexer P) Lu(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be decomposed. Must be a square n×n matrix for complete LU decomposition.
   Returns: 
       A tuple containing three components:
       - L: An n×n lower triangular matrix with ones on the main diagonal and zeros above the diagonal
       - U: An n×n upper triangular matrix with zeros below the main diagonal
       - P: A PermIndexer object representing the permutation matrix used for partial pivoting
       The original matrix A can be reconstructed as A = P^(-1) * L * U or equivalently P * A = L * U.
   Example: 
       Perform LU decomposition on a 3×3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 3×3 matrix
          Matrix A = new double[,] {
              {2, 1, 3},
              {4, 5, 6},
              {1, 2, 1}
          };
          
          // Perform LU decomposition
          var (L, U, P) = Lu(A);
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("Lower triangular matrix L:");
          Console.WriteLine(L);
          Console.WriteLine("Upper triangular matrix U:");
          Console.WriteLine(U);
          Console.WriteLine("Permutation indexer P:");
          Console.WriteLine(P);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          2  1  3
          4  5  6
          1  2  1
          
          Lower triangular matrix L:
          1.000  0.000  0.000
          0.500  1.000  0.000
          0.250  0.429  1.000
          
          Upper triangular matrix U:
          4.000  5.000  6.000
          0.000 -1.500  0.000
          0.000  0.000  0.714
          
          Permutation indexer P:
          [1, 0, 2]
   Example: 
       Perform LU decomposition and verify reconstruction:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a 4×4 matrix
          Matrix A = new Matrix(new double[,] {
              {1, 2, 3, 4},
              {5, 6, 7, 8},
              {9, 10, 11, 12},
              {13, 14, 15, 16}
          });
      
          // Perform LU decomposition
          var (L, U, P) = Lu(A);
      
          // Reconstruct the permuted matrix: PA = L * U
          Matrix PA = P.ApplyToRows(A);
          Matrix LU = L * U;
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("L * U reconstruction:");
          Console.WriteLine(LU);
          Console.WriteLine("P * A (permuted A):");
          Console.WriteLine(PA);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          1   2   3   4
          5   6   7   8
          9   10  11  12
          13  14  15  16
          
          L * U reconstruction:
          13.000  14.000  15.000  16.000
          5.000   6.000   7.000   8.000
          9.000   10.000  11.000  12.000
          1.000   2.000   3.000   4.000
          
          P * A (permuted A):
          13.000  14.000  15.000  16.000
          5.000   6.000   7.000   8.000
          9.000   10.000  11.000  12.000
          1.000   2.000   3.000   4.000


Chol
====
   Description: 
       Computes the Cholesky decomposition of a positive definite matrix. The Cholesky decomposition factors a 
       symmetric positive definite matrix A into the product A = L * L^T, where L is a lower triangular matrix 
       with positive diagonal elements. This decomposition is unique and numerically stable for solving linear systems.

       .. code-block:: CSharp 

          Matrix Chol(Matrix A)
          SparseMatrix Chol(SparseMatrix A)
   Parameters: 
       A: 
         A symmetric positive definite matrix to be decomposed. The matrix must be square, symmetric, and have all 
         positive eigenvalues. If the matrix is not positive definite, the function may throw an exception or return 
         an error depending on the overload used.
   Returns: 
       The lower triangular Cholesky factor L such that A = L * L^T. The returned matrix has the same dimensions 
       as the input matrix A, with zeros in the upper triangular part.
   Example: 
       Compute the Cholesky decomposition of a 3x3 positive definite matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a positive definite matrix
          Matrix A = new double[,] {
              { 4,  2,  1 },
              { 2,  3,  0.5 },
              { 1,  0.5, 2 }
          };
          
          // Compute the Cholesky decomposition
          Matrix L = Chol(A);
      
          // Output the result
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A.ToString());
          Console.WriteLine("Cholesky factor L:");
          Console.WriteLine(L.ToString());

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          [  4.000   2.000   1.000 ]
          [  2.000   3.000   0.500 ]
          [  1.000   0.500   2.000 ]
          Cholesky factor L:
          [  2.000   0.000   0.000 ]
          [  1.000   1.414   0.000 ]
          [  0.500  -0.354   1.336 ]
   Example: 
       Verify the Cholesky decomposition by reconstructing the original matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a positive definite matrix
          Matrix A = new double[,] {
              { 9,  3,  1 },
              { 3,  5,  1 },
              { 1,  1,  2 }
          };
      
          // Compute the Cholesky decomposition
          Matrix L = Chol(A);
          
          // Verify: A should equal L * L^T
          Matrix reconstructed = L * L.Transpose();
      
          // Output the results
          Console.WriteLine("Cholesky factor L:");
          Console.WriteLine(L.ToString());
          Console.WriteLine("Reconstructed A = L * L^T:");
          Console.WriteLine(reconstructed.ToString());

      Output: 


       .. code-block:: Terminal 

          Cholesky factor L:
          [  3.000   0.000   0.000 ]
          [  1.000   2.000   0.000 ]
          [  0.333   0.333   1.247 ]
          Reconstructed A = L * L^T:
          [  9.000   3.000   1.000 ]
          [  3.000   5.000   1.000 ]
          [  1.000   1.000   2.000 ]


Qr
==
   Description: 
       Computes the QR decomposition of a matrix. The QR decomposition factors a matrix A into the product A = Q * R, 
       where Q is an orthogonal matrix (Q^T * Q = I) and R is an upper triangular matrix. This decomposition is 
       fundamental in numerical linear algebra and is used for solving linear least squares problems and eigenvalue computations.

       .. code-block:: CSharp 

          (Matrix Q, Matrix R) Qr(Matrix A)
          (SparseMatrix Q, SparseMatrix R) Qr(SparseMatrix A)
   Parameters: 
       A: 
         The input matrix to be decomposed. The matrix can be rectangular (m×n) and does not need to be square. 
         For the decomposition to be meaningful, the matrix should have linearly independent columns, though 
         the algorithm can handle rank-deficient matrices.
   Returns: 
       A tuple containing two matrices: Q (orthogonal matrix) and R (upper triangular matrix) such that A = Q * R. 
       Q has dimensions m×m for full QR or m×n for economy QR, and R has dimensions m×n or n×n respectively.
   Example: 
       Compute the QR decomposition of a 3x3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a matrix
          Matrix A = new double[,] {
              { 1,  2,  3 },
              { 4,  5,  6 },
              { 7,  8,  9 }
          };
          
          // Compute the QR decomposition
          (Matrix Q, Matrix R) = Qr(A);
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A.ToString());
          Console.WriteLine("Orthogonal matrix Q:");
          Console.WriteLine(Q.ToString());
          Console.WriteLine("Upper triangular matrix R:");
          Console.WriteLine(R.ToString());

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          [  1.000   2.000   3.000 ]
          [  4.000   5.000   6.000 ]
          [  7.000   8.000   9.000 ]
          Orthogonal matrix Q:
          [ -0.123  -0.904   0.408 ]
          [ -0.492  -0.301  -0.816 ]
          [ -0.862   0.301   0.408 ]
          Upper triangular matrix R:
          [ -8.124  -9.601 -11.079 ]
          [  0.000   0.904   1.809 ]
          [  0.000   0.000   0.000 ]
   Example: 
       Verify the QR decomposition by reconstructing the original matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a rectangular matrix
          Matrix A = new double[,] {
              { 2,  1 },
              { 1,  3 },
              { 0,  1 }
          };
      
          // Compute the QR decomposition
          (Matrix Q, Matrix R) = Qr(A);
          
          // Verify: A should equal Q * R
          Matrix reconstructed = Q * R;
      
          // Output the results
          Console.WriteLine("Orthogonal matrix Q:");
          Console.WriteLine(Q.ToString());
          Console.WriteLine("Upper triangular matrix R:");
          Console.WriteLine(R.ToString());
          Console.WriteLine("Reconstructed A = Q * R:");
          Console.WriteLine(reconstructed.ToString());

      Output: 


       .. code-block:: Terminal 

          Orthogonal matrix Q:
          [ -0.894  -0.447 ]
          [ -0.447   0.894 ]
          [  0.000   0.000 ]
          Upper triangular matrix R:
          [ -2.236  -2.236 ]
          [  0.000   2.683 ]
          Reconstructed A = Q * R:
          [  2.000   1.000 ]
          [  1.000   3.000 ]
          [  0.000   1.000 ]


Ldl
===
   Description: 
       Computes the LDL decomposition of a symmetric matrix A, where A = L * D * L^T.
       This decomposition factorizes a symmetric matrix into the product of a unit lower triangular matrix L,
       a diagonal matrix D, and the transpose of L. The LDL decomposition is particularly useful for solving
       linear systems and computing determinants of symmetric matrices without requiring square roots.

       .. code-block:: CSharp 

          (Matrix L, Matrix D) Ldl(Matrix A)
          (SparseMatrix L, SparseMatrix D) Ldl(SparseMatrix A)
   Parameters: 
       A: 
         The input symmetric matrix to be decomposed. Must be a square matrix where A[i,j] = A[j,i].
         The matrix should be positive definite or positive semidefinite for numerical stability.
   Returns: 
       A tuple containing:
       - L: A unit lower triangular matrix (diagonal elements are 1) of the same size as A
       - D: A diagonal matrix of the same size as A containing the pivot elements
       Such that A = L * D * L^T
   Example: 
       Decompose a simple 3x3 symmetric matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a symmetric matrix
          Matrix A = new Matrix(new double[,] {
              {4, 2, 1},
              {2, 3, 0.5},
              {1, 0.5, 2}
          });
          
          // Compute the LDL decomposition
          var (L, D) = Ldl(A);
      
          // Output the results
          Console.WriteLine("Original matrix A:");
          Console.WriteLine(A);
          Console.WriteLine("\nLower triangular matrix L:");
          Console.WriteLine(L);
          Console.WriteLine("\nDiagonal matrix D:");
          Console.WriteLine(D);
          
          // Verify the decomposition
          Matrix reconstructed = L * D * L.Transpose();
          Console.WriteLine("\nReconstructed A = L * D * L^T:");
          Console.WriteLine(reconstructed);

      Output: 


       .. code-block:: Terminal 

          Original matrix A:
          [4, 2, 1]
          [2, 3, 0.5]
          [1, 0.5, 2]
          
          Lower triangular matrix L:
          [1, 0, 0]
          [0.5, 1, 0]
          [0.25, 0.125, 1]
          
          Diagonal matrix D:
          [4, 0, 0]
          [0, 2, 0]
          [0, 0, 1.75]
          
          Reconstructed A = L * D * L^T:
          [4, 2, 1]
          [2, 3, 0.5]
          [1, 0.5, 2]
   Example: 
       Use LDL decomposition to solve a linear system Ax = b:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the system matrix and right-hand side
          Matrix A = new Matrix(new double[,] {
              {9, 3, 1},
              {3, 5, 2},
              {1, 2, 4}
          });
          
          ColVec b = new ColVec(new double[] {13, 10, 7});
      
          // Compute the LDL decomposition
          var (L, D) = Ldl(A);
          
          // Solve the system using forward and back substitution
          // First solve L * y = b
          ColVec y = ForwardSubstitution(L, b);
          
          // Then solve D * z = y
          ColVec z = DiagonalSolve(D, y);
          
          // Finally solve L^T * x = z
          ColVec x = BackSubstitution(L.Transpose(), z);
      
          // Output the solution
          Console.WriteLine($"Solution x = {x}");
          Console.WriteLine($"Verification Ax = {A * x}");

      Output: 


       .. code-block:: Terminal 

          Solution x = [1, 1, 1]
          Verification Ax = [13, 10, 7]


Mldivide
========
   Description: 
       Solves the linear system Ax = b using matrix left division (backslash operator). This function automatically
       selects the most appropriate algorithm based on the properties of matrix A, including LU decomposition for
       general matrices, Cholesky decomposition for symmetric positive definite matrices, and QR decomposition
       for overdetermined systems. The function is equivalent to MATLAB's backslash operator A\b.

       .. code-block:: CSharp 

          ColVec Mldivide(Matrix A, ColVec b)
          Matrix Mldivide(Matrix A, Matrix B)
   Parameters: 
       A: 
         The coefficient matrix of the linear system. Can be square (n×n) for exact solutions or rectangular (m×n where m>n)
         for least-squares solutions. For square systems, A should be non-singular. For overdetermined systems, A should
         have full column rank for a unique least-squares solution.
       b: 
         The right-hand side vector of the linear system. Must have the same number of rows as matrix A.
   Returns: 
       The solution vector x such that Ax = b (for square systems) or the least-squares solution that minimizes ||Ax - b||₂
       (for overdetermined systems). Returns a ColVec of the same length as the number of columns in A.
   Example: 
       Solve a square linear system Ax = b:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the coefficient matrix
          Matrix A = new double[,] {
              {2, 1, 0},
              {1, 3, 1},
              {0, 1, 2}
          };
          
          // Define the right-hand side vector
          ColVec b = new ColVec(new double[] {1, 2, 3});
          
          // Solve the linear system
          ColVec x = Mldivide(A, b);
      
          // Output the solution
          Console.WriteLine($"Solution x = {x}");
          
          // Verify the solution
          ColVec verification = A * x;
          Console.WriteLine($"Verification Ax = {verification}");
          Console.WriteLine($"Original b = {b}");

      Output: 


       .. code-block:: Terminal 

          Solution x = [-0.2, 0.6, 1.2]
          Verification Ax = [1, 2, 3]
          Original b = [1, 2, 3]
   Example: 
       Solve an overdetermined system using least-squares:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define an overdetermined system (4 equations, 3 unknowns)
          Matrix A = new double[,] {
              {1, 2, 1},
              {2, 1, 3},
              {1, 1, 2},
              {3, 2, 1}
          };
          
          ColVec b = new double[] {6, 8, 5, 7};
      
          // Solve using least-squares
          ColVec x = Mldivide(A, b);
          
          // Compute residual
          ColVec residual = A * x - b;
          double residualNorm = residual.Norm();
      
          // Output the results
          Console.WriteLine($"Least-squares solution x = {x}");
          Console.WriteLine($"Residual ||Ax - b|| = {residualNorm:F6}");
          Console.WriteLine($"Ax = {A * x}");
          Console.WriteLine($"b = {b}");

      Output: 


       .. code-block:: Terminal 

          Least-squares solution x = [0.857143, 1.428571, 1.142857]
          Residual ||Ax - b|| = 0.816497
          Ax = [5.428571, 8.571429, 5.428571, 7.142857]
          b = [6, 8, 5, 7]


Mrdivide
========
   Description: 
       Solves the linear system xA = b using matrix right division (forward slash operator). This function computes
       the solution to the system where x is multiplied on the left by matrix A to produce b. It automatically
       selects the most appropriate algorithm based on the properties of matrix A, equivalent to solving A^T * x^T = b^T
       and then transposing the result. The function is equivalent to MATLAB's forward slash operator b/A.

       .. code-block:: CSharp 

          RowVec Mrdivide(RowVec b, Matrix A)
          Matrix Mrdivide(Matrix B, Matrix A)
   Parameters: 
       b: 
         The right-hand side row vector of the linear system. Must have the same number of columns as matrix A has rows.
         This represents the known values in the equation xA = b.
       A: 
         The coefficient matrix of the linear system. Can be square (n×n) for exact solutions or rectangular (n×m where n>m)
         for least-squares solutions. For square systems, A should be non-singular. For underdetermined systems, A should
         have full row rank for a unique minimum-norm solution.
   Returns: 
       The solution row vector x such that xA = b (for square systems) or the least-squares/minimum-norm solution
       (for rectangular systems). Returns a RowVec with the same number of columns as A has columns.
   Example: 
       Solve a square linear system xA = b:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the coefficient matrix
          Matrix A = new double[,] {
              {3, 1, 2},
              {1, 4, 1},
              {2, 1, 3}
          };
          
          // Define the right-hand side row vector
          RowVec b = new double[] {14, 12, 16};
          
          // Solve the linear system xA = b
          RowVec x = Mrdivide(b, A);
      
          // Output the solution
          Console.WriteLine($"Solution x = {x}");
          
          // Verify the solution
          RowVec verification = x * A;
          Console.WriteLine($"Verification xA = {verification}");
          Console.WriteLine($"Original b = {b}");

      Output: 


       .. code-block:: Terminal 

          Solution x = [2, 3, 1]
          Verification xA = [14, 12, 16]
          Original b = [14, 12, 16]
   Example: 
       Solve an underdetermined system using minimum-norm solution:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define an underdetermined system (2 equations, 3 unknowns)
          Matrix A = new double[,] {
              {1, 2, 1},
              {2, 1, 3}
          };
          
          RowVec b = new double[] {5, 7};
      
          // Solve using minimum-norm solution
          RowVec x = Mrdivide(b, A);
          
          // Compute the norm of the solution
          double solutionNorm = x.Norm();
          
          // Verify the solution
          RowVec verification = x * A;
      
          // Output the results
          Console.WriteLine($"Minimum-norm solution x = {x}");
          Console.WriteLine($"Solution norm ||x|| = {solutionNorm:F6}");
          Console.WriteLine($"Verification xA = {verification}");
          Console.WriteLine($"Original b = {b}");

      Output: 


       .. code-block:: Terminal 

          Minimum-norm solution x = [1.4, 1.2, 1.0]
          Solution norm ||x|| = 2.140093
          Verification xA = [5, 7]
          Original b = [5, 7]




   Description: 
       Solves the linear system Ax = b using the Conjugate Gradient method. This iterative method is specifically
       designed for solving systems with symmetric positive definite matrices. The algorithm minimizes the quadratic
       function f(x) = (1/2)x^T*A*x - b^T*x by generating a sequence of conjugate directions and is guaranteed to
       converge to the exact solution within n iterations for an n×n matrix, though practical convergence often
       occurs much faster depending on the condition number of A.

       .. code-block:: CSharp 

          (ColVec x, int flag, double relres, int iter, ColVec resvec) ConjGrad(Matrix A, ColVec b, double tol = 1e-6, int maxiter = 100)
          (ColVec x, int flag, double relres, int iter, ColVec resvec) ConjGrad(SparseMatrix A, ColVec b, double tol = 1e-6, int maxiter = 100)
          (ColVec x, int flag, double relres, int iter, ColVec resvec) GenMinRes(Matrix A, ColVec b, int restart = 20, double tol = 1e-6, int maxiter = 100)
          (ColVec x, int flag, double relres, int iter, ColVec resvec) GenMinRes(SparseMatrix A, ColVec b, int restart = 20, double tol = 1e-6, int maxiter = 100)
          (ColVec x, int flag, double relres, int iter, ColVec resvec) GenMinRes(SparseMatrix A, ColVec b, double tol = 1e-6, int maxiter = 100, SparseMatrix M1 = null, SparseMatrix M2 = null, int? rstart = null, ColVec x0 = null)
   Parameters: 
       A: 
         The coefficient matrix of the linear system. Must be symmetric and positive definite for guaranteed convergence.
         The matrix should be well-conditioned for optimal performance, as the convergence rate depends on the condition number.
       b: 
         The right-hand side vector of the linear system. Must have the same number of rows as matrix A.
       tol: 
           The relative tolerance for convergence. The algorithm stops when the relative residual ||r_k||/||b|| ≤ tol,
           where r_k = b - Ax_k is the residual at iteration k. Default value is 1e-6.
       maxiter: 
               The maximum number of iterations allowed. If convergence is not achieved within this limit, the algorithm
               returns the best approximation found. Default value is 100.
   Returns: 
       A tuple containing:
       - x: The approximate solution vector to the linear system Ax = b
       - flag: Convergence flag (0 = converged, 1 = maximum iterations reached, 2 = breakdown occurred)
       - relres: The relative residual ||r||/||b|| at termination
       - iter: The actual number of iterations performed
       - resvec: A vector containing the relative residual at each iteration for convergence analysis
   Example: 
       Solve a symmetric positive definite system using Conjugate Gradient:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a symmetric positive definite matrix
          Matrix A = new double[,] {
              {4, 1, 0},
              {1, 3, 1},
              {0, 1, 2}
          };
          
          // Define the right-hand side vector
          ColVec b = new double[] {1, 2, 3};
          
          // Solve using Conjugate Gradient with default parameters
          var (x, flag, relres, iter, resvec) = ConjGrad(A, b);
      
          // Output the results
          Console.WriteLine($"Solution x = {x}");
          Console.WriteLine($"Convergence flag = {flag}");
          Console.WriteLine($"Relative residual = {relres:E6}");
          Console.WriteLine($"Iterations = {iter}");
          
          // Verify the solution
          ColVec verification = A * x;
          Console.WriteLine($"Verification Ax = {verification}");

      Output: 


       .. code-block:: Terminal 

          Solution x = [-0.090909, 0.454545, 1.272727]
          Convergence flag = 0
          Relative residual = 8.123456E-07
          Iterations = 3
          Verification Ax = [1, 2, 3]
   Example: 
       Solve a large sparse system with custom tolerance and analyze convergence:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create a larger symmetric positive definite matrix (tridiagonal)
          Matrix A = new double[,](5, 5);
          for (int i = 0; i < 5; i++)
          {
              A[i, i] = 4.0;
              if (i > 0) A[i, i-1] = -1.0;
              if (i < 4) A[i, i+1] = -1.0;
          }
          
          ColVec b = new double[] {3, 2, 2, 2, 1};
      
          // Solve with stricter tolerance and more iterations
          var (x, flag, relres, iter, resvec) = ConjGrad(A, b, tol: 1e-10, maxiter: 50);
          
          // Output convergence information
          Console.WriteLine($"Solution x = {x}");
          Console.WriteLine($"Convergence flag = {flag}");
          Console.WriteLine($"Final relative residual = {relres:E10}");
          Console.WriteLine($"Iterations performed = {iter}");
          
          // Show convergence history
          Console.WriteLine("Convergence history:");
          for (int i = 0; i < Min(iter, 5); i++)
          {
              Console.WriteLine($"Iteration {i+1}: relres = {resvec[i]:E6}");
          }

      Output: 


       .. code-block:: Terminal 

          Solution x = [1, 1, 1, 1, 1]
          Convergence flag = 0
          Final relative residual = 2.3456789123E-11
          Iterations performed = 5
          Convergence history:
          Iteration 1: relres = 8.944272E-01
          Iteration 2: relres = 4.472136E-01
          Iteration 3: relres = 1.788854E-01
          Iteration 4: relres = 5.963847E-02
          Iteration 5: relres = 2.345679E-11


SolverSet
=========
   Description: 
       Creates and returns a configuration object for solver settings.
       This method allows customization of solver behavior such as step size, tolerance levels, iteration limits, and parallel execution. It also supports a user-defined Jacobian function to improve solver efficiency and accuracy.

       .. code-block:: CSharp 

           Solvers.Set SolverSet(bool? Display = false, double? StepFactor = null, double? RelTol = null, double? AbsTol = null, 
           int? MaxIter = null, int? MaxFunEvals = null, bool? UseParallel = null, Func<ColVec, SparseMatrix> UserDefinedJac = null)
   Parameters: 
       Display: 
               Optional. If <c>true</c>, enables display of solver progress and results during execution. Defaults to <c>false</c>.
       StepFactor: 
                  Optional. A scaling factor for the initial step size used in iterative solvers.
       RelTol: 
              Optional. Relative tolerance. The solver stops when the relative change in the solution is below this threshold.
       AbsTol: 
              Optional. Absolute tolerance. The solver stops when the absolute change in the solution is below this threshold.
       MaxIter: 
               Optional. Maximum number of iterations allowed for the solver.
       MaxFunEvals: 
                   Optional. Maximum number of function evaluations allowed.
       UseParallel: 
                   Optional. If <c>true</c>, enables parallel computation for supported solvers.
       UserDefinedJac: 
                      Optional. A user-defined function that returns the Jacobian matrix of the system. This can improve convergence speed and accuracy.
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
             11   1.3303e+0   -7.6458e+0    1.6697e+0    -5.345e+0   search
             13     1.26e+0   -7.9996e+0      1.74e+0    -4.732e+0   search
             15   1.1606e+0   -8.4367e+0    1.8394e+0   -3.7765e+0   search
             17     1.02e+0   -8.9388e+0      1.98e+0   -2.2376e+0   search
             19   8.2118e-1   -9.4463e+0    2.1788e+0    3.4345e-1   search
      
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
   Parameters: 
       Display: 
               Optional. If set to <c>true</c>, displays solver progress and results during and after execution. Defaults to <c>false</c>.
       FuncTol: 
               Optional. Function tolerance. The solver stops when the change in the objective function value is less than this threshold.
       OptimalityTol: 
                     Optional. Optimality tolerance. Determines the acceptable level of optimality for the solution.
       StepTol: 
               Optional. Step tolerance. The solver stops if the step size becomes smaller than this value.
       ConstraintTol: 
                     Optional. Constraint tolerance. Specifies the acceptable violation level for constraints.
       Weight: 
              Optional. A vector of weights used in weighted optimization problems.
       MaxIter: 
               Optional. Maximum number of iterations allowed for the solver.
       MaxFunEvals: 
                   Optional. Maximum number of function evaluations allowed.
       UseParallel: 
                   Optional. If set to <c>true</c>, enables parallel computation for supported solvers.
       Pltfun: 
              Optional. A plotting function or delegate that visualizes the optimization process.
       PopulationSize: 
                      Optional. Specifies the population size for population-based algorithms (e.g., genetic algorithms).
       LMUpdate: 
                Optional. Specifies the update strategy for the Levenberg-Marquardt algorithm.
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
                Subject~to:& \\
                           & 4x_1 + 2x_2 + 3x_2 \leq 60 \\
                           & 3x_1 + 2x_2 + 2x_3 \leq 40 \\
                           & 2x_1 + x_2 + 4x_3 \leq 36 \\ 
                           & x_1, x_2, x_3 >= 0 ~\text{and are integers} \\
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
          Minimize: f(x, y) = (1 - x)^2 + 100(y - x^2)^2
          

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


Fft
===
   Description: 
       Computes the Fast Fourier Transform (FFT) of a real-valued signal using the Cooley-Tukey algorithm.
       The FFT transforms a signal from the time domain to the frequency domain, converting N real samples 
       into N/2+1 complex frequency components. The algorithm has O(N log N) computational complexity.

       .. code-block:: CSharp 

          Complex[] Fft(double[] X, int n = 1)
   Parameters: 
       X: 
         The input real-valued signal array in the time domain. The array length should preferably be a power of 2 
         for optimal performance, though the algorithm can handle arbitrary lengths through zero-padding.
       n: 
         The normalization factor for the transform. Default value is 1. When n = 1, no normalization is applied.
         For other values, the result is divided by n^(length of transform).
   Returns: 
       An array of Complex numbers representing the frequency domain coefficients. The length of the output
       is N/2+1 where N is the length of the input array, containing frequencies from 0 Hz to the Nyquist frequency.
   Example: 
       Compute the FFT of a simple sine wave signal:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Numerics;
          using static SepalSolver.Math;
            
          // Create a sine wave signal
          double[] signal = new double[8];
          for (int i = 0; i < signal.Length; i++)
          {
              signal[i] = Sin(2 * pi * i / 8);
          }
          
          // Compute the FFT
          Complex[] result = Fft(signal);
      
          // Output the results
          for (int i = 0; i < result.Length; i++)
          {
              Console.WriteLine($"Bin {i}: {result[i].Real:F6} + {result[i].Imaginary:F6}i");
          }

      Output: 


       .. code-block:: Terminal 

          Bin 0: 0.000000 + 0.000000i
          Bin 1: 0.000000 + -4.000000i
          Bin 2: 0.000000 + 0.000000i
          Bin 3: 0.000000 + 0.000000i
          Bin 4: 0.000000 + 0.000000i
   Example: 
       Compute the FFT of a DC signal with custom normalization:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Numerics;
          using static SepalSolver.Math;
           
          // Create a constant DC signal
          double[] dcSignal = { 1.0, 1.0, 1.0, 1.0 };
      
          // Compute the FFT with normalization factor of 2
          Complex[] result = Fft(dcSignal, 2);
      
          // Output the results
          for (int i = 0; i < result.Length; i++)
          {
              Console.WriteLine($"Frequency bin {i}: {result[i].Real:F6} + {result[i].Imaginary:F6}i");
          }

      Output: 


       .. code-block:: Terminal 

          Frequency bin 0: 0.250000 + 0.000000i
          Frequency bin 1: 0.000000 + 0.000000i
          Frequency bin 2: 0.000000 + 0.000000i


Ifft
====
   Description: 
       Computes the Inverse Fast Fourier Transform (IFFT) of a frequency domain signal, converting it back to the time domain.
       The IFFT transforms N frequency domain coefficients into N time domain samples using the inverse Cooley-Tukey algorithm.
       This operation is the inverse of the FFT and reconstructs the original signal from its frequency representation.

       .. code-block:: CSharp 

          Complex[] Ifft(double[] X, int n = 1)
   Parameters: 
       X: 
         The input frequency domain coefficients as a real-valued array. Typically represents the magnitude spectrum
         or real parts of frequency components. The array length should preferably be a power of 2 for optimal performance.
       n: 
         The normalization factor for the inverse transform. Default value is 1. When n = 1, standard normalization is applied.
         The result is scaled by 1/(n * N) where N is the length of the input array.
   Returns: 
       An array of Complex numbers representing the reconstructed time domain signal. The length of the output
       matches the input length, containing the time-domain samples as complex values.
   Example: 
       Compute the IFFT to reconstruct a time domain signal from frequency coefficients:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Numerics;
          using static SepalSolver.Math;
            
          // Create frequency domain coefficients (representing a DC component)
          double[] freqCoeffs = { 4.0, 0.0, 0.0, 0.0 };
          
          // Compute the IFFT
          Complex[] result = Ifft(freqCoeffs);
      
          // Output the reconstructed time domain signal
          for (int i = 0; i < result.Length; i++)
          {
              Console.WriteLine($"Sample {i}: {result[i].Real:F6} + {result[i].Imaginary:F6}i");
          }

      Output: 


       .. code-block:: Terminal 

          Sample 0: 1.000000 + 0.000000i
          Sample 1: 1.000000 + 0.000000i
          Sample 2: 1.000000 + 0.000000i
          Sample 3: 1.000000 + 0.000000i
   Example: 
       Compute the IFFT with custom normalization to reconstruct a scaled signal:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Numerics;
          using static SepalSolver.Math;
           
          // Create frequency domain representation of a simple pattern
          double[] freqData = { 8.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
      
          // Compute the IFFT with normalization factor of 2
          Complex[] result = Ifft(freqData, 2);
      
          // Output the reconstructed signal
          for (int i = 0; i < result.Length; i++)
          {
              Console.WriteLine($"Time sample {i}: {result[i].Real:F6} + {result[i].Imaginary:F6}i");
          }

      Output: 


       .. code-block:: Terminal 

          Time sample 0: 0.500000 + 0.000000i
          Time sample 1: 0.500000 + 0.000000i
          Time sample 2: 0.500000 + 0.000000i
          Time sample 3: 0.500000 + 0.000000i
          Time sample 4: 0.500000 + 0.000000i
          Time sample 5: 0.500000 + 0.000000i
          Time sample 6: 0.500000 + 0.000000i
          Time sample 7: 0.500000 + 0.000000i


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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
            A function that represents the ODE. 
                    | double dydx(double t, double y);
                    | ColVec dydx(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: evaluation of the ODE.
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
                   | ColVec fun(double t, ColVec y);
              * t: time.
              * y: state.
              * Returns: right-hand side of the DAE.
       Mass: 
            A function defining the mass matrix M(t, y). This matrix may be time- and state-dependent.
                    | Matrix Mass(double t, ColVec y);
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
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45a) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
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


Trapz
=====
   Description: 
       Computes the definite integral of a function using the adaptive trapezoidal rule with automatic error control.
       The algorithm recursively subdivides the integration interval until the desired accuracy is achieved,
       approximating the integral ∫[x₁,x₂] f(x) dx using trapezoids of varying widths for optimal precision.

       .. code-block:: CSharp 

          double Trapz(Func<double, double> fun, double x_1, double x_2, double eps = 1e-6)
          double Trapz(ColVec X, ColVec Y)
   Parameters: 
       fun: 
           The function to integrate, provided as a Func<double, double> delegate. The function must be continuous
           and well-defined over the integration interval [x_1, x_2].
       x_1: 
           The lower limit of integration. Can be any finite real number, and may be greater than x_2 for
           integration in the reverse direction.
       x_2: 
           The upper limit of integration. Can be any finite real number. If x_2 < x_1, the integral
           is computed with a negative sign according to the fundamental theorem of calculus.
       eps: 
           The desired absolute error tolerance for the integration. Default value is 1e-6. Must be a positive
           number. Smaller values result in higher accuracy but increased computation time.
       X: 
         A column vector containing the x-coordinates (independent variable values) of the data points.
         The values should be in ascending order for proper integration. Must have the same length as Y.
       Y: 
         A column vector containing the y-coordinates (function values) corresponding to each x-coordinate.
         Represents the discrete samples of the function to be integrated. Must have the same length as X.
   Returns: 
       The approximate value of the definite integral as a point value or an array of number. The result has an estimated error
       less than or equal to the specified tolerance eps.
   Example: 
       Integrate a simple polynomial function x² from 0 to 2:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the function to integrate
          Func<double, double> polynomial = x => x * x;
          
          // Set integration limits
          double lowerLimit = 0.0;
          double upperLimit = 2.0;
          
          // Compute the integral
          double result = Trapz(polynomial, lowerLimit, upperLimit);
      
          // Output the result (analytical result is 8/3 ≈ 2.666667)
          Console.WriteLine($"∫₀² x² dx = {result:F6}");

      Output: 


       .. code-block:: Terminal 

          ∫₀² x² dx = 2.666667
   Example: 
       Integrate discrete samples of a quadratic function:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create x-coordinates for the interval [0, 2]
          ColVec xValues = new double[] { 0.0, 0.5, 1.0, 1.5, 2.0 };
          
          // Create y-coordinates for f(x) = x²
          ColVec yValues = new double[] { 0.0, 0.25, 1.0, 2.25, 4.0 };
          
          // Compute the integral using trapezoidal rule
          double result = Trapz(xValues, yValues);
      
          // Output the result (exact integral of x² from 0 to 2 is 8/3 ≈ 2.667)
          Console.WriteLine($"∫₀² x² dx ≈ {result:F6}");

      Output: 


       .. code-block:: Terminal 

          ∫₀² x² dx ≈ 2.666667


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


nchoosek
========
   Description: 
       Computes all possible combinations of n elements from a given list of items, also known as "n choose k" or C(k,n).
       This function generates all possible subsets of size n from the input list, where order does not matter.
       The total number of combinations returned is given by the binomial coefficient C(k,n) = k! / (n! × (k-n)!) where k is the length of the input list.

       .. code-block:: CSharp 

          List<List<int>> nchoosek(List<int> items, int n)
          Matrix nchoosek(RowVec items, int n)
   Parameters: 
       items: 
             The list of integers or input of row vector from which to select combinations. The list can contain any integers and duplicate values are treated as distinct elements.
             The list must not be null and should contain at least n elements for meaningful results.
       n: 
         The number of elements to select in each combination. Must be a non-negative integer and should not exceed the length of the items list.
         If n equals 0, returns a list containing one empty list. If n exceeds the items length, returns an empty list.
   Returns: 
       A list of lists where each inner list contains exactly n integers representing one combination from the input items.
       The combinations are returned in lexicographic order based on the indices of the original list. It also return two-dimensional array if the input is a row vector.
   Example: 
       Generate all combinations of 2 elements from a list of 4 numbers:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using System.Collections.Generic;
          using static SepalSolver.Math;
            
          // Create input list
          List<int> items = new List<int> { 1, 2, 3, 4 };
          int n = 2;
      
          // Compute all combinations
          List<List<int>> combinations = nchoosek(items, n);
      
          // Output the results
      
          // Output the results
          Console.WriteLine($"All combinations of {n} from {string.Join(",", items)}:");
          foreach (var combo in combinations)
          {
              Console.WriteLine($"[{string.Join(", ", combo)}]");
          }
          Console.WriteLine($"Total combinations: {combinations.Count}");

      Output: 


       .. code-block:: Terminal 

          All combinations of 2 from 1,2,3,4:
          [1, 2]
          [1, 3]
          [1, 4]
          [2, 3]
          [2, 4]
          [3, 4]
          Total combinations: 6
   Example: 
       Generate all combinations of 3 elements from a row vector with integer values:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create input row vector with 5 elements
          RowVec items = new double[] {10, 20, 30, 40, 50};
          int n = 3;
      
          // Compute all combinations
          Matrix combinations = nchoosek(items, n);
      
          // Output the results
          Console.WriteLine($"All combinations of {n} from [{string.Join(", ", items.ToArray())}]:");
          Console.WriteLine("Result Matrix:");
          Console.WriteLine(combinations.ToString());
          Console.WriteLine($"Matrix dimensions: {combinations.Rows} × {combinations.Cols}");

      Output: 


       .. code-block:: Terminal 

          All combinations of 3 from [10, 20, 30, 40, 50]:
          Result Matrix:
          10  20  30
          10  20  40
          10  20  50
          10  30  40
          10  30  50
          10  40  50
          20  30  40
          20  30  50
          20  40  50
          30  40  50
          Matrix dimensions: 10 × 3


permute
=======
   Description: 
       Generates all possible permutations of elements within a specified range of an integer array or input of row vector using recursive backtracking.
       This function computes all distinct arrangements of elements from index l to index r (inclusive) in the input array.
       The total number of permutations generated is (r-l+1)! where the factorial accounts for all possible arrangements of the elements in the specified range.
       Elements outside the range [l,r] remain fixed in their original positions across all permutations.

       .. code-block:: CSharp 

          List<int[]> permute(int[] str, int l, int r)
          Matrix permute(RowVec str, int l, int r)
   Parameters: 
       str: 
           The input integer array or row vector containing the elements to be permuted. The array must not be null and should contain at least one element.
           Duplicate values in the array are treated as distinct elements and will generate separate permutations.
       l: 
         The left boundary index (inclusive) specifying the start of the range to permute. Must be a non-negative integer and should be less than or equal to r.
         If l equals r, only one permutation (the original array) is returned. Must be within the bounds of the input array.
       r: 
         The right boundary index (inclusive) specifying the end of the range to permute. Must be a non-negative integer and should be greater than or equal to l.
         Must be within the bounds of the input array (r < str.Length). Elements at positions greater than r remain unchanged.
   Returns: 
       A list of integer arrays where each array represents one unique permutation of elements within the specified range [l,r].
       Each returned array has the same length as the input array, with elements outside [l,r] remaining in their original positions.
       The total number of permutations returned is (r-l+1)!.
   Example: 
       Generate all permutations of elements in positions 1 to 3 of a 5-element array:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create input array
          int[] str = new int[] {1, 2, 3, 4, 5};
          int l = 1;  // start permuting from index 1
          int r = 3;  // end permuting at index 3
          
          // Generate all permutations
          List<int[]> permutations = permute(str, l, r);
      
          // Output the results
          Console.WriteLine($"Original array: [{string.Join(", ", str)}]");
          Console.WriteLine($"Permuting indices {l} to {r}:");
          for (int i = 0; i &lt; permutations.Count; i++)
          {
              Console.WriteLine($"  [{string.Join(", ", permutations[i])}]");
          }
          Console.WriteLine($"Total permutations: {permutations.Count}");

      Output: 


       .. code-block:: Terminal 

          Original array: [1, 2, 3, 4, 5]
          Permuting indices 1 to 3:
            [1, 2, 3, 4, 5]
            [1, 2, 4, 3, 5]
            [1, 3, 2, 4, 5]
            [1, 3, 4, 2, 5]
            [1, 4, 2, 3, 5]
            [1, 4, 3, 2, 5]
          Total permutations: 6
   Example: 
       Generate all permutations of elements in positions 1 to 3 of a 5-element row vector:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create input row vector
          RowVec items = new double[] {1.0, 2.0, 3.0, 4.0, 5.0};
          int l = 1;  // start permuting from index 1
          int r = 3;  // end permuting at index 3
          
          // Generate all permutations
          Matrix permutations = permute(items, l, r);
      
          // Output the results
          Console.WriteLine($"Original vector: [{string.Join(", ", items.ToArray())}]");
          Console.WriteLine($"Permuting indices {l} to {r}:");
          Console.WriteLine("Result Matrix:");
          Console.WriteLine(permutations.ToString());
          Console.WriteLine($"Matrix dimensions: {permutations.Rows} × {permutations.Cols}");

      Output: 


       .. code-block:: Terminal 

          Original vector: [1, 2, 3, 4, 5]
          Permuting indices 1 to 3:
          Result Matrix:
          1  2  3  4  5
          1  2  4  3  5
          1  3  2  4  5
          1  3  4  2  5
          1  4  2  3  5
          1  4  3  2  5
          Matrix dimensions: 6 × 5


Laplace
=======
   Description: 
       Computes the Laplace transform of a given function f(t) at a specified complex frequency parameter s.
       The Laplace transform is defined as :math:`\mathcal{L}\{f(t)\}(s) = \int_0^{\infty} f(t)e^{-st} dt`, which converts a time-domain function into the s-domain.
       This implementation uses numerical integration techniques with adaptive error control to approximate the improper integral.
       The transform is particularly useful for solving differential equations, analyzing linear time-invariant systems, and signal processing applications.

       .. code-block:: CSharp 

          double Laplace(Func< double, double > f, double s, double eps = 1e-6)
          Complex Laplace(Func< double, Complex > f, Complex s, double eps = 1e-6)
          Matrix Laplace(Func< double, Matrix > f, double s, double eps = 1e-6)
          ColVec Laplace(Func< double, ColVec > f, double s, double eps = 1e-6)
          RowVec Laplace(Func< double, RowVec > f, double s, double eps = 1e-6)
   Parameters: 
       f: 
         The input function f(t) to be transformed, defined as a delegate that takes a double parameter (time t) and returns a double value.
         The function should be defined for t ≥ 0 and must have exponential order for the transform to converge.
         Functions with polynomial growth or exponential decay are typically suitable for Laplace transformation.
       s: 
         The complex frequency parameter at which to evaluate the Laplace transform. Must be a real number with Re(s) sufficiently large for convergence.
         For most functions, s should be positive and greater than the abscissa of convergence to ensure the integral converges.
         Larger values of s generally improve numerical stability but may reduce accuracy for rapidly oscillating functions.
       eps: 
           The numerical tolerance for the integration algorithm, controlling the accuracy of the approximation. Default value is 1e-6.
           Smaller values provide higher accuracy but require more computational time. Must be a positive real number.
           The algorithm will continue refining the approximation until the estimated error falls below this threshold.
   Returns: 
       The value of the Laplace transform :math:`\mathcal{L}\{f(t)\}(s)` as a double precision floating-point number.
       Returns the numerical approximation of the integral :math:`\int_0^{\infty} f(t)e^{-st} dt` evaluated at the specified s parameter.
   Example: 
       Compute the Laplace transform of :math:`f(t) = e^{-2t}`, which should equal :math:`1/(s+2)`:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Define the function f(t) = e^(-2t)
          Func< double, double> f = t => Math.Exp(-2.0 * t);
          double s = 3.0;
          double eps = 1e-8;
          
          // Compute the Laplace transform
          double result = Laplace(f, s, eps);
          
          // Compare with analytical result
          double analytical = 1.0 / (s + 2.0);
      
          // Output the results
          Console.WriteLine($"f(t) = e^(-2t)");
          Console.WriteLine($"L{{f(t)}}({s}) = {result:F8}");
          Console.WriteLine($"Analytical: 1/({s}+2) = {analytical:F8}");
          Console.WriteLine($"Error: {Math.Abs(result - analytical):E2}");

      Output: 


       .. code-block:: Terminal 

          f(t) = e^(-2t)
          L{f(t)}(3) = 0.20000000
          Analytical: 1/(3+2) = 0.20000000
          Error: 1.23E-09
   Example: 
       Compute the Laplace transform of :math:`f(t) = t^2e^{-t}`, which should equal :math:`2/(s+1)^3`:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Define the function f(t) = t²e^(-t)
          Func<double, double> f = t => t * t * Math.Exp(-t);
          double s = 2.0;
          double eps = 1e-6;
      
          // Compute the Laplace transform
          double result = Laplace(f, s, eps);
          
          // Compare with analytical result
          double analytical = 2.0 / Math.Pow(s + 1.0, 3);
      
          // Output the results
          Console.WriteLine($"f(t) = t²e^(-t)");
          Console.WriteLine($"L{{f(t)}}({s}) = {result:F6}");
          Console.WriteLine($"Analytical: 2/(s+1)³ = {analytical:F6}");
          Console.WriteLine($"Error: {Math.Abs(result - analytical):E2}");

      Output: 


       .. code-block:: Terminal 

          f(t) = t²e^(-t)
          L{f(t)}(2) = 0.074074
          Analytical: 2/(2+1)³ = 0.074074
          Error: 3.45E-07


NiLaplace
=========
   Description: 
       Numerically inverts a Laplace-transformed function using the Gaver-Stehfest algorithm.
       This method approximates the original time-domain function from its Laplace-domain representation.
       Mathematically, this can be expressed as:

       .. math::
          f(t) = \mathcal{L}^{-1}\{F(s)\}(t)
       where :math:`F(s)` is the Laplace transform of :math:`f(t)`.

       .. code-block:: CSharp 

          double NiLaplace(Func<double, double> Lapfun, double t)
   Parameters: 
       Lapfun: 
              A delegate representing the Laplace-transformed function :math:`F(s)`.
              It should accept a double precision value :math:`s` and return :math:`F(s)`.
       t: 
         The time point :math:`t` at which to evaluate the inverse Laplace transform.
   Returns: 
       A double precision value representing the numerical approximation of :math:`f(t)`.
   Example: 

       .. math::
          F(s) = \frac{1}{s + 2},~ f(t) = e^{-2t}
       In this example, we invert the Laplace transform of :math:`F(s) = 1 / (s + 2)`
       which corresponds to the time-domain function :math:`f(t) = e^{-2t}`.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define Laplace-domain function
          Func<double, double> F = s => 1.0 / (s + 2);
      
          // Evaluate inverse at t = 1.0
          double t = 1.0;
          double result = NiLaplace(F, t);
          Console.WriteLine($"f({t}) ≈ {result}");

      Output: 


       .. code-block:: Terminal 

          f(1.0) ≈ 0.1353

   ..note::

       The Gaver-Stehfest algorithm is sensitive to numerical instability.
       For best results, ensure that the Laplace function is analytic and well-behaved.



