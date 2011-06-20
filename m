From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Mon, 20 Jun 2011 22:33:45 +0200
Message-ID: <4DFFAEA9.8060402@gmail.com>
References: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04> <4DFF1C5A.4080207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64078 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752527Ab1FTUdv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 16:33:51 -0400
Received: by eyx24 with SMTP id 24so675080eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 13:33:49 -0700 (PDT)
In-Reply-To: <4DFF1C5A.4080207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: daeinki <inki.dae@samsung.com>
Cc: jg1.han@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi Inki

On 06/20/2011 12:09 PM, daeinki wrote:
> Hi, Mr. Han and Sylwester.
> below is my opinion.
>=20
> JinGoo Han =EC=93=B4 =EA=B8=80:
=2E..
>> Please, refer to the LCD contoller clock table as follows:
>>   - s3c2440 uses 's3c2410fb.c', not 's3c-fb.c' since  LCD controller=
 IP is different.
>>     However, s3c2443 uses 's3c-fb.c'. So I add s3c2443 to table inst=
ead of s3c2440.
>>   - s3c6410 has SCLK_LCD, but, clock name is not defined.
>>   - Exynos4 does not use name "HCLK".
>>
>>            | LCD controller    |                            |
>>            | (IP core) clock   | LCD pixel clock            |
>> ----------+------------------------+-----------------------+
>> s3c2443   |  HCLK (lcd)       | x  |  DISPCLK (display-if) |
>> ----------+------------------------+-----------------------+
>> s3c6410   |  HCLK (lcd)       | x  |  SCLK_LCD  (N/A)      |
>> ----------+------------------------+-----------------------+
>> s5pc100   |  HCLK (lcd)       | x  |  SCLK_LCD  (sclk_lcd) |
>> ----------+------------------------+-----------------------+
>> s5pv210   |  HCLK_DSYS (lcd)  | x  |  SCLK_FIMD (sclk_fimd)|
>> ----------+-----------------------+------------------------+
>> exynos4   |  ACLK_160 (fimd)  | O  |  SCLK_FIMD (sclk_fimd)|
>> ----------+------------------------+-----------------------+
=2E..
>>> I think we could try to create two clock connection ids to the fram=
ebuffer
>>> device in the first place, e.g. "bus_ck", "pix_ck".
>>> And then think about how handle that in the driver.
>>>
>>> But this requires conversion to the omap-style clock registration m=
ethod,
>>> something like in the attached patch. The patch is only for s5pv210=
 and
>>> and compile tested only as I didn't have any board to test it here.
>>> It's based on for-next branch at http://tinyurl.com/6yzravy I think=
 there
>>> might be more issues to convert the old s3c24xx platforms, neverthe=
less
>>> the attached patch should not affect them.
=2E..

> when someone adds new board file with new SoC, he doesn't need to kno=
w
> this SoC chip has hclk and sclk_fimd or only sclk_fimd(such as exynos=
4).
> using implicit clock means it should know that this SoC chip has both
> clocks(bus clock, sclk_fimd) or only sclk_fimd.
>=20
> for example, if any driver needs fimd clock frequency then this drive=
r
> should know that this SoC chip is exynos4 or not and has both clock
> source(bus clock, soure clock fimd) or not(only source clock fimd)
> so I think we shoule see only a clock "lcd" regardless of which clock=
 is
> used and if exynos4 then sclk_fimd would be set by machine code.
>=20
> and Sylwester,
> it appears that your patch has one issue about clk_get function call.
> your patch adds "bus_ck" to list head "clocks" of plat-samsung/clock.=
c

Why do you think so ? In fact the "clocks" list in plat-samsung/clock.c
is not used any more, AFAIU it should have been removed altogether with
clk_get/clk_put functions in Thomas' clkdev patches.=20
When you comment out the line declaring the list everything compiles fi=
ne
there.

> and "pix_ck" to list head "clocks" of drivers/clk/clkdev.c and I am
> afraid that if some machine(such as s3c24xx, s3c64xx and s5pc1xx) has
> CLKDEV_LOOKUP configuration then clk_get() would fail to get clock
> object because in this case, clock lookup could be done through list
> head "clocks" of driver/clk/clkdev.c.(it's right from
> plat-samsung/clock.c) so I think it needs more patch for resolving th=
is

As I indicated earlier the framebuffer driver would have to be modified
to support newly introduced clock _connection_ names.
We could (temporarily) name one of those clock connections "lcd",
to avoid additional trouble on SoCs that still use a one-to-one
platform clock name <-> clock connection id mapping.

> issue also and do you think it's a good way to use only one clock nam=
e
> "lcd"?... in fact, this might be so.... much slight issue. :)

Do you mean using using one name in the code for different clock names
in the datasheets ? I suppose it was because of the API limitations and
hope it will change for the better. :)

Cheers,
Sylwester
