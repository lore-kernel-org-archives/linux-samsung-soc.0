From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Mon, 20 Jun 2011 11:47:44 +0200
Message-ID: <4DFF1740.1030809@samsung.com>
References: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53485 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753275Ab1FTJrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 05:47:48 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LN3009IM1VMCE@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 10:47:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LN300AHO1VLLT@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 10:47:45 +0100 (BST)
In-reply-to: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi JinGoo,

On 06/20/2011 09:14 AM, JinGoo Han wrote:
> Hi, Sylwester Nawrocki.
> I appreciate your review and suggestion.
> 
> Please, refer to the LCD contoller clock table as follows:

ok, thanks for the update. 

>  - s3c2440 uses 's3c2410fb.c', not 's3c-fb.c' since  LCD controller IP is different.
>    However, s3c2443 uses 's3c-fb.c'. So I add s3c2443 to table instead of s3c2440.

Yes, I was aware of that. My bad to put s3c2440 in the table.

>  - s3c6410 has SCLK_LCD, but, clock name is not defined.
>  - Exynos4 does not use name "HCLK".
> 
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
             ^^^^^^^^^^^^^^^^^^^    
In mach-exynos4/clock.c this clock is described as ACLK_133 (lcd)

> 
> s3c2443, s3c6410, s5pc100 and s5pv210 don't use 'sclk_lcd' or 'sclk_fimd'.
> 'lcd' clock is also used to generate the LCD pixel clock.
> 
> My point is that LCD controller clock should be named "lcd" for consistence.

Yes, I agree. After thinking about it a bit more I was going to propose
that too.

> If there is not mux for lcd pixel clock in case of exynos4, "sclk_fimd" will be set
> in machine directory.

OK, you patch for s3c-fb driver looks like a significant improvement comparing
to the original one. But I think we should remove the callback into machine
code.
The driver could just directly be doing clk_get(dev, "sclk_fimd"); If this
succeeds and clksel option is not set in the IP variant then the driver should
treat "sclk_fimd" as pixel clock, i.e. it will set its frequency and enable it.
It should not care about setting the parent for "sclk_fimd", this should
be done before s3c-fb probe is called.

The problem is that I don't know what to do it the bootloader does not set
a parent clock for sclk_fimd.. 
The board code could just get sclk_fimd and set mout_mpll as its parent, like
it's done in your patch:
[PATCH v2 3/5] ARM: EXYNOS4: Add platform device and helper functions for FIMD
(except passing a pointer to the driver).

However there have been objections to put such things in the board code in
the past.
In case of camera clocks we used to have internally a function in the machine
file setting the parent clocks, until bootloader was modified to configure them.


> 
> As you mentioned, I also think that we need to create two clock connection ids
> such as  "bus_ck", "pix_ck" in order to use SCLK_LCD or SCLK_FIMD.
> Moreover, 'lcd' in s5pv210 should be changed to 'fimd' according to s5pv210 datasheet.

Yeah, that makes sense.

> However, it requires many works to convert.

It's a bit laborious. But it's doable.

> 
> So, I think that 'two clock connection ids' patch would be submitted later,
> after committing the patches that I submitted on last Friday.

I agree with that, given that the callback is removed from the platform data
structure.
We need to get ourselves onto path of migration to the device tree and IMHO
adding more callbacks to board code is a step in opposite direction.


Thanks, 
S. 
