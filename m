Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E98C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0512613D5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbhJEMFj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 08:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhJEMFi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 08:05:38 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69679C06174E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 05:03:48 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id g10so5845267vsb.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HqbKX+VNWiRtUH7hwIBdqXVzeWXo/aDW9j/mMe6CT9Q=;
        b=Jxx52nQjwLKwrPqBK5J9SqX3ZpzNBu7vyOyPdeW82CnOQSqmG0hIH1TByL+Leycwup
         XBWkH06NvGKXQQNai223elsh1KL6akW6OCQYempohuiwSEpdxtDVayFwGBAgoCpFRif1
         KjKqA22rrpT32g7m5WSKcOJiUCpUkvH/FT4MYxS3475s4QuVy9xCAJvzfsBkIUDa2Dd8
         IM76MjcI1JX8JJgSgh3vEuFn2Yo2H48DRKjUkzbLvapE4c4LFKX2e41Qc8uc9FZ9zB4c
         Fa2Ml2CwlR6/n3p3aypY6V9b03+KPOb4rrQiNl+nssGzCeGPuvodSU9A9w1t1V9CLsMr
         KI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HqbKX+VNWiRtUH7hwIBdqXVzeWXo/aDW9j/mMe6CT9Q=;
        b=7/y3d4Yaa08FSjgsRcpkBdHi7sfGmybW+wDXnt0xd9PcV5w7ptpy9wfmxxeCKGnaMo
         epSDl12qzknkVjX5UE8hAngMyyU8ew+dUKtNa1Pva22t8A8aDTduA2wXyG/V3Kddvl4n
         D3AtLYNxc3SlvIAhjsE0KWJLImMK/uWhjtG518Zhj46Gox8Rl2y2vIxoCj5jt52nAbqi
         Qu0XliQAjr0QQ3d2cgqgH2nXmp/9OIJYGYY3uq0uhD8yh8Z83wLmRyYoUuffH2kV/mKC
         EwPHObnLs2uUeC2d/R53Qz/2GhV8K6OSV6SfgY0q5ntlIDY+rfTrmjAHtV+8/G+j/VhJ
         tomQ==
X-Gm-Message-State: AOAM530YkIg/SVt8iL4DMeb3qWQK7BFyqlb6uG8qmWLdhwNr1lTm71++
        y2J2yzjM9L5TkHREDberU0ltvc6H9HZDkVbzGpWadg==
X-Google-Smtp-Source: ABdhPJza1u3lC+ZNbsp5i9/gcvrItb0CCbFgI4/IPF66MKhw0dUbPR0x2t27G0thTcZVDx5m2/P9sFyOeuf5o6HYyDY=
X-Received: by 2002:a67:d289:: with SMTP id z9mr8927314vsi.39.1633435427435;
 Tue, 05 Oct 2021 05:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com> <20210917175134.252882-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210917175134.252882-3-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 15:03:35 +0300
Message-ID: <CAPLW+4mweQxF38hZZQHQR6JXpoMfQyu2AUX+r8xFvN_vj=ALGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: samsung: exynos-chipid: convert to a module
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
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

On Fri, 17 Sept 2021 at 20:51, Krzysztof Kozlowski
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
> index 5c1d0f97f766..5e8c957231ff 100644
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
> @@ -129,6 +130,7 @@ static const struct of_device_id exynos_chipid_of_device_ids[] = {
>         { .compatible = "samsung,exynos4210-chipid" },
>         {}
>  };
> +MODULE_DEVICE_TABLE(of, exynos_chipid_of_device_ids);
>
>  static struct platform_driver exynos_chipid_driver = {
>         .driver = {
> @@ -138,4 +140,11 @@ static struct platform_driver exynos_chipid_driver = {
>         .probe  = exynos_chipid_probe,
>         .remove = exynos_chipid_remove,
>  };
> -builtin_platform_driver(exynos_chipid_driver);
> +module_platform_driver(exynos_chipid_driver);
> +
> +MODULE_DESCRIPTION("Samsung Exynos ChipID controller and ASV driver");

Just curious, how exactly ASV is related to chip-id driver?

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
