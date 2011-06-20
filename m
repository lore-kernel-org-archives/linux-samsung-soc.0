From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Mon, 20 Jun 2011 23:51:43 +0200
Message-ID: <4DFFC0EF.4030702@gmail.com>
References: <15716730.35471308554086138.JavaMail.weblogic@epv6ml04> <4DFF1C5A.4080207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:38700 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755099Ab1FTVvv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 17:51:51 -0400
Received: by eyx24 with SMTP id 24so694883eyx.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 14:51:50 -0700 (PDT)
In-Reply-To: <4DFF1C5A.4080207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: daeinki <inki.dae@samsung.com>
Cc: jg1.han@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

On 06/20/2011 12:09 PM, daeinki wrote:
> when someone adds new board file with new SoC, he doesn't need to know
> this SoC chip has hclk and sclk_fimd or only sclk_fimd(such as exynos4).
> using implicit clock means it should know that this SoC chip has both
> clocks(bus clock, sclk_fimd) or only sclk_fimd.

AFAICS at least two clock sources are connected to LCD controller on
each SoC supported by s3c-fb: a bus and dedicated video reference clock.
There is a mux inside the device to switch between them for video reference
clock in all but most recent SoCs. The driver is already (will be) aware
that the mux control bit disappeared in some IP variant and it must split
functionality between two clock sources.

> 
> for example, if any driver needs fimd clock frequency then this driver
> should know that this SoC chip is exynos4 or not and has both clock
> source(bus clock, soure clock fimd) or not(only source clock fimd)
> so I think we shoule see only a clock "lcd" regardless of which clock is
> used and if exynos4 then sclk_fimd would be set by machine code.

I wouldn't make the driver this dumb. It must already handle relatively
large differences across the IPs.
