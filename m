From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS5: save CLK_TOP_SRC3 register before
 powergating
Date: Thu, 27 Dec 2012 15:51:20 +0100
Message-ID: <2189333.1zyqbQ2mTY@amdc1227>
References: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
 <1354018957-17752-4-git-send-email-prasanna.ps@samsung.com>
 <CAJuYYwQ7W-1DKbECW1LASVEwXdcZhs09ksx0ppsaphA=YkWeeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15061 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752593Ab2L0OvZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 09:51:25 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP00M6G2LNX1D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 23:51:23 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP009KF2LLVQA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 23:51:23 +0900 (KST)
In-reply-to: <CAJuYYwQ7W-1DKbECW1LASVEwXdcZhs09ksx0ppsaphA=YkWeeQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Prasanna Kumar <prasanna.ps@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Thomas,

On Tuesday 04 of December 2012 14:29:24 Thomas Abraham wrote:
> On 27 November 2012 17:52, Prasanna Kumar <prasanna.ps@samsung.com> 
wrote:
> > From: Prasanna Kumar <prasanna.ps@samsung.com>
> > 
> > This patch adds a software workaround to the hardware
> > problem found in exynos5 while powergating.
> > 
> > It is observed that CLK_TOP_SRC3 register gets modified if
> > the G-Scaler/MFC devices are power gated. The clock for G-Scaler gets
> > set to XXTI which results in the device running very slow .
> > A big drop in performance is noticed whilerunning the video.
> > This issue also occurs while powergating MFC.
> > 
> > The value of clock source register is restored once the powergating
> > operation is completed.
> > 
> > Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> > ---
> > 
> >  arch/arm/mach-exynos/pm_domains.c |   27 +++++++++++++++++++++++++++
> >  1 files changed, 27 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/mach-exynos/pm_domains.c
> > b/arch/arm/mach-exynos/pm_domains.c index 9f1351d..955cbe3 100644
> > --- a/arch/arm/mach-exynos/pm_domains.c
> > +++ b/arch/arm/mach-exynos/pm_domains.c
> > @@ -24,6 +24,8 @@
> > 
> >  #include <mach/regs-pmu.h>
> >  #include <plat/devs.h>
> > 
> > +#include <mach/regs-clock.h>
> > +#include <plat/cpu.h>
> > 
> >  /*
> >  
> >   * Exynos specific wrapper around the generic power domain
> > 
> > @@ -41,6 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain
> > *domain, bool power_on)> 
> >         void __iomem *base;
> >         u32 timeout, pwr;
> >         char *op;
> > 
> > +       u32 tmp = 0;
> > 
> >         pd = container_of(domain, struct exynos_pm_domain, pd);
> >         base = pd->base;
> > 
> > @@ -48,6 +51,23 @@ static int exynos_pd_power(struct generic_pm_domain
> > *domain, bool power_on)> 
> >         pwr = power_on ? S5P_INT_LOCAL_PWR_EN : 0;
> >         __raw_writel(pwr, base);
> > 
> > +       /*
> > +        *It is found that the CLK SRC register in exynos5
> > +        *gets modified when power domain of gsc/mfc/isp/disp1
> > +        *is powered off.This happens only after the system is
> > +        *suspended and resumed and not before that.
> > +        *The following fix adresses this hardware issue.
> > +        *It saves the value of clock source register and
> > +        *resores it later
> > +        */
> > +
> > +       if (soc_is_exynos5250()) {
> > +               if (!power_on) {
> > +                       /* save clock source register */
> > +                       tmp = __raw_readl(EXYNOS5_CLKSRC_TOP3);
> > +               }
> > +       }
> 
> Does the value of EXYNOS5_CLKSRC_TOP3 register change as soon as the
> G-Scaler/MFC devices are power gated?
> 
> - If yes, the value of CLKSRC register should be saved before the
> power domain register is programmed.
> 
> - If not, as mentioned in the comment, if this issue occurs during a
> suspend-resume cycle, the value of this register can be saved and
> restored in the clock driver code itself.
> 
> The other thing that needs to be relooked into here is the use of
> EXYNOS5_CLKSRC_TOP3 register address. Currently, the clock registers
> are statically io-remapped. With the upcoming migration to common
> clock for Exynos5, the clock registers will not be statically
> io-remapped but instead remapped during clock initialization. So the
> use of EXYNOS5_CLKSRC_TOP3 will not hold and so we need to relook into
> this.
> 
> > +
> > 
> >         /* Wait max 1ms */
> >         timeout = 10;
> > 
> > @@ -61,6 +81,13 @@ static int exynos_pd_power(struct generic_pm_domain
> > *domain, bool power_on)> 
> >                 cpu_relax();
> >                 usleep_range(80, 100);
> >         
> >         }
> > 
> > +
> > +       if (soc_is_exynos5250()) {
> 
> We could use the of_machine_is_compatible api here instead of
> soc_is_exynos5250() macro.

I don't think that of_machine_is_compatible() is preferred over 
soc_is_xxx(). The former has dependencies on OF support and requires
a string comparison, while the latter is just a single integer check.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
