---
titleEN: Fog Architecture and Internet of Things
title: 边缘计算与物联网
date: 2018-12-17
display: true
categories:
- thoughts
tags:
- iot
- internet
- fog
---


{% raw %}<span class=".zh">{% endraw %}
在过去的几十年中，互联网迅速发展，在人们的生活中起着越来越重要的作用。 在地球上几乎所有人类的参与之后[1]，开发人员不可避免地期望为互联网提供更多可用的东西，然后产生了物联网（IoT）的想法。 遗憾的是，在大量事物连接到Internet的情况下，其当前体系结构似乎并不是IoT的高效解决方案。 Bonomi等。 思科的文献[2]首先注意到了这个问题，然后他们提出了革命性的Fog概念，以适应即将到来的物联网时代对越来越多的各种设备的访问。 本文将论证雾概念可以对促进物联网建设产生重大影响。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
In the past few decades, Internet has been rapidly expanding and it plays an increasingly important role in people’s life. After the involvement of nearly all humans on the earth [1], developers, inevitably, expected to make more things available for the internet, which then generated the idea of the Internet of Things (IoT). Regrettably, in the case that a considerable number of things connect to the internet, its current architecture seems not to be a so efficient solution for IoT. Bonomi et al. [2] from Cisco firstly noticed this issue and they then put forward a revolutionary concept of Fog to satisfy the access of a surging number and variety of devices in the coming IoT era. This essay will argue that the Fog concept can have considerable impact on promoting IoT construction.



{% raw %}</span>{% endraw %}


<!-- more -->

{% raw %}
<script>
    session.onload(function(){
        if(page.tran.getLang() == 'zh'){
            tips.warning({
                title: '注意',
                position: 'topRight',
                message: '此页面由机器翻译为中文!!',
                buttons: [['<button>查看原文</button>', function (instance, toast) {
                    page.tran.setLang('en');
                    instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
                }, true]]
            });
        }
    });
</script>
{% endraw %}


{% raw %}<span class=".zh">{% endraw %}

关于Internet的体系结构是集中式还是分布式的，引起了广泛的争议。在过去的几年中，集中化（也被称为云）已逐渐应用于现代互联网的实用结构。在此概念下，将计算，存储和控制等功能从最终用户设备迁移到云服务器已成为一种流行趋势[3]。与云不同，Fog提议将这些功能从服务器分发给用户，让用户彼此共享。

雾可以分为三个维度：雾计算，雾存储和雾控制。根据Bonomi等人的说法。 [2]，雾计算意味着不仅要充分利用来自用户设备的计算资源，而且要充分利用用户与传统云服务器之间任意位置的计算资源。一个理想的例子是，视频游戏玩家的智能手机可以访问空闲计算。资源，例如玩家笔记本电脑的中央处理器（CPU），以改善他们的游戏体验。与Fog计算类似，Fog存储是第二个维度，它建议通过某种算法将用户数据从单个存储分发到多个存储设备[3]。 Google Spanner [4]是一种勇敢的做法，它是一种公共数据库，其功能是将用户的数据分发到世界各地的数据中心，以保护这些数据免遭攻击。 Shi等。 [5]指出，雾的第三个维度，雾控制，倾向于将传统的控制系统分为许多小型的独立和交互式雾系统，这些雾系统仅专注于提供单一功能。在这种情况下，如果雾灯控制系统发生故障，主机系统仍可以通过另一个类似的雾灯控制系统获得光的命令，以将服务持续保持在智能家居中。

Fog之所以为物联网的建设做出贡献的原因之一是，Fog概念下的互联网可以满足极具挑战性的物联网最小延迟要求。 Chiang＆Zhang教授[3]指出，物联网应用程序（例如虚拟现实（VR）游戏，车对车通信和无人机（UAV）控制应用程序）似乎需要等待时间，即一台设备发送信号之间的时间。消息，并且目标设备接收不到10毫秒的消息，这是Cloud服务无法实现的。但是，在Yousefpour，Ishigaki和Jue [6]提出的Fog计算模型中，Fog体系结构的低级服务延迟特性已被证明是持久且稳定的。这可能意味着对延迟敏感的物联网应用可以从其延迟最小化策略中受益。

Fog促进物联网建设的另一个原因是，Fog结构化的互联网可以提供不间断的服务，而这正是物联网应用所希望的。在Fog结构中，控制行为是通过几个并行控制系统协同工作而实现的，而每个系统都有独立支持整个控制行为的潜力。这使得当设备与服务器断开连接或雾网的一部分正在更新甚至损坏时，雾服务仍然可以运行[3]。此特性对于互联车辆[2]在脱机或遇到事故时确保其运行至关重要。

除了这些原因之外，与当前的Cloud Internet相比，Fog Internet的架构似乎更加环保，尤其是在即将到来的物联网时代。在21世纪，环境保护已成为政策制定和商业活动中一个相对重要的议程。消费者期望产品中或由其制造产生的对环境有害的元素更少。但是，根据Aazam等人的说法。 [1]将来，诸如可乐瓶或树的叶子之类的所有事物都可能成为Internet的一部分，这可能需要大量的新电气设备，而其中每个电气设备都可能在一定程度上损害环境。但是，这可能意味着如果可以减少必要电气产品的数量，则将保护生态环境。研究人员评估了Fog计算的适用性，他们指出，在IoT的背景下，Fog Internet可以减少功耗并降低CO2排放[7]。显然，这些可以使互联网更接近绿色网络。

一种说法是，Fog架构的物联网在隐私和安全性方面受到质疑[3]。由于重要的Internet功能和资源都在用户附近，因此有可能遭受Fog设备的攻击。但是，这可以通过与其他技术合作来解决。例如，Zyskind和Nathan [8]设计了一种基于区块链的分散式个人数据管理算法，这是一种强大的编码方法。该算法可能是解决雾网数据安全性不足并保持系统安全的一种可行解决方案。

总而言之，尽管基于Fog概念的物联网目前可能在隐私和系统安全性方面受到质疑，但它在延迟，系统可靠性和生态友好性方面具有令人满意的性能，这是促进物联网建设的关键因素。但是，雾仍然是一个新概念，并且几乎所有相关研究都是在过去两年中进行的。要使Fog概念真正应用于物联网框架还有很长的路要走。

-----------------
**参考（IEEE）**
[1] M. Aazam，I。Khan，AA Alsaffar和E. Huh，“物联网：整合物联网和云计算及其所涉及的问题”，2014年第11届国际巴本应用科学与技术会议论文集（IBCAST ）巴基斯坦伊斯兰堡。 [线上]。 2014年1月14日至18日，伊斯兰堡，第414-419页。提供：https：//uk.cloud.yimian.xyz/index.php/s/PAbkLC5bqoWFcJi

        这是一篇经过同行评审的早期文章，介绍了云和物联网的概念。它为我提供了研究人员如何看待Cloud以及他们如何理解2014年（当Cloud Computing开始流行时）IoT的范围。我使用它来提供有关Cloud简介的一些背景。

[2] F. Bonomi，R。Milito，J。Zhu和S. Addepalli，“雾计算及其在物联网中的作用”，在第一版MCC移动云计算研讨会论文集中。 [线上]。 2012年8月，第13-16页。可用：https：//uk.cloud.yimian.xyz/index.php/s/ZnyXdJKk84dR2QD

       本文首先指出了雾的概念。它的作者全部来自思科，思科被认为是提供Internetworking解决方案的最强大的公司。我已使用此资源介绍了Fog和Fog计算以及其虚构的Fog-IoT应用程序之一的互联汽车的一些背景。

[3] M. Chiang和T. Zhang，IEEE物联网杂志中的“雾与物联网：研究机会概述”。 [线上]。卷3号6，pp.854-864，2016年12月。可用：https：//uk.cloud.yimian.xyz/index.php/s/Fi7KELbjE7kR3qq

        这是最有影响力的工程师组织IEEE发布的邀请论文。 Chiang来自普林斯顿，Zhang来自思科。在本文之后，更多的研究者开始注意到Fog。我使用此资源介绍，评估和查询Fog，因为这是一种罕见的高质量论文。

[4] J.C. Corbett，J.Dean，M.Epstein，A.Fikes，C.Frost，J.J。 Furman，S。Ghemawat，A。Gubarev，C。Heiser，P。Hochschild和W. Hsieh，“ Spanner：Google的全球分布式数据库”，ACM Transactions on Computer Systems（TOCS）。 [在线] .vol。 31号3页2013年8月8日。可用：https：//uk.cloud.yimian.xyz/index.php/s/oxj4EAm6M78GPN8

        本文详细介绍了Google Spanner。 Google Spanner是根据本文设计的。之所以包含此来源，是因为我认为Google Spanner是Fog存储的革命性尝试。当我尝试描述雾存储的概念时，我以它为例。

[5] W. Shi，J。Cao，Q。Zhang，Y。Li和L. Xu，“边缘计算：愿景与挑战”，在IEEE物联网杂志上。 [线上]。卷3号5，第637-646页，2016年10月。可用：https：//uk.cloud.yimian.xyz/index.php/s/p4QGJA6AWPDKEK4

        这是IEEE的期刊，已被引用8422次。它提供了有关如何将Fog应用于计算领域的一些新颖思想。我从此来源总结了Fog控制概念，并引用了他们对Fog IoT的隐私和安全性问题的质疑。

[6] A. Yousefpour，G。Ishigaki和J. P. Jue，“雾计算：努力使物联网中的延迟最小化”，2017 IEEE国际边缘计算会议（EDGE），美国檀香山，檀香山。 [线上]。 2017年，第17-24页。可用：https：//uk.cloud.yimian.xyz/index.php/s/EsDjHnHHGND2SoD

        作者来自德克萨斯大学，他们在雾领域并不出名。由于它是唯一一篇评估延迟（Fog IoT的最重要特征）的数学方法，并且得出了看似可靠的结果，因此我使用它来支持我的低延迟论点。

[7] S. Sarkar，S。Chatterjee和S. Misra，“在物联网环境下进行雾计算的适用性评估”，在IEEE交易云计算中。[在线]。卷6号1，第46-59页，2018年1月至3月。可用：https：//uk.cloud.yimian.xyz/index.php/s/m7of3EjZ6Tji7jF

        该论文是在几个月前发表的。它由两名学生和一名医生撰写，因此并不那么权威。但是，由于对Fog的研究很少，我最终决定使用其建模结果来支持Fog IoT比Cloud更环境友好。

[8] G. Zyskind，O。Nathan和A.’。 Pentland，“去中心化隐私：使用区块链保护个人数据”，2015 IEEE安全和隐私研讨会，加利福尼亚州圣何塞。 [线上]。 2015年，第180-184页。可用：https：//uk.cloud.yimian.xyz/index.php/s/7FirJsrD93wzDxN

        该论文由IEEE发表。 Zyskind来自麻省理工学院，这使得消息来源似乎可信。我对区块链算法感兴趣，该算法在理论上绝对是安全的，我认为这是解决Fog IoT安全问题的一种理想方法。

----------------------
附件
雾和物联网PPT：https://uk.cloud.yimian.xyz/index.php/s/GbLfqxX2CBTDdRR

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

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


{% raw %}</span>{% endraw %}
