From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: exynos: Fix FSYS CMU parent clocks in
 Exynos 5433 SoC
Date: Thu, 17 Nov 2016 01:31:10 +0900
Message-ID: <CAGTfZH0FknLzB+dPvMGxVj3WuXba1BLix5gb5i8xMe+mk9jZVQ@mail.gmail.com>
References: <CGME20161116130707eucas1p20f49e19c746905f858ca7c7b1e7c0e37@eucas1p2.samsung.com>
 <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com> <1479301615-11240-2-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34199 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbcKPQbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:31:31 -0500
Received: by mail-qk0-f196.google.com with SMTP id 124so21991031qkh.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 08:31:31 -0800 (PST)
In-Reply-To: <1479301615-11240-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-16 22:06 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> This patch corrects FSYS CMU parent clocks specified in clock controller
> node to let improved Exynos 5433 clocks driver to control proper clocks
> on FSYS<->TOP CMU boundary.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 1188630..6564875 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -312,7 +312,7 @@
>
>                         clock-names = "oscclk",
>                                 "sclk_ufs_mphy",
> -                               "div_aclk_fsys_200",
> +                               "aclk_fsys_200",

FSYS cmu doesn't use the "aclk_fsys_200" clock as parent clock.

When I check the clk-exynos5433.c driver, CLK_MOUT_ACLK_FSYS_200_USER
mux in the FSYS cmu
uses the "div_aclk_fsys_200" clock as parent clock instead of "aclk_fsys_200".

>                                 "sclk_pcie_100_fsys",
>                                 "sclk_ufsunipro_fsys",
>                                 "sclk_mmc2_fsys",
> @@ -322,7 +322,7 @@
>                                 "sclk_usbdrd30_fsys";
>                         clocks = <&xxti>,
>                                 <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> -                               <&cmu_top CLK_DIV_ACLK_FSYS_200>,
> +                               <&cmu_top CLK_ACLK_FSYS_200>,
>                                 <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
>                                 <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
>                                 <&cmu_top CLK_SCLK_MMC2_FSYS>,
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Best Regards,
Chanwoo Choi
