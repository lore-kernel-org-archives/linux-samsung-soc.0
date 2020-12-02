Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302F1C8300F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 04:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E53E422202
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 04:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgLBEV6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Dec 2020 23:21:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:38528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727375AbgLBEV6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 23:21:58 -0500
Date:   Wed, 2 Dec 2020 09:51:12 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606882877;
        bh=0MX7CoibYwcelRM52XLtvuAv3gqF6aXGWnyw7knX294=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=c9MF51dsqMfjDFqmA7eT47Io5h22+qX5+QyI/LGeTXdeeOAWQMgajwaG9OEv/NOJm
         ayaD4s0+fVgdr/U1EOpJn3onueXyxayo8AEx258Td1pfLRIDCBUUKy+H7G4Rw5KtOa
         5UjMVIh7cvUbxO87UsRBUqogBmAqnz9WGDA9Julo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] phy: samsung: Fix build break in USB2 PHY driver for
 Exynos5420 SoCs
Message-ID: <20201202042112.GD8403@vkoul-mobl>
References: <CGME20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85@eucas1p2.samsung.com>
 <20201201170905.16153-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201170905.16153-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01-12-20, 18:09, Marek Szyprowski wrote:
> Exynos5420 variant of USB2 PHY is handled by the same code as the
> Exynos5250 one. Introducing a separate Kconfig symbol for it was an
> over-engineering, which turned out to cause build break for certain
> configurations:
> 
> ERROR: modpost: "exynos5420_usb2_phy_config" [drivers/phy/samsung/phy-exynos-usb2.ko] undefined!
> 
> Fix this by removing PHY_EXYNOS5420_USB2 symbol and using
> PHY_EXYNOS5250_USB2 also for Exynos5420 SoCs.
> 
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Fixes: 81b534f7e9b2 ("phy: samsung: Add support for the Exynos5420 variant of the USB2 PHY")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Vinod: this a fix to the patch merged yesterday. If you want me to resend
> a fixed initial patch, let me know.

The fix is just fine :)

Although the patch subject line is not. It is supposed to talk about the
change done and not the effect.

Maybe "Merge kconfig for Exynos5420 and Exynos5250" would make better
sense

> ---
>  drivers/phy/samsung/Kconfig            | 7 +------
>  drivers/phy/samsung/phy-samsung-usb2.c | 2 --
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 0f51d3bf38cc..e20d2fcc9fe7 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -64,12 +64,7 @@ config PHY_EXYNOS4X12_USB2
>  config PHY_EXYNOS5250_USB2
>  	bool
>  	depends on PHY_SAMSUNG_USB2
> -	default SOC_EXYNOS5250
> -
> -config PHY_EXYNOS5420_USB2
> -	bool
> -	depends on PHY_SAMSUNG_USB2
> -	default SOC_EXYNOS5420
> +	default SOC_EXYNOS5250 || SOC_EXYNOS5420
>  
>  config PHY_S5PV210_USB2
>  	bool "Support for S5PV210"
> diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
> index 3908153f2ce5..ec2befabeea6 100644
> --- a/drivers/phy/samsung/phy-samsung-usb2.c
> +++ b/drivers/phy/samsung/phy-samsung-usb2.c
> @@ -127,8 +127,6 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
>  		.compatible = "samsung,exynos5250-usb2-phy",
>  		.data = &exynos5250_usb2_phy_config,
>  	},
> -#endif
> -#ifdef CONFIG_PHY_EXYNOS5420_USB2
>  	{
>  		.compatible = "samsung,exynos5420-usb2-phy",
>  		.data = &exynos5420_usb2_phy_config,
> -- 
> 2.17.1

-- 
~Vinod
