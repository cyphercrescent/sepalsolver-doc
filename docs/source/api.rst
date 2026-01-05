API
===

Overview
The Sepal Solver API provides a collection of methods to solve different classes of mathematical problems. These methods are designed to be modular, efficient, and easy to integrate into external applications.

## Purpose

The `math.cs` class is the **core mathematical library** of the Sepal Solver. It provides a wide range of numerical, algebraic, statistical, and analytical methods designed to support problem-solving across linear algebra, calculus, optimization, special functions, random number generation, and polynomial analysis.  

This class acts as the foundation for computational tasks, enabling developers and researchers to perform both **basic operations** (like matrix manipulation and trigonometric functions) and **advanced computations** (like solving differential equations, optimization problems, and evaluating special functions).

---

## 🔑 Key Capabilities

- **Matrix & Vector Operations**: Creation, manipulation, and transformation of arrays, including dense and sparse formats.  

- **Numerical Methods**: Integration, differentiation, interpolation, and numerical solvers for equations and systems.  

- **Optimization & Root Finding**: Linear programming, nonlinear optimization, genetic algorithms, and equation solvers.  

- **Polynomial Tools**: Fitting, root finding, convolution, and deconvolution.  

- **Special Functions**: Comprehensive support for Bessel, Gamma, Legendre, Chebyshev, Hermite, and other advanced functions.  

- **Random Number Generation**: Uniform, normal, t-distribution, and sequence generators.  

- **Transform Methods**: Fourier and Laplace transforms for signal and system analysis.  

- **Differential Equation Solvers**: Multiple ODE solvers with varying accuracy and stability options.  

---

## 📂 Categories of Methods


- **Array & Matrix Utilities**: `Zeros`, `Ones`, `Eye`, `Reshape`, `Repmat`, `Diag`, `Sparse`  

- **Basic Math Functions**: `Abs`, `Round`, `Floor`, `Ceil`, `Pow`, `Sqrt`, `Log`, `Exp`  

- **Trigonometric & Hyperbolic**: `Sin`, `Cos`, `Tan`, `Sinh`, `Cosh`, `Tanh`  

- **Polynomial Methods**: `Polyfit`, `Roots`, `Conv`, `Deconv`  

- **Special Functions**: `Gamma`, `LambertW`, `BesselJ`, `ChebyshevT`, `LegendreP`, `Zeta`  

- **Optimization & Solvers**: `Fzero`, `Fsolve`, `Linprog`, `Fmincon`, `Ga`  

- **Differential Equations**: `Ode23`, `Ode45`, `Ode78`, `decic`  

- **Transforms**: `Fft`, `Ifft`, `Laplace`, `NiLaplace`  

- **Integration & Summation**: `Trapz`, `Integral`, `Integral2`, `Integral3`, `Integral4`  



   .. toctree::

      Math
      
