---
title: 2018 – 年度总结
titleEN: 2018 – Retrospect and Prospect
date: 2019-01-08
categories:
- life
tags:
- summary
---


{% raw %}<span class=".zh">{% endraw %}
白驹过隙，挥别2018，走向2019..

作为完全独立生活的第一年，失去约束，放飞自我，狠狠地狂野了一把。然后，竟然还意外地做成了不少事情..
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
In the blink of an eye, I bid farewell to 2018 and march towards 2019..
As the first year of a completely independent life, I lost my inhibitions and let myself go wild.Then, unexpectedly also accomplished many things unexpectedly..
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

## 代码方面：

 - 最大的收获是发现并加入了Github
 - 掌握了不少新语言，嗯数一数有C, C++, PHP, JavaScript, vbs, HTML, CSS, Python, shell, dos, Matlab (大致是按照熟练顺序吧)
 - 经营着7台服务器，一台win2012在上海（第一台），三台cent在悉尼，亚特兰大和伦敦，国内两台Cent 在深圳和北京，再加上宿舍里的ubuntu树莓派，哈哈哈,,,

### 上半年
 - 上半年帮爸爸搞万宗商业，通过ftp连上海服务器，勉强搞了个公司网站出来，可惜暑假被‘拉脱维亚’（至少IP是）的黑客朋友搞掉了，从此弃坑windows
 - 5，6月份尝试搞过一个Steel15高中同学平台，但因为企划模式不切实际等原因，进度一直搁置，最终也在8月份一起被黑掉了（从此养成勤备份好习惯( •̀ ω •́ )y）
 - 7月在欧朗研发部时和组员一起做了一个基于微信小程序的学生电子ID卡，我在其中算是担任后端工程师吧，并且最后还在学校和企业大佬面前做了项目答辩哦
 - 暑假在家中用wifiduino搞了两个项目，太阳能自动加水和走廊灯的自感应化，设计和采购材料时接触了一些水管和电线的知识。据说目前板子仍然运行良好哦

### 9，10月份
 - 9月份的话，开始进军Linux, 通过Vultr搞了不少服务器做尝试，搭建了私人的ss服务器，自此科学上网
 - 9月份，基于开源的NextCloud在伦敦docker搭建了第一个私人网盘，一直使用至今，只是国内访问速度，，(￣▽￣)”，，希望去英国后能好一点
 - 9月份，重建了宿舍的IoT系统，目前虽然出过几次bug但总体而言运行良好
 - 10月份，不爽于诸多被禁番剧，着手搭建第一代Yimian Video视频平台
 - 10月份，多次尝试搞Linux Mail服务，均失败，至今沿用5月份的Windows Mail
 - 10，11月份，C语言as搞了一个数据联网同步，有背景音乐的石头剪刀小游戏
 - 10月份，开发了一个短信验证码login系统
 - 10月，基于shell以及一系列Linux软件结合Nginx搞了一个ss服务器的端口流量管理和统计系统，然后对同学朋友开放帮助他们科学上网（不过北京朋友反应上不了，大概是北京的墙比较高吧，望今年通过增添混淆解决）

### 11，12月份
 - 11月，跟着北大一个网课，尝试搞Python TensorFlow的图像识别，然后成功半途而废掉了。。不过终于对AI有了实践性的了解，理解到目前的神经网络本质是用一坨多项式去fit一个复杂的自然函数
 - 11月，入手了人生第一台树莓派，搭配上红外摄像头，目前呢，可以提供流媒体视频直播服务，，
 - 12月，尝试开发一个上课自动签到的微信小程序，结果被ICE强大的限制算法降伏，，失败
 - 12月，基于Wordpress搭建了一个加载慢慢的Blog平台，
 - 12月，偶然发现了frp，成功实现服务内网穿透，并将其应用到树莓派以及我的PC上
 - 12月，和C语言小组5人一起搞了一个酒店管理系统，然后我最大的contribution是从零搭建了一个底层数据库系统，处理速度，额，炒鸡慢，尽管已经引入了哈希算法..
 - 12月底，入了Github的坑，接触到了DIYgod大神
 - 12月底，基于Dplayer，改良Yimian Video至第三代，支持hls，搭建了弹幕服务器，增添了弹幕功能，通过第三方API连接B站弹幕
 - 12月底，基于Aplayer，开发出基于php控制的网页音乐播放插件，可直接播放网易云指定歌单
 - 12月底，改良以往login页面，增添原创的防robot算法，提升为全动态页面
 - 12月底，接触pjax，YimianVideo, 视频列表试点应用，并开始着手全站动态化改造
 - 12月底，入手咕咕机，利用其API每晚自动打印今日站点访问统计

## 学习方面：

 - 英语方面EAP课程结业，雅思互换的话大概6.5分吧，毕竟也全英授课一年半了
 - 文科方面历史法律学的很开心，考得嘛，，不置评论
 - 年初恶补了基础心理学，社会心理学，发展心理学，变态心理学，心理咨询学，心理测量学，本打算参加心理咨询师考试的，结果最终因为年龄不到要求挺遗憾的，但是学到了这么多喜欢的东西蛮开心的
 - 电路嘛，起码能做基础的直流交流分析了
 - 11月日常物理建模，然后日常最后建得解不出来..
 - 选修了城市规划的课程，虽然给均分造成的影响不忍直视但是，，现在看城市越来越有感觉了哈
 - 社团嘛参加了Infoco凭关系进了管理层，然后一直水偶尔参个会出点主意之类的

## 研究方面：

研究方面，主要搞了三个。上半年调查了Personality trait 对Second Language Acquisition 的影响，最终发现只有内倾型和Grammar优势有着significant 相关性。暑假在欧朗期间搞了关于物联网行业的一个调查，发现业内存在显著的客制化和去中心化发展趋势。下半年在暑期结论的基础上研究了一下Fog Computing， 基本上读遍了近两年IEEE上关于Fog 的文章，愈发坚信未来10年互联网云雾结合的趋势。一个感觉，中国会是这一场互联网架构变革中的关键

## 生活方面

### 番剧
 - 追番56部，分别是
>《 刀剑乱舞-花丸 》
>《 少年锦衣卫 》 
>《 四月是你的谎言 》 
>《 摇曳露营 》 
>《 月色真美 》
>《 擅长捉弄的高木同学 》 
>《 CLANNAD 》 
>《 KANON 》
>《 AIR 》 
>《 可塑性记忆 》 
>《 冰菓 》 
>《 Charlotte 》
>《 龙与虎 》 
>《 星之梦 》 
>《 Angel Beats 》 
>《 斩 赤红之瞳 》 
>《 罪恶王冠 》 
>《 言叶之庭 》 
>《 樱花庄的宠物女孩 》 
>《 未闻花名 》
>《 刀剑神域 》 
>《 凉宫春日的消失 》 
>《 某科学的超电磁炮 》 
>《 紫罗兰永恒花园 》 
>《 萤火之森 》 
>《 声之形 》 
>《 中二病也要谈恋爱 》 
>《 缘之空 》
>《 东京喰种 》 
>《 实力主义至上教室 》 
>《 工作细胞 》 
>《 绯弹的亚里亚 》
>《 从零开始的异世界生活 》 
>《 埃罗芒阿老师 》 
>《 我的妹妹不可能有这么可爱 》 
>《 我的青春恋爱物语果然有问题 》 
>《 白色相簿2 》 
>《 境界的彼方 》 
>《 游戏人生 》 
>《 citrus 》 
>《 命运石之门 》 
>《 未来时在做什么?有没有空?可以来拯救吗？ 》 
>《 路人女主的养成方法 》 
>《 fate 》 
>《 进击的巨人 》 
>《 玉子市场 》 
>《 小林家的龙女仆 》 
>《 吹响吧，上低音号 》 
>《 夏目友人帐 》 
>《 妖精森林的小不点 》 
>《 银魂 》 
>《 干物妹小埋 》 
>《 魔法禁书目录 》 
>《 吹响吧，上低音号第二季 》 
>《 利兹与青鸟 》 
>《 轻音少女第一季 》 
 - 观看电视剧：《lie to me》《硅谷》《谈判官》《翻译官》《非自然死亡》

### 调情易趣
 - Bilibili看视频425小时，大概刷便了Jack Ma的演讲，最痴迷up主竟然是环球时报。。
 - 云村听歌1017小时
 - 倾听了一场交响音乐会
 - 旅游五次，分别在曲阜，太湖，苏州拙政园，济南，南京
 - 去过一次酒吧
 - 三次卡拉OK
 - 回老家探望姥姥，爷爷，陪表妹外甥玩
 - 学车，科一，科二，无证驾驶从方特到山口来回
 - 看了不少电影，就不数了
 - 后期更加注重生活和头发，，日均2盒奶，渐渐跟上早点

## 经济方面

 - 项目开销渐长，18年花销1000+，但仍可控
 - 奖学金补助
 - 比较稳健的投资策略，平均能把七日年化搞到4+，最高的时候到过7
 - 现金流控制还可以，一年内没有发生过现金紧张情况
 - 然后发现如果只是生活的话想多花点钱真的要很努力才行

## 会展：

 - 参加中国开发者大会，入坑开源
 - 赴上海参加世界移动大会，一窥中国物联网未来

## 反思：

 - 熬夜有点小多，目测下半学期平均1点半睡觉
 - 通宵次数略多，大概有15次，其中3次通宵时间超过30小时
 - 运动少，只游过一次泳，没怎么跑过步
 - 经常起不来所以不吃早餐
 - 编起程来生活节奏就乱掉，太过急切的追求功能完善与完美
 - 高二下半学期节奏不稳，数学更是基本半学期没怎么学
 - 过多归因于学校课程设置问题，这本身就很有问题

## 展望2019：

 - 更惬意的生活
 - 更宜人的节奏
 - 更真诚的人际
 - 2020年Github中国区前100
 - 文体两开花


---------------
本文已完结哦(๑•̀ㅁ•́ฅ)


{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}


## Code：

- The most rewarding part was discovering and joining Github
- Master a lot of new languages, including C, C++, PHP, JavaScript, VBS, HTML, CSS, Python, shell, DOS, Matlab (roughly in the order of proficiency)
- Runs 7 servers, 1 Win2012 in Shanghai (the first), 3 Cent in Sydney, Atlanta, and London, 2 Cent in China in Shenzhen and Beijing, plus Ubuntu Raspberry Pie in my dorm room, hahaha,,,,

### The First Half of The Year
 - In the first half of the year, I helped my father to do 10,000 businesses, connected with the Server in Shanghai via FTP, and managed to make a company website. Unfortunately, in the summer vacation, I was lost by the hacker friends in Latvia (at least IP is), so I abandoned the pit of Windows
- 5 or 6 months trying to make a platform Steel15 high school classmate, but because the planning mode is impractical, the schedule has been put on hold, and finally in August hacked together (from a good habit to pay close attention to regular backups (, ̀ omega, ́) y)
- in July, when I was in the r&d department of euron, I worked with my team members to make a student electronic ID card based on WeChat small program. I worked as a back-end engineer in the card, and finally I did a project defense in front of the school and enterprise bosses
 - During the summer vacation, I conducted two projects with Wifiduino at home, such as solar energy automatic water addition and self-induction of corridor lights. During the designing and purchasing of materials, I got some knowledge of water pipes and electric wires.It is said that the board is still running well

### September and October
- In September, it started to move into Linux, experimenting with servers through Vultr, setting up a private SS server that has been scientifically connected ever since
- In September, NextCloud based on open source set up the first private network disk in London Docker. It has been used until now, except for domestic access speed, ~ ~ ~ ", hoping to get better after going to Britain
- In September, the dormitory IoT system was rebuilt and has been working well despite a few bugs so far
- In October, frustrated by the number of banned Yimian dramas, the first Yimian Video platform was set up
- In October, I tried to run Linux Mail service for several times, but failed. So far, I still use The Windows Mail in May
 - In October and November, C language as made a small game of rock scissors with data network synchronization and background music
- In October, developed an SMS verification code login system
- In October, based on shell and a series of Linux software combined with Nginx, I built a port traffic management and statistics system for SS server, and then opened it to my classmates and friends to help them access the Internet scientifically (But my friends in Beijing didn't respond well, maybe the wall in Beijing is relatively high, I hope this year we can solve this problem by adding confusion).

### November and December
- In November, following an online class at Peking University, I tried to engage in image recognition of Python TensorFlow, and then successfully abandoned it halfway. . But finally I have a practical understanding of AI, and understand that the essence of the current neural network is to use a tuft of polynomials to fit a complex natural function
 - In November, I started my life’s first Raspberry Pi with an infrared camera. Currently, it can provide live streaming video services.
 - In December, I tried to develop a WeChat applet for automatic sign-in in class, but failed by ICE's powerful restriction algorithm.
 - In December, built a blog platform based on Wordpress that loads slowly,
 - In December, I stumbled upon frp, successfully achieved service intranet penetration, and applied it to the Raspberry Pi and my PC
 - In December, I worked on a hotel management system with 5 people in the C language team, and my biggest contribution was to build a bottom-level database system from scratch. The processing speed was slow, even though the hash algorithm had been introduced. .
 - At the end of December, I entered the pit of Github and came into contact with the DIYgod god
 - At the end of December, based on Dplayer, improved Yimian Video to the third generation, supported hls, built a bullet screen server, added a bullet screen function, and connected to station B bullet screen through a third-party API
 - At the end of December, based on Aplayer, a web music player plug-in based on PHP control was developed, which can directly play NetEase Cloud designated playlists
 - At the end of December, improved the previous login page, added original anti-robot algorithm, and upgraded it to a fully dynamic page
 - At the end of December, contacted pjax, YimianVideo, and video list pilot applications, and started the dynamic transformation of the whole site
 - At the end of December, started the Cuckoo machine, using its API to automatically print today's site visit statistics every night

## Learning Aspect：

- After completing the English EAP course, IELTS exchange is about 6.5 points. After all, it has been taught in English for a year and a half.
  - In the liberal arts, I am very happy in history and law. Well, I don’t comment.
  - I supplemented basic psychology, social psychology, developmental psychology, abnormal psychology, psychological counseling, and psychometrics at the beginning of the year. I planned to take the counselor exam, but I was very sorry because I was under the age requirement. I'm so happy to learn so many things I like
  - Circuits, at least basic DC and AC analysis can be done
  - Daily physical modeling in November, and finally the daily construction can not be solved...
  - I took the course of urban planning, although I can’t bear to look directly at the impact on the equalization, but now I feel more and more feeling about the city.
  - The club joined Infoco and got into the management based on the relationship, and then it was always the occasional meeting to come up with ideas, etc.

## Research:

In terms of research, there are mainly three. In the first half of the year, we investigated the impact of the Personality trait on Second Language Acquisition, and finally found that only the introverted type and the Grammar advantage have a significant correlation. During the summer vacation in Oulang, I conducted a survey on the Internet of Things industry and found that there is a significant trend of customization and decentralization in the industry. In the second half of the year, I studied Fog Computing on the basis of the conclusion of the summer vacation. I basically read the IEEE articles on Fog in the past two years, and I became more and more convinced of the trend of Internet cloud and fog combination in the next 10 years. There is a feeling that China will be the key to this Internet architecture change

## Life aspect

### ACG
 - Chasing Fan 56, which are
> "Touken Ranbu-Hanamaru"
> "Juvenile Jinyiwei"
> "April is your lie"
> "Swaying Camping"
> "The Moonlight Is Really Beautiful"
> "Takagi-san who is good at teasing"
>《 CLANNAD》
>《 KANON》
>《 AIR》
>《Plastic Memory》
> "Bingguo"
> "Charlotte"
> "Dragon and Tiger"
> "Star Dream"
>《Angel Beats》
> "Slash the Crimson Eye"
> "Guilty Crown"
> "The Garden of Words"
> "Sakura Village's Pet Girl"
> "Unheard Flower Names"
> "Sword Art Online"
> "The Disappearance of Haruhi Suzumiya"
> "A certain scientific super-electromagnetic gun"
> "Violet Evergarden"
> "Firefly Forest"
> "The Shape of Sound"
> "Dating in the Second Disease"
> "Fate of Space"
> "Tokyo Ghoul"
> "Strength Doctrine Classroom"
> "Working Cells"
> "Aria the Scarlet Ammo"
> "Zero-Starting Life in Another World"
> "Teacher Eromanga"
> "My sister can't be so cute"
> "My youth romance story really has a problem"
>《White Album 2》
> "Beyond the Realm"
> "Game of Life"
>《 citrus》
> "The Gate of Destiny Stones"
> "What are you doing in the future? Is there any time? Can you come to save? 》
> "How to raise a passerby heroine"
>《 fate》
> "Attack on Titan"
> "Jade Market"
> "The Dragon Maid of the Kobayashi Family"
> "Blow, Euphonium"
> "Natsume's Book of Friends"
> "The Little Things of the Fairy Forest"
> "Gintama"
> "Small Buried Qianwumei"
> "A Certain Magical Index"
> "Blow, Euphonium Season 2"
> "Leeds and the Bluebird"
> "Qingyin Girl Season 1"
 - Watch TV series: "lie to me", "Silicon Valley", "negotiator", "translator", "unnatural death"

### Happiness
  - Bilibili watched the video for 425 hours, and probably finished Jack Ma's speech. The most obsessed up host turned out to be the Global Times. .
  - 1017 hours of listening to songs in Yuncun
  - Listened to a symphony concert
  - Five trips in Qufu, Taihu Lake, Suzhou Humble Administrator's Garden, Jinan and Nanjing
  - Go to the bar once
  - Three karaoke
  - Visit grandma, grandpa, and cousin and nephew
  - Learn to drive, subject one, subject two, driving from Fangte to Yamaguchi without a license
  - I watched a lot of movies, so I won’t count them
  - Pay more attention to life and hair in the later period, and average 2 boxes of milk a day, and gradually keep up with it early

## Economic Aspect

 - Project expenses are getting longer, spending 1000+ in 18 years, but still manageable
 - Scholarship subsidy
 - Relatively stable investment strategy, average 7-day annualization can reach 4+, the highest time is 7
 - Cash flow control is okay, there is no cash shortage in one year
 - Then I found that if I just want to spend more money, I really need to work hard

## Exhibition:

 - Participate in the China Developers Conference, open source
 - Go to Shanghai to participate in the World Mobile Conference and get a glimpse of the future of China's Internet

## Reflection:

 - Staying up late is a bit too small, visually check the average of going to bed at 1:30 in the second half of the semester
 - The number of overnight stays is slightly higher, about 15 times, of which 3 times are more than 30 hours overnight
 - Less exercise, only one swim, not much running
 - I can't get up often so I skip breakfast
 - The rhythm of life is chaotic when I start the process, and I am too eager to pursue functional perfection and perfection
 - Rhythm is unstable in the second half of the second semester of high school, and mathematics is basically not learned in the half semester
 - Too much attributed to the school curriculum, which is very problematic in itself

## Looking forward to 2019:

 - A more comfortable life
 - More pleasant rhythm
 - More sincere interpersonal
 - Top 100 Github China in 2020
 - Stylistic two blossoms


---------------
This article is over (๑•̀ㅁ•́ฅ)



{% raw %}</span>{% endraw %}