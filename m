Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449B2C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 13:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE4A42151B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604584248;
	bh=QhSpAqc+JI6iEP/gvXgklZw5qTJq5ZUzZ9hmMY56PxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=z4jV4gTw7JrduuBYm1tw5YPhJ8ZR32TT8whstv57suN6U2+LPXWt1vX91Hew1pVBR
	 /Lbfw+Vfs6q9JcQ98SLzHkByLJCUgkOICLjO+U3yH5nCrJYeueTWCBjKJVZ9JEwgF7
	 Zkvx5ukvC5UexZ58TId00M9TyTy1gXKelUtwWous=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbgKENus (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 08:50:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:51682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgKENus (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 08:50:48 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E699E206B6;
        Thu,  5 Nov 2020 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604584247;
        bh=QhSpAqc+JI6iEP/gvXgklZw5qTJq5ZUzZ9hmMY56PxQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aeDVCuYDBm5ybOxqE9hZvmcySKgIJYzAQRWIv2CTS9HvUSmxqRnHeNaOU5lbcUmCX
         pavpZdRzRbP3f3/LXJ4fwrlEwVg51nc99YlC1dRmK7fhQMZfP/1dh1QPWVN6Q7J+t1
         IlFyZcAkjxgO7Kz0iRebQBMLA/K6RGSa8Xx1tUzg=
Received: by mail-oi1-f179.google.com with SMTP id m17so1725548oie.4;
        Thu, 05 Nov 2020 05:50:46 -0800 (PST)
X-Gm-Message-State: AOAM5328SoCf3+HmnlgrWN8LRhtZUMDaCEcuea3qgk19BR2G1C95O3eR
        LXA8HIKJM09QrjOpzYIbOJqI3pjpcTqb1E0H0Q==
X-Google-Smtp-Source: ABdhPJwlLmVul9osQoOmAYcll5ZdLwQnv0cOCpb55EEmIiGva2JHFnzJmvuYRje/DB8hxEKpkeNR1O4Z3zfeZXa8Hcg=
X-Received: by 2002:a54:4588:: with SMTP id z8mr1649677oib.147.1604584246048;
 Thu, 05 Nov 2020 05:50:46 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482@eucas1p1.samsung.com>
 <20201105114804.18326-1-m.szyprowski@samsung.com>
In-Reply-To: <20201105114804.18326-1-m.szyprowski@samsung.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 5 Nov 2020 07:50:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTrUTHr4=ZDNfaf-mZE3wgfzkV=CRgb7yGzKg1oH7zvg@mail.gmail.com>
Message-ID: <CAL_JsqKTrUTHr4=ZDNfaf-mZE3wgfzkV=CRgb7yGzKg1oH7zvg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Use fixed index for the MMC devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 5, 2020 at 5:48 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Recently introduced asynchronous probe on the MMC devices can shuffle
> block IDs in the system. Pin them to values equal to the physical MMC bus
> number to ease booting in environments where UUIDs are not practical.

How's that going to help for existing DTs?

> Use newly introduced aliases for mmcblk devices from commit fa2d0aa96941
> ("mmc: core: Allow setting slot index via device tree alias").
>
> Suggested-by: Markus Reichl <m.reichl@fivetechno.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 3 +++
>  arch/arm/boot/dts/exynos4.dtsi    | 2 ++
>  arch/arm/boot/dts/exynos4210.dtsi | 1 +
>  arch/arm/boot/dts/exynos4412.dtsi | 1 +
>  arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
>  arch/arm/boot/dts/exynos5260.dtsi | 3 +++
>  arch/arm/boot/dts/exynos5410.dtsi | 3 +++
>  arch/arm/boot/dts/exynos5420.dtsi | 3 +++
>  8 files changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 75ed82600ec8..510080bb4102 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -28,6 +28,9 @@
>         aliases {
>                 pinctrl0 = &pinctrl_0;
>                 pinctrl1 = &pinctrl_1;
> +               mmc0 = &mshc_0;
> +               mmc1 = &mshc_1;
> +               mmc2 = &mshc_2;
>                 mshc0 = &mshc_0;

Then what's this for? Do you need multiple aliases to the same device?
And pinctrl aliases are odd too and should be removed.

>                 mshc1 = &mshc_1;
>                 mshc2 = &mshc_2;
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index a1e54449f33f..e266f890eea4 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -45,6 +45,8 @@
>                 fimc1 = &fimc_1;
>                 fimc2 = &fimc_2;
>                 fimc3 = &fimc_3;

Another odd one...

> +               mmc1 = &sdhci_1;
> +               mmc2 = &sdhci_2;
>                 serial0 = &serial_0;
>                 serial1 = &serial_1;
>                 serial2 = &serial_2;
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index fddc661ded28..f1d0d5959b7f 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -23,6 +23,7 @@
>         compatible = "samsung,exynos4210", "samsung,exynos4";
>
>         aliases {
> +               mmc0 = &sdhci_0;
>                 pinctrl0 = &pinctrl_0;
>                 pinctrl1 = &pinctrl_1;
>                 pinctrl2 = &pinctrl_2;
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index fa8e8d6bc4d5..9fcf7383eb9d 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -28,6 +28,7 @@
>                 pinctrl3 = &pinctrl_3;
>                 fimc-lite0 = &fimc_lite_0;
>                 fimc-lite1 = &fimc_lite_1;
> +               mmc0 = &mshc_0;
>                 mshc0 = &mshc_0;
>         };
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 84677332a5a2..0a0436f92fac 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -30,6 +30,10 @@
>                 gsc1 = &gsc_1;
>                 gsc2 = &gsc_2;
>                 gsc3 = &gsc_3;
> +               mmc0 = &mmc_0;
> +               mmc1 = &mmc_1;
> +               mmc2 = &mmc_2;
> +               mmc3 = &mmc_3;
>                 mshc0 = &mmc_0;
>                 mshc1 = &mmc_1;
>                 mshc2 = &mmc_2;
> diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
> index 973448c4ad93..64bf1d8dc33b 100644
> --- a/arch/arm/boot/dts/exynos5260.dtsi
> +++ b/arch/arm/boot/dts/exynos5260.dtsi
> @@ -21,6 +21,9 @@
>                 i2c1 = &hsi2c_1;
>                 i2c2 = &hsi2c_2;
>                 i2c3 = &hsi2c_3;
> +               mmc0 = &mmc_0;
> +               mmc1 = &mmc_1;
> +               mmc2 = &mmc_2;
>                 pinctrl0 = &pinctrl_0;
>                 pinctrl1 = &pinctrl_1;
>                 pinctrl2 = &pinctrl_2;
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 584ce62361b1..503859153769 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -24,6 +24,9 @@
>                 pinctrl1 = &pinctrl_1;
>                 pinctrl2 = &pinctrl_2;
>                 pinctrl3 = &pinctrl_3;
> +               mmc0 = &mmc_0;
> +               mmc1 = &mmc_1;
> +               mmc2 = &mmc_2;
>         };
>
>         cpus {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 23a8fd5c8a6e..3a3eadd890fb 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -19,6 +19,9 @@
>         compatible = "samsung,exynos5420", "samsung,exynos5";
>
>         aliases {
> +               mmc0 = &mmc_0;
> +               mmc1 = &mmc_1;
> +               mmc2 = &mmc_2;
>                 mshc0 = &mmc_0;
>                 mshc1 = &mmc_1;
>                 mshc2 = &mmc_2;
> --
> 2.17.1
>
