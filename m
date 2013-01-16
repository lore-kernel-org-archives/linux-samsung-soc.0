From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove wrong I2S0 clock from peril clock
Date: Wed, 16 Jan 2013 10:08:06 +0900
Message-ID: <00fb01cdf385$f116dde0$d34499a0$@samsung.com>
References: <003501cd9d65$9611d060$c2357120$@samsung.com>
 <50F4CDA5.3090904@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22116 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757442Ab3APBII (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 20:08:08 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGP00IPM1SVEY80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Jan 2013 10:08:06 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGP00JNN1TI9O30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Jan 2013 10:08:06 +0900 (KST)
In-reply-to: <50F4CDA5.3090904@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sangbeom Kim' <sbkim73@samsung.com>


On 1/15/2013 12:32 PM, Tushar Behera wrote: 
> On 09/28/2012 04:09 PM, Sangsu Park wrote:
> > Remove I2S0 clock from peril since peril doesn't have I2S0 clock for
EXYNOS4.
> > Audio Subsystem block has I2S0 clk.
> >
> > Signed-off-by: sangsu <sangsu@sangsu-P560.(none)>
> > ---
> >  arch/arm/mach-exynos/clock-exynos4.c |    5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/clock-exynos4.c
> > b/arch/arm/mach-exynos/clock-exynos4.c
> > index 6a45c9a..fa8a134 100644
> > --- a/arch/arm/mach-exynos/clock-exynos4.c
> > +++ b/arch/arm/mach-exynos/clock-exynos4.c
> > @@ -613,11 +613,6 @@ static struct clk exynos4_init_clocks_off[] = {
> >  		.ctrlbit	= (1 << 18),
> >  	}, {
> >  		.name		= "iis",
> > -		.devname	= "samsung-i2s.0",
> > -		.enable		= exynos4_clk_ip_peril_ctrl,
> > -		.ctrlbit	= (1 << 19),
> > -	}, {
> > -		.name		= "iis",
> >  		.devname	= "samsung-i2s.1",
> >  		.enable		= exynos4_clk_ip_peril_ctrl,
> >  		.ctrlbit	= (1 << 20),
> >
> 
> After this clock has been removed, I2S0 registration fails on EXYNOS4
> based boards (clk_get for iis clock fails). The alternate clock from
> Audio subsystem block is missing.
> 
Yes, you're right.
I2S0 clock doesn't belong to peril clock.
Audio Subsystem has its own clock and also I2S0 clock.
That work might be missed. I'll do that work soon.

Thanks.
> --
> Tushar Behera
