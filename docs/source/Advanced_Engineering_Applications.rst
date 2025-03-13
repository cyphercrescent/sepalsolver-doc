Advanced Engineering Applications
=================================

In this chapter we present pratical engineering problems solved with combinations of concept discussed under linear algebra, optimization, ordinary differential equations, numerical laplace inversion and special functions

Dimensionless Water Influx Estimation
-------------------------------------
Water influx in an oil reservoir is the migration of water from an aquifer into the pore spaces of the reservoir rock containing oil.  This water movement is primarily driven by pressure differences between the aquifer and the reservoir as the oil is produced and reservoir pressure declines.  The water influx can provide pressure support, helping to maintain reservoir pressure and sustain oil production. Hence, understanding and accurate estimation of water influx is crucial for optimizing oil recovery strategies and the long-term economic viability of an oil field.

For use in material balance computation in edge drive configuration, reservoir engneering books provide plots for Wd as a function of dimensionless radius and time

For :math:`Rd \leq 4`

.. figure:: images/Water-Influx-from-Craft-and-Hawkins_4dn.png
   :align: center
   :alt: Water-Influx-from-Craft-and-Hawkins_4dn.png

For :math:`5 \leq Rd \leq 10`

.. figure:: images/Water-Influx-from-Craft-and-Hawkins_5up.png
   :align: center
   :alt: Water-Influx-from-Craft-and-Hawkins_5up.png

In an edge drive configuration with the aquifer closed at its outer boundary, the governing equation gives:

.. math:: 
   \cfrac{\partial P}{\partial t} = \cfrac{1}{r}\cfrac{\partial}{\partial r}\left(r \cfrac{\partial P}{\partial r} \right)

.. math:: 
   P(t = 0, r) = 0, P(t, r = 1) = 1, \cfrac{\partial P}{\partial r}(t, r = r_D) = 0

The solution in laplace space:

.. math:: 
   P(s, r) = \Phi_1 I_0(r\sqrt{s}) + \Phi_2 K_0(r\sqrt{s})

Using the boundary conditions to evaluate the constants and substitute them:

.. math:: 
   P(s, r) = \cfrac{K_1(r_D\sqrt{s}) I_0(r\sqrt{s}) + I_1(r_D\sqrt{s}) K_0(r\sqrt{s})}{s(K_1(r_D\sqrt{s}) I_0(\sqrt{s}) + I_1(r_D\sqrt{s}) K_0(\sqrt{s}))}

From Darcy law, we know that the rate of water influx is proportional to the negative rate of change of pressure with respect to radial position at the reservoir aquifer boundary, hence total water influx after a time t is thus:

.. math:: 
   W(t) = \int_{0}^{t_D} -\cfrac{\partial P}{\partial r} (\tau, r = 1) \partial \tau

This can be accomplised by performing the integration in laplace space before inverting to time space. 

.. math:: 
   W(t) = \mathcal{L}^{-1}\left(\frac{-1}{s} \cfrac{\partial P}{\partial r} (s, r = 1) \right)

.. math:: 
   W(t) = \mathcal{L}^{-1}\left(\frac{1}{s\sqrt{s}} \cfrac{I_1(r_D\sqrt{s}) K_1(\sqrt{s}) - K_1(r_D\sqrt{s}) I_1(\sqrt{s})}{(I_1(r_D\sqrt{s}) K_0(\sqrt{s}) + K_1(r_D\sqrt{s}) I_0(\sqrt{s}))} \right)


Lets see how to compute water influx, and generate the started water influx plot as shown above

.. note::
   The matlab implementation uses the numerical laplace inversion code from matlab file exchange[3]


.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define Wd function in time space.
         double EdgeClosedBoundaryRadial_Wd(double tD, double rD)
         {
             // define the embedded laplace space solution
             Func<double, double> lapW = new(s =>
             {
                 double sqrts, sqrts3, rDsqrts, Num, Den;
                 sqrts = Sqrt(s); sqrts3 = s * sqrts; rDsqrts = rD * sqrts;
                 Num = BesselI(1, rDsqrts) * BesselK(1, sqrts) - BesselK(1, rDsqrts) * BesselI(1, sqrts);
                 Den = BesselI(1, rDsqrts) * BesselK(0, sqrts) + BesselK(1, rDsqrts) * BesselI(0, sqrts);
                 if (double.IsInfinity(Num) || double.IsInfinity(Den))
                     return 1 / sqrts3;
                 else
                     return Num / (sqrts3 * Den);
             });
             return tD == 0 || rD == 1 ? 0 : NiLaplace(lapW, tD);
         }
         
         // define the time and radial mesh
         double[] Rd = [2, 2.5, 3, 3.5, 4, 50];
         ColVec Td = Logspace(-1, 2), Wd;
         int end = Rd.Length - 1;
         // compute the water influx and plot
         hold = true;
         List<string> lgd = [];
         foreach (double rD in Rd)
         {
             Wd = Td.Select(tD => EdgeClosedBoundaryRadial_Wd(tD, rD)).ToList();
             SemiLogx(Td, Wd, Linewidth: 2); lgd.Add("rD = " + rD);
         }
         lgd[end] = "rD = ∞";
         Xlabel("tD"); Ylabel("WD");
         Legend(lgd, Alignment.UpperLeft);
         Axis([0.1, 100, 1, 8]);
         Title("Dimensionless Water Influx");
         SaveAs("Dimensionless-Water-Influx-CCL-Math-4dn.png");

      .. figure:: images/Dimensionless-Water-Influx-CCL-Math-4dn.png
         :align: center
         :alt: Dimensionless-Water-Influx-CCL-Math-4dn.png

      .. code-block:: C#

         // define the time and radial mesh
         Rd = [5, 6, 7, 8, 9, 10, 50];
         Td = Logspace(0, 3); end = Rd.Length - 1;
        
         // compute the water influx and plot
         hold = true;
         lgd = [];
         foreach (double rD in Rd)
         {
             Wd = Td.Select(tD => EdgeClosedBoundaryRadial_Wd(tD, rD)).ToList();
             SemiLogx(Td, Wd, Linewidth: 2); lgd.Add("rD = " + rD);
         }
         lgd[end] = "rD = ∞";
         Xlabel("tD"); Ylabel("WD");
         Legend(lgd, Alignment.UpperLeft);
         Axis([1, 1000, 0, 70]);
         Title("Dimensionless Water Influx");
         SaveAs("Dimensionless-Water-Influx-CCL-Math-5up.png");
 
      .. figure:: images/Dimensionless-Water-Influx-CCL-Math-5up.png
         :align: center
         :alt: Dimensionless-Water-Influx-CCL-Math-5up.png

   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab
         
         % define the solution in time space
         function wt = EdgeClosedBoundaryRadial_Wd(tD, rD)
         
            % define the solution in laplace space
            function ws = lapW(s)
               sqrts = sqrt(s); sqrts3 = s * sqrts; rDsqrts = rD * sqrts;
               Num = besseli(1, rDsqrts) * besselk(1, sqrts) - besselk(1, rDsqrts) * besseli(1, sqrts);
               Den = besseli(1, rDsqrts) * besselk(0, sqrts) + besselk(1, rDsqrts) * besseli(0, sqrts);
               if (isinf(Num) || isinf(Den))
                  ws = 1 / sqrts3;
               else
                  ws = Num / (sqrts3 * Den);
               end
            end
         
            if(tD == 0 || rD == 1)
               wt =  0;
            else
               wt = niLaplace(@(s)lapW(s), tD);
            end
         end

         % define the time and radial mesh
         Rd = [2, 2.5, 3, 3.5, 4, 50];
         Td = logspace(-1, 2);
            
         % compute the water influx and plot
         figure(Color='w'); 
         lgd = {};
         for rD = Rd 
            Wd = arrayfun(@(tD)EdgeClosedBoundaryRadial_Wd(tD, rD), Td);
            semilogx(Td, Wd, linewidth = 2); hold on;
            lgd = [lgd, "rD = " + num2str(rD)];
         end
         lgd(end) = 'rD = ∞'; grid on;
         xlabel("tD"); ylabel("WD");
         legend(lgd, location = "northwest")
         axis([0.1, 100, 1, 8]);
         title("Dimensionless Water Influx");
         saveas(gcf, "Dimensionless-Water-Influx-Matlab-4dn.png");
            

      .. figure:: images/Dimensionless-Water-Influx-Matlab-4dn.png
         :align: center
         :alt: Dimensionless-Water-Influx-Matlab-4dn.png

      .. code-block:: matlab

         % define the time and radial mesh
         Rd = [5,6,7,8,9,10, 50];
         Td = logspace(0, 3);
            
         % compute the water influx and plot
         figure(Color='w'); lgd = {};
         for rD = Rd 
            Wd = arrayfun(@(tD)EdgeClosedBoundaryRadial_Wd(tD, rD), Td);
            semilogx(Td, Wd, linewidth = 2); hold on;
            lgd = [lgd, "rD = " + num2str(rD)];
         end
         lgd(end) = 'rD = ∞'; grid on;
         xlabel("tD"); ylabel("WD");
         legend(lgd, location = "northwest")
         axis([1,1000,0, 70]);
         title("Dimensionless Water Influx");
         saveas(gcf, "Dimensionless-Water-Influx-Matlab-5up.png");

      .. figure:: images/Dimensionless-Water-Influx-Matlab-5up.png
         :align: center
         :alt: Dimensionless-Water-Influx-Matlab-5up.png


Compressibility of Natural Gas
------------------------------
Natural gas compressibility is a measure of how much the volume of a given amount of natural gas decreases when pressure is applied to it. It is an important property to understand because it affects how much gas can be stored in a given space, and how easily the gas can be transported through pipelines.   

Why Compressibility Matters

- Storage: Natural gas is often stored in underground reservoirs or tanks. The compressibility of the gas determines how much gas can be packed into these storage spaces at a given pressure.   
- Transportation: In pipelines, higher pressure helps move gas efficiently. Compressibility affects how much pressure is needed to transport a certain amount of gas.   
- Metering: Accurate measurement of natural gas flow relies on understanding its compressibility, as the volume of gas changes with pressure and temperature.   
- Reservoir Engineering: In oil and gas reservoirs, compressibility is crucial for estimating gas reserves and predicting how the reservoir will perform under production.   

Factors Affecting Compressibility

- Pressure: As pressure increases, the volume of natural gas decreases, meaning compressibility increases.   
- Temperature: Higher temperatures generally decrease compressibility, as the gas molecules have more energy and resist being forced closer together.   
- Gas Composition: Natural gas is a mixture of hydrocarbons, primarily methane. The exact composition affects compressibility, as different gases have different compressibility factors.   

Calculating Compressibility

- Ideal Gas Law: At low pressures and high temperatures, natural gas behaves close to an ideal gas, and its compressibility can be estimated using the ideal gas law.   
- Real Gas Equations: At higher pressures and lower temperatures, deviations from ideal behavior become significant. More complex equations, like the Peng-Robinson or Soave-Redlich-Kwong equations, are used to account for real gas behavior.
- Compressibility Factor (Z-factor): This factor corrects the ideal gas law for real gas behavior. It is often determined using charts or correlations based on pressure, temperature, and gas composition.   

Importance of Accurate Compressibility Calculations

- Safety: Inaccurate compressibility calculations can lead to over-pressurization of storage vessels or pipelines, posing safety risks.
- Economic Efficiency: Optimizing pipeline and storage design, as well as accurately metering gas flow, requires precise compressibility data to ensure cost-effectiveness.
- Environmental Impact: Understanding gas behavior is essential for preventing leaks and ensuring the safe handling of natural gas, reducing its environmental impact.

Additional Points

- Isothermal Compressibility: This refers to compressibility measured at a constant temperature.
- Compressibility of Gas Mixtures: When dealing with natural gas, which is a mixture, the compressibility of the mixture needs to be determined based on the individual components and their proportions.


Z-factor
~~~~~~~~
Here we show how to compute Z factor from Hall and Yarborough Ea derivative of Starline Carnahan's Equation of state:

.. math:: 
   \begin{array}{rcl}
   t &=& 1/T_{pr}                   \\
   A &=& 0.06125t\exp(-1.2(1-t)^2)  \\
   B &=& 14.76t - 9.76t^2 + 4.58t^3 \\
   C &=& 90.7t - 242.2t^2 + 42.4t^3 \\
   D &=& 2.18 + 2.82t
   \end{array}

We solve for the root of:

.. math::
   -AP_{pr} + \frac{y+y^2+y^3-y^4}{(1-y)^3} - By^2+Cy^D = 0

And then compute:

.. math::
   z = \frac{AP_{pr}}{y}

.. figure:: images/ZfactorBookPlot3.png
   :align: center
   :alt: ZfactorBookPlot3.png


.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define zfunction
         static double ZfactorHY(double Pr, double Tr)
         {
             // define variables
             double z = 1, t, tm1, tm1e2, t2, t3, A, B,
                 C, D, r, y2, y3, y4, Den;
         
             // avoid computing z when Pr = 0.
             if (Pr != 0)
             {
                 t = 1 / Tr; t2 = t * t; t3 = t2 * t;
                 tm1 = 1 - t; tm1e2 = tm1 * tm1;
                 A = 0.06125 * t * Exp(-1.2 * tm1e2);
                 B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
                 C = 90.7 * t - 242.2 * t2 + 42.4 * t3;
                 D = 2.18 + 2.82 * t; r = A * Pr;
         
                 // define density equation
                 var yfunc = new Func<double, double>(y =>
                 {
                     y2 = y * y; y3 = y2 * y; y4 = y3 * y;
                     Den = Pow(1 - y, 3);
                     return -A * Pr + (y + y2 + y3 - y4) / Den -
                     B * y2 + C * Pow(y, D);
                 });
        
                 // solve the density equation
                 var opts = SolverSet (StepFactor: 0.5 );
                 double y = Fsolve(yfunc, r, opts);
         
                 // compute the z factor
                 z = A * Pr / y;
             }
             return z;
         } 
         
         // set up ressure and temperature mesh
         double[] Pr = Enumerable.Range(0, 301).Select(i => i * 0.05).ToArray();
         double[] Tr = [1.05,    1.08,   1.12,   1.18,   1.26,   1.35,   1.47,
                        1.61,    1.75,   1.91,   2.09,   2.29,   2.62,   3.00];
         ColVec Z;
         
         // compute z factors and plot them
         List<string> Tlabels = [];
         hold = true;
         foreach( var tr in Tr)
         {
             Z = Pr.Select(p => ZfactorHY(p, tr)).ToArray();
             Plot(Pr, Z);
             Tlabels.Add("Tr = " + tr);
         }
         Legend(Tlabels, Alignment.LowerRight );
         SaveAs("Zfactor-Hall-Yarborough-CCL-Math.png");

      .. figure:: images/Zfactor-Hall-Yarborough-CCL-Math.png
         :align: center
         :alt: Zfactor-Hall-Yarborough-CCL-Math.png


   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

                  % define zfunction
         function z =  ZfactorHY(Pr, Tr)
         
             % define density equation
             function yres = yfunc(y, A, B, C, D, Pr)
                  y2 = y * y; y3 = y2 * y; y4 = y3 * y; Den = (1 - y)^3;
                  yres = -A * Pr + (y + y2 + y3 - y4) / Den - B * y2 + C * y^D;
             end

             z = 1;
             % avoid computing z when Pr = 0.
             if (Pr ~= 0)
                 t = 1 / Tr; t2 = t * t; t3 = t2 * t;
                 tm1 = 1 - t; tm1e2 = tm1 * tm1;
                 A = 0.06125 * t * exp(-1.2 * tm1e2);
                 B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
                 C = 90.7 * t - 242.2 * t2 + 42.4 * t3;
                 D = 2.18 + 2.82 * t; r = A * Pr;

                 % solve the density equation
                 s = fsolve(@(y) yfunc(y, A, B, C, D, Pr), r);

                 % compute the z factor
                 z = A * Pr / s;
             end
         end

         % set up ressure and temperature mesh
         Pr = (0:300) * 0.05;
         Tr = [1.05,    1.08,   1.12,   1.18,   1.26,   1.35,   1.47, ...
               1.61,    1.75,   1.91,   2.09,   2.29,   2.62,   3.00];
         
         % compute z factors and plot them
         Tlabels = {};
         for tr = Tr
             plot(Pr, arrayfun(@(pr) ZfactorHY(pr, tr), Pr)); hold on;
             Tlabels = [Tlabels, "Tr = " + tr];
         end

         % add legend, axis label and title
         legend(Tlabels, location = "southeast");
         xlabel("Pr"); 
         title("Zfactor Hall Yarborough"); box on;
         saveas(gcf, 'Zfactor-Hall-Yarborough-Matlab', 'png');

      .. figure:: images/Zfactor-Hall-Yarborough-Matlab.png
         :align: center
         :alt: Zfactor-Hall-Yarborough-Matlab.png


Reduced Compressiblity
~~~~~~~~~~~~~~~~~~~~~~
Reduced compressibility is given by:

.. math::
   c_rT_r = \frac{1}{Ppr} - \frac{1}{z}\frac{dz}{dPpr}

Using Hall and Yarborough Correlation, we can evaluate the reduced compressibility as:


.. math::
   \chi = \cfrac{1 + 4y + 4y^2 - 4y^3 + y^4}{(1 - y)^4} - 2By + CDy^{(D - 1)}
   
.. math::
   c_rT_r = \cfrac{A Tr}{y\chi};


.. figure:: images/CrTrCraftHawkins.png
   :align: center
   :alt: CrTrCraftHawkins.png
   

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define CrTr function
         static double CrTrHY(double Pr, double Tr)
         {
             double t, tm1, tm1e2, t2, t3, A, B, C, D, r, y2, y3, y4, yDm1, ym1p3, ym1p4, Den;

             // compute itnermediate variables
             t = 1 / Tr; t2 = t * t; t3 = t2 * t; tm1 = 1 - t; tm1e2 = tm1 * tm1;
             A = 0.06125 * t * Exp(-1.2 * tm1e2); B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
             C = 90.7 * t - 242.2 * t2 + 42.4 * t3;  D = 2.18 + 2.82 * t; r = A * Pr;

             // define density function
             var yfunc = new Func<double, double>(y =>
             {
                 y2 = y * y; y3 = y2 * y; y4 = y3 * y; ym1p3 = Pow(1 - y, 3);
                 return -A * Pr + (y + y2 + y3 - y4) / ym1p3 - B * y2 + C * Pow(y, D);
             });

             // solve density function
             var opts = SolverSet(StepFactor: 0.5);
             if (Pr > 15) r *= 0.5;
             double y = Fsolve(yfunc, r, opts);

             // compute crtr
             y2 = y * y; y3 = y2 * y; y4 = y3 * y; ym1p4 = Pow(1 - y, 4); yDm1 = Pow(y, D - 1);
             Den = (1 + 4 * y + 4 * y2 - 4 * y3 + y4) / ym1p4 - 2 * B * y + C * D * yDm1;
             return A * Tr / (y * Den);
         } 
        
         // set up ressure and temperature mesh
         double[] Pr = Linspace(0.2, 25, 501);
         double[] Tr = [1.05, 1.10, 1.20, 1.30, 1.40];
         ColVec Cr;
         
         // compute CrTr and plot them
         List<string> Tlabels = [];
         hold = true;
         foreach( var tr in Tr)
         {
             Cr = Pr.Select(p => CrTrHY(p, tr)).ToArray();
             LogLog(Pr, Cr);
             Tlabels.Add("Tr = " + tr);
         }
         Legend(Tlabels, Alignment.LowerLeft );
         Xlabel("Pr"); Ylabel("CrTr");
         Axis([0.1, 100, 0.01, 10]);
         minorgrid = true;
         SaveAs("Reduced-Compressibility-Hall-Yarborough-CCL-Math.png");

      .. figure:: images/Reduced-Compressibility-Hall-Yarborough-CCL-Math.png
         :align: center
         :alt: Reduced-Compressibility-Hall-Yarborough-CCL-Math.png


   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define crtr function
         function crtrhy =  CrTrHY(Pr, Tr)

             % compute intermediate variables.
             t = 1 / Tr; t2 = t * t; t3 = t2 * t; tm1 = 1 - t; tm1e2 = tm1 * tm1;
             A = 0.06125 * t * exp(-1.2 * tm1e2); B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
             C = 90.7 * t - 242.2 * t2 + 42.4 * t3; D = 2.18 + 2.82 * t; r = A * Pr;
         
             % define density equation
             function yres = yfunc(y, A, B, C, D, Pr)
                  y2 = y * y; y3 = y2 * y; y4 = y3 * y; Den = (1 - y)^3;
                  yres = -A * Pr + (y + y2 + y3 - y4) / Den - B * y2 + C * y^D;
             end

             % solve the density equation
             if(Pr > 15)
                 r = r/2;
             end
             y = fsolve(@(y) yfunc(y, A, B, C, D, Pr), r);

             % compute crtr
             y2 = y * y; y3 = y2 * y; y4 = y3 * y; ym1p4 = (1 - y)^4; yDm1 = y^(D - 1);
             Den = (1 + 4 * y + 4 * y2 - 4 * y3 + y4) / ym1p4 - 2 * B * y + C * D * yDm1;
            crtrhy = A*Tr/(y*Den);
             
         end

         % set up ressure and temperature mesh
         Pr = linspace(0.2, 25, 501);
         Tr = [1.05,  1.1,  1.2,  1.3,  1.4];
         
         % compute CrTr and plot them
         figure(Color = 'w'); Tlabels = {};
         for tr = Tr
             loglog(Pr, arrayfun(@(pr) CrTrHY(pr, tr), Pr)); hold on;
             Tlabels = [Tlabels, "Tr = " + tr];
         end

         % add legend, axis label and title
         legend(Tlabels, location = "southwest");
         xlabel("Pr"); ylabel("CrTr"); 
         axis([0.1, 100, 0.01, 10]);
         grid on; grid minor;
         title("Reduced Compressibility Hall Yarborough"); box on;
         saveas(gcf, 'Reduced-Compressibility-Hall-Yarborough-Matlab', 'png');


      .. figure:: images/Reduced-Compressibility-Hall-Yarborough-Matlab.png
         :align: center
         :alt: Reduced-Compressibility-Hall-Yarborough-Matlab.png




Blasius Boundary Layer and Howarth's Transformation
---------------------------------------------------

Background
~~~~~~~~~~~
The Blasius Boundary Layer refers to a boundary layer of fluid in the vicinity of a flat plate that moves steadily in its own plane. This concept was first introduced by German mathematician Heinrich Blasius. This solution is important in the field of fluid dynamics, particularly in the area of laminar flow. In this solution, the flow velocity outside the boundary layer is assumed to be uniform. Inside the boundary layer, the fluid's velocity changes from zero at the plate surface to the free stream velocity at the edge of the boundary layer. This concept plays a significant role in understanding and predicting the behavior of fluid flow in various engineering and scientific applications.

The solutions to the Blasius equation provide valuable insights into the behavior of fluid flow near a boundary. For instance, it demonstrates that the boundary layer thickness grows as the square root of the distance along the plate. Also, it reveals that the shear stress at the plate surface is proportional to the square root of the free stream velocity, among other observations.

The Blasius Boundary Layer solution, despite its simplifications, offers a good approximation for real-life engineering problems involving fluid flow over flat surfaces. This understanding is crucial in designing and optimizing various engineering systems, ranging from airfoils in aeronautics to heat exchangers in thermal power plants and thermal shield design on reusable rockets.

.. math:: 
   2f''' + f''f = 0

This equation can be solved by transforming it into a system of 1st order differential equations.

Let:

.. math:: 
   y_1 = f, y_2 = f', y_3 = f''

hence

.. math:: 
   \begin{array}{rcl}
   y'_1&=&f' = y_2, \\
   y'_2&=&f'' = y_3, \\
   y'_3&=&f''' = -0.5f''f = -0.5y_3y_1
   \end{array}

So, the system of first order differential equation is thus:

.. math:: 
   \begin{array}{rcl}
   y'_1&=&y_2, \\
   y'_2&=&y_3, \\
   y'_3&=&-0.5y_3y_1
   \end{array}

Subject to the following initial and terminal conditions. 

.. math:: 
   y_1(0) = 0, y_2(0) = 0, y_2(\infty) = 1

To solve system of ordinary differential equation, you need the initial conditions, but when one of the initial conditions is missing, and we have a terminal condition instead, we can solve for the initial condition we do not have using the terminal condition we have, just like finding the root of a nonlinear function. But to evaluate the value of the function that you want to be zero, you have to perform the integration of the ode, using the guess given by the nonlinear solver and then return the function value which is the difference between the terminal value you obtained from the integration and the desired value. In this case the unknown value is :math:`y_3(0)`, and the function value is :math:`y_2(\infty) - 1`.

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define variables
         ColVec T = null; Matrix Y = null;

         // define function
         ColVec dydt(double t, ColVec y)
         {
             double[] dy = [y[1], y[2], -0.5 * y[2] * y[0]];
             return dy;
         }
         
         // set time span
         double[] tspan = [0, 6]; 
        
         // define nonlinear function to shooting for terminal boundary
         double fun(double y3_0)
         {
             double[] y0 = [0, 0, y3_0];
             (T, Y) = Ode45(dydt, y0, tspan);
             return Y.LastRow[1] - 1;
         }
         
         // solve for unknown initial condition
         Solvers.Result y3_0 = Solvers.FSolve(fun, 0.5);
        
         // plot the result
         Plot(T, Y, Linewidth: 2);
         Legend( ["f", "f'", "f''"], Alignment.UpperLeft );
         Axis([0, 6, 0, 2]); Xlabel("η"); Title("Blasius Boundary layer");
         SaveAs("Blasius-Boundary-Layer-CCL-Math.png");
          

      .. figure:: images/Blasius-Boundary-Layer-CCL-Math.png
         :align: center
         :alt: Blasius-Boundary-Layer-CCL-Math.png


   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         dydt = @(t, y)[y(2); y(3); -0.5*y(3)*y(1)];
         
         % set time span
         tspan = [0,6]; 

         % define function for shooting
         function res = fun(y3_0, dydt, tspan)
             y0 = [0, 0, y3_0];
             [~, Y] = ode45(dydt, tspan, y0);
             res = Y(end, 2) - 1;
         end

         % solve the nonlinear equation for y_3(0)
         y3_0 = fzero(@(y3_0)fun(y3_0, dydt, tspan), 0.5);
         
         % recompute the solution of the ode system using the new initial condition
         y0 = [0, 0, y3_0];
         [T, Y] = ode45(dydt, tspan, y0);

         % plot the result
         figure(Color = 'w')
         plt = plot(T, Y, linewidth = 2);
         axis([0,6,0,2])
         xlabel("η"); 
         legend("f", "f'", "f''")
         title("Blasius Boundary layer");
         saveas(gcf, 'Blasius-Boundary-Layer-Matlab', 'png')

      .. figure:: images/Blasius-Boundary-Layer-Matlab.png
         :align: center
         :alt: Blasius-Boundary-Layer-Matlab.png


Howarth’s Transformation
~~~~~~~~~~~~~~~~~~~~~~~~

Introducing the **Howarth–Dorodnitsyn transformation** (or **Dorodnitsyn-Howarth transformation**) is a density-weighted[4] coordinate transformation, which reduces variable-density flow conservation equations to simpler form (in most cases, to incompressible form), allows us to model the temperature within the boundary layer. 

Introducing the self-similar variables

.. math::
   \eta = \sqrt{\frac{U}{2\nu_{\infty}x}} \int_0^y \frac{\rho}{\rho_{\infty}}dy, 
   f(\eta) = \frac{\psi}{\sqrt{2\nu_{\infty}U_x}},~
   \tilde{h}(\eta) = \frac{h}{h_{\infty}},~
   \tilde{h}_w = \frac{h_w}{h_{\infty}},~
   \tilde{\rho}_w = \frac{\rho}{\rho_{\infty}}

the equations reduce to:

.. math:: 
   2(\tilde{\rho}\tilde{\mu}f'')' + ff'' = 0,

.. math::
   (\tilde{\rho}\tilde{\mu}\tilde{h}')' + Pr f \tilde{h}' + Pr(\gamma - 1)M^2\tilde{\rho}\tilde{\mu}f''^2 = 0


where :math:`\gamma` is the specific heat ratio and :math:`M = U/c_\infty` is the Mach number[6], where :math:`c_\infty` speed of sound[7]. The equation can be solved once :math:`\tilde{\rho} = \tilde{\rho}(\tilde{h})` and :math:`\tilde{\mu} = \tilde{\mu}(\tilde{h})` are specified.

The boundary conditions are:

.. math::
   f(0) = f’(0) = \theta(0) - \tilde{h}_w = f’(\infty)-1 = \tilde{h}(\infty)-1 = 0

The temperature inside the boundary layer will increase even though the plate temperature is maintained at the same temperature as ambient, due to dissipative heating and of course, these dissipation effects are only pronounced when the Mach number :math:`M` is large. 

Here we present the solution for the model when :math:`M = 0` and :math:`5`. 

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define parameters
         double rhomu_h, drhomu_h_eta, gamma, Pr, C;
         
         // define functions and their derivatives
         Func<double, double> rho, drhodh, mu, dmudh, rhomu;
         Func<double, double, double> drhomu;
         
         //define time span and intial guess 
         double[] tspan, y0, y35guess;
         
         // define intexer for the unknwon initial conditions
         Indexer I = new int[] { 1, 3 };
         
         //define function for solution of howarth transformation
         (ColVec, Matrix) HowarthTransform(double M)
         {
             // assign parameters, functions anf their derivatives
             gamma = 1.4; 
             Pr = 0.7; 
             C = Pr * (gamma - 1) * M * M;
             rho = h => 1.0/h;
             drhodh = h => -1 / (h * h);
             mu = h => Pow(h, 2.0 / 3);
             dmudh = h => 2.0 / 3 * Pow(h, -1.0 / 3);
             rhomu = h => rho(h) * mu(h);
             drhomu = (h, dh) => (rho(h) * dmudh(h) + drhodh(h) * mu(h)) * dh;
         
             // define the differential equation
             ColVec dydt(double t, ColVec y)
             {
                 rhomu_h = rhomu(y[3]);
                 drhomu_h_eta = drhomu(y[3], y[4]);
                 double[] dy = [y[1], 
                                y[2], 
                                -(2*drhomu_h_eta + y[0])*y[2]/(2*rhomu_h), 
                                y[4],
                                -(drhomu_h_eta*y[4] + Pr*y[0]*y[4] + C*rhomu_h*y[2]*y[2])/rhomu_h ];
                 return dy;
             }
         
             // set time span and intial guess
             tspan = [0, 5]; y35guess = [0.1, 0.2];
             ColVec T = null; Matrix Y = null;
         
             // define the nonlinear system to compute the initial condition
             ColVec fun(ColVec y35_0)
             {
                 y0 = [0, 0, y35_0[0], 2, y35_0[1]];
                 (T, Y) = Ode45(dydt, y0, tspan);
                 return Y.LastRow[I].T - 1;
             }
        
             // solve for the unknown initial conditions
             Solvers.FSolve(fun, y35guess);
             return (T, Y);
         }
         
         // generator solution for M = 0 and plot
         (ColVec T, Matrix Y) = HowarthTransform(0);
         Plot(T, Y["", 1], "b", 2); hold = true;
         Plot(T, Y["", 3] - 1, "r", 2);
         
         // generator solution for M = 5 and plot
         (T, Y) = HowarthTransform(5);
         Plot(T, Y["", 1], "b", 2);
         Plot(T, Y["", 3] - 1, "r", 2); hold = false;
         
         // add legend, axis label and title
         Legend( ["f'", "h-1"], Alignment.UpperRight);
         Xlabel("η"); Title("Howarth Transformation");
         Axis([0, 5, 0, 2]);
         SaveAs("Howarth-Transformation-CCL-Math.png");
          

      .. figure:: images/Howarth-Transformation-CCL-Math.png
         :align: center
         :alt: Howarth-Transformation-CCL-Math.png


   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         function [T, Y] = HowarthTransform(M)
             % define parameters, functions anf their derivatives
             gamma = 1.4; 
             Pr = 0.7; 
             C = Pr*(gamma - 1)*M^2;
             rho = @(h) h^(-1); 
             drhodh = @(h) -1*h^(-2);
             mu = @(h) h^(2/3); 
             dmudh = @(h) (2/3)*h^(-1/3);
             rhomu = @(h)rho(h)*mu(h);
             drhomu = @(h, dh) (rho(h)*dmudh(h) + drhodh(h)*mu(h))*dh;
         
             % define the differential equation
             function dy = dydt(~, y)
         
                 rhomu_h = rhomu(y(4)); 
                 drhomu_h = drhomu(y(4), y(5));
                 dy = [y(2); 
                       y(3); 
                       -(2*drhomu_h + y(1))*y(3)/(2*rhomu_h); y(5);
                       -(drhomu_h*y(5) + Pr*y(1)*y(5) + C*rhomu_h*y(3)^2)/rhomu_h];
         
             end
        
             % set time span and intial guess
             tspan = [0, 5]; 
             y35guess = [0.5; 1];
        
             % define the nonlinear system to compute the initial condition
             function res = fun(y35_0)
         
                 y0 = [0, 0, y35_0(1), 2, y35_0(2)];
                 [T, Y] = ode45(@dydt, tspan, y0);
                 res = Y(end, [2,4])' - 1;
         
             end
             
             % solve for the unknown initial conditions
             fsolve(@fun, y35guess);
             Y(:,4) = Y(:,4)-1;
         end
         
         % generator solution for M = 5 and plot
         [T, Y] = HowarthTransform(0); 
         figure(color='w'); hold on; 
         plot(T, Y(:, 2), 'b', linewidth = 2);
         plot(T, Y(:, 4), 'r', linewidth = 2);
         
         % generator solution for M = 5 and plot
         [T, Y] = HowarthTransform(5);
         plot(T, Y(:, 2), 'b', linewidth = 2);
         plot(T, Y(:, 4), 'r', linewidth = 2);
        
         % add legend, axis label and title
         legend("f'", "h-1");
         xlabel("η"); 
         title("Howarth Transformation");
         axis([0,5,0,2]); box on;
         saveas(gcf, 'Howarth-Transformation-Matlab', 'png');

      .. figure:: images/Howarth-Transformation-Matlab.png
         :align: center
         :alt: Howarth-Transformation-Matlab.png



Pleiades System
---------------
The Pleiades, also known as the Seven Sisters (M45)[1], is a prominent open star cluster located in the constellation Taurus. It's one of the closest and most easily visible star clusters to Earth[2], making it a favorite target for stargazers and a subject of fascination across cultures. The system of equations describing the motion of the stars in the cluster consists of 14 nonstiff second-order differential equations, which produce a system of 28 equations when rewritten in first-order form.

Celestial mechanics is basically an interplay between Newton's law of gravitation :math:`F_i = \sum_{i \neq j} g \cfrac{m_i m_j}{||p_j - p_i||^2}d_{ij}` and Newton's second law of motion :math:`F_i = m_i\cfrac{d^2p_i}{dt^2}`. 

The positions determine the gravitational forces acting on the bodies, but the net force on each of the bodies determines its acceleration (i.e. changes its position from the second order).

we examine this system in 2D, i.e. :math:`p_i = [x_i, y_i]`,  :math:`d_{ij} = \cfrac{(p_j - p_i)}{r_{ij}}` and :math:`r_{ij} = ||p_j - p_i||`

The dynamics of the system can then be modelled as:

 .. math:: 
    \cfrac{d^2p_i}{dt^2} = \sum_{i \neq j} g \cfrac{m_j(p_j - p_i)}{r_{ij}^3}

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         // define masses
         double[] m = [1, 2, 3, 4, 5, 6, 7];

         // define function
         ColVec pleiades(double t, ColVec q)
         {
             double[] dqdt = new double[28];
             double x1, x2, y1, y2, dx, dy, r3;
             for (int i = 0; i < 7; i++)
             {
                 // x- velocity of star i
                 dqdt[i + 0] = q[i + 14];
                 // y- velocity of star j
                 dqdt[i + 7] = q[i + 21]; 
                 x1 = q[i]; y1 = q[i + 7];
                 for (int j = 0; j < 7; j++)
                 {
                     x2 = q[j]; y2 = q[j + 7];
                     if (j != i)// The star does not attract itself
                     {
                         dx = x2 - x1; dy = y2 - y1;
                         r3 = Pow(dx * dx + dy * dy, 1.5);
                         //impact of star j on x-acceleration of star i 
                         dqdt[i + 14] += m[j] * dx / r3;
                         //impact of star j on y-acceleration of star i 
                         dqdt[i + 21] += m[j] * dy / r3;
                     }
                 }
             }
             return dqdt;
         }
        
         double[] init = [3, 3,-1, -3, 2, -2, 2, 
                          3, -3, 2, 0, 0, -4, 4,
                          0, 0, 0, 0, 0, 1.75, -1.5,
                          0, 0, 0, -1.25, 1, 0, 0];
        
         Indexer I = new(0, 7), J = I + 7;
         double[] tspan = Linspace(1, 15, 200);
         var opts = Odeset( AbsTol: 1e-15, RelTol: 1e-13 );
        
         (ColVec T, Matrix Y) = Ode89(pleiades, init, tspan, opts);
         Plot(Y["", I], Y["", J], "--");
         Title("Position of Pleiades Stars, Solved by ODE89");
         Xlabel("X Position");
         Ylabel("y Position");
         SaveAs("Position-of-Pleiades-Stars-CCL-Math-Ode89.png");
        

      .. figure:: images/Position-of-Pleiades-Stars-CCL-Math-Ode89.png
         :align: center
         :alt: Position-of-Pleiades-Stars-CCL-Math-Ode89.png

   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         dqdt = @(t, q) pleiades(t,q);

         % set initial condition
         q0 = [3 3 -1 -3 2 -2 2 ...
               3 -3 2 0 0 -4 4 ...
               0 0 0 0 0 1.75 -1.5 ...
               0 0 0 -1.25 1 0 0]';
         
         % set time span
         t_span = linspace(1,15,200);
         
         % call the solver
         opts = odeset("RelTol",1e-13,"AbsTol",1e-15);
         [t, q89] = ode89(dqdt, t_span, q0, opts);
         
         % display the result
         plot(q89(:,1:7),q89(:,8:14),'--')
         title('Position of Pleiades Stars, Solved by ODE89')
         xlabel('X Position')
         ylabel('Y Position')
         saveas(gcf, 'Position-of-Pleiades-Stars-Matlab-ODE89', 'png')

         function dqdt = pleiades(t,q)
            x = q(1:7);
            y = q(8:14);
            xDist = (x - x.');
            yDist = (y - y.');
            r = (xDist.^2+yDist.^2).^(3/2);
            m = (1:7)';
            dqdt = [q(15:28);
                    sum(xDist.*m./r,1,'omitnan').';
                    sum(yDist.*m./r,1,'omitnan').'];
          end

      .. figure:: images/Position-of-Pleiades-Stars-Matlab-ODE89.png
         :align: center
         :alt: Position-of-Pleiades-Stars-Matlab-ODE89.png


we can add animation of the solution

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         
         byte[] ImageGen(int i)
         {
             Plot(Y["", I], Y["", J], "--"); hold = true;
             for (int j = 0; j < 7; j++) Scatter(Y[i, j], Y[i, j + 7], "fo", 20);
             hold = false; return GetImageBytes(700, 700);
         }
         AnimationMaker(ImageGen, "Position-of-Pleiades-Stars-CCL-Math-Ode89.gif", 10, 200);
        
      .. figure:: images/Position-of-Pleiades-Stars-CCL-Math-Ode89.gif
         :align: center
         :alt: Position-of-Pleiades-Stars-CCL-Math-Ode89.gif

   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % generate animation
         AnimateOrbits(t89,q89);

         function AnimateOrbits(t,q)
            sz = 15; clrs = 'rkbmcyg';
            for k = 1:length(t)
                plot(q(:,1:7),q(:,8:14),'--'); hold on
                xlim([-20 20]);  ylim([-10 10]);
                arrayfun(@(i) plot(q(k,i), q(k,i+7),'o','MarkerSize',sz,...
                         'MarkerFaceColor',clrs(i)), 1:7);
                hold off
                drawnow
                M(k) = getframe(gca);
                im{k} = frame2im(M(k));
            end
            
            filename = "orbits.gif";
            for idx = 1:length(im)
                [A,map] = rgb2ind(im{idx},256);
                if idx == 1
                    imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0);
                else
                    imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0);
                end
            end
            close all
         end

      .. figure:: images/Position-of-Pleiades-Stars-Matlab-ODE89.gif
         :align: center
         :alt: Position-of-Pleiades-Stars-Matlab-ODE89.gif



One Transistor Amplifier
------------------------
This example shows how to solve a stiff differential algebraic equation (DAE) that describes an electrical circuit. The one-transistor amplifier problem can be rewritten in semi-explicit form, but this example solves it in its original form :math:`Mu=\varphi(u)` The problem includes a constant, singular mass matrix :math:`M`.

The transistor amplifier circuit contains six resistors, three capacitors, and a transistor.

.. figure:: images/Transistor.png
         :align: center
         :alt: Transistor.png

- The initial voltage signal is :math:`U_e(t) = 0.4\sin(200\pi t)`.
- The operating voltage is :math:`U_b = 6`.
- The voltages at the nodes are given by :math:`U_i(t) (i = 1,2,3,4,5)`.
- The values of the resistors  :math:`R_i(t) (i = 1,2,3,4,5)`. are constant, and the current through each resistor satisfies :math:`I = U/R`.
- The values of the capacitors :math:`C_i (i = 1,2,3)` are constant, and the current through each capacitor satisfies :math:`I=C⋅dU/dt`.

The goal is to solve for the output voltage through node 5, :math:`U_5(t)`.

Using Kirchoff's law to equalize the current through each node (1 through 5), you can obtain a system of five equations describing the circuit:

Node 1: :math:`C_1(U'_2 - U'_1) = (U_1 - U_e(t))/R_0`

Node 2: :math:`C_1(U'_1 - U'_2) = (U_2 - U_b)/R_1 + U_2/R_1 + 0.01f(U_2 - U_3)`

Node 3: :math:`-C_2U'_3 = U_3/R_3 - f(U_2 - U_3)`

Node 4: :math:`C_3(U'_5 - U'_4) = (U_4 - U_b)/R_4 + 0.99f(U_2 - U_3)`

Node 5: :math:`C_3(U'_4 - U'_5) = U_5/R_5`


By extracting the coeeficients of the derivatives into a matrix, we have:

.. math::

   \begin{pmatrix}
   -c_{1}  &  c_{1} &    0   &    0   &   0    \\
    c_{1}  & -c_{1} &    0   &    0   &   0    \\
      0    &   0    & -c_{2} &    0   &   0    \\
      0    &   0    &    0   & -c_{3} &  c_{3} \\
      0    &   0    &    0   &  c_{3} & -c_{3}
   \end{pmatrix}
   \begin{pmatrix} U'_1 \\  U'_2 \\ U'_3 \\ U'_4 \\ U'_5 \end{pmatrix} = 
   \begin{pmatrix} 
        (U_1 - U_e(t))/R_0 \\  
        (U_2 - U_b)/R_1 + U_2/R_1 + 0.01f(U_2 - U_3) \\ 
        U_3/R_3 - f(U_2 - U_3) \\ 
        (U_4 - U_b)/R_4 + 0.99f(U_2 - U_3) \\ 
        U_5/R_5 
    \end{pmatrix}


.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using System;
         using System.Collections.Generic;
         using CypherCrescent.MathematicsLibrary;
         using static CypherCrescent.MathematicsLibrary.Math;

         double pi = PI, Ub = 6, R0 = 1000, R15 = 9000, alpha = 0.99,
         beta = 1e-6, Uf = 0.026, c1 = 1e-6, c2 = 2e-6, c3 = 3e-6;
         Matrix Mass(double t, ColVec y) =>
            new double[,] { {-c1,  c1,  0,   0,   0 },
                            { c1, -c1,  0,   0,   0 },
                            { 0,   0,  -c2,  0,   0 },
                            { 0,   0,   0,  -c3,  c3},
                            { 0,   0,   0,   c3, -c3} };
        
         ColVec dudt(double t, ColVec u)
         {
             double Ue = 0.4 * Sin(200 * pi * t),
                    f23 = beta * (Exp((u[1] - u[2]) / Uf) - 1);
             double[] du = [ -(Ue - u[0])/R0,
                           -(Ub/R15 - u[1]*2/R15 - (1-alpha)*f23),
                           -(f23 - u[2]/R15),
                           -((Ub - u[3])/R15 - alpha*f23),
                            u[4]/R15 ];
             return du;
         }
         double[] tspan = [0, 0.1];
         double[] y0 = [0, Ub / 2, Ub / 2, Ub, 0];
        
         Ode.Set options = new() { RelTol = 1e-3, MassType = Ode.MassType.Constant };
        
         (ColVec T, Matrix Y) = Ode45a(dudt, Mass, y0, tspan, opts);
         ColVec X = T, U5 = Y["", 4];
         Scatter(X, 0.4 * Sin(200 * pi * X), "o"); hold = true;
         Plot(X, U5, "--r"); hold = false;
         Legend(["Input", "Output"], Alignment.UpperLeft);
         Xlabel("Time t"); Ylabel("Solution y");
         Title("One Transistor Amplifier DAE Problem-CCL-Math-DAE45");
         SaveAs("One-Transistor-Amplifier-DAE-Problem-CCL-Math-DAE45.png");
        

      .. figure:: images/One-Transistor-Amplifier-DAE-Problem-CCL-Math-DAE45.png
         :align: center
         :alt: One-Transistor-Amplifier-DAE-Problem-CCL-Math-DAE45.png
     

   .. tab:: Python

      Python Implementation

      .. code-block:: python

      


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         Ub = 6; R0 = 1000; R15 = 9000; alpha = 0.99; beta = 1e-6; 
         Uf = 0.026; c1 = 1e-6; c2 = 2e-6; c3 = 3e-6;
         M = [-c1,  c1,   0,   0,   0
               c1, -c1,   0,   0,   0
                0,   0, -c2,   0,   0
                0,   0,   0, -c3,  c3
                0,   0,   0,  c3, -c3];
        
         Ue = @(t) 0.4 * sin(200 * pi * t);
         f23 = @(u) beta * (exp((u(2) - u(3)) / Uf) - 1);
         dudt = @(t, u)[-(Ue(t) - u(1))/R0
                        -(Ub/R15 - u(2)*2/R15 - (1-alpha)*f23(u))
                        -(f23(u) - u(3)/R15)
                        -((Ub - u(4))/R15 - alpha*f23(u))
                        u(5)/R15];
         % set initial condition
         u0 = [0, Ub / 2, Ub / 2, Ub, 0];
         
         % set time span
         t_span = [0, 0.1];
         
         % call the solver
         options = odeset(Mass = M);
         [t, u] = ode23t(dudt, t_span, u0, options);
         
         % display the result
         plot(t, Ue(t), 'bo', t, u(:,5), '.r');
         xlabel('t')
         ylabel('y')
         legend("Input Voltage U_e(t)","Output Voltage U_5(t)",Location="NorthWest");
         title("One Transistor Amplifier DAE Problem-Matlab-ODE23T");
         saveas(gcf, 'One-Transistor-Amplifier-DAE-Problem-Matlab-ODE23T', 'png')

      .. figure:: images/One-Transistor-Amplifier-DAE-Problem-Matlab-ODE23T.png
         :align: center
         :alt: One-Transistor-Amplifier-DAE-Problem-Matlab-ODE23T.png



Reference
---------

1. Hairer, E., et al. Solving Ordinary Differential Equations I: Nonstiff Problems. 2nd rev. ed, Springer, 2009.

2. “Pleiades.” Wikipedia, 21 June 2021. Wikipedia, https://en.wikipedia.org/wiki/Pleiades.

3. Lateef Adewale Kareem (2025). Numerical Inversion of Laplace Transform (https://www.mathworks.com/matlabcentral/fileexchange/179769-numerical-inversion-of-laplace-transform), MATLAB Central File Exchange. Retrieved January 30, 2025.
4. https://en.wikipedia.org/wiki/Density
5. https://en.wikipedia.org/wiki/Specific_heat_ratio
6. https://en.wikipedia.org/wiki/Mach_number
7. https://en.wikipedia.org/wiki/Speed_of_sound