From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH] ARM: exynos: Allow wake-up using GIC interrupts
Date: Mon, 16 Dec 2013 17:30:48 +0530
Message-ID: <CAM4voakHDrEOyxVJ4bhUwjU3vwUHYfzkVonen3D5-g0287DfbA@mail.gmail.com>
References: <1381855370-7500-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:62176 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753285Ab3LPMAs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 07:00:48 -0500
Received: by mail-qc0-f169.google.com with SMTP id r5so3611891qcx.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2013 04:00:48 -0800 (PST)
In-Reply-To: <1381855370-7500-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On Tue, Oct 15, 2013 at 10:12 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch restores the ability to receive wake-up events from internal
> GIC interrupts, e.g. RTC tick or alarm interrupts.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/pm-core.h |  1 -
>  arch/arm/mach-exynos/pm.c                   | 55 +++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletion(-)
>

I don't see this patch in kgene's tree or linux-next. Was this handled
some other way ? I have been testing s2r with this patch on exynos5250
and it works fine.

> diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
> index 2b00833..be112ce 100644
> --- a/arch/arm/mach-exynos/include/mach/pm-core.h
> +++ b/arch/arm/mach-exynos/include/mach/pm-core.h
> @@ -66,7 +66,6 @@ static inline void samsung_pm_saved_gpios(void)
>
>  /* Compatibility definitions to make plat-samsung/pm.c compile */
>  #define IRQ_EINT_BIT(x)                1
> -#define s3c_irqwake_intallow   0
>  #define s3c_irqwake_eintallow  0
>
>  #endif /* __ASM_ARCH_PM_CORE_H */
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index c679db5..1f24e7f 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -212,14 +212,69 @@ static struct subsys_interface exynos_pm_interface = {
>         .add_dev        = exynos_pm_add,
>  };
>
> +struct exynos_wkup_irq {
> +       unsigned int hwirq;
> +       u32 mask;
> +};
> +
> +static const struct exynos_wkup_irq exynos4_wkup_irq[] = {
> +       { 76, BIT(1) }, /* RTC alarm */
> +       { 77, BIT(2) }, /* RTC tick */
> +       { /* sentinel */ },
> +};
> +
> +static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
> +       { 75, BIT(1) }, /* RTC alarm */
> +       { 76, BIT(2) }, /* RTC tick */
> +       { /* sentinel */ },
> +};
> +
> +unsigned long s3c_irqwake_intallow;
> +
> +int s3c_irq_wake(struct irq_data *data, unsigned int state)
> +{
> +       const struct exynos_wkup_irq *wkup_irq;
> +
> +       if (soc_is_exynos5250())
> +               wkup_irq = exynos5250_wkup_irq;
> +       else
> +               wkup_irq = exynos4_wkup_irq;
> +
> +       while (wkup_irq->mask) {
> +               if (wkup_irq->hwirq == data->hwirq) {
> +                       if (!state)
> +                               s3c_irqwake_intmask |= wkup_irq->mask;
> +                       else
> +                               s3c_irqwake_intmask &= ~wkup_irq->mask;
> +                       return 0;
> +               }
> +               ++wkup_irq;
> +       }
> +
> +       return -ENOENT;
> +}
> +
>  static __init int exynos_pm_drvinit(void)
>  {
> +       const struct exynos_wkup_irq *wkup_irq;
>         struct clk *pll_base;
>         unsigned int tmp;
>
>         if (soc_is_exynos5440())
>                 return 0;
>
> +       if (soc_is_exynos5250())
> +               wkup_irq = exynos5250_wkup_irq;
> +       else
> +               wkup_irq = exynos4_wkup_irq;
> +
> +       while (wkup_irq->mask) {
> +               s3c_irqwake_intallow |= wkup_irq->mask;
> +               ++wkup_irq;
> +       }
> +
> +       gic_arch_extn.irq_set_wake = s3c_irq_wake;
> +
>         s3c_pm_init();
>
>         /* All wakeup disable */
> --
> 1.8.3.2

Regards,
Abhilash
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
