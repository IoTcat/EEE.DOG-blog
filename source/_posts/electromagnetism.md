---
title: 工程电磁学
date: 2019-02-26
categories:
- notes
tags:
- maxwell
---

麦克斯韦大法好！！


<!--more-->


### 先供上麦克斯韦方程 膜拜膜拜(　o=^•ェ•)o

$$
\begin{eqnarray}
\nabla\cdot\vec{E} &=& \frac{\rho}{\varepsilon_0} \\
\nabla\cdot\vec{B} &=& 0 \\
\nabla\times\vec{E} &=& -\frac{\partial B}{\partial t} \\
\nabla\times\vec{B} &=& \mu_0\left(\vec{J}+\varepsilon_0\frac{\partial E}{\partial t} \right)
\end{eqnarray}
$$

----------------

## 第一话 - 高斯生库伦

 - 假设空间中两点电荷$Q_{1}$,$Q_{2}$，相距d，欲求其相互作用的电场力。
 - 现以$Q_{1}$为圆心，$d$为半径做球。根据高斯law可知球面上的电通量只与球内电荷量有关，本例中为$\frac{Q_{1}}{\varepsilon_0}$。
 - 将上式中电通量除以求表面积可得电场强度$\frac{Q_{1}}{4\pi d^{2}\varepsilon_0}$
 - 场强乘以$Q_{2}$即可得库仑力$\frac{Q_{1}Q_{2}}{4\pi d^{2}\varepsilon_0}$
 - 令$k=\frac{1}{4\pi \varepsilon_0}$整理得
$$F = \frac{k Q_{1}Q_{2}}{d^{2}}$$
证毕

## 第二话 - 高斯金箍棒

 - 假设一均匀带电长度正无穷细杆，电荷密度为$\lambda$，求距其$d$处场强。
 - 绕杆画一个过待求点的圆柱，设高为$x$。
 - 由于杆长无限，圆柱两底面电场被抵消。
 - 圆柱侧面积为$2\pi dx$
 - 圆柱内电荷量为$\lambda x$
 - 引入高斯，得
$$
2\pi dxE = \frac{\lambda x}{\varepsilon_{0}}
$$
整理得
$$
E = \frac{\lambda}{2\pi d\varepsilon_{0}}
$$
证毕

## 高斯球球球

 - 首先要有一个带电小球，电量$Q$，想求其外部距其圆心$d$处场强。
 - 然后可列式
$$
4\pi d^2 E = \frac{Q}{\varepsilon_0}
$$
整理得
$$
E = \frac{Q}{4\pi \varepsilon_0 d^2}
$$
毕

## 高斯大面

 - 首先有一个均匀带电无穷面，带电面密度$\rho$，欲求距其$d$的点场强。
 - 以无穷面为中央横截面，做一个底面圆心为待求点的圆柱，半径为$r$。
 - 由于电场线皆平行，只有两个底面有电场线穿过。
 - 可列式
$$
2\pi r^2 E = \frac{\rho \pi r^2}{\varepsilon_0}
$$
整理得
$$
E = \frac{\rho}{2\varepsilon_0}
$$
完事


-----------
To Be Continued...