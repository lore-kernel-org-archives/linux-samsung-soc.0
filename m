From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Fix EINT wake-up mask configuration when pinctrl is used
Date: Fri, 17 May 2013 21:49:13 +0200
Message-ID: <13970900.6bfa7bMWJL@flatron>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com> <1368807872-2601-3-git-send-email-t.figa@samsung.com> <CAD=FV=UUzB=FwHfzTwRMDDGn3+FkuZPbXG9QL_h07qZgRMkZrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:49173 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852Ab3EQTtQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 15:49:16 -0400
Received: by mail-ee0-f52.google.com with SMTP id c13so2577805eek.25
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 12:49:15 -0700 (PDT)
In-Reply-To: <CAD=FV=UUzB=FwHfzTwRMDDGn3+FkuZPbXG9QL_h07qZgRMkZrw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, s.nawrocki@samsung.com

Hi Doug,

On Friday 17 of May 2013 12:22:36 Doug Anderson wrote:
> Tomasz,
> 
> On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > On DT-enabled systems pinctrl-exynos driver is responsible for
> > handling
> > of wake-up EINT interrupts. This patch adjusts wake-up mask
> > configuration code to take wake-up mask value from pinctrl-exynos
> > driver on DT-enabled systems.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  arch/arm/mach-exynos/include/mach/pm-core.h | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> A little ugly

Hehe. I thought exactly the same, but I don't see any better solution at 
the moment, except persuading the whole suspend/resume support in plat-
samsung to be a friend of multiplatform, which will have to be done 
eventually, but at the moment I don't have time to work on it.

> because of the need to support old non-device tree
> boards, but seems reasonable.  Means that if you have a device tree
> you'd better be using pincontrol.  Assuming that's true now someone
> needs to go through and remove all of the device tree support (and
> bindings Documentation) for gpio-samsung.  Maybe someone has already
> started?

If I remember correctly Sylwester Nawrocki had some patches to remove 
that. He's on a leave right now, so he won't send them for a while, but I 
guess it's nothing urgent.

> On exynos5250-snow (pinmux backported to 3.8):
> 
> Tested-by: Doug Anderson <dianders@chromium.org>
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks.

Best regards,
Tomasz

> On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > On DT-enabled systems pinctrl-exynos driver is responsible for
> > handling
> > of wake-up EINT interrupts. This patch adjusts wake-up mask
> > configuration code to take wake-up mask value from pinctrl-exynos
> > driver on DT-enabled systems.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  arch/arm/mach-exynos/include/mach/pm-core.h | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h
> > b/arch/arm/mach-exynos/include/mach/pm-core.h index 7dbbfec..296090e
> > 100644
> > --- a/arch/arm/mach-exynos/include/mach/pm-core.h
> > +++ b/arch/arm/mach-exynos/include/mach/pm-core.h
> > @@ -18,8 +18,15 @@
> > 
> >  #ifndef __ASM_ARCH_PM_CORE_H
> >  #define __ASM_ARCH_PM_CORE_H __FILE__
> > 
> > +#include <linux/of.h>
> > 
> >  #include <mach/regs-pmu.h>
> > 
> > +#ifdef CONFIG_PINCTRL_EXYNOS
> > +extern u32 exynos_get_eint_wake_mask(void);
> > +#else
> > +static inline u32 exynos_get_eint_wake_mask(void) { return
> > 0xffffffff; } +#endif
> > +
> > 
> >  static inline void s3c_pm_debug_init_uart(void)
> >  {
> >  
> >         /* nothing here yet */
> > 
> > @@ -27,7 +34,12 @@ static inline void s3c_pm_debug_init_uart(void)
> > 
> >  static inline void s3c_pm_arch_prepare_irqs(void)
> >  {
> > 
> > -       __raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MASK);
> > +       u32 eintmask = s3c_irqwake_eintmask;
> > +
> > +       if (of_have_populated_dt())
> > +               eintmask = exynos_get_eint_wake_mask();
> > +
> > +       __raw_writel(eintmask, S5P_EINT_WAKEUP_MASK);
> > 
> >         __raw_writel(s3c_irqwake_intmask & ~(1 << 31),
> >         S5P_WAKEUP_MASK);
> >  
> >  }
> > 
> > --
> > 1.8.2.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
