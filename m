From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v3 3/4] ARM: EXYNOS: Enable PMUs for exynos4
Date: Thu, 30 Aug 2012 11:13:44 +0900
Message-ID: <003501cd8655$15317f80$3f947e80$@samsung.com>
References: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
 <1346202897-27306-4-git-send-email-chanho61.park@samsung.com>
 <20120829213405.GC13868@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36611 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754020Ab2H3CM4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 22:12:56 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9J0079EQ4V0AI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 11:12:45 +0900 (KST)
Received: from DOCHANHO61P01 ([10.90.51.44])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9J000X5Q58YCA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 11:12:44 +0900 (KST)
In-reply-to: <20120829213405.GC13868@mudshark.cambridge.arm.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Will Deacon' <will.deacon@arm.com>
Cc: linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, sachin.kamat@linaro.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, kgene.kim@samsung.com, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org

> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-
> kernel-bounces@lists.infradead.org] On Behalf Of Will Deacon
> Sent: Thursday, August 30, 2012 6:34 AM
> To: Chanho Park
> Cc: linux-samsung-soc@vger.kernel.org; linux@arm.linux.org.uk;
> sachin.kamat@linaro.org; Kyungmin Park; kgene.kim@samsung.com;
> thomas.abraham@linaro.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v3 3/4] ARM: EXYNOS: Enable PMUs for exynos4
> 
> On Wed, Aug 29, 2012 at 02:14:56AM +0100, Chanho Park wrote:
> > This patch define irq numbers of ARM performance monitoring unit for
> exynos4.
> > The number of CPU cores and PMU irq numbers are vary according to soc
> types.
> > So we need to identify each soc type using soc_is_xxx function and
> > define the pmu irqs dynamically. In case of exynos4412, there are 4 cpu
> cores and pmus.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-exynos/common.c            |   45
> ++++++++++++++++++++++++++++++
> >  arch/arm/mach-exynos/include/mach/irqs.h |    8 ++++--
> >  arch/arm/plat-samsung/devs.c             |    2 +-
> >  3 files changed, 52 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/common.c
> > b/arch/arm/mach-exynos/common.c index be61564..24b78bd 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -30,11 +30,13 @@
> >  #include <asm/mach/map.h>
> >  #include <asm/mach/irq.h>
> >  #include <asm/cacheflush.h>
> > +#include <asm/pmu.h>
> 
> Why do you need this header file?

Oh, I'll remove  it. Thanks.

> 
> >  #include <mach/regs-irq.h>
> >  #include <mach/regs-pmu.h>
> >  #include <mach/regs-gpio.h>
> >  #include <mach/pmu.h>
> > +#include <mach/irqs.h>
> >
> >  #include <plat/cpu.h>
> >  #include <plat/clock.h>
> > @@ -1056,3 +1058,46 @@ static int __init exynos_init_irq_eint(void)
> >  	return 0;
> >  }
> >  arch_initcall(exynos_init_irq_eint);
> > +
> > +#if defined(CONFIG_CPU_EXYNOS4210) ||
> defined(CONFIG_SOC_EXYNOS4212)
> > +static struct resource exynos42xx_pmu_resource[] = {
> > +	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU),
> > +	DEFINE_RES_IRQ(EXYNOS4_IRQ_PMU_CPU1),
> > +};
> > +
> > +static struct platform_device exynos42xx_device_pmu = {
> > +	.name		= "arm-pmu",
> > +	.num_resources	= ARRAY_SIZE(exynos42xx_pmu_resource),
> > +	.resource	= exynos42xx_pmu_resource,
> > +};
> > +#endif
> 
> Given that you don't pass an id and your device-tree binding is that for
> Cortex A15, I assume this patch series is based on my perf/updates branch?
> 
> That's good because it reduces the potential for conflicts, but you should
> make sure that whoever you send this to is aware of the dependency.

Yes. This patch is based on your latest patchset to avoid conflict because I saw Kukjin had acked your patch.
I think he'll resolve the dependency. If not, I'll re-submit this patch after applied your patch.

Best regards,
Chanho Park

> 
> Cheers,
> 
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
