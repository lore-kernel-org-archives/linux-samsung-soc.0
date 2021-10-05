Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8A8C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:07:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E845761507
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhJEMJa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 08:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbhJEMJ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 08:09:28 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF34C06174E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 05:07:37 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id 66so7079560vsd.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NMod5kv6mgBP+Lyuh+sVjFWXXjpByRzbJbxi4k3EgsI=;
        b=dKw9bQhzayOGjFRE3NoOdUQWH6uCbVW9FfwtlS53KSymDvI19CKdfrKmX4kio/TAU3
         0Jn5zcm9ITLezTMjCY2YQTAceLs8c56SZI+78Kub+aBf9DKi3Nt1doq4P9JblkI+hFGz
         pD8HBW34/F8SanhmG42y2fvoUu/6vjVDcQp2GZLaYh8avPeeXo9VgiPa7jVn6kMBsWd9
         doCLBRX4X4bZeG1E7J1yT0saKVyTFjN1i165ZKVdyySLsB1iNUaVpwrKPhUQdnszS4gM
         hN8JpbHN7UxS2XE9SceLySXOouV4JQf93DgjMpdy9L290wcId5KJ9ob5cQanl36JWBJo
         U19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMod5kv6mgBP+Lyuh+sVjFWXXjpByRzbJbxi4k3EgsI=;
        b=VGvZoYTZWXVGNU8RLWEnvbt8Qeue7rsEYJjDDThvznEGEERr5FZIgTJ+HQt6iAgm8C
         LflU7633hlS3vZwb3ZBiKMFFx9WLV8Q8GdQLeLY+a1psncyb3rgreI86GB1BMftOql8S
         5rTuPGVOPmJ8Kx230s7t9tFf9Ey+9U8v0Q4uf+tY1PXDqlq8QMMv6urKYyCExmYe0Par
         XdQPx/LwgHBm9YoDftMyFQoU2JYWQO8F9pVkHR2RyPp0Z0GxxqaVH3zhU+ZlESTXBJce
         65r9q5Ua7cKtD2bpxLZerKUgnPg+XSWcL6DQEiLqfng+x/Gtd2PqGv01p+y2SygcTq5P
         bz8g==
X-Gm-Message-State: AOAM530V0dy8jAaIROstPf+P46boAHLbbUqCy/Pvlwonwdr9mG60CT8Z
        DmgcwHLBh0TJXqDdqkJsvpss6CwJkdeNB7jTAQfK7A==
X-Google-Smtp-Source: ABdhPJynizbQFCeZG9BwAOTaCKB+w3D26HKETWiOzcDEcyyn503ncEKZty/6FmuTlm97gQ7yAvJmmpNAZBJh/8IDf/E=
X-Received: by 2002:a67:1781:: with SMTP id 123mr17925487vsx.1.1633435656646;
 Tue, 05 Oct 2021 05:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com> <20210919093114.35987-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210919093114.35987-3-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 15:07:25 +0300
Message-ID: <CAPLW+4mf4cYEJHTuVoibVU8Wcr_2w5opJ3Jmc+a7HXnzDbo8Zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: samsung: exynos-chipid: convert to a module
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 19 Sept 2021 at 12:31, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Exynos ChipID and ASV (Adaptive Supply Voltage) driver is not essential
> to system boot and it can successfully be built and loaded as module.
>
> This makes core kernel image smaller and reduces the memory footprint
> when multi-platform kernel is booted on non-Exynos board.  Usually it is
> also distro-friendly.
>
> Add multiple authors of the driver since its conversion from
> mach-exynos, ordered alphabetically by first name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/soc/samsung/Kconfig          |  3 ++-
>  drivers/soc/samsung/Makefile         |  3 ++-
>  drivers/soc/samsung/exynos-chipid.c  | 11 ++++++++++-
>  drivers/soc/samsung/exynos5422-asv.c |  1 +
>  4 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index 1f643c0f5c93..fe139f26d093 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -13,13 +13,14 @@ config EXYNOS_ASV_ARM
>         depends on EXYNOS_CHIPID
>
>  config EXYNOS_CHIPID
> -       bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
> +       tristate "Exynos ChipID controller and ASV driver" if COMPILE_TEST
>         depends on ARCH_EXYNOS || COMPILE_TEST
>         select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
>         select MFD_SYSCON
>         select SOC_BUS
>         help
>           Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
> +         This driver can also be built as module (exynos_chipid).
>
>  config EXYNOS_PMU
>         bool "Exynos PMU controller driver" if COMPILE_TEST
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 0c523a8de4eb..2ae4bea804cf 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -1,8 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  obj-$(CONFIG_EXYNOS_ASV_ARM)   += exynos5422-asv.o
> +obj-$(CONFIG_EXYNOS_CHIPID)    += exynos_chipid.o
> +exynos_chipid-y                        += exynos-chipid.o exynos-asv.o
>
> -obj-$(CONFIG_EXYNOS_CHIPID)    += exynos-chipid.o exynos-asv.o
>  obj-$(CONFIG_EXYNOS_PMU)       += exynos-pmu.o
>
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)   += exynos3250-pmu.o exynos4-pmu.o \
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index dcd9a08ce706..b2627a3a127a 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -128,6 +129,7 @@ static const struct of_device_id exynos_chipid_of_device_ids[] = {
>         { .compatible = "samsung,exynos4210-chipid" },
>         {}
>  };
> +MODULE_DEVICE_TABLE(of, exynos_chipid_of_device_ids);
>
>  static struct platform_driver exynos_chipid_driver = {
>         .driver = {
> @@ -137,4 +139,11 @@ static struct platform_driver exynos_chipid_driver = {
>         .probe  = exynos_chipid_probe,
>         .remove = exynos_chipid_remove,
>  };
> -builtin_platform_driver(exynos_chipid_driver);
> +module_platform_driver(exynos_chipid_driver);
> +
> +MODULE_DESCRIPTION("Samsung Exynos ChipID controller and ASV driver");
> +MODULE_AUTHOR("Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>");
> +MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>");
> +MODULE_AUTHOR("Pankaj Dubey <pankaj.dubey@samsung.com>");
> +MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/samsung/exynos5422-asv.c b/drivers/soc/samsung/exynos5422-asv.c
> index ca409a976e34..475ae5276529 100644
> --- a/drivers/soc/samsung/exynos5422-asv.c
> +++ b/drivers/soc/samsung/exynos5422-asv.c
> @@ -503,3 +503,4 @@ int exynos5422_asv_init(struct exynos_asv *asv)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(exynos5422_asv_init);
> --
> 2.30.2
>
