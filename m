From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: RE: [PATCH v2] ARM: Exynos: JPEG board definition and device register
Date: Wed, 01 Feb 2012 11:27:00 +0100
Message-ID: <000001cce0cc$08258a90$18709fb0$%p@samsung.com>
References: <1328005243-6072-1-git-send-email-andrzej.p@samsung.com>
 <4F2902C0.5020805@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31544 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753277Ab2BAK1G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 05:27:06 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYP00MTLMD3ZR@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 10:27:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYP00D6WMD31X@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 10:27:03 +0000 (GMT)
In-reply-to: <4F2902C0.5020805@linaro.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Tushar,

On Wednesday, February 01, 2012 10:16 AM Tushar Behera wrote:

> 
> On 01/31/2012 03:50 PM, Andrzej Pietrasiewicz wrote:
> > Add JPEG board definition and device register
> >
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > Dear All,
> >
> > This patch adds board definition code and device registration code
> > for JPEG IP found in Exynos4 SoC.
> >
> > It is exactly the same as the previous patch but with better coding
> style
> > compliance.
> >
> >  arch/arm/mach-exynos/Kconfig               |    2 ++
> >  arch/arm/mach-exynos/clock.c               |    5 +++++
> >  arch/arm/mach-exynos/include/mach/map.h    |    3 +++
> >  arch/arm/mach-exynos/mach-nuri.c           |    2 ++
> >  arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
> >  arch/arm/plat-s5p/Kconfig                  |    5 +++++
> >  arch/arm/plat-samsung/devs.c               |   26
> ++++++++++++++++++++++++++
> >  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
> >  8 files changed, 46 insertions(+), 0 deletions(-)
> >
> [snip]
> >
> > +#ifdef CONFIG_S5P_DEV_JPEG
> > +static struct resource s5p_jpeg_resource[] = {
> > +	[0] = {
> > +		.start	= S5P_PA_JPEG,
> > +		.end	= S5P_PA_JPEG + SZ_4K - 1,
> > +		.flags	= IORESOURCE_MEM,
> > +	},
> > +	[1] = {
> > +		.start	= IRQ_JPEG,
> > +		.end	= IRQ_JPEG,
> > +		.flags	= IORESOURCE_IRQ,
> > +	},
> > +};
> 
> Should be using DEFINE_RES_MEM and DEFINE_RES_IRQ.
>
Thank you for pointing this out. I will fix it.
 
> Also, wouldn't be a good idea to split this patch into 2 different
> patches for platform-specific and board-specific changes?
> 
I think I will split it into 3 patches: platform-specific and
2 board-specific (universal, nuri).

Andrzej
