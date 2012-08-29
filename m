From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 1/4] ARM: EXYNOS: Add set_irq_affinity function for combiner_irq
Date: Wed, 29 Aug 2012 16:31:18 +0530
Message-ID: <CAJuYYwRab+BvZhE+vcUGtsrfpxHW_LfhtHGYj3W6eX6TjEFbvA@mail.gmail.com>
References: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
	<1346202897-27306-2-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:55023 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752676Ab2H2LBU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 07:01:20 -0400
Received: by lagy9 with SMTP id y9so417462lag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Aug 2012 04:01:18 -0700 (PDT)
In-Reply-To: <1346202897-27306-2-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, Kyungmin Park <kyungmin.park@samsung.com>

On 29 August 2012 06:44, Chanho Park <chanho61.park@samsung.com> wrote:
> This patch adds set_irq_affinity function for combiner_irq. We need this
> function to enable a arm-pmu because the pmu of exynos has combined type irqs.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c |   30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 4eb39cd..f194bbc 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -405,6 +405,7 @@ struct combiner_chip_data {
>         unsigned int irq_offset;
>         unsigned int irq_mask;
>         void __iomem *base;
> +       unsigned int parent_irq;
>  };
>
>  static struct irq_domain *combiner_irq_domain;
> @@ -461,10 +462,28 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
>         chained_irq_exit(chip, desc);
>  }
>
> +#ifdef CONFIG_SMP
> +static int combiner_set_affinity(struct irq_data *d,
> +                                const struct cpumask *mask_val, bool force)
> +{
> +       struct combiner_chip_data *chip_data = irq_data_get_irq_chip_data(d);
> +       struct irq_chip *chip = irq_get_chip(chip_data->parent_irq);
> +       struct irq_data *data = irq_get_irq_data(chip_data->parent_irq);
> +
> +       if (chip && chip->irq_set_affinity)
> +               return chip->irq_set_affinity(data, mask_val, force);
> +       else
> +               return -EINVAL;
> +}
> +#endif
> +
>  static struct irq_chip combiner_chip = {
> -       .name           = "COMBINER",
> -       .irq_mask       = combiner_mask_irq,
> -       .irq_unmask     = combiner_unmask_irq,
> +       .name                   = "COMBINER",
> +       .irq_mask               = combiner_mask_irq,
> +       .irq_unmask             = combiner_unmask_irq,
> +#ifdef CONFIG_SMP
> +       .irq_set_affinity       = combiner_set_affinity,
> +#endif
>  };
>
>  static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int irq)
> @@ -484,12 +503,13 @@ static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int i
>  }
>
>  static void __init combiner_init_one(unsigned int combiner_nr,
> -                                    void __iomem *base)
> +                                    void __iomem *base, unsigned int irq)
>  {
>         combiner_data[combiner_nr].base = base;
>         combiner_data[combiner_nr].irq_offset = irq_find_mapping(
>                 combiner_irq_domain, combiner_nr * MAX_IRQ_IN_COMBINER);
>         combiner_data[combiner_nr].irq_mask = 0xff << ((combiner_nr % 4) << 3);
> +       combiner_data[combiner_nr].parent_irq = irq;
>
>         /* Disable all interrupts */
>         __raw_writel(combiner_data[combiner_nr].irq_mask,
> @@ -573,12 +593,12 @@ static void __init combiner_init(void __iomem *combiner_base,
>         }
>
>         for (i = 0; i < max_nr; i++) {
> -               combiner_init_one(i, combiner_base + (i >> 2) * 0x10);
>                 irq = IRQ_SPI(i);
>  #ifdef CONFIG_OF
>                 if (np)
>                         irq = irq_of_parse_and_map(np, i);
>  #endif
> +               combiner_init_one(i, combiner_base + (i >> 2) * 0x10, irq);
>                 combiner_cascade_irq(i, irq);
>         }
>  }
> --
> 1.7.9.5
>
