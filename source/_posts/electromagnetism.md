---
title: 工程电磁学
titleEN: Engineering Electromagnetics
date: 2019-02-26
categories:
- notes
tags:
- maxwell
---



{% raw %}<span class=".zh">{% endraw %}

麦克斯韦大法好！！

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Maxwell Dafa is good! !
{% raw %}</span>{% endraw %}


<!--more-->

{% raw %}
<script>
	session.onload(function(){
		if(page.tran.getLang() == 'en'){
			tips.warning({
				title: 'Caution',
				position: 'topRight',
				message: 'This page was translated by Machine!!',
				buttons: [['<button>Show Original Page</button>', function (instance, toast) {
					page.tran.setLang('zh');
             		instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
        		}, true]]
			});
		}
	});
</script>
{% endraw %}

{% raw %}<span class=".zh">{% endraw %}

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


{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

### First offer to Maxwell's equation, worship (　o=^•ェ•)o

$$
\begin{eqnarray}
\nabla\cdot\vec{E} &=& \frac{\rho}{\varepsilon_0} \\
\nabla\cdot\vec{B} &=& 0 \\
\nabla\times\vec{E} &=& -\frac{\partial B}{\partial t} \\
\nabla\times\vec{B} &=& \mu_0\left(\vec{J}+\varepsilon_0\frac{\partial E}{\partial t} \right)
\end{eqnarray}
$$

----------------

## Chapter One-Gossian Cullen

 - Suppose two electric charges $Q_{1}$ and $Q_{2}$ in space are separated by d, and the electric field force they want to interact with.
 - Now take $Q_{1}$ as the center of the circle and $d$ as the radius to make the ball. According to the Gaussian law, the electric flux on the sphere is only related to the amount of charge in the sphere, which is $\frac{Q_{1}}{\varepsilon_0}$ in this example.
 - Divide the electric flux in the above formula by the surface area to get the electric field intensity $\frac{Q_{1}}{4\pi d^{2}\varepsilon_0}$
 - Field strength is multiplied by $Q_{2}$ to get Coulomb force $\frac{Q_{1}Q_{2}}{4\pi d^{2}\varepsilon_0}$
 - Let $k=\frac{1}{4\pi \varepsilon_0}$ to get
$$F = \frac{k Q_{1}Q_{2}}{d^{2}}$$
Completed

## Chapter 2-Gauss Golden Cudgel

 - Assuming that a uniformly charged length is positively infinitely thin and the charge density is $\lambda$, find the field strength $d$ away from it.
 - Draw a cylinder around the rod and set the height to be $x$.
 - Due to the infinite length of the rod, the electric fields on the two bottom surfaces of the cylinder are cancelled.
 - The cylindrical side area is $2\pi dx$
 - The amount of charge in the cylinder is $\lambda x$
 - Introduce Gaussian, get
$$
2\pi dxE = \frac{\lambda x}{\varepsilon_{0}}
$$
Organized
$$
E = \frac{\lambda}{2\pi d\varepsilon_{0}}
$$
Completed

## Gauss Ball Ball

 - First, there must be a charged ball with electricity $Q$, and I want to find the field strength at the distance of $d$ from the center of the ball.
 - Then columnable
$$
4\pi d^2 E = \frac{Q}{\varepsilon_0}
$$
Organized
$$
E = \frac{Q}{4\pi \varepsilon_0 d^2}
$$
complete

## Gaussian Noodles

 - First, there is a uniformly charged infinite surface, the charged surface density is $\rho$, and the field strength of the point $d$ is desired.
 - Using the infinite plane as the central cross section, make a cylinder with the center of the bottom surface as the point to be found, and the radius is $r$.
 - Since the electric field lines are all parallel, only two bottom surfaces have electric field lines passing through.
 - Columnable
$$
2\pi r^2 E = \frac{\rho \pi r^2}{\varepsilon_0}
$$
Organized
$$
E = \frac{\rho}{2\varepsilon_0}
$$
Finished


-----------
To Be Continued...


{% raw %}</span>{% endraw %}
