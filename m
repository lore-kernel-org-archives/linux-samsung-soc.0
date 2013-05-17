From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Fix EINT wake-up mask configuration when
 pinctrl is used
Date: Fri, 17 May 2013 12:22:36 -0700
Message-ID: <CAD=FV=UUzB=FwHfzTwRMDDGn3+FkuZPbXG9QL_h07qZgRMkZrw@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:57570 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753601Ab3EQTWi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 15:22:38 -0400
Received: by mail-lb0-f178.google.com with SMTP id w10so3276483lbi.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 12:22:37 -0700 (PDT)
In-Reply-To: <1368807872-2601-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> On DT-enabled systems pinctrl-exynos driver is responsible for handling
> of wake-up EINT interrupts. This patch adjusts wake-up mask
> configuration code to take wake-up mask value from pinctrl-exynos driver
> on DT-enabled systems.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/pm-core.h | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

A little ugly because of the need to support old non-device tree
boards, but seems reasonable.  Means that if you have a device tree
you'd better be using pincontrol.  Assuming that's true now someone
needs to go through and remove all of the device tree support (and
bindings Documentation) for gpio-samsung.  Maybe someone has already
started?


On exynos5250-snow (pinmux backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>

On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> On DT-enabled systems pinctrl-exynos driver is responsible for handling
> of wake-up EINT interrupts. This patch adjusts wake-up mask
> configuration code to take wake-up mask value from pinctrl-exynos driver
> on DT-enabled systems.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/pm-core.h | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
> index 7dbbfec..296090e 100644
> --- a/arch/arm/mach-exynos/include/mach/pm-core.h
> +++ b/arch/arm/mach-exynos/include/mach/pm-core.h
> @@ -18,8 +18,15 @@
>  #ifndef __ASM_ARCH_PM_CORE_H
>  #define __ASM_ARCH_PM_CORE_H __FILE__
>
> +#include <linux/of.h>
>  #include <mach/regs-pmu.h>
>
> +#ifdef CONFIG_PINCTRL_EXYNOS
> +extern u32 exynos_get_eint_wake_mask(void);
> +#else
> +static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
> +#endif
> +
>  static inline void s3c_pm_debug_init_uart(void)
>  {
>         /* nothing here yet */
> @@ -27,7 +34,12 @@ static inline void s3c_pm_debug_init_uart(void)
>
>  static inline void s3c_pm_arch_prepare_irqs(void)
>  {
> -       __raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MASK);
> +       u32 eintmask = s3c_irqwake_eintmask;
> +
> +       if (of_have_populated_dt())
> +               eintmask = exynos_get_eint_wake_mask();
> +
> +       __raw_writel(eintmask, S5P_EINT_WAKEUP_MASK);
>         __raw_writel(s3c_irqwake_intmask & ~(1 << 31), S5P_WAKEUP_MASK);
>  }
>
> --
> 1.8.2.1
>
