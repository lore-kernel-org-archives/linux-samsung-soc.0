From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Mon, 15 Jul 2013 17:22:09 +0530
Message-ID: <CAK9yfHyEaysTJ9QpWWxxOacQEP4wv1NX3sXKkvKFhMbBgbCYYg@mail.gmail.com>
References: <1372054438-15693-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:59752 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755899Ab3GOLwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 07:52:10 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so15567467oah.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jul 2013 04:52:09 -0700 (PDT)
In-Reply-To: <1372054438-15693-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 24 June 2013 11:43, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> With the recent cleanup in Exynos platform code notably commits
> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs like
> Exynos4412 which have more (285) than the default number of GPIOs (255).
> Thus define this number in Kconfig file. Without this patch we get the
> following errors during boot:
>
> gpiochip_add: gpios 251..258 (gpv0) failed to register
> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
> error code: -22
> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
> Based on Kukjin's for-next tree.
> ---
>  arch/arm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ddf2667..380a53b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1578,6 +1578,7 @@ config ARCH_NR_GPIO
>         default 512 if SOC_OMAP5
>         default 392 if ARCH_U8500
>         default 352 if ARCH_VT8500
> +       default 288 if ARCH_EXYNOS
>         default 288 if ARCH_SUNXI
>         default 264 if MACH_H4700
>         default 0
> --
> 1.7.9.5
>

Kukjin,

Now that 3.11-rc1 is out, can you please queue this up for 3.11-rc2 as
without this patch
gpio support on 4412 boards is broken.


-- 
With warm regards,
Sachin
