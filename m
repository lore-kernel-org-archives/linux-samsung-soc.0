From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
Date: Tue, 28 Aug 2012 19:43:30 +0200
Message-ID: <2038010.NUtf96WSJU@flatron>
References: <1422318.SfZfh0XoVo@amdc1227> <503CF014.8010503@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:50959 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab2H1Rnh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 13:43:37 -0400
Received: by wgbdr13 with SMTP id dr13so4833909wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 10:43:35 -0700 (PDT)
In-Reply-To: <503CF014.8010503@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

Thanks for reviewing the patch.

On Tuesday 28 of August 2012 09:21:40 Stephen Boyd wrote:
> On 8/28/2012 4:13 AM, Tomasz Figa wrote:
> > diff --git a/arch/arm/mach-exynos/platsmp.c
> > b/arch/arm/mach-exynos/platsmp.c index 36c3984..1114ced 100644
> > --- a/arch/arm/mach-exynos/platsmp.c
> > +++ b/arch/arm/mach-exynos/platsmp.c
> > @@ -34,8 +34,19 @@
> > 
> >  extern void exynos4_secondary_startup(void);
> > 
> > -#define CPU1_BOOT_REG		(samsung_rev() == EXYNOS4210_REV_1_1 ? \
> > -				S5P_INFORM5 : S5P_VA_SYSRAM)
> > +static inline volatile void *cpu_boot_reg_base(void)
> 
> __iomem?

Sorry, bad habit. I will fix it. 
 
> > +{
> > +	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
> > +		return S5P_INFORM5;
> > +	return S5P_VA_SYSRAM;
> > +}
> > +
> > +static inline volatile void *cpu_boot_reg(int cpu)
> 
> __iomem? And why volatile?

Ditto.

> > +{
> > +	if (soc_is_exynos4412())
> > +		return cpu_boot_reg_base() + 4*cpu;
> > +	return cpu_boot_reg_base();
> > +}
> > 
> >  /*
> >  
> >   * control for which core is the next to come out of the secondary
> > 
> > @@ -195,6 +208,8 @@ void __init platform_smp_prepare_cpus(unsigned int
> > max_cpus)> 
> >  	 * until it receives a soft interrupt, and then the
> >  	 * secondary CPU branches to this address.
> >  	 */
> > 
> > -	__raw_writel(virt_to_phys(exynos4_secondary_startup),
> > -			CPU1_BOOT_REG);
> > +	for (i = 1; i < max_cpus; ++i) {
> > +		__raw_writel(virt_to_phys(exynos4_secondary_startup),
> > +							cpu_boot_reg(i));
> 
> Do you need to use cpu_logical_map()?

Correct me if I am wrong, but physical to logical CPU mapping will not be 
1:1 only if booted on physical CPU other than 0. I have not seen yet an 
Exynos-based board which does it.

However it might be wiser to use cpu_logical_map() just to be safe indeed. 
I will add it in next version of the patch.

--
Best regards,
Tomasz Figa
