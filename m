Return-Path: <SRS0=ZUuD=YI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A43C10F14
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Oct 2019 14:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5041214AE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Oct 2019 14:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haOGaYC/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732385AbfJOONd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Oct 2019 10:13:33 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42004 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732364AbfJOONd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 10:13:33 -0400
Received: by mail-vs1-f68.google.com with SMTP id m22so13222570vsl.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2019 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhnnS+fONegzJKouW6TGJYBzAX4jJpOzISUMhIfFdCE=;
        b=haOGaYC/1KpBT/vZYB+zjBwPW0pfiZ9pk+jzE6qpTtML9GwFS2Ys1CErgD5FIvPiB+
         X0ToEA3MXJvRPHR9pr3mqn44Qeg1eiBHtuWFLadTcT838sJ27Bdf2bXC4JFczewUcDwk
         /Dc/CxazPnZRkv8scafnNFeJ6raAwhqzfwh40y+ueE186kUodVfkPFgQ8vQ5+KYF2z/+
         J5zhBocRy6yw1MxIaA4QWZDuIdwQ+ySN//DZYJewJpFVJO7Iak1lO3oRZq2PikbPV/07
         TFqzaYgK9VHbCEHSto/sb5hkTXvjqWzsds595DHF0kyv2w3YPBVzQrUCaGfOLUvmYlcQ
         Qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhnnS+fONegzJKouW6TGJYBzAX4jJpOzISUMhIfFdCE=;
        b=Yy3f9PqhUEcof0iYvI+nen1cHD9OU7AkAaTECeKArxd/tT355S354qvqsc+iVxjHXm
         pq6rQ17VSQk3iVFR8lr5b2PXSPkOXtWYl+rJr3TiFR8kPjNqI3FHBbnijWGvi2EU+AgZ
         SsDXEZdLenUHL3pZ9cb5EGhys9OIaz5LqIlrp0r+LXvZAUW6aQrAlvQodD4sCo/EYeRR
         JzcZ6W0CQ/JseuUh1q4bmy0+DTWftLe0F90I18B6kutmj+1hygXxJKMetzWCMpWCQbwG
         OXUfm8+APXe5TFD1CedrQhdmhV3lN48GBzJz5kPjazZN+Rt/Ps8HCC3rR6ksBtzNW33c
         ULIw==
X-Gm-Message-State: APjAAAXbvgmvgJI8sVTMo+FGC4wnRf/Lx+fkpjOsXgoCHC7n8kOiX0Uo
        QTSIx12SfEqfHFcX63njRz0gkQWTp/ZCA/v6GjRBNQ==
X-Google-Smtp-Source: APXvYqzA32Mk0LaXO6v1xRVVKG/ySz/eTgRyhMT2tMHZp7seOXpAOAcCIYGvFFlIHW1pgcDj3L8ihVXHbmmd+HuPNOA=
X-Received: by 2002:a67:ef89:: with SMTP id r9mr20863437vsp.200.1571148811398;
 Tue, 15 Oct 2019 07:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de> <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-8-arnd@arndb.de>
In-Reply-To: <20191010203043.1241612-8-arnd@arndb.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 15 Oct 2019 16:12:55 +0200
Message-ID: <CAPDyKFquppMx=hpPkwU65DbW_XGgm0oww+zOS2Z-OVE6Kr0xxA@mail.gmail.com>
Subject: Re: [PATCH 08/36] ARM: exynos: stop selecting PLAT_SAMSUNG
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Oct 2019 at 22:34, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Now that no code in arch/arm is shared between mach-exynos and the
> others, make the split formal.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig.debug        | 8 ++++----
>  arch/arm/Makefile             | 1 -
>  arch/arm/mach-exynos/Makefile | 4 ----
>  arch/arm/plat-samsung/Kconfig | 4 ++--
>  drivers/mmc/host/Kconfig      | 2 +-

For the mmc part:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


>  5 files changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index d05b836dfeb2..9c4f2d6deb06 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -998,7 +998,7 @@ choice
>                   via SCIFA4 on Renesas SH-Mobile AG5 (SH73A0).
>
>         config DEBUG_S3C_UART0
> -               depends on PLAT_SAMSUNG
> +               depends on PLAT_SAMSUNG || ARCH_EXYNOS
>                 select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>                 select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>                 select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1010,7 +1010,7 @@ choice
>                   by the boot-loader before use.
>
>         config DEBUG_S3C_UART1
> -               depends on PLAT_SAMSUNG
> +               depends on PLAT_SAMSUNG || ARCH_EXYNOS
>                 select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>                 select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>                 select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1022,7 +1022,7 @@ choice
>                   by the boot-loader before use.
>
>         config DEBUG_S3C_UART2
> -               depends on PLAT_SAMSUNG
> +               depends on PLAT_SAMSUNG || ARCH_EXYNOS
>                 select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>                 select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>                 select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1034,7 +1034,7 @@ choice
>                   by the boot-loader before use.
>
>         config DEBUG_S3C_UART3
> -               depends on PLAT_SAMSUNG && (ARCH_EXYNOS || ARCH_S5PV210)
> +               depends on ARCH_EXYNOS || ARCH_S5PV210
>                 select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>                 select DEBUG_S3C64XX_UART if ARCH_S3C64XX
>                 select DEBUG_S5PV210_UART if ARCH_S5PV210
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db857d07114f..f492d7c338fe 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -233,7 +233,6 @@ machine-$(CONFIG_PLAT_SPEAR)                += spear
>
>  # Platform directory name.  This list is sorted alphanumerically
>  # by CONFIG_* macro name.
> -plat-$(CONFIG_ARCH_EXYNOS)     += samsung
>  plat-$(CONFIG_ARCH_OMAP)       += omap
>  plat-$(CONFIG_ARCH_S3C64XX)    += samsung
>  plat-$(CONFIG_ARCH_S5PV210)    += samsung
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 0fd3fcf8bfb0..53fa363c8e44 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -3,10 +3,6 @@
>  # Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
>  #              http://www.samsung.com/
>
> -ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/$(src)/include -I$(srctree)/arch/arm/plat-samsung/include
> -
> -# Core
> -
>  obj-$(CONFIG_ARCH_EXYNOS)      += exynos.o exynos-smc.o firmware.o
>
>  obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm.o sleep.o
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 832ab0e6cd72..e31a156a27df 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -4,7 +4,7 @@
>
>  config PLAT_SAMSUNG
>         bool
> -       depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_EXYNOS || ARCH_S5PV210
> +       depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
>         default y
>         select GENERIC_IRQ_CHIP
>         select NO_IOPORT_MAP
> @@ -240,7 +240,7 @@ config SAMSUNG_PM_DEBUG
>         bool "Samsung PM Suspend debug"
>         depends on PM && DEBUG_KERNEL
>         depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
> -       depends on DEBUG_EXYNOS_UART || DEBUG_S3C24XX_UART || DEBUG_S3C2410_UART
> +       depends on DEBUG_S3C24XX_UART || DEBUG_S3C2410_UART
>         help
>           Say Y here if you want verbose debugging from the PM Suspend and
>           Resume code. See <file:Documentation/arm/samsung-s3c24xx/suspend.rst>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 49ea02c467bf..400a581c918c 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -275,7 +275,7 @@ config MMC_SDHCI_TEGRA
>
>  config MMC_SDHCI_S3C
>         tristate "SDHCI support on Samsung S3C SoC"
> -       depends on MMC_SDHCI && PLAT_SAMSUNG
> +       depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_EXYNOS)
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           often referrered to as the HSMMC block in some of the Samsung S3C
> --
> 2.20.0
>
