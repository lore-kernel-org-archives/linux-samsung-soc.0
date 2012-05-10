From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2] ARM: Exynos4: read initial state of power domain from
 hw registers
Date: Thu, 10 May 2012 14:06:49 +0200
Message-ID: <021301cd2ea5$60d0a360$2271ea20$%szyprowski@samsung.com>
References: <4F7EE249.30002@mvista.com>
 <1334061579-8492-1-git-send-email-m.szyprowski@samsung.com>
 <034001cd2e8c$8ed252e0$ac76f8a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64253 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756492Ab2EJMG5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 08:06:57 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M3T0031J2Z9WD@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 13:06:45 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3T007BJ2ZGOZ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 13:06:53 +0100 (BST)
In-reply-to: <034001cd2e8c$8ed252e0$ac76f8a0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>

Hello,

On Thursday, May 10, 2012 11:09 AM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > Some bootloaders disable unused power domains, so kernel code should
> > read the actual state from the hardware registers instead of assuming
> > that their initial state is 'on'.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-exynos/pm_domains.c |    9 ++++++---
> >  1 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-
> > exynos/pm_domains.c
> > index 13b3068..26fc47d 100644
> > --- a/arch/arm/mach-exynos/pm_domains.c
> > +++ b/arch/arm/mach-exynos/pm_domains.c
> > @@ -151,9 +151,12 @@ static __init int exynos4_pm_init_power_domain(void)
> >  	if (of_have_populated_dt())
> >  		return exynos_pm_dt_parse_domains();
> >
> > -	for (idx = 0; idx < ARRAY_SIZE(exynos4_pm_domains); idx++)
> > -		pm_genpd_init(&exynos4_pm_domains[idx]->pd, NULL,
> > -				exynos4_pm_domains[idx]->is_off);
> > +	for (idx = 0; idx < ARRAY_SIZE(exynos4_pm_domains); idx++) {
> > +		struct exynos_pm_domain *pd = exynos4_pm_domains[idx];
> > +		int on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
> > +
> > +		pm_genpd_init(&pd->pd, NULL, !on);
> > +	}
> >
> >  #ifdef CONFIG_S5P_DEV_FIMD0
> >  	exynos_pm_add_dev_to_genpd(&s5p_device_fimd0, &exynos4_pd_lcd0);
> > --
> > 1.7.1.569.g6f426
> 
> As you said, if bootloader changed some hardware setting which is not
> expected value in kernel, it should be notified to kernel. But for
> pm_domaine->is_off, it should be via DT on EXYNOS now. As you know, the
> functionality has been already implemented on dt.

I really doubt that we need such complex interface to pass the information 
which the driver can simply read from the register...

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
