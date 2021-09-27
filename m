Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CEAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 22:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84B80610A2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 22:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237855AbhI0WeP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Sep 2021 18:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237899AbhI0WeO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 18:34:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5475EC061765
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 15:32:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g41so83797404lfv.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 15:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SWtpZ8PO1D/9eZFX8nceZYsmLHQWGmkDYyw8clyIoeQ=;
        b=nsv+9QbYaiqvtpvL0wrJuH7G7mw8h6nMh5mofTyXGGAeKDE8SUGersA+a/Yo3NkFAr
         aniIIzDZ6Jbf0clUsu2XlJdS32IPCPd9V3FHvw5WnG5PidLr41vu5a16BeAd0ww2ZLyh
         RgWN54kjzvAjvFPaejwwXJaYwsdpZqxPr3YBK3CaBn/dylvTLV2OOnsH/w+oaaKIdd7E
         +F2HXqZgxbqkizIt2ZzKQOpzx94qj5/yKPko8l3qUfJ8V4Q6hC8w8RzN8k2uxmCZpxHq
         WhgAGDzMaiMWranShw8/gsrbRLnRvabX3luVEEkOmMZy0v32tnx/xDK3duThElp/r9Zq
         WArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWtpZ8PO1D/9eZFX8nceZYsmLHQWGmkDYyw8clyIoeQ=;
        b=F5MuyFCjvLxHU1TArMLKn90IhNI/Ep/0UxAEWhcYLQFA8ovSbbj0m43Ob+m9DG7aMr
         9YKBgGrcD4co6iyW01ImkkuwiH4FzewGDKwgz7v85bJlQYSf9uSZrzA3caghG7IA/IaS
         yPgdMbSsOloHdGRul+D9aJMJS+gEGCiex0XvLB+kMwDMhbV14ft8Doglp2jF5Oa3yf1m
         2+jbKmB7tlCm8jNxW28Nhi12VGz3SCdOdRrcMe/nZCKxKb+v4vSUaqcqVTRpRfwe3CWm
         12rMr5aiUiuIcwu0ff+l+L+MrAuHLWTnI//W9JYJ4k/8rN7zFaql+R+EQKU5F1luhTIA
         pBKg==
X-Gm-Message-State: AOAM530fI+t46Q6Ivd/ZqdWd2DyVRfbjYlCGYH6cb0043i/TDxrfCfjJ
        Day3rNo8sNc6JRFwvDM1GJJitYCYnNzsDU1s7Y4fKQ==
X-Google-Smtp-Source: ABdhPJyEXb/yQ9/a6K8aBzhJdUYb10ZUYNoy2vlteyYKNJZtPx8j46XiOXQmIJRCjJRs1TQZhUKudUPzSmNoSz+Gk+Y=
X-Received: by 2002:a05:6512:3fa5:: with SMTP id x37mr2271959lfa.233.1632781953710;
 Mon, 27 Sep 2021 15:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210924133257.112017-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210924133257.112017-1-krzysztof.kozlowski@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 Sep 2021 00:31:56 +0200
Message-ID: <CAPDyKFr6tEEm0j7qBrA3dqqEZxF-5+DXrau3TKTK8RRuYeL5yA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-s3c: Describe driver in KConfig
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 24 Sept 2021 at 15:33, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Describe better which driver applies to which SoC, to make configuring
> kernel for Samsung SoC easier.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 71313961cc54..e4c1648e364e 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -315,15 +315,17 @@ config MMC_SDHCI_TEGRA
>           If unsure, say N.
>
>  config MMC_SDHCI_S3C
> -       tristate "SDHCI support on Samsung S3C SoC"
> +       tristate "SDHCI support on Samsung S3C/S5P/Exynos SoC"
>         depends on MMC_SDHCI
>         depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           often referrered to as the HSMMC block in some of the Samsung S3C
> -         range of SoC.
> +         (S3C2416, S3C2443, S3C6410), S5Pv210 and Exynos (Exynso4210,
> +         Exynos4412) SoCs.
>
> -         If you have a controller with this interface, say Y or M here.
> +         If you have a controller with this interface (thereforeyou build for
> +         such Samsung SoC), say Y or M here.
>
>           If unsure, say N.
>
> --
> 2.30.2
>
