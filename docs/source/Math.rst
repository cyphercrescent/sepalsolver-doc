

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
       Reads a two-dimensional elements in matrix from a file.
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


ReadRowVec
==========
   Description: 
       Reads a row vector of numbers from a file.
       This method parses a single line of space-separated values from the specified file and constructs a one-dimensional matrix representation.

       .. code-block:: CSharp 

          RowVec ReadRowVec(string filename)
   Param: 
      | filename:  The path to the input file containing the row vector data.
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
   Param: 
      | filename:  The path to the input file containing the column vector data.
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
   Param: 
      | A:  The matrix object to be written to the file.
      | filename:  The path to the output file where the matrix will be saved.
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
   Param: 
      | A:  The array of Boolean values to evaluate.
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
   Param: 
      | A:  The array of Boolean values to evaluate.
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
   Param: 
      | A:  The Boolean array to search for matching true entries.
      | k:  The maximum number of matching indices to return. Defaults to int.MaxValue if not specified.
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
   Param: 
      | a:  The dividend—value to be divided.
      | b:  The divisor—value by which to divide.
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
   Param: 
      | num:  The <c>double</c> value to be converted.
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
   Param: 
      | fun:  A unary function that defines how each element should be transformed.
      | X:  The input column vector or row vector or matrix whose elements will be transformed.
      | Y:  The second column vector or row vector or matrix of input values.
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


Zeros
=====
   Description: 
       Generates a one-dimensional  0r two-dimensional array of zeros with specified dimensions.
       This method creates a vector of M rows or matrix of M rows and N columns, where every element is initialized to zero.

       .. code-block:: CSharp 

          double[] Zeros(int N)
          double[,] Zeros(int M, int N)
          double[,] Zeros(int[] S)
   Param: 
      | M:  The number of rows in the resulting matrix.
      | N:  The number of columns in the resulting matrix.
      | S:  The number of equal columns and rows in the resulting matrix.
   Returns: 
       An array of vector of size M or matrix of size M by N filled with zeros.
   Example: 
       Create a 3x4 matrix of zeros:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Generate 4 by 3 matrix 
          double[,] zeros = Zeros(3, 4);
      
          // Display matrix
          for (int i = 0; i < zeros.Rows; i++)
          {
              for (int j = 0; j < zeros.Cols; j++)
                  Console.Write(zeros[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          0 0 0 0  
          0 0 0 0  
          0 0 0 0


Ones
====
   Description: 
       Generates a two-dimensional array of ones with specified dimensions.
       This method creates a matrix of M rows and N columns, where every element is initialized to 1.0.

       .. code-block:: CSharp 

          double[] Ones(int M)
          double[,] Ones(int M, int N)
          double[,] Ones(int[] S) 
   Param: 
      | M:  The number of rows in the resulting matrix.
      | N:  The number of columns in the resulting matrix.
      | S:  Array of integer rows and columns in the resulting matrix.
   Returns: 
       An array of vector of size M or matrix of size M by N filled with ones.
   Example: 
       Create a 2x3 matrix of ones:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          //Generate Matrix 2 by 3 with all the element has 1.0
          double[,] ones = Ones(2, 3);
      
          // Display matrix
          for (int i = 0; i < ones.Rows; i++)
          {
              for (int j = 0; j < ones.Cols; j++)
                  Console.Write(ones[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          1 1 1  
          1 1 1


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
   Param: 
      | A:  The scalar value or matrix to replicate.
      | M:  The number of rows in the resulting matrix.
      | N:  The number of columns in the resulting matrix.
      | S:  Array of integer rows and columns in the resulting matrix.
   Returns: 
       A matrix of dimensions M x N where all values are equal to A.
   Example: 
       Create a 2x4 matrix filled with the value 3.14:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Replicate all elements of a matrix same.
          double[,] replicated = Repmat(3.14, 2, 4);
      
          // Display matrix
          for (int i = 0; i < replicated.Rows; i++)
          {
              for (int j = 0; j < replicated.Cols; j++)
                  Console.Write(replicated[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          3.14 3.14 3.14 3.14  
          3.14 3.14 3.14 3.14


Repelem
=======
   Description: 
       Replicates each element of a matrix a specified number of times along both axes.
       This method expands the input matrix by repeating each element M times row-wise (vertically) and N times column-wise (horizontally), returning the result as a new Matrix with repetitive elements.

       .. code-block:: CSharp 

          Matrix Repelem(Matrix A, int M, int N)
   Param: 
      | A:  The input matrix whose elements will be replicated.
      | M:  The number of times to repeat each element along the row (vertical) direction.
      | N:  The number of times to repeat each element along the column (horizontal) direction.
   Returns: 
       A new Matrix instance containing the expanded result with replicated elements.
   Example: 
       Create a 4x6 matrix by replicating a 2x2 matrix:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Create a 2 by 2 matrix
          Matrix A  = new double[,]{{1, 2},{3,4}}
      
          // Apply element-wise replication
          Matrix expanded = Repelem(A, 2, 3);
      
          // Display result
          for (int i = 0; i < expanded.Rows; i++)
          {
              for (int j = 0; j < expanded.Cols; j++)
                  Console.Write(expanded[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          1 1 1 2 2 2  
          1 1 1 2 2 2  
          3 3 3 4 4 4  
          3 3 3 4 4 4


Kron
====
   Description: 
       Computes the Kronecker product of two matrices.
       This method generates a block matrix by multiplying each element of matrix X by the entire matrix Y, preserving the structure of X.

       .. code-block:: CSharp 

          Matrix Kron(Matrix X, Matrix Y)
   Param: 
      | X:  The first matrix (left operand) of the Kronecker product.
      | Y:  The second matrix (right operand) of the Kronecker product.
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
          for (int i = 0; i < result.Rows; i++)
          {
              for (int j = 0; j < result.Cols; j++)
                  Console.Write(result[i, j] + " ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          0 5 0 10  
          6 7 12 14  
          0 15 0 20  
          18 21 24 28


Rand
====
   Description: 
       Generates a one-dimensional or two-dimensional matrix of random double-precision values between 0.0 (inclusive) and 1.0 (exclusive).
       This method creates a matrix with M rows and N columns, where each element is independently sampled from a uniform distribution.

       .. code-block:: CSharp 

          double[] Rand(int N)
          double[,] Rand(int M, int N)
          double[,] Rand(int[] Size)
   Param: 
      | M:  The number of rows in the output matrix.
      | N:  The number of columns in the output matrix.
      | Size:  A vector of two integer elements.
   Returns: 
       An array (vector) of size M or matrix of size M x N populated with random values in the range [0.0, 1.0).
   Example: 
       Create a 3x3 matrix of random doubles:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
           
          double[,] randomMatrix = Rand(3, 3);
      
          // Print matrix contents
          for (int i = 0; i < randomMatrix.Rows; i++)
          {
              for (int j = 0; j < randomMatrix.Cols; j++)
                  Console.Write($"{randomMatrix[i, j]:F2} ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          0.42 0.75 0.31  
          0.89 0.06 0.94  
          0.12 0.54 0.78


Randn
=====
   Description: 
       Generates an array (Vector) or matrix of normally distributed random double values.
       This method creates a vector of size M or M * N matrix with each element independently sampled from a normal distribution characterized by the specified <c>mean</c> and <c>standard deviation</c>.

       .. code-block:: CSharp 

          double[] Randn(int N, double mean = 0, double std = 1)
          double[,] Randn(int M, int N, double mean = 0, double standardDeviation = 1)
          double[,] Randn(int[] Size, double mean = 0, double std = 1) => Randn(Size[0], Size[1], mean, std);
   Param: 
      | M:  The number of rows in the resulting matrix.
      | N:  The number of columns in the resulting matrix.
      | mean:  The mean (μ) of the normal distribution. Default is 0.
      | standardDeviation:  The standard deviation (σ) of the normal distribution. Default is 1.
   Returns: 
       An array (vector) of size M or matrix of dimensions M x N filled with normally distributed random values.
   Example: 
       Create a 2x3 matrix sampled from N(5, 2²):

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
            
          double[,] randval = Randn(2, 3, 5.0, 2.0);
      
          // Display result
          for (int i = 0; i < randval.Rows; i++)
          {
              for (int j = 0; j < randval.Cols; j++)
                  Console.Write($"{randval[i, j]:F2} ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          3.02 6.87 4.11  
          5.73 8.34 1.95


RandTri
=======
   Description: 
       Generates a matrix of random double values from a triangular distribution.
       This method creates an M x N matrix where each element is independently sampled from a triangular distribution defined by minimum bound value, mode of distribution likely, and maximum bound value.

       .. code-block:: CSharp 

          double[] RandTri(int N, double min = 0.0, double likely = 0.5, double max = 1.0)
          double[,] RandTri(int M, int N, double min = 0.0, double likely = 0.5, double max = 1.0)
          double[,] RandTri(int[] Size, double min = 0.0, double likely = 0.5, double max = 1.0) => RandTri(Size[0], Size[1], min, likely, max)
   Param: 
      | M:  The number of rows in the resulting matrix.
      | N:  The number of columns in the resulting matrix.
      | min:  The minimum value of the triangular distribution (lower bound).
      | likely:  The most likely (mode) value of the triangular distribution.
      | max:  The maximum value of the triangular distribution (upper bound).
   Returns: 
       An array (vector) of dimension M or matrix of dimensions M x N populated with random values drawn from the specified triangular distribution.
   Example: 
       Create a 2x3 matrix sampled from a triangular distribution between 10 and 20 with a peak at 15:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          double[,] triMatrix = RandTri(2, 3, 10, 15, 20);
      
          // Display result
          for (int i = 0; i < triMatrix.Rows; i++)
          {
              for (int j = 0; j < triMatrix.Cols; j++)
                  Console.Write($"{triMatrix[i, j]:F2} ");
              Console.WriteLine();
          }

      Output: 


       .. code-block:: Terminal 

          13.47 16.89 14.12  
          11.53 15.00 17.26


Linspace
========
   Description: 
       Generates a linearly spaced array of double values between two endpoints.
       This method produces a one-dimensional array of N evenly spaced values from a to b, inclusive. If N is 1, the array contains just a.

       .. code-block:: CSharp 

          double[] Linspace(double a, double b, int N = 100)
   Param: 
      | a:  The starting value of the range.
      | b:  The ending value of the range.
      | N:  The number of evenly spaced points to generate. Default is 100.
   Returns: 
       An array containing N linearly spaced values between a and b.
   Example: 
       Generate 10 points from -1 to 1:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          //Generate point from -1 to 1
          double[] line = Linspace(-1.0, 1.0, 10);
      
          // Display result
          foreach (double x in line)
              Console.Write($"{x:F2} ");

      Output: 


       .. code-block:: Terminal 

          -1.00 -0.78 -0.56 -0.33 -0.11 0.11 0.33 0.56 0.78 1.00


Logspace
========
   Description: 
       Generates a logarithmically spaced array of double values between powers of 10.
       This method creates a one-dimensional array with N values spaced evenly on a logarithmic scale, ranging from <c>10^a</c> to <c>10^b</c>, inclusive.

       .. code-block:: CSharp 

          double[] Logspace(double a, double b, int N = 100)
   Param: 
      | a:  The base-10 exponent of the starting value (10^a).
      | b:  The base-10 exponent of the ending value (10^b).
      | N:  The number of points to generate. Default is 100.
   Returns: 
       An array of N values logarithmically spaced between 10^a and 10^b.
   Example: 
       Generate 5 values from 10⁰ to 10²:

       .. code-block:: CSharp 

          // import libraries 
          using System;
          using static SepalSolver.Math;
          
          // Generate logarithmically space between 1 and 100 inclusive
          double[] freqs = Logspace(0, 2, 5);
      
          // Display result, formated to 2 decimal places
          foreach (double x in freqs)
              Console.Write($"{x:F2} ");

      Output: 


       .. code-block:: Terminal 

          1.00 3.16 10.00 31.62 100.00


Interp1
=======
   Description: 
       Performs one-dimensional linear interpolation.
       This method estimates the output value at a query point <c>x</c> by linearly interpolating between known data points in <c>X</c> and corresponding values in <c>Y</c>.

       .. code-block:: CSharp 

          double Interp1(ColVec X, ColVec Y, double x)
   Param: 
      | X:  A column vector containing the known x-coordinates, which must be sorted in ascending order.
      | Y:  A column vector containing the corresponding y-values.
      | x:  The x-value at which to evaluate the interpolated result.
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
   Param: 
      | j:  The zero-based index of the column to extract.
      | data:  The two-dimensional array from which the column will be retrieved.
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
          double[] col = Getcol(0, matrix);
      
          foreach (double val in col)
              Console.Write(val + " ");

      Output: 


       .. code-block:: Terminal 

          1 4 7


Getrow
======
   Description: 
       Extracts a specified row from a two-dimensional array.
       This method retrieves the row at index i from the input matrix data and returns it as a one-dimensional array.

       .. code-block:: CSharp 

          double[] Getrow(int i, double[,] data)
   Param: 
      | i:  The index of the row to extract.
      | data:  The two-dimensional array from which the row will be retrieved.
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
          double[] row = Getrow(2, matrix);
          
          // Output the matrix
          foreach (double val in row)
              Console.Write(val + " ");

      Output: 


       .. code-block:: Terminal 

          7 8 9


=>J.Select(j
============
   Description: 
       Extracts specified columns from a two-dimensional array using an indexer.
       This method returns a new Matrix containing only the columns of data specified by the I-indexer.

       .. code-block:: CSharp 

          Matrix Getcols(indexer I, double[,] data)
   Param: 
      | I:  An indexer object specifying the zero-based column indices to select.
      | data:  The two-dimensional array from which columns are extracted.
   Returns: 
       A Matrix composed of the selected columns from the input matrix data, in the order defined by I-indexer.
   Example: 
       Extract columns 1 and 3 from a 3x4 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // Create a 3 by 4 matrix
          Matrix matrix = new double[,]{
              { 10, 20, 30, 40 },
              { 50, 60, 70, 80 },
              { 90, 100, 110, 120 }
          };
          
          // Set the matrix index to be extracted
          indexer I = new indexer(new int[] { 1, 3 }); // select 2nd and 4th columns
          
          // Extract the matrix
          Matrix cols = Getcols(I, matrix);
          
          // Output the extracted matrix
          console.writeline($"The extracted matrix is: {cols}")

      Output: 


       .. code-block:: Terminal 

          20 40  
          60 80  
          100 120


Getrows
=======
   Description: 
       Extracts specified rows from a two-dimensional array using an indexer.
       This method returns a new Matrix data composed of the rows from matrix data that correspond to the indices specified by I-indexer.

       .. code-block:: CSharp 

          Matrix Getrows(indexer I, double[,] data)
   Param: 
      | I:  An indexer object that specifies the zero-based indices of the rows to extract.
      | data:  The two-dimensional array from which rows will be selected.
   Returns: 
       A Matrix containing the rows of data specified by I-indexer, in the same order.
   Example: 
       Extract the 1st and 3rd rows from a 4x3 matrix:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create a 4 by 3 matrix
          Matrix matrix = new double[,] {
              { 10, 20, 30 },
              { 40, 50, 60 },
              { 70, 80, 90 },
              { 100, 110, 120 }
          };
          // Set the matrix index to be extracted
          indexer I = new indexer(new int[] { 0, 2 }); // first and third rows
          
          // Extract the matrix
          Matrix rows = Getrows(I, matrix);
      
          // Output the extracted matrix
          console.writeline($"The extracted matrix is: {rows}")

      Output: 


       .. code-block:: Terminal 

          10 20 30  
          70 80 90


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
   Param: 
      | a, b:  The scalar value to prepend.
      | A, B:  The input array (row or column vector) or matrix to which a will be prepended.
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
   Param: 
      | a, b:  The scalar value to be placed at the top or below of the resulting vector.
      | A, B:  The input column vector or matrix whose elements will appear before or after a.
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

          double Pow(double x, double n)
          Pow(Complex x, double n)
          Pow(Complex x, double n)
          SparseMatrix PowTW(SparseMatrix x, double n)
          SparseColVec PowTW(SparseColVec x, double n)
          SparseRowVec PowTW(SparseRowVec x, double n)
   Param: 
      | x:  The base value.
      | n:  The exponent value (can be negative, fractional, or zero).
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
   Param: 
      | X:  A one-dimensional or two-dimensional array of double values. Must contain at least two elements.
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


MultTW
======
   Description: 
       Performs element-wise (Hadamard) multiplication of two column vectors or multiplication of two matrices. Vector and Matrix A and B must have the same size.
       This method multiplies corresponding elements of A and B, producing a new vector or matrix of the same length.

       .. code-block:: CSharp 

          ColVec MultTW(ColVec A, ColVec B)
          RowVec MultTW(RowVec A, RowVec B)
          Matrix MultTW(Matrix A, Matrix B)
          Matrix MultTW(ColVec A, RowVec B)
          Matrix MultTW(RowVec A, ColVec B)
          Matrix MultTW(Matrix A, ColVec B)
          Matrix MultTW(ColVec B, Matrix A)
          Matrix MultTW(Matrix A, RowVec B)
          Matrix MultTW(RowVec B, Matrix A)
   Param: 
      | A:  The first input column vector or matrix.
      | B:  The second input column vector or matrix, of the same size as A.
   Returns: 
       A vector containing the element-wise products A[i] * B[i] or matrix containing the element-wise products A[i,j] * B[i,j]], for all valid indices.
   Example: 
       Multiply two 3-element vectors element-wise:
       .. Math::
          \begin{array}{rl}
                &A = [1.0,   2.0,   3.0] \\
                &B = [4.0,  5.0,  6.0] \\   
          \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
           
          // Create two column vector A and B
          ColVec A = new double[] { 1.0, 2.0, 3.0 };
          ColVec B = new double[] { 4.0, 5.0, 6.0 };
      
          // Calculation of element-wise multiplication
          ColVec result = MultTW(A, B);
      
          // Output the result
          console.writeline($"Multiplication of two column-wise vector: {result}")

      Output: 


       .. code-block:: Terminal 

          Multiplication of two column-wise vector:
          4  
          10  
          18
   Example: 
       Multiply two 2x2 matrices element-wise:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
            
          // Create Matrix A and Matrix B
          Matrix A = new double[,] {
              { 1, 2 },
              { 3, 4 }
          };
      
          Matrix B = new double[,] {
              { 5, 6 },
              { 7, 8 }
          };
      
          // Calculation of element-wise multiplication
          Matrix result = MultTW(A, B);
      
          // Output the result
          console.writeline($"Multiplication of two Matrix-wise: {result}")

      Output: 


       .. code-block:: Terminal 

          Multiplication of two Matrix-wise:
          5 12  
          21 32


DivTW
=====
   Description: 
       Performs element-wise division of two column vectors or matrices.No element in the divisor vector or matrix should be zero.
       This method divides each element of column vector or matrix A by the corresponding element in column vector or matrix B, returning a new vector or matrix of the same size.

       .. code-block:: CSharp 

          ColVec DivTW(ColVec A, ColVec B)
          RowVec DivTW(RowVec A, RowVec B)
          Matrix DivTW(Matrix A, Matrix B)
          ColVec DivTW(double a, ColVec B)
          RowVec DivTW(double a, RowVec B)
          Matrix DivTW(double a, Matrix B)
          Matrix DivTW(ColVec A, RowVec B)
          Matrix DivTW(RowVec A, ColVec B)
          Matrix DivTW(Matrix A, ColVec B)
          Matrix DivTW(ColVec B, Matrix A)
          Matrix DivTW(Matrix A, RowVec B)
          Matrix DivTW(RowVec B, Matrix A)
   Param: 
      | A:  The numerator vector.
      | B:  The denominator vector. Must be the same size as A. No element of vector or matric B should be zero.
   Returns: 
       A vector or matrix containing the element-wise quotients A[i] / B[i] or A[i,j]/B[i,j].
   Example: 
       Divide two column vectors element-wise:
       .. Math::
          \begin{array}{rl}
                &A = [10.0,   20.0,   30.0] \\
                &B = [2.0,  4.0,  5.0] \\   
          \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // Create column vector A and vector B
          ColVec A = new double[] { 10.0, 20.0, 30.0 };
          ColVec B = new double[] { 2.0, 4.0, 5.0 };
           
          // Calculation of element-wise division
          ColVec result = DivTW(A, B);
      
          // Output the result
          console.writeline($"Division of two column-wise: {result}")

      Output: 


       .. code-block:: Terminal 

          5  
          5  
          6
   Example: 
       Divide two 2x2 matrices element-wise:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          //Create matrix A and matrix B
          Matrix A = new double[,] {
              { 10, 20 },
              { 30, 40 }
          };
      
          Matrix B = new double[,] {
              { 2, 4 },
              { 5, 10 }
          };
          
          // Calculation of element-wise division
          Matrix result = DivTW(A, B);
      
          // Output the result
          console.writeline($"Division of two matrix-wise: {result}")

      Output: 


       .. code-block:: Terminal 

          5 5  
          6 4


PowTW
=====
   Description: 
       Performs element-wise exponentiation of two column vectors or matrices.
       This method raises each element of vector or matrix A to the corresponding power in vector or matrix B, producing a new vector or matrix. The size of vector or matrix A and B must be the same.

       .. code-block:: CSharp 

          ColVec PowTW(ColVec A, ColVec B)
          RowVec PowTW(RowVec A, RowVec B)
          Matrix PowTW(Matrix A, Matrix B)
          ColVec PowTW(double x, ColVec N)
          RowVec PowTW(double x, RowVec N)
          Matrix PowTW(double x, Matrix N)
          ColVec PowTW(ColVec x, double n)
          RowVec PowTW(RowVec x, double n)
          Matrix PowTW(Matrix x, double n)
          Matrix PowTW(ColVec A, RowVec B)
          Matrix PowTW(RowVec A, ColVec B)
          Matrix PowTW(Matrix A, ColVec B)
          Matrix PowTW(ColVec B, Matrix A)
          Matrix PowTW(Matrix A, RowVec B)
          Matrix PowTW(RowVec B, Matrix A)
   Param: 
      | A:  The base vector or matrix.
      | B:  The exponent vector or matrix. Must have the same length as A.
   Returns: 
       A vector or matrix containing the element-wise exponentiation
   Example: 
       Raise elements of one vector to the powers in another:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
          
          // Create vector A and vector B
          ColVec A = new double[] { 2.0, 3.0, 4.0 };
          ColVec B = new double[] { 3.0, 2.0, 0.5 };
          
          // Calculation of element-wise exponent
          ColVec result = PowTW(A, B);
      
          // Output the result
          console.writeline($"Exponent of two column-wise: {result}")

      Output: 


       .. code-block:: Terminal 

          8  
          9  
          2
   Example: 
       Raise each element of one 2x2 matrix to the powers in another:

       .. code-block:: CSharp 

          // import libraries
          using System;
          using static SepalSolver.Math;
      
          // Create matrix A and B
          Matrix A = new double[,] {
              { 2.0, 3.0 },
              { 4.0, 36.0 }
          };
      
          Matrix B = new double[,] {
              { 3.0, 2.0 },
              { 1.0, 0.5 }
          };
          
          // Calculation of element-wise exponent
          Matrix result = PowTW(A, B);
      
          // Output the result
          console.writeline($"Exponent of two matrix-wise: {result}")

      Output: 


       .. code-block:: Terminal 

          8 9  
          4 6


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
   Param: 
      | x:  The double-precision floating-point number or complex number or each element in a vector or matrix to be rounded.
      | decP:  The number of decimal places to round to. Default is 0 (rounds to nearest integer). Must be between 0 and 15.
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
   Param: 
      | x:  The number whose square root is to be calculated. Must be non-negative for real results.
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
   Param: 
      | x:  The number to be squared.
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
   Param: 
      | x:  The double-precision floating-point number to floor.
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
   Param: 
      | x:  The double-precision floating-point number to ceiling.
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
   Param: 
      | A:  The first scalar, array or matrix to compare.
      | B:  The second scaler, array or matrix to compare.
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
   Param: 
      | A:  The first integer to compare.
      | B:  The second integer to compare.
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
   Param: 
      | x:  The angle in radians for which to calculate the sine.
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
   Param: 
      | x:  The sine value for which to calculate the arcsine. Must be between -1 and 1 inclusive.
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
   Param: 
      | x:  The angle in radians for which to calculate the cosine.
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
   Param: 
      | x:  A scalar number or one-dimensional or two-dimensional array for which to calculate the arccosine. Must be between -1 and 1 inclusive.
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
   Param: 
      | x:  The angle in radians for which to calculate the tangent.
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
   Param: 
      | x:  A scalar number or one-dimensional or two-dimensional array representing a tangent value for which the arctangent is to be computed.
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
   Param: 
      | x:  A scalar number one-dimensional or two-dimensional array representing the value for which the hyperbolic sine is to be computed.
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
          Console.WriteLine($"Verification: (e^{x} - e^(-{x}))/2 = {(Math.Exp(x) - Math.Exp(-x)) / 2}");

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
   Param: 
      | x:  A scalar number or one-dimensional or two-dimensional array representing the value for which the hyperbolic cosine is to be computed.
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
   Param: 
      | x:  A double-precision floating-point number representing the value for which to calculate the hyperbolic tangent.
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
   Param: 
      | x:  A one-dimensional or two-dimensional array or double-precision floating-point number in the range (-1, 1), representing the value for which to compute the inverse hyperbolic tangent.
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
   Param: 
      | x:  A one-dimensional or two-dimensional array or double-precision floating-point number representing the power to raise Euler's number (e) to.
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
   Param: 
      | x:  A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose logarithm is to be calculated.
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
   Param: 
      | x:  A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose base-2 logarithm is to be calculated.
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
   Param: 
      | x:  A one-dimensional or two-dimensional array or double-precision floating-point number greater than zero, representing the value whose base-10 logarithm is to be calculated.
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
<<<<<<< HEAD
                         & c = 60x_1 + 40x_2 + 70x_3
                Subject to:& \\
                           & 4x_1 + 2x_2 + 3x_2 \leq 60 \\
                           & 3x_1 + 2x_2 + 2x_3 \leq 40 \\
                           & 2x_1 + x_2 + 4x_3 leq 36 \\ 
                           & x_1, x_2, x_3 >= 0 and are integers \\
=======
                         & c = 60x_1 + 40x_2 + 70x_3\\
                Subject~to:& \\
                           & 4x_1 + 2x_2 + 3x_2 \leq 60 \\
                           & 3x_1 + 2x_2 + 2x_3 \leq 40 \\
                           & 2x_1 + x_2 + 4x_3 \leq 36 \\ 
                           & x_1, x_2, x_3 \geq 0 ~\text{and are integers} \\
>>>>>>> 511e66f607f24620335b7af848366458e71f981e
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
      
<<<<<<< HEAD
          y(x, t) = x_3 * \exp(x_1t) + x_4 *\exp(-x_2t) 
=======
          y(x, t) = x_3\exp(x_1t) + x_4\exp(-x_2t) 
>>>>>>> 511e66f607f24620335b7af848366458e71f981e
       

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
      | fun:  A function that represents the implicit ODE. 
            Signature: double fun(double t, double y, double yp);
                       ColVec fun(double t, ColVec y, ColVec yp);
               * t: time.
               * y: state.
               * yp: derivative of the state.
               * Returns: the residual of the implicit ODE.
      | initcon:  A tuple containing two elements:
                   * y0:  initial state.
                   * yp0: initial rate of change.
      | tspan:  A two-element array [t0, tf] specifying the time interval for integration.
      | options:  Optional parameters for the ODE solver, such as:
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
   Param: 
      | fun:  A function representing the right-hand side of the DAE. 
            Signature: ColVec fun(double t, ColVec y);
               * t: time.
               * y: state.
               * Returns: right-hand side of the DAE.
      | Mass:  A function defining the mass matrix M(t, y). This matrix may be time- and state-dependent.
             Signature: Matrix Mass(double t, ColVec y);
                * t: time.
                * y: state.
                * Returns: the mass of the DAE.
      | initcon:  An array of doubles representing the initial conditions for the state vector y.
                The length must match the dimension of the system.
      | tspan:  A two-element array specifying the time interval for integration: [t0, tf].
      | options:  Optional parameters for the ODE solver, such as:
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
