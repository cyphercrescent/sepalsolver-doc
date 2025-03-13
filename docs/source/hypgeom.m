function result = hypgeom(ab, c, z)
a = ab(1); b = ab(2); s = 1; t = 1; n = 0;
result = 1;
den = gammaln(a) + gammaln(b) - gammaln(c);
while (abs(t) > 1e-15)
 n = n + 1; s = s * z;
 ap = gammaln(a + n);
 bp = gammaln(b + n);
 cp = gammaln(c + n);
 gn = gammaln(n + 1);
 e = exp(ap + bp - cp - den - gn);
 t  = e*s;
 result = result + t;
end
