From: daeinki <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Tue, 21 Jun 2011 09:20:15 +0900
Message-ID: <4DFFE3BF.7090301@samsung.com>
References: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04>
 <4DFF1C5A.4080207@samsung.com> <4DFFAEA9.8060402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13793 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756319Ab1FUASD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 20:18:03 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN400L47658V1F0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 09:18:01 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN400MNJ661YG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 09:18:01 +0900 (KST)
In-reply-to: <4DFFAEA9.8060402@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: jg1.han@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi Sylwester

You are right, no problem if clkdev is used instead of=20
plat-samsung/clock.c. I didn't aware of recently trend.(I couldn't=20
afford to having interest in open source) and I will look over clkdev=20
feature Thomas introduced.

Thank you.

Sylwester Nawrocki =EC=93=B4 =EA=B8=80:
> Hi Inki
>=20
> On 06/20/2011 12:09 PM, daeinki wrote:
>> Hi, Mr. Han and Sylwester.
>> below is my opinion.
>>
>> JinGoo Han =EC=93=B4 =EA=B8=80:
> ...
>>> Please, refer to the LCD contoller clock table as follows:
>>>   - s3c2440 uses 's3c2410fb.c', not 's3c-fb.c' since  LCD controlle=
r IP is different.
>>>     However, s3c2443 uses 's3c-fb.c'. So I add s3c2443 to table ins=
tead of s3c2440.
>>>   - s3c6410 has SCLK_LCD, but, clock name is not defined.
>>>   - Exynos4 does not use name "HCLK".
>>>
>>>            | LCD controller    |                            |
>>>            | (IP core) clock   | LCD pixel clock            |
>>> ----------+------------------------+-----------------------+
>>> s3c2443   |  HCLK (lcd)       | x  |  DISPCLK (display-if) |
>>> ----------+------------------------+-----------------------+
>>> s3c6410   |  HCLK (lcd)       | x  |  SCLK_LCD  (N/A)      |
>>> ----------+------------------------+-----------------------+
>>> s5pc100   |  HCLK (lcd)       | x  |  SCLK_LCD  (sclk_lcd) |
>>> ----------+------------------------+-----------------------+
>>> s5pv210   |  HCLK_DSYS (lcd)  | x  |  SCLK_FIMD (sclk_fimd)|
>>> ----------+-----------------------+------------------------+
>>> exynos4   |  ACLK_160 (fimd)  | O  |  SCLK_FIMD (sclk_fimd)|
>>> ----------+------------------------+-----------------------+
> ...
>>>> I think we could try to create two clock connection ids to the fra=
mebuffer
>>>> device in the first place, e.g. "bus_ck", "pix_ck".
>>>> And then think about how handle that in the driver.
>>>>
>>>> But this requires conversion to the omap-style clock registration =
method,
>>>> something like in the attached patch. The patch is only for s5pv21=
0 and
>>>> and compile tested only as I didn't have any board to test it here=
=2E
>>>> It's based on for-next branch at http://tinyurl.com/6yzravy I thin=
k there
>>>> might be more issues to convert the old s3c24xx platforms, neverth=
eless
>>>> the attached patch should not affect them.
> ...
>=20
>> when someone adds new board file with new SoC, he doesn't need to kn=
ow
>> this SoC chip has hclk and sclk_fimd or only sclk_fimd(such as exyno=
s4).
>> using implicit clock means it should know that this SoC chip has bot=
h
>> clocks(bus clock, sclk_fimd) or only sclk_fimd.
>>
>> for example, if any driver needs fimd clock frequency then this driv=
er
>> should know that this SoC chip is exynos4 or not and has both clock
>> source(bus clock, soure clock fimd) or not(only source clock fimd)
>> so I think we shoule see only a clock "lcd" regardless of which cloc=
k is
>> used and if exynos4 then sclk_fimd would be set by machine code.
>>
>> and Sylwester,
>> it appears that your patch has one issue about clk_get function call=
=2E
>> your patch adds "bus_ck" to list head "clocks" of plat-samsung/clock=
=2Ec
>=20
> Why do you think so ? In fact the "clocks" list in plat-samsung/clock=
=2Ec
> is not used any more, AFAIU it should have been removed altogether wi=
th
> clk_get/clk_put functions in Thomas' clkdev patches.=20
> When you comment out the line declaring the list everything compiles =
fine
> there.
>=20
>> and "pix_ck" to list head "clocks" of drivers/clk/clkdev.c and I am
>> afraid that if some machine(such as s3c24xx, s3c64xx and s5pc1xx) ha=
s
>> CLKDEV_LOOKUP configuration then clk_get() would fail to get clock
>> object because in this case, clock lookup could be done through list
>> head "clocks" of driver/clk/clkdev.c.(it's right from
>> plat-samsung/clock.c) so I think it needs more patch for resolving t=
his
>=20
> As I indicated earlier the framebuffer driver would have to be modifi=
ed
> to support newly introduced clock _connection_ names.
> We could (temporarily) name one of those clock connections "lcd",
> to avoid additional trouble on SoCs that still use a one-to-one
> platform clock name <-> clock connection id mapping.
>=20
>> issue also and do you think it's a good way to use only one clock na=
me
>> "lcd"?... in fact, this might be so.... much slight issue. :)
>=20
> Do you mean using using one name in the code for different clock name=
s
> in the datasheets ? I suppose it was because of the API limitations a=
nd
> hope it will change for the better. :)
>=20
> Cheers,
> Sylwester
>=20
>=20
