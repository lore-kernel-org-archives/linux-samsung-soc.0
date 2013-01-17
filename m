From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module on EXYNOS5440
Date: Thu, 17 Jan 2013 09:34:53 +0100
Message-ID: <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:48246 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932093Ab3AQIey (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 03:34:54 -0500
Received: by mail-ie0-f181.google.com with SMTP id 16so4337347iea.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 00:34:54 -0800 (PST)
In-Reply-To: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree-discuss@lists.ozlabs.org

On Thu, Jan 3, 2013 at 1:20 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Fix the incorrect compatible property value of pin-controller module
> EXYNOS5440 SoC.
>
(...)
>
>         pinctrl {
> -               compatible = "samsung,pinctrl-exynos5440";
> +               compatible = "samsung,exynos5440-pinctrl";
>                 reg = <0xE0000 0x1000>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index 953737d..cac4b45 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3026,7 +3026,7 @@ static __init int samsung_gpiolib_init(void)
>         static const struct of_device_id exynos_pinctrl_ids[] = {
>                 { .compatible = "samsung,pinctrl-exynos4210", },
>                 { .compatible = "samsung,pinctrl-exynos4x12", },
> -               { .compatible = "samsung,pinctrl-exynos5440", },
> +               { .compatible = "samsung,exynos5440-pinctrl", },
>         };
>         for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
>                 if (pctrl_np && of_device_is_available(pctrl_np))

I am tempted to apply this patch just to annoy people with
obsessive-compulsive disorder (but that's a bit mean).
Reference:
http://izismile.com/2011/08/16/obnoxious_ways_to_drive_people_with_ocd_nuts_16_pics.html

But I'd like a word from Rob, Grant or Stephen so I have some
guidance here.

Yours,
Linus Walleij
