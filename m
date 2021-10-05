Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A892C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CA5361502
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbhJEMMi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 08:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbhJEMMh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 08:12:37 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38964C061749
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 05:10:47 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id f2so22485244vsj.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+FpzWH2ZIdZS8P9itXj17dRdXa9ruIevTcz0+5q7b4=;
        b=aEQ2lypF9WQGoGPdcJLUpnDkTaoqHtURxtHwBWjypLxQS8mzf1Yhik2f1k4oyyevB+
         v5JWYANFC7eDUs2ckJJj+NPbd6QMWEmrQXkJ1R7I1U1/q5IjAxzXMuVLB4wkZXQ3ad27
         h3RiUotm3GY8rlULHtMoBV24PMHZGcA3nCAAd7b5zurKu+MCtR0RfEE90U1PODP6QwIJ
         GVcGhoG9UnAjRZrdu636fj3X49dKe94ShjN4rdcakPLQrDPU6Bcyae2uI4hkNkVkbSLc
         ZnIWqtI3yOPnGq17eny2S1CdLo8I8MJSIuyVoC3jgKRXZjPWCpxD9kwiIA6QzdYgEzEJ
         G2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+FpzWH2ZIdZS8P9itXj17dRdXa9ruIevTcz0+5q7b4=;
        b=Sk6jChho5OlgEBj4mDRKXATE6gzMRU1UdWyzhgp4Te447wZBfCHd/Gj6HcqpE3FhMZ
         n1RpFRo2TKGB7rxQ6Sul+9V/Uv26EKpccWBmNfybBBBz8Ocojvhr82JZy7Yd3vDNeJKJ
         lCaDIZR8lbohbnVOWKLBnKUWu2nl2bC/OaVzoFTI/4UVP9++hilSOG2juonzEKZyHOiZ
         eB7rz4q3DZVcjaCT0N09hNsP8vAYA/47n0g3M6uKDcK6p5bQe+J3apf6BakRlk5bXqlN
         EMTNvFCR2g8l6JnkT0dVQ0j8FiBKAmSwCXhGZyzwIJdkkPNEu1TD3i4IYgNzcpmwf0cP
         zqZw==
X-Gm-Message-State: AOAM5300KlwpMV9dJPmwpElX1QIjXpiBsWnjz23OPtqJims32ViSsvGX
        LlmivbdyHCeot1dphIimJA00PYp8JjuatAaMkAlHnA==
X-Google-Smtp-Source: ABdhPJwQPm67yxGJ4FtMJNzBWUpDBn/qkdjLiKqVJgWGXq0/bbGz9rz8oI9e2wECpt3qr8rlikCAs/B7DNWrOT5XQuM=
X-Received: by 2002:a67:1781:: with SMTP id 123mr17945675vsx.1.1633435846315;
 Tue, 05 Oct 2021 05:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com> <20210919093114.35987-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210919093114.35987-4-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 15:10:34 +0300
Message-ID: <CAPLW+4=0K-BLGSR2O05OmRNaLuHaYandZBBUTRYm6-JnBT7QrA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] soc: samsung: exynos-chipid: do not enforce built-in
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
> After converting the Exynos ChipID and ASV driver to a module, allow to
> actually choose it to be a module, while being a default built-in.  The
> side effect is that driver could be now entirely disabled even for
> kernel with ARCH_EXYNOS, but this is not a critical issue because driver
> is not necessary for the proper platform boot.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm/mach-exynos/Kconfig | 1 -
>  drivers/soc/samsung/Kconfig  | 3 ++-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 5a48abac6af4..30f930e20599 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -13,7 +13,6 @@ menuconfig ARCH_EXYNOS
>         select ARM_GIC
>         select EXYNOS_IRQ_COMBINER
>         select COMMON_CLK_SAMSUNG
> -       select EXYNOS_CHIPID
>         select EXYNOS_THERMAL
>         select EXYNOS_PMU
>         select EXYNOS_SROM
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index fe139f26d093..e2cedef1e8d1 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -13,8 +13,9 @@ config EXYNOS_ASV_ARM
>         depends on EXYNOS_CHIPID
>
>  config EXYNOS_CHIPID
> -       tristate "Exynos ChipID controller and ASV driver" if COMPILE_TEST
> +       tristate "Exynos ChipID controller and ASV driver"
>         depends on ARCH_EXYNOS || COMPILE_TEST
> +       default ARCH_EXYNOS
>         select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
>         select MFD_SYSCON
>         select SOC_BUS
> --
> 2.30.2
>
