From: daeinki <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Mon, 20 Jun 2011 19:09:30 +0900
Message-ID: <4DFF1C5A.4080207@samsung.com>
References: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60529 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753315Ab1FTKHT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 06:07:19 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN300EVM2RU7BE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:07:17 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN300DCP2S5WO@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:07:17 +0900 (KST)
In-reply-to: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi, Mr. Han and Sylwester.
below is my opinion.

JinGoo Han =BE=B4 =B1=DB:
> Hi, Sylwester Nawrocki.
> I appreciate your review and suggestion.
>=20
> Please, refer to the LCD contoller clock table as follows:
>  - s3c2440 uses 's3c2410fb.c', not 's3c-fb.c' since  LCD controller I=
P is different.
>    However, s3c2443 uses 's3c-fb.c'. So I add s3c2443 to table instea=
d of s3c2440.
>  - s3c6410 has SCLK_LCD, but, clock name is not defined.
>  - Exynos4 does not use name "HCLK".
>=20
>           | LCD controller    |                            |
>           | (IP core) clock   | LCD pixel clock            |
> ----------+------------------------+-----------------------+
> s3c2443   |  HCLK (lcd)       | x  |  DISPCLK (display-if) |
> ----------+------------------------+-----------------------+
> s3c6410   |  HCLK (lcd)       | x  |  SCLK_LCD  (N/A)      |
> ----------+------------------------+-----------------------+
> s5pc100   |  HCLK (lcd)       | x  |  SCLK_LCD  (sclk_lcd) |
> ----------+------------------------+-----------------------+
> s5pv210   |  HCLK_DSYS (lcd)  | x  |  SCLK_FIMD (sclk_fimd)|
> ----------+-----------------------+------------------------+
> exynos4   |  ACLK_160 (fimd)  | O  |  SCLK_FIMD (sclk_fimd)|
> ----------+------------------------+-----------------------+
>=20
> s3c2443, s3c6410, s5pc100 and s5pv210 don't use 'sclk_lcd' or 'sclk_f=
imd'.
> 'lcd' clock is also used to generate the LCD pixel clock.
>=20
> My point is that LCD contoroller clock should be named "lcd" for cons=
istence.
> If there is not mux for lcd pixel clock in case of exynos4, "sclk_fim=
d" will be set
> in machine directory.
>=20
> As you mentioned, I also think that we need to create two clock conne=
ction ids
> such as  "bus_ck", "pix_ck" in order to use SCLK_LCD or SCLK_FIMD.
> Moreover, 'lcd' in s5pv210 should be changed to 'fimd' according to s=
5pv210 datasheet.
> However, it requres many works to convert.
>=20
> So, I think that 'two clock connection ids' patch would be submitted =
later,
> after committing the patches that I submitted on last Friday.
>=20
>=20
> On 06/19/2011 23:39 AM, Sylwester Nawrocki wrote:
>> Hi Jingoo,
>>
>> On 06/17/2011 03:01 PM, Jingoo Han wrote:
>>> This patch changes clock name for FIMD from "fimd" to "lcd".
>>>
>>> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos4/clock.c |    4 ++--
>>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos4/clock.c
>>> b/arch/arm/mach-exynos4/clock.c index 871f9d5..12e6853 100644
>>> --- a/arch/arm/mach-exynos4/clock.c
>>> +++ b/arch/arm/mach-exynos4/clock.c
>>> @@ -433,12 +433,12 @@ static struct clk init_clocks_off[] =3D {
>>>     .enable  =3D exynos4_clk_ip_cam_ctrl,
>>>     .ctrlbit =3D (1<<  3),
>>>    }, {
>>> -  .name  =3D "fimd",
>>> +  .name  =3D "lcd",
>>>     .id  =3D 0,
>>>     .enable  =3D exynos4_clk_ip_lcd0_ctrl,
>> I think we're inevitably heading to disaster with this kind of impli=
cit
>> clocks mapping across various SoCs. It is getting harder to figure o=
ut
>> what's going on with every new SoC support added.
>> The "fimd" clock in this case (exynos4) is not really a HCLK clock, =
like,
>> for instance, in case of s5pv210. But after this patch they would bo=
th be
>> named "lcd". You cannot set frequency on "fimd" clock, it is only fo=
r
>> gating the bus clock to the LCD controller, right ? Whereas "lcd"
>> indicates HCLK on s5pv210 and can also be used to generate the LCD p=
ixel
>> clock.
>> I know you are not going to use "lcd" clock in the driver for settin=
g up
>> the pixel clock frequency on exynos4 but it's all confusing this way=
=2E
>>
>> I dug in the datasheets and it looks like the LCD controller's IP ma=
in
>> (bus) clock is named HCLK there and "lcd" throughout the code.
>>
>>           | LCD controller    |                            |
>>           | (IP core) clock   | LCD pixel clock            |
>> ----------+------------------------+-----------------------+
>> s3c2440   |  HCLK (lcd)       | x  |  N/A ?                |
>> ----------+------------------------+-----------------------+
>> s3c6410   |  HCLK (lcd)       | x  |  LCD                  |
>> ----------+------------------------+-----------------------+
>> s5pc100   |  HCLK (lcd)       | x  |  SCLK_LCD  (sclk_lcd) |
>> ----------+------------------------+-----------------------+
>> s5pv210   |  HCLK(_DSYS) (lcd)| x  |  SCLK_FIMD (sclk_fimd)|
>> ----------+-----------------------+-----------------------+
>> exynos4   |  ?                | -  |  SCLK_FIMD?(sclk_fimd)|
>> ----------+------------------------+-----------------------+
>>
>> I think we could try to create two clock connection ids to the frame=
buffer
>> device in the first place, e.g. "bus_ck", "pix_ck".
>> And then think about how handle that in the driver.
>>
>> But this requires conversion to the omap-style clock registration me=
thod,
>> something like in the attached patch. The patch is only for s5pv210 =
and
>> and compile tested only as I didn't have any board to test it here.
>> It's based on for-next branch at http://tinyurl.com/6yzravy I think =
there
>> might be more issues to convert the old s3c24xx platforms, neverthel=
ess
>> the attached patch should not affect them.
>>
>> --
>> Regards,
>> Sylwester

when someone adds new board file with new SoC, he doesn't need to know
this SoC chip has hclk and sclk_fimd or only sclk_fimd(such as exynos4)=
=2E
using implicit clock means it should know that this SoC chip has both
clocks(bus clock, sclk_fimd) or only sclk_fimd.

for example, if any driver needs fimd clock frequency then this driver
should know that this SoC chip is exynos4 or not and has both clock
source(bus clock, soure clock fimd) or not(only source clock fimd)
so I think we shoule see only a clock "lcd" regardless of which clock i=
s
used and if exynos4 then sclk_fimd would be set by machine code.

and Sylwester,
it appears that your patch has one issue about clk_get function call.
your patch adds "bus_ck" to list head "clocks" of plat-samsung/clock.c
and "pix_ck" to list head "clocks" of drivers/clk/clkdev.c and I am
afraid that if some machine(such as s3c24xx, s3c64xx and s5pc1xx) has
CLKDEV_LOOKUP configuration then clk_get() would fail to get clock
object because in this case, clock lookup could be done through list
head "clocks" of driver/clk/clkdev.c.(it's right from
plat-samsung/clock.c) so I think it needs more patch for resolving this
issue also and do you think it's a good way to use only one clock name
"lcd"?... in fact, this might be so.... much slight issue. :)
