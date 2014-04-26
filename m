From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCHv4 2/7] ARM: EXYNOS: Support secondary CPU boot of Exynos4212
Date: Sat, 26 Apr 2014 19:49:13 +0900
Message-ID: <0b3601cf613d$29ae93c0$7d0bbb40$@samsung.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
 <1398388572-30239-3-git-send-email-cw00.choi@samsung.com>
 <535B00E5.4060903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <535B00E5.4060903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Chanwoo Choi' <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi,
> 
Hi,

> On 25.04.2014 03:16, Chanwoo Choi wrote:
> > From: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >
> > This patch fix the offset of CPU boot address and change parameter of
> smc call
> > of SMC_CMD_CPU1BOOT command for Exynos4212.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >   arch/arm/mach-exynos/firmware.c | 15 ++++++++++++++-
> >   1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-
> exynos/firmware.c
> > index 932129e..aa01c42 100644
> > --- a/arch/arm/mach-exynos/firmware.c
> > +++ b/arch/arm/mach-exynos/firmware.c
> > @@ -18,6 +18,8 @@
> >
> >   #include <mach/map.h>
> >
> > +#include <plat/cpu.h>
> > +
> >   #include "smc.h"
> >
> >   static int exynos_do_idle(void)
> > @@ -28,13 +30,24 @@ static int exynos_do_idle(void)
> >
> >   static int exynos_cpu_boot(int cpu)
> >   {
> > +	/*
> > +	 * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
> > +	 * But, Exynos4212 has only one secondary CPU so second parameter
> > +	 * isn't used for informing secure firmware about CPU id.
> > +	 */
> > +	if (soc_is_exynos4212())
> > +		cpu = 0;
> > +
> >   	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
> >   	return 0;
> >   }
> >
> >   static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
> >   {
> > -	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
> > +	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
> > +
> > +	if (!soc_is_exynos4212())
> > +		boot_reg += 4*cpu;
> >
> >   	__raw_writel(boot_addr, boot_reg);
> >   	return 0;
> >
> 
> This patch should be applied independently of Exynos3250 support.
> Kukjin, what do you think?
> 
Yes, this should be separated. I will pick this into fixes.

> Anyway,
> 
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
