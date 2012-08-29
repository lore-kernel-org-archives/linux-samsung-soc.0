From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 2/4] ARM: EXYNOS: Correct combined IRQs for exynos4412
Date: Wed, 29 Aug 2012 16:39:35 +0530
Message-ID: <CAJuYYwSH19-GmNo7jZyXd9TC4VeKGxVCd=N0Vi4=kUNZPZNx6g@mail.gmail.com>
References: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
	<1346202897-27306-3-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:60121 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752541Ab2H2LJh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 07:09:37 -0400
Received: by lagy9 with SMTP id y9so424372lag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Aug 2012 04:09:35 -0700 (PDT)
In-Reply-To: <1346202897-27306-3-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, Kyungmin Park <kyungmin.park@samsung.com>

On 29 August 2012 06:44, Chanho Park <chanho61.park@samsung.com> wrote:
> This patch corrects combined IRQs for exynos4412 platform. The exynos4412 has
> four extra combined irq group. Each irq is mapped to IRQ_SPI(xx). Unfortunately,
> extra combined IRQs isn't sequential. So, we need to map the irq manually.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c            |   31 ++++++++++++++++++++++++------
>  arch/arm/mach-exynos/include/mach/irqs.h |    2 +-
>  2 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index f194bbc..be61564 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -560,23 +560,39 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
>         .map    = combiner_irq_domain_map,
>  };
>
> +static unsigned int get_combiner_extra_irq(int group)
> +{
> +       switch (group) {
> +       case 16:
> +               return IRQ_SPI(107);
> +       case 17:
> +               return IRQ_SPI(108);
> +       case 18:
> +               return IRQ_SPI(48);
> +       case 19:
> +               return IRQ_SPI(42);
> +       default:
> +               return 0;
> +       }
> +}
> +
>  static void __init combiner_init(void __iomem *combiner_base,
>                                  struct device_node *np)
>  {
>         int i, irq, irq_base;
>         unsigned int max_nr, nr_irq;
>
> +       max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
> +                                       EXYNOS4_MAX_COMBINER_NR;
> +
>         if (np) {
>                 if (of_property_read_u32(np, "samsung,combiner-nr", &max_nr)) {
>                         pr_warning("%s: number of combiners not specified, "
>                                 "setting default as %d.\n",
> -                               __func__, EXYNOS4_MAX_COMBINER_NR);
> -                       max_nr = EXYNOS4_MAX_COMBINER_NR;
> +                               __func__, max_nr);
>                 }
> -       } else {
> -               max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
> -                                               EXYNOS4_MAX_COMBINER_NR;
>         }
> +
>         nr_irq = max_nr * MAX_IRQ_IN_COMBINER;

Along with this change, this patch should update the default value
"samsung,combiner-nr" binding in device tree binding documentation for
combiner. It should state that is Exynos5 will use 32 and Exynos4 will
use 20 as the default value.

>
>         irq_base = irq_alloc_descs(COMBINER_IRQ(0, 0), 1, nr_irq, 0);
> @@ -593,7 +609,10 @@ static void __init combiner_init(void __iomem *combiner_base,
>         }
>
>         for (i = 0; i < max_nr; i++) {
> -               irq = IRQ_SPI(i);
> +               if (i < 16 || soc_is_exynos5250())
> +                       irq = IRQ_SPI(i);
> +               else
> +                       irq = get_combiner_extra_irq(i);
>  #ifdef CONFIG_OF
>                 if (np)
>                         irq = irq_of_parse_and_map(np, i);
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
> index 35bced6..357ed7f 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -165,7 +165,7 @@
>  #define EXYNOS4_IRQ_FIMD0_VSYNC                COMBINER_IRQ(11, 1)
>  #define EXYNOS4_IRQ_FIMD0_SYSTEM       COMBINER_IRQ(11, 2)
>
> -#define EXYNOS4_MAX_COMBINER_NR                16
> +#define EXYNOS4_MAX_COMBINER_NR                20

Will this not break Exynos4210 which has only 16 combiners? This is
fine in case max-combiner values is listed in dt mode, but in non-dt
mode or if max-combiner is not specified in dt, this will not be
correct.

>
>  #define EXYNOS4_IRQ_GPIO1_NR_GROUPS    16
>  #define EXYNOS4_IRQ_GPIO2_NR_GROUPS    9
> --
> 1.7.9.5
>
