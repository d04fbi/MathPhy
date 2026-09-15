# The Abstraction Gap Between Mathematics and Physics: The Hidden Compromise in Dimensional Analysis Resolved

**Author:** Fredrik Bierich
**License:** Copyright © 2026 Fredrik Bierich. Licensed under CC-BY-4.0.
**Subject:** Mathematics, Physics
**Keywords:** Circular Sector, Circular Functions, Chebyshev Polynomials, Simple Harmonic Motion, Uniform Circular Motion
**Official Data Repository:** Zenodo
**DOI:** https://doi.org/10.5281/zenodo.22690421

## Abstract

In this project we bridge the abstraction gap between mathematics and physics by adopting a geometric perspective of trigonometry. We formalize this by addressing the arc length of a circular sector and defining the circular functions axiomatically as direct functional mappings from the physical parameters of a circular sector -- namely the radius and the arc length -- to its orthogonal projections. Finally, we demonstrate the utility of this framework by modeling simple harmonic motion and uniform circular motion through these geometric functions.

## 1. The circular sector

### Theorem 1.1

$$s = \lim \limits_{n \to \infty} 2^n \sqrt{2r^2 - 2ra_n}$$

$$a_n = \frac{\sqrt{2r^2 + 2ra_{n-1}}}{2}$$

$$a_0 = x \quad \text{ for } -r \leq x \leq r$$

#### Proof

$$\overline{OX_n} = \frac{\overline{OS_{n-1}} \sqrt{\overline{OR}^2 - \overline{OX_{n-1}}^2}}{\sqrt{\overline{OR}^2 + \overline{OS_{n-1}}^2 - 2 \overline{OS_{n-1}} \overline{OX_{n-1}}}}$$

$$\overline{RS_n} = \sqrt{\overline{OR}^2 + \overline{OS_n}^2 - 2 \overline{OS_n} \overline{OX_n}}$$

$$\mathrm{arc} RS_0 := \lim \limits_{n \to \infty} 2^n \overline{RS_n}$$

$$a_0 = x \quad \text{for } -r \leq x \leq r$$

$$a_n = \frac{r \sqrt{r^2 - a_{n-1}^2}}{\sqrt{r^2 + r^2 - 2ra_{n-1}}}$$

$$a_n = \frac{r \sqrt{r^2 - a_{n-1}^2}}{\sqrt{2r^2 - 2ra_{n-1}}}$$

$$a_n = r \frac{\sqrt{r^2 - a_{n-1}^2}}{\sqrt{2r^2 - 2ra_{n-1}}}$$

$$a_n = r \sqrt{\frac{r^2 - a_{n-1}^2}{2r^2 - 2ra_{n-1}}}$$

$$a_n = r \sqrt{\frac{(r + a_{n-1}) (r - a_{n-1})}{2r^2 - 2ra_{n-1}}}$$

$$a_n = r \sqrt{\frac{(r + a_{n-1}) (r - a_{n-1})}{2r (r - a_{n-1})}}$$

$$a_n = r \sqrt{\frac{r + a_{n-1}}{2r}}$$

$$a_n = r \sqrt{\frac{2r (r + a_{n-1})}{(2r)^2}}$$

$$a_n = r \sqrt{\frac{2r^2 + 2ra_{n-1}}{(2r)^2}}$$

$$a_n = r \sqrt{\frac{\left(\sqrt{2r^2 + 2ra_{n-1}}\right)^2}{(2r)^2}}$$

$$a_n = r \sqrt{\left(\frac{\sqrt{2r^2 + 2ra_{n-1}}}{2r}\right)^2}$$

$$a_n = r \frac{\sqrt{2r^2 + 2ra_{n-1}}}{2r}$$

$$a_n = \frac{r \sqrt{2r^2 + 2ra_{n-1}}}{2r}$$

$$a_n = \frac{\sqrt{2r^2 + 2ra_{n-1}}}{2}$$

$$s_n = \sqrt{r^2 + r^2 - 2ra_n}$$

$$s_n = \sqrt{2r^2 - 2ra_n}$$

$$s = \lim \limits_{n \to \infty} 2^n s_n$$

$$s = \lim \limits_{n \to \infty} 2^n \sqrt{2r^2 - 2ra_n}$$

##### Lemma 1.1

$$A_{ORS_{n-1}} = \frac{\overline{RS_{n-1}} \overline{OX_n}}{2} = \frac{\overline{OS_{n-1}} \overline{RX_{n-1}}}{2}$$

$$\frac{\overline{RS_{n-1}} \overline{OX_n}}{2} = \frac{\overline{OS_{n-1}} \overline{RX_{n-1}}}{2}$$

$$\overline{RS_{n-1}} \overline{OX_n} = \overline{OS_{n-1}} \overline{RX_{n-1}}$$

$$\frac{\overline{RS_{n-1}} \overline{OX_n}}{\overline{RS_{n-1}}} = \frac{\overline{OS_{n-1}} \overline{RX_{n-1}}}{\overline{RS_{n-1}}}$$

$$\overline{OX_n} = \frac{\overline{OS_{n-1}} \overline{RX_{n-1}}}{\overline{RS_{n-1}}}$$

$$\overline{OX_n} = \frac{\overline{OS_{n-1}} \sqrt{\overline{OR}^2 - \overline{OX_{n-1}}^2}}{\overline{RS_{n-1}}}$$

$$\overline{OX_n} = \frac{\overline{OS_{n-1}} \sqrt{\overline{OR}^2 - \overline{OX_{n-1}}^2}}{\sqrt{\overline{OR}^2 + \overline{OS_{n-1}}^2 - 2 \overline{OS_{n-1}} \overline{OX_{n-1}}}}$$

##### Lemma 1.2

$$\overline{RS_n}^2 = \overline{RX_n}^2 + \overline{X_nS_n}^2$$

$$\overline{RS_n} = \sqrt{\overline{RX_n}^2 + \overline{X_nS_n}^2}$$

$$\overline{RS_n} = \sqrt{\overline{OR}^2 - \overline{OX_n}^2 + \overline{X_nS_n}^2}$$

$$\overline{RS_n} = \sqrt{\overline{OR}^2 - \overline{OX_n}^2 + \left(\overline{OS_n} - \overline{OX_n}\right)^2}$$

$$\overline{RS_n} = \sqrt{\overline{OR}^2 - \overline{OX_n}^2 + \overline{OS_n}^2 - 2 \overline{OS_n} \overline{OX_n} + \overline{OX_n}^2}$$

$$\overline{RS_n} = \sqrt{\overline{OR}^2 + \overline{OS_n}^2 - 2 \overline{OS_n} \overline{OX_n}}$$

##### Lemma 1.3

$$\overline{OX_n}^2 + \overline{RX_n}^2 = \overline{OR}^2$$

$$\overline{OX_n}^2 + \overline{RX_n}^2 - \overline{OX_n}^2 = \overline{OR}^2 - \overline{OX_n}^2$$

$$\overline{RX_n}^2 = \overline{OR}^2 - \overline{OX_n}^2$$

$$\overline{RX_n} = \sqrt{\overline{OR}^2 - \overline{OX_n}^2}$$

### Theorem 1.2

$$A = \frac{rs}{2}$$

#### Proof

##### Lemma 1.4

$$A_0 = \lim \limits_{n \to \infty} 2^{n-1} A_{ORS_nS_{n-1}}$$

$$A_0 = \lim \limits_{n \to \infty} 2^{n-1} \frac{\overline{RS_{n-1}} \overline{OS_n}}{2}$$

$$A_0 = \frac{\lim \limits_{n \to \infty} 2^{n-1} \overline{RS_{n-1}} \overline{OS_n}}{2}$$

$$A_0 = \frac{\lim \limits_{n \to \infty} \left(2^{n-1} \overline{RS_{n-1}}\right) \overline{OS_n}}{2}$$

$$A_0 = \frac{\lim \limits_{n \to \infty} \overline{OS_n} \left(2^{n-1} \overline{RS_{n-1}}\right)}{2}$$

$$A_0 = \frac{\left(\lim \limits_{n \to \infty} \overline{OS_n}\right) \left(\lim \limits_{n \to \infty} 2^{n-1} \overline{RS_{n-1}}\right)}{2}$$

$$A_0 = \frac{\overline{OR} \lim \limits_{n \to \infty} 2^{n-1} \overline{RS_{n-1}}}{2}$$

$$A_0 = \frac{\overline{OR} \mathrm{arc} RS_0}{2}$$

## 2\. The circular functions

### Definition 2.1

$$\arccos \colon \lbrace (r,x) \in \mathbb{R}^2 \mid r > 0, -r \leq x \leq r \rbrace \to \mathbb{R} \quad (r,x) \mapsto s$$

### Corollary 2.1

$$\arccos(r,x) = \lim_{n \to \infty} 2^n \sqrt{2r^2 - 2ra_n}$$

$$a_n = \frac{\sqrt{2r^2 + 2ra_{n-1}}}{2}$$

$$a_0 = x \quad \text{ for } -r \leq x \leq r$$

### Definition 2.2

$$\cos \colon \lbrace (r,s) \in \mathbb{R}^2 \mid r > 0 \rbrace \to \mathbb{R} \quad (r,s) \mapsto x$$

### Theorem 2.1

$$\cos(r,s) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{s}{r}\right)^{2k}}{(2k)!}$$

#### Proof

$$s = \lim \limits_{m \to \infty} 2^m \sqrt{2r^2 - 2r a_{m,m}}$$

$$2^m \sqrt{2r^2 - 2r a_{m,0}} = s$$

$$\frac{2^m \sqrt{2r^2 - 2r a_{m,0}}}{2^m} = \frac{s}{2^m}$$

$$\sqrt{2r^2 - 2r a_{m,0}} = \frac{s}{2^m}$$

$$\left(\sqrt{2r^2 - 2r a_{m,0}}\right)^2 = \left(\frac{s}{2^m}\right)^2$$

$$2r^2 - 2r a_{m,0} = \left(\frac{s}{2^m}\right)^2$$

$$2r^2 - 2r a_{m,0} = \frac{s^2}{\left(2^m\right)^2}$$

$$2r^2 - 2r a_{m,0} = \frac{s^2}{2^{2m}}$$

$$2r^2 - 2r a_{m,0} - 2r^2 = \frac{s^2}{2^{2m}} - 2r^2$$

$$-2r a_{m,0} = \frac{s^2}{2^{2m}} - 2r^2$$

$$\frac{-2r a_{m,0}}{-2r} = \frac{\left(\frac{s^2}{2^{2m}}\right) - 2r^2}{-2r}$$

$$a_{m,0} = \frac{\left(\frac{s^2}{2^{2m}}\right) - 2r^2}{-2r}$$

$$a_{m,0} = \frac{\left(\frac{s^2}{2^{2m}}\right)}{-2r} - \frac{2r^2}{-2r}$$

$$a_{m,0} = \frac{s^2}{2^{2m}(-2r)} - \frac{2r^2}{-2r}$$

$$a_{m,0} = \frac{s^2}{-2^{2m+1}r} - \frac{2r^2}{-2r}$$

$$a_{m,0} = \frac{s^2}{-2^{2m+1}r} + \frac{-2r^2}{-2r}$$

$$a_{m,0} = \frac{s^2}{-2^{2m+1}r} + r$$

$$a_{m,0} = r + \frac{s^2}{-2^{2m+1}r}$$

$$a_{m,0} = r - \left(-\frac{s^2}{-2^{2m+1}r}\right)$$

$$a_{m,0} = r - \left(\frac{-s^2}{-2^{2m+1}r}\right)$$

$$a_{m,0} = r - \frac{s^2}{2^{2m+1}r}$$

$$r \hat{a}_{m,0} = r - \frac{s^2}{2^{2m+1}r}$$

$$\frac{r \hat{a}_{m,0}}{r} = \frac{r - \left(\frac{s^2}{2^{2m+1}r}\right)}{r}$$

$$\frac{r \hat{a}_{m,0}}{r} = \frac{r}{r} - \frac{\left(\frac{s^2}{2^{2m+1}r}\right)}{r}$$

$$\hat{a}_{m,0} = \frac{r}{r} - \frac{\left(\frac{s^2}{2^{2m+1}r}\right)}{r}$$

$$\hat{a}_{m,0} = 1 - \frac{\left(\frac{s^2}{2^{2m+1}r}\right)}{r}$$

$$\hat{a}_{m,0} = 1 - \frac{s^2}{2^{2m+1}r^2}$$

$$a_{m,n} = \frac{\sqrt{2r^2 + 2r a_{m,n-1}}}{2} \quad \text{for } n \leq m$$

$$a_{m,n-1} = \frac{\sqrt{2r^2 + 2r a_{m,n}}}{2} \quad \text{for } n \leq m$$

$$2 a_{m,n-1} = 2 \frac{\sqrt{2r^2 + 2r a_{m,n}}}{2} \quad \text{for } n \leq m$$

$$2 a_{m,n-1} = \frac{2 \sqrt{2r^2 + 2r a_{m,n}}}{2} \quad \text{for } n \leq m$$

$$2 a_{m,n-1} = \sqrt{2r^2 + 2r a_{m,n}} \quad \text{for } n \leq m$$

$$(2 a_{m,n-1})^2 = \left(\sqrt{2r^2 + 2r a_{m,n}}\right)^2 \quad \text{for } n \leq m$$

$$2^2 a_{m,n-1}^2 = \left(\sqrt{2r^2 + 2r a_{m,n}}\right)^2 \quad \text{for } n \leq m$$

$$4 a_{m,n-1}^2 = \left(\sqrt{2r^2 + 2r a_{m,n}}\right)^2 \quad \text{for } n \leq m$$

$$4 a_{m,n-1}^2 = 2r^2 + 2r a_{m,n} \quad \text{for } n \leq m$$

$$4 a_{m,n-1}^2 - 2r^2 = 2r^2 + 2r a_{m,n} - 2r^2 \quad \text{for } n \leq m$$

$$4 a_{m,n-1}^2 - 2r^2 = 2r a_{m,n} \quad \text{for } n \leq m$$

$$\frac{4 a_{m,n-1}^2 - 2r^2}{2r} = \frac{2r a_{m,n}}{2r} \quad \text{for } n \leq m$$

$$\frac{4 a_{m,n-1}^2}{2r} - \frac{2r^2}{2r} = \frac{2r a_{m,n}}{2r} \quad \text{for } n \leq m$$

$$\frac{2 a_{m,n-1}^2}{r} - \frac{2r^2}{2r} = \frac{2r a_{m,n}}{2r} \quad \text{for } n \leq m$$

$$\frac{2 a_{m,n-1}^2}{r} - r = \frac{2r a_{m,n}}{2r} \quad \text{for } n \leq m$$

$$\frac{2 a_{m,n-1}^2}{r} - r = a_{m,n} \quad \text{for } n \leq m$$

$$a_{m,n} = \frac{2 a_{m,n-1}^2}{r} - r \quad \text{for } n \leq m$$

$$r \hat{a}_{m,n} = \frac{2(r \hat{a}_{m,n-1})^2}{r} - r \quad \text{for } n \leq m$$

$$r \hat{a}_{m,n} = \frac{2r^2 \hat{a}_{m,n-1}^2}{r} - r \quad \text{for } n \leq m$$

$$r \hat{a}_{m,n} = 2r \hat{a}_{m,n-1}^2 - r \quad \text{for } n \leq m$$

$$\frac{r \hat{a}_{m,n}}{r} = \frac{2r \hat{a}_{m,n-1}^2 - r}{r} \quad \text{for } n \leq m$$

$$\frac{r \hat{a}_{m,n}}{r} = \frac{2r \hat{a}_{m,n-1}^2}{r} - \frac{r}{r} \quad \text{for } n \leq m$$

$$\hat{a}_{m,n} = \frac{2r \hat{a}_{m,n-1}^2}{r} - \frac{r}{r} \quad \text{for } n \leq m$$

$$\hat{a}_{m,n} = 2 \hat{a}_{m,n-1}^2 - \frac{r}{r} \quad \text{for } n \leq m$$

$$\hat{a}_{m,n} = 2 \hat{a}_{m,n-1}^2 - 1 \quad \text{for } n \leq m$$

$$\cos(r,s) = \lim \limits_{m \to \infty} r \hat{a}_{m,m}$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \hat{a}_{m,m}$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} T_{2^m}\left(\hat{a}_{m,0}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} T_{2^m}\left(1 - \frac{s^2}{2^{2m+1}r^2}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{\left(2^{2m+1} \left(1 - \frac{s^2}{2^{2m+1}r^2} - 1\right)\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{\left(2^{2m+1} \left(-\frac{s^2}{2^{2m+1}r^2}\right)\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{\left(-2^{2m+1} \frac{s^2}{2^{2m+1}r^2}\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{\left(-\frac{2^{2m+1}s^2}{2^{2m+1}r^2}\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{\left(-\frac{s^2}{r^2}\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{(-1)^k \left(\frac{s^2}{r^2}\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{(-1)^k \left(\left(\frac{s}{r}\right)^2\right)^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \lim \limits_{m \to \infty} \sum \limits_{k=0}^{2^m} \frac{(-1)^k \left(\frac{s}{r}\right)^{2k}}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^m}\right)$$

$$\cos(r,s) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{s}{r}\right)^{2k}}{(2k)!}$$

##### Lemma 2.1

$$T_{2m}(x) = 2 (T_{m}(x))^2 - 1$$

$$m = 2^{n-1}$$

$$T_{2(2^{n-1})}(x) = 2 (T_{2^{n-1}}(x))^2 - 1$$

$$T_{1}(x) = x$$

$$T_{2^{n}}(x) = 2 (T_{2^{n-1}}(x))^2 - 1$$

$$T_{1}(x) = x$$

##### Lemma 2.2

$$T_{m}(x) = \sum \limits_{k=0}^{m} \frac{2^{k} \prod \limits_{j=0}^{k-1} (m^2 - j^2)}{(2k)!} (x - 1)^k$$

$$m = 2^n$$

$$T_{2^n}(x) = \sum \limits_{k=0}^{2^n} \frac{2^{k} \prod \limits_{j=0}^{k-1} ((2^n)^2 - j^2)}{(2k)!} (x - 1)^k$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{2^{k} (x - 1)^k \prod \limits_{j=0}^{k-1} ((2^n)^2 - j^2)}{(2k)!}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k \prod \limits_{j=0}^{k-1} ((2^n)^2 - j^2)}{(2k)!}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} ((2^n)^2 - j^2)$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} (2^{2n} - j^2)$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \frac{2^{2n} (2^{2n} - j^2)}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} 2^{2n} \frac{2^{2n} - j^2}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} 2^{2n} \prod \limits_{j=0}^{k-1} \frac{2^{2n} - j^2}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k}{(2k)!} (2^{2n})^k \prod \limits_{j=0}^{k-1} \frac{2^{2n} - j^2}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2 (x - 1))^k (2^{2n})^k}{(2k)!} \prod \limits_{j=0}^{k-1} \frac{2^{2n} - j^2}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2^{2n+1} (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \frac{2^{2n} - j^2}{2^{2n}}$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2^{2n+1} (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(\frac{2^{2n}}{2^{2n}} - \frac{j^2}{2^{2n}}\right)$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2^{2n+1} (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{2^{2n}}\right)$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2^{2n+1} (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{(2^2)^n}\right)$$

$$T_{2^{n}}(x) = \sum \limits_{k=0}^{2^n} \frac{(2^{2n+1} (x - 1))^k}{(2k)!} \prod \limits_{j=0}^{k-1} \left(1 - \frac{j^2}{4^n}\right)$$

### Definition 2.3

$$\arcsin \colon \lbrace (r,y) \in \mathbb{R}^2 \mid r > 0, -r \leq y \leq r \rbrace \to \mathbb{R} \quad (r,y) \mapsto s$$

### Theorem 2.2

$$\arcsin(r,y) = \frac{\arccos(r,-y) - \arccos(r,y)}{2}$$

#### Proof

$$\arcsin(r,y) = \frac{\arcsin(r,y) + \arcsin(r,y)}{2}$$

$$\arcsin(r,y) = \frac{\arcsin(r,y) + \arcsin(r,y) + \arccos(r,y) - \arccos(r,y)}{2}$$

$$\arcsin(r,y) = \frac{\arcsin(r,y) + \arcsin(r,-y) + \arccos(r,-y) - \arccos(r,y)}{2}$$

$$\arcsin(r,y) = \frac{\arcsin(r,y) - \arcsin(r,y) + \arccos(r,-y) - \arccos(r,y)}{2}$$

$$\arcsin(r,y) = \frac{\arccos(r,-y) - \arccos(r,y)}{2}$$

### Definition 2.4

$$\sin \colon \lbrace (r,s) \in \mathbb{R}^2 \mid r > 0 \rbrace \to \mathbb{R} \quad (r,s) \mapsto y$$

### Theorem 2.3

$$\sin(r,s) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{s}{r}\right)^{2k+1}}{(2k+1)!}$$

#### Proof

$$\cos(r,\alpha - \beta) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha - \beta}{r}\right)^{2k}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} \frac{(-1)^k \left(\frac{\alpha - \beta}{r}\right)^{2k}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} \frac{(-1)^k \sum \limits_{j=0}^{2k} \binom{2k}{j} \left(\frac{\alpha}{r}\right)^{2k-j} \left(\frac{-\beta}{r}\right)^{j}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} \frac{(-1)^k \sum \limits_{j=0}^{2k} \frac{(2k)!}{j! (2k-j)!} \left(\frac{\alpha}{r}\right)^{2k-j} \left(\frac{-\beta}{r}\right)^{j}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} \frac{(-1)^k \sum \limits_{j=0}^{2k} (2k)! \frac{\left(\frac{\alpha}{r}\right)^{2k-j} \left(\frac{-\beta}{r}\right)^{j}}{j! (2k-j)!}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} \frac{(-1)^k (2k)! \sum \limits_{j=0}^{2k} \frac{\left(\frac{\alpha}{r}\right)^{2k-j} \left(\frac{-\beta}{r}\right)^{j}}{j! (2k-j)!}}{(2k)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \sum \limits_{k=0}^{n} (-1)^k \sum \limits_{j=0}^{2k} \frac{\left(\frac{\alpha}{r}\right)^{2k-j} \left(\frac{-\beta}{r}\right)^{j}}{j! (2k-j)!}$$

$$\cos(r,\alpha - \beta) = r \lim \limits_{n \to \infty} \left(\sum \limits_{k=0}^{n} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{j=0}^{n-k} \frac{(-1)^j \left(\frac{\beta}{r}\right)^{2j}}{(2j)!} + \sum \limits_{k=0}^{n-1} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{j=0}^{n-1-k} \frac{(-1)^j \left(\frac{\beta}{r}\right)^{2j+1}}{(2j+1)!}\right)$$

$$\cos(r,\alpha - \beta) = r \left(\lim \limits_{n \to \infty} \left(\sum \limits_{k=0}^{n} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{j=0}^{n-k} \frac{(-1)^j \left(\frac{\beta}{r}\right)^{2j}}{(2j)!}\right) + \lim \limits_{n \to \infty} \left(\sum \limits_{k=0}^{n-1} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{j=0}^{n-1-k} \frac{(-1)^j \left(\frac{\beta}{r}\right)^{2j+1}}{(2j+1)!}\right)\right)$$

$$\cos(r,\alpha - \beta) = r \left(\sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!} + \lim \limits_{n \to \infty} \left(\sum \limits_{k=0}^{n-1} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{j=0}^{n-1-k} \frac{(-1)^j \left(\frac{\beta}{r}\right)^{2j+1}}{(2j+1)!}\right)\right)$$

$$\cos(r,\alpha - \beta) = r \left(\sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!} + \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)$$

$$\cos(r,\alpha - \beta) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!} + r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}$$

$$\cos(r,\alpha - \beta) = \frac{r \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!} + r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)}{r}$$

$$\cos(r,\alpha - \beta) = \frac{r^2 \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!} + r^2 \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}}{r}$$

$$\cos(r,\alpha - \beta) = \frac{\left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!}\right) + r^2 \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!} \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}}{r}$$

$$\cos(r,\alpha - \beta) = \frac{\left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k}}{(2k)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!}\right) + \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)}{r}$$

$$\cos(r,\alpha - \beta) = \frac{\cos(r,\alpha) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k}}{(2k)!}\right) + \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)}{r}$$

$$\cos(r,\alpha - \beta) = \frac{\cos(r,\alpha) \cos(r,\beta) + \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)}{r}$$

$$m = 0$$

$$\cos(r,\alpha - \beta) = a_{m,0}$$

$$a_{m,0} = r - \frac{s^2}{2^{2m+1}r}$$

$$s = \sqrt{\left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 + \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}$$

$$\cos(r,\alpha - \beta) = r - \frac{\left(\sqrt{\left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 + \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}\right)^2}{2r}$$

$$\cos(r,\alpha - \beta) = r - \frac{\left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 + \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2}{2r} - \frac{\left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 + \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 + \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos(r,\alpha) - \cos(r,\beta)\right)^2 - \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos^2(r,\alpha) - 2 \cos(r,\alpha) \cos(r,\beta) + \cos^2(r,\beta)\right) - \left(\sin(r,\alpha) - \sin(r,\beta)\right)^2}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos^2(r,\alpha) - 2 \cos(r,\alpha) \cos(r,\beta) + \cos^2(r,\beta)\right) - \left(\sin^2(r,\alpha) - 2 \sin(r,\alpha) \sin(r,\beta) + \sin^2(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \cos^2(r,\alpha) + 2 \cos(r,\alpha) \cos(r,\beta) - \cos^2(r,\beta) - \left(\sin^2(r,\alpha) - 2 \sin(r,\alpha) \sin(r,\beta) + \sin^2(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \cos^2(r,\alpha) + 2 \cos(r,\alpha) \cos(r,\beta) - \cos^2(r,\beta) - \sin^2(r,\alpha) + 2 \sin(r,\alpha) \sin(r,\beta) - \sin^2(r,\beta)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos^2(r,\alpha) + \sin^2(r,\alpha)\right) + 2 \cos(r,\alpha) \cos(r,\beta) - \cos^2(r,\beta) + 2 \sin(r,\alpha) \sin(r,\beta) - \sin^2(r,\beta)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos^2(r,\alpha) + \sin^2(r,\alpha)\right) - \left(\cos^2(r,\beta) + \sin^2(r,\beta)\right) + 2 \cos(r,\alpha) \cos(r,\beta) + 2 \sin(r,\alpha) \sin(r,\beta)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - \left(\cos^2(r,\alpha) + \sin^2(r,\alpha)\right) - \left(\cos^2(r,\beta) + \sin^2(r,\beta)\right) + 2 \left(\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2r^2 - r^2 - \left(\cos^2(r, \beta) + \sin^2(r,\beta)\right) + 2 \left(\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{r^2 - \left(\cos^2(r, \beta) + \sin^2(r,\beta)\right) + 2 \left(\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{r^2 - r^2 + 2 \left(\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{2 \left(\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)\right)}{2r}$$

$$\cos(r,\alpha - \beta) = \frac{\cos(r,\alpha) \cos(r,\beta) + \sin(r,\alpha) \sin(r,\beta)}{r}$$

$$\sin(r,\alpha) \sin(r,\beta) = \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!}\right) \left(r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}\right)$$

$$\sin(r,\alpha) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\alpha}{r}\right)^{2k+1}}{(2k+1)!}$$

$$\sin(r,\beta) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{\beta}{r}\right)^{2k+1}}{(2k+1)!}$$

$$\sin(r,s) = r \sum \limits_{k=0}^{\infty} \frac{(-1)^k \left(\frac{s}{r}\right)^{2k+1}}{(2k+1)!}$$

## 3\. Simple harmonic motion

* $m$ is the mass of the object measured in kilograms (Kg)
* $\omega$ is the linear speed of the object at equilibrium measured in meters per second (m/s)
* $k$ is the spring constant of the restoring force measured in Newtons per meter (N/m)
* $r$ is the amplitude of the oscillatory motion measured in meters (m)

$$F = ma = -kx$$

$$ma = -kx$$

$$x(t) = \cos(r,\omega t)$$

$$a(t) = \frac{d^2x}{dt^2}$$

$$a(t) = \frac{d^2 \cos(r,\omega t)}{dt^2}$$

$$a(t) = \frac{-\omega^2 \cos(r,\omega t)}{r^2}$$

$$a(x) = \frac{-\omega^2 x}{r^2}$$

$$m \frac{-\omega^2 x}{r^2} = -kx$$

$$\frac{m (-\omega^2 x)}{r^2} = -kx$$

$$\frac{-m \omega^2 x}{r^2} = -kx$$

$$\frac{-m \omega^2 x}{r^2} = \frac{-kr^2x}{r^2}$$

$$m \omega^2 = kr^2$$

$$v(t) = \frac{dx}{dt}$$

$$v(t) = \frac{d \cos(r,\omega t)}{dt}$$

$$v(t) = \frac{-\omega \sin(r,\omega t)}{r}$$

$$K(t) = \frac{mv^2(t)}{2}$$

$$K(t) = \frac{m \left(\frac{-\omega \sin(r,\omega t)}{r}\right)^2}{2}$$

$$K(t) = \frac{m \frac{(-\omega \sin(r,\omega t))^2}{r^2}}{2}$$

$$K(t) = \frac{m \frac{(-\omega)^2 \sin^2(r,\omega t))^2}{r^2}}{2}$$

$$K(t) = \frac{m \frac{\omega^2 \sin^2(r,\omega t)}{r^2}}{2}$$

$$K(t) = \frac{\frac{m \omega^2 \sin^2(r,\omega t)}{r^2}}{2}$$

$$K(t) = \frac{\frac{kr^2 \sin^2(r,\omega t)}{r^2}}{2}$$

$$K(t) = \frac{k \sin^2(r,\omega t)}{2}$$

$$U(t) = \frac{kx^2(t)}{2}$$

$$U(t) = \frac{k \cos^2(r,\omega t)}{2}$$

$$E = K + U$$

$$E = \frac{k \sin^2(r,\omega t)}{2} + \frac{k \cos^2(r,\omega t)}{2}$$

$$E = \frac{k \sin^2(r,\omega t) + k \cos^2(r,\omega t)}{2}$$

$$E = \frac{k (\sin^2(r,\omega t) + \cos^2(r,\omega t))}{2}$$

$$E = \frac{kr^2}{2}$$

$$E = \frac{m \omega^2}{2}$$

## 4\. Uniform circular motion

* $m$ is the mass of the object measured in kilograms (Kg)
* $\omega$ is the circular arc speed of the object measured in meters per second (m/s)
* $r$ is the constant distance from the object to the center of rotation measured in meters (m)

$$F = ma$$

$$\omega = \frac{\Delta s}{\Delta t}$$

$$\vec{r}_x(t) = \cos(r,\omega t)$$

$$\vec{r}_y(t) = \sin(r,\omega t)$$

$$\vec{r} = (\vec{r}_x,\vec{r}_y)$$

$$\vec{r}(t) = (\cos(r,\omega t),\sin(r,\omega t))$$

$$\vec{v} = \frac{d \vec{r}}{dt}$$

$$\vec{v}(t) = \frac{d (\cos(r,\omega t),\sin(r,\omega t))}{dt}$$

$$\vec{v}(t) = \left(\frac{d \cos(r,\omega t)}{dt},\frac{d \sin(r,\omega t)}{dt}\right)$$

$$\vec{v}(t) = \left(\frac{-\omega \sin(r,\omega t)}{r},\frac{\omega \cos(r,\omega t)}{r}\right)$$

$$\vec{v}(t) = \frac{\omega \left(-\sin(r,\omega t),\cos(r,\omega t)\right)}{r}$$

$$\vec{a} = \frac{d^2 \vec{r}}{dt^2}$$

$$\vec{a}(t) = \frac{d^2 (\cos(r,\omega t),\sin(r,\omega t))}{dt^2}$$

$$\vec{a}(t) = \left(\frac{d^2 \cos(r,\omega t)}{dt^2},\frac{d^2 \sin(r,\omega t)}{dt^2}\right)$$

$$\vec{a}(t) = \left(\frac{-\omega^2 \cos(r,\omega t)}{r^2},\frac{-\omega^2 \sin(r,\omega t)}{r^2}\right)$$

$$\vec{a}(t) = \frac{-\omega^2 \left(\cos(r,\omega t),\sin(r,\omega t)\right)}{r^2}$$

$$\vec{a} = \frac{-\omega^2 \vec{r}}{r^2}$$

$$\vec{F} = m \vec{a}$$

$$\vec{F} = m \frac{-\omega^2 \vec{r}}{r^2}$$

$$\vec{F} = \frac{m (-\omega^2 \vec{r})}{r^2}$$

$$\vec{F} = \frac{-m \omega^2 \vec{r}}{r^2}$$

$$v = \left|\vec{v}\right|$$

$$v = \left|\frac{\omega \left(-\sin(r,\omega t),\cos(r,\omega t)\right)}{r}\right|$$

$$v = \frac{\left|\omega \left(-\sin(r,\omega t),\cos(r,\omega t)\right)\right|}{\left|r\right|}$$

$$v = \frac{\left|\omega\right| \left|\left(-\sin(r,\omega t),\cos(r,\omega t)\right)\right|}{\left|r\right|}$$

$$v = \frac{\omega \left|\left(-\sin(r,\omega t),\cos(r,\omega t)\right)\right|}{\left|r\right|}$$

$$v = \frac{\omega \sqrt{(-\sin(r,\omega t))^2 + \cos^2(r,\omega t)}}{\left|r\right|}$$

$$v = \frac{\omega \sqrt{\sin^2(r,\omega t) + \cos^2(r,\omega t)}}{\left|r\right|}$$

$$v = \frac{\omega \sqrt{r^2}}{\left|r\right|}$$

$$v = \frac{\omega \left|r\right|}{\left|r\right|}$$

$$v = \omega$$

$$E = \frac{mv^2}{2}$$

$$E = \frac{m \omega^2}{2}$$

$$a = \left|\vec{a}\right|$$

$$a = \left|\frac{-\omega^2 \vec{r}}{r^2}\right|$$

$$a = \frac{\left|-\omega^2 \vec{r}\right|}{\left|r^2\right|}$$

$$a = \frac{\left|-\omega^2\right| \left|\vec{r}\right|}{\left|r^2\right|}$$

$$a = \frac{\omega^2 \left|\vec{r}\right|}{\left|r^2\right|}$$

$$a = \frac{\omega^2 r}{\left|r^2\right|}$$

$$a = \frac{\omega^2 r}{r^2}$$

$$a = \frac{\omega^2}{r}$$

$$F = \frac{m \omega^2}{r}$$

