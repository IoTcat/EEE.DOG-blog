---
title: Fog Architecture and Internet of Things
date: 2018-12-17
categories:
- thoughts
tags:
- iot
- internet
- fog
---
In the past few decades, Internet has been rapidly expanding and it plays an increasingly important role in people’s life. After the involvement of nearly all humans on the earth [1], developers, inevitably, expected to make more things available for the internet, which then generated the idea of the Internet of Things (IoT). Regrettably, in the case that a considerable number of things connect to the internet, its current architecture seems not to be a so efficient solution for IoT. Bonomi et al. [2] from Cisco firstly noticed this issue and they then put forward a revolutionary concept of Fog to satisfy the access of a surging number and variety of devices in the coming IoT era. This essay will argue that the Fog concept can have considerable impact on promoting IoT construction.

<!--more-->

Internet’s architecture had been widely controverted concerning whether it should be centralized or distributed. In the past few years, centralization, which is also regarded as the Cloud, has been gradually applied to the practical structure for modern internet. Under this concept, it has become a popular trend to move functions such as computing, storage and control from end-user devices to Cloud servers [3].Different from the Cloud, the Fog proposes to distribute these functions from servers to the users and let users share them with each other.

Fog can be classified into three dimensions: Fog computing, Fog storage, and Fog control. According to Bonomi et al. [2], Fog computing means to make full use of the computing resources not only from the user devices, but from the location anywhere between users and traditional Cloud servers.An ideal example is that, video game players’ smartphone can access the idle computing resource such as the Central Processing Unit (CPU) of players’ laptop to improve their game experience. Similar to the Fog computing, Fog storage,the second dimension, proposes to distribute user’s data from single storage to many storage devices through certain algorithm [3]. One brave practice for this is Google Spanner [4], which is a public database functioning by distributing user’s data to data centers all around the world to protect these data from being attacked. Shi et al. [5] indicated that the third dimension of Fog, Fog control, tends to split a traditional control system into many small independent and interactive fog systems which only concentrate on providing single function. In this case, if a fog light control system breaks down, the host system can still get the command of the light through another similar fog control system to keep the service incessantly in a Smart Home.

One reason why the Fog contributes to the construction of IoT is that the internet under the concept of Fog can meet the challenging minimized delay requirement of IoT. Prof. Chiang & Zhang [3] indicated that, IoT applications such as Virtual Reality(VR) games, vehicle-to-vehicle communications and unmanned aerial vehicle (UAV)control applications appear to require latencies, the time spent between one device sending a message and the target device receiving the message, lower than tens of milliseconds, which the Cloud services cannot achieve. However, in a Fog computing model proposed by Yousefpour, Ishigaki & Jue [6], the low-level service delay character of Fog architecture had been proved to be persistent and stable. This may mean that latency-sensitive IoT applications can benefit from their delay-minimizing policy.

Another factor of why the Fog facilitates IoT construction is that a Fog structured internet can provide uninterrupted services, which IoT applications are desirous of. In a Fog structure a control behavior is achieved by several parallel control systems working together while each system has the potentiality to support the whole control behavior independently. This makes it possible that a Fog service can still function when devices disconnect with the server or part of the Fog net is updating or even broken [3]. This trait becomes crucial for Connected Vehicle [2] to ensure its operation when it is offline or meet with an accident.

Apart from these reasons,comparing to the current Cloud internet, the architecture of a Fog internet seems to be more eco-friendly, especially for the coming IoT era. In the 21stcentury, environmental protection has been becoming a comparatively important agenda for policy making and business activity. Consumers expect fewer environment-harmful elements in the product or generated from its manufacture. However, accordingto Aazam et al. [1], in the future, everything such as a bottle of cola or a leaf of a tree can be part of Internet, which may require a considerable number of new electrical equipment while each one of them might hurt the environment to some extent. However, this may mean that the ecological environment would be protected if the amount of necessary electrical products could be decreased. Researchers had assessed the suitability of Fog computing and they pointed that a Fog internet can result in less power consumption and lower CO2 emission in the context of IoT [7]. Apparently, these may transform the internet closer to a green net.

One argument is that the Fog architected IoT was questioned in privacy and security [3]. Since the important internet functions and resources are near the users, it becomes risky for a Fog device of being attacked. However, this might be solved by collaborating with other technics. For example, Zyskind and Nathan [8] designed a decentralized personal data management algorithm basing on blockchain, a powerful encoding method. This algorithm might be one possible solution to cover the data security shortage of Fog net and keep the system safe.

To conclude, although the IoT based on Fog concept may be currently doubted in privacy and system security, it has satisfactory performance in respect of latency, system reliability and eco-friendliness, which are crucial factors on facilitating IoT construction. However, Fog is still a new concept and nearly all of the relevant research was conducted in the past two years. It is still a long way to go before the Fog concept can be actually applied into the framework of IoT.

-----------------
**Reference (IEEE)**
[1] M. Aazam, I. Khan, A. A. Alsaffar and E. Huh, “Cloud of Things: Integrating Internet of Things and cloud computing and the issues involved,” Proceedings of 2014 11th International Bhurban Conference on Applied Sciences & Technology (IBCAST) Islamabad,Pakistan. [Online]. 14th – 18th January, 2014, Islamabad, 2014, pp. 414-419.Available: https://uk.cloud.yimian.xyz/index.php/s/PAbkLC5bqoWFcJi

        This is an early peer-reviewed article introducingthe concept of Cloud and IoT. It provides me the scope of how researcherslooked at Cloud and how they understood IoT in 2014 (when Cloud Computing beganto be popular). I have used this to provide some background about Cloud inintroduction.

[2] F. Bonomi, R. Milito, J. Zhu and S. Addepalli, “Fog computing and its role in the internet of things” In Proceedings of the first edition of the MCC workshop on Mobile cloud computing. [Online]. August, 2012, pp.13-16. Available: https://uk.cloud.yimian.xyz/index.php/s/ZnyXdJKk84dR2QD

       Thispaper firstly pointed out the Fog concept. Its writers were all from Cisco, which is considered the most powerfulcompany on providing Internetworking solution. I have used this sourceto introduce some background of Fog and Fog computing and the Connected Vehicle,one of their imaginary Fog-IoT application.

[3] M. Chiang and T. Zhang, “Fog and IoT:An Overview of Research Opportunities” in IEEE Internet of Things Journal. [Online]. vol. 3, no. 6, pp.854-864, Dec. 2016. Available: https://uk.cloud.yimian.xyz/index.php/s/Fi7KELbjE7kR3qq

        This is an invited paper published by IEEE, the most influential organization for Engineer. Chiang is from Princeton and Zhang is from Cisco. After this paper, more researchers began to notice Fog. I have used this source to introduce, evaluate and query Fog because this is a rare high-quality paper.

[4] J.C. Corbett, J. Dean, M. Epstein, A. Fikes, C. Frost,J.J. Furman, S. Ghemawat, A. Gubarev, C. Heiser, P. Hochschild and W. Hsieh, “Spanner:Google’s globally distributed database”, ACM Transactions on Computer Systems (TOCS). [Online].vol. 31, no. 3,pp. 8, Aug. 2013. Available: https://uk.cloud.yimian.xyz/index.php/s/oxj4EAm6M78GPN8

        This paper detailly introduced Google Spanner. Google Spanner was designed based on this paper. I include this source because I think Google Spanner is are volutionary attempt of Fog storage. And I have used this as an example when I try to describe the concept of Fog storage.

[5] W. Shi, J. Cao, Q. Zhang, Y. Li and L. Xu, “Edge Computing: Vision and Challenges” in IEEE Internet of Things Journal. [Online]. vol. 3, no. 5, pp. 637-646, Oct. 2016.Available: https://uk.cloud.yimian.xyz/index.php/s/p4QGJA6AWPDKEK4

        This is a journal from IEEE and have been cited 8422 times. It provides several novel ideas concerning how would the Fog be applied in computing field. I have summarized the Fog control concept from this source and cited their questioning concerning the privacy and security issue of Fog IoT.

[6] A. Yousefpour, G. Ishigaki and J. P. Jue, “Fog Computing: Towards Minimizing Delay in the Internet of Things” 2017 IEEE International Conference on Edge Computing (EDGE), Honolulu, HI. [Online]. 2017, pp. 17-24. Available: https://uk.cloud.yimian.xyz/index.php/s/EsDjHnHHGND2SoD

        The authors were from Texas University and they are not famous in Fog field. As it is the only paper which evaluated latency, the most significant trait of Fog IoT, mathematically and got a seemly reliable result, I have used this to support my low latency argument. 

[7] S. Sarkar, S. Chatterjee and S. Misra, “Assessment of the Suitability of Fog Computing in the Context of Internet of Things”in IEEE Transactions on Cloud Computing.[Online]. vol. 6, no. 1, pp. 46-59, Jan.-March 2018. Available: https://uk.cloud.yimian.xyz/index.php/s/m7of3EjZ6Tji7jF

        This paper was just published a few month ago. It was written by two students and one doctor, which makes it not so authoritative. However, since there are few Fog research, I finally decide to use its modeling result to support that Fog IoT is more environment friendly than Cloud.

[8] G. Zyskind, O. Nathan and A. ‘. Pentland,”Decentralizing Privacy: Using Blockchain to Protect Personal Data” 2015 IEEE Security and Privacy Workshops,San Jose, CA. [Online]. 2015, pp. 180-184. Available: https://uk.cloud.yimian.xyz/index.php/s/7FirJsrD93wzDxN

        This paper was published by IEEE. Zyskind was from MIT, which makes the source seems to be credible. I am interested in the blockchain algorithm which is theoretically absolutely safe as it mentioned and I think it is one ideal method to deal with the security problem of Fog IoT.

----------------------
Attachment
Fog and IoT PPT: https://uk.cloud.yimian.xyz/index.php/s/GbLfqxX2CBTDdRR