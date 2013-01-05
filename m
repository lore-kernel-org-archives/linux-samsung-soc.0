From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/2] ARM: dts: fix compatible value for exynos pinctrl
Date: Sat, 5 Jan 2013 14:57:54 -0800
Message-ID: <CAOesGMiSgcuD7z4yc2Z+_hi+PZnuv9pa7saeGymwT0DPz=j8dQ@mail.gmail.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
	<1357172423-8217-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:34815 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755899Ab3AEW54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Jan 2013 17:57:56 -0500
Received: by mail-ea0-f182.google.com with SMTP id a14so7458011eaa.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Jan 2013 14:57:55 -0800 (PST)
In-Reply-To: <1357172423-8217-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org

On Wed, Jan 2, 2013 at 4:20 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Fix the incorrect compatible property value of pinctrl for EXYNOS4 SoCs.

Ah, this answers my question from the previous patch. So, why do 5450
as a separate patch?


> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index e97a278..4598a47 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -7,9 +7,9 @@ on-chip controllers onto these pads.
>
>  Required Properties:
>  - compatible: should be one of the following.
> -  - "samsung,pinctrl-exynos4210": for Exynos4210 compatible pin-controller.
> -  - "samsung,pinctrl-exynos4x12": for Exynos4x12 compatible pin-controller.
> -  - "samsung,pinctrl-exynos5250": for Exynos5250 compatible pin-controller.
> +  - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-controller.
> +  - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-controller.
> +  - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-controller.

Do we care about backwards compatibility for ARM device trees yet?
It's becoming time to start caring soon, if we don't. So while this
might be OK for this time around, we should start requiring some
backwards compatibility for bindings that have been used in at least
one released kernel.

Once we do care, then you can update the dts/dtsi files, but you'll
need to keep both the old and the new bindings in the C file below.


> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index d6d0dc6..3777a41 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -1024,8 +1024,8 @@ static int __init exynos_init_irq_eint(void)
>          * interrupt support code here can be completely removed.
>          */
>         static const struct of_device_id exynos_pinctrl_ids[] = {
> -               { .compatible = "samsung,pinctrl-exynos4210", },
> -               { .compatible = "samsung,pinctrl-exynos4x12", },
> +               { .compatible = "samsung,exynos4210-pinctrl", },
> +               { .compatible = "samsung,exynos4x12-pinctrl", },
>         };
>         struct device_node *pctrl_np, *wkup_np;
>         const char *wkup_compat = "samsung,exynos4210-wakeup-eint";
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index cac4b45..8c00f7d 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3024,8 +3024,8 @@ static __init int samsung_gpiolib_init(void)
>         */
>         struct device_node *pctrl_np;
>         static const struct of_device_id exynos_pinctrl_ids[] = {
> -               { .compatible = "samsung,pinctrl-exynos4210", },
> -               { .compatible = "samsung,pinctrl-exynos4x12", },
> +               { .compatible = "samsung,exynos4210-pinctrl", },
> +               { .compatible = "samsung,exynos4x12-pinctrl", },
>                 { .compatible = "samsung,exynos5440-pinctrl", },
>         };
>         for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
> index 864fed8..602b30b 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -945,9 +945,9 @@ static int __devinit samsung_pinctrl_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id samsung_pinctrl_dt_match[] = {
> -       { .compatible = "samsung,pinctrl-exynos4210",
> +       { .compatible = "samsung,exynos4210-pinctrl",
>                 .data = (void *)exynos4210_pin_ctrl },
> -       { .compatible = "samsung,pinctrl-exynos4x12",
> +       { .compatible = "samsung,exynos4x12-pinctrl",
>                 .data = (void *)exynos4x12_pin_ctrl },
>         {},
>  };


-Olof
