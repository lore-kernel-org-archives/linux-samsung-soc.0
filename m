From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/2] clk/samsung: exynos5433: Fix parent clocks for FSYS block
Date: Thu, 17 Nov 2016 21:54:40 +0900
Message-ID: <CAGTfZH0Xe2SRoEt2qi3piqThm9bCg2ERhozmHB+sZzn-UU=21A@mail.gmail.com>
References: <CGME20161117085106eucas1p1db7f6fb1e955257c607785ee76536b18@eucas1p1.samsung.com>
 <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34837 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752219AbcKQQ6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 11:58:14 -0500
Received: by mail-qt0-f196.google.com with SMTP id m48so14774696qta.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2016 08:58:14 -0800 (PST)
In-Reply-To: <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-17 17:50 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> The proper parent clock for FSYS block is "aclk_fsys_200" according to
> the Exynos5433 reference manual.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5433-clock.txt | 6 +++---
>  drivers/clk/samsung/clk-exynos5433.c                         | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> index 63379b04e052..ffff67a0e9cd 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -79,7 +79,7 @@ Required Properties:
>         Input clocks for fsys clock controller:
>                 - oscclk
>                 - sclk_ufs_mphy
> -               - div_aclk_fsys_200
> +               - aclk_fsys_200
>                 - sclk_pcie_100_fsys
>                 - sclk_ufsunipro_fsys
>                 - sclk_mmc2_fsys
> @@ -235,7 +235,7 @@ Example 2: Examples of clock controller nodes are listed below.
>
>                 clock-names = "oscclk",
>                         "sclk_ufs_mphy",
> -                       "div_aclk_fsys_200",
> +                       "aclk_fsys_200",
>                         "sclk_pcie_100_fsys",
>                         "sclk_ufsunipro_fsys",
>                         "sclk_mmc2_fsys",
> @@ -245,7 +245,7 @@ Example 2: Examples of clock controller nodes are listed below.
>                         "sclk_usbdrd30_fsys";
>                 clocks = <&xxti>,
>                        <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> -                      <&cmu_top CLK_DIV_ACLK_FSYS_200>,
> +                      <&cmu_top CLK_ACLK_FSYS_200>,
>                        <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
>                        <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
>                        <&cmu_top CLK_SCLK_MMC2_FSYS>,
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index cdf6ba3e5577..218a94f90e37 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -1934,7 +1934,7 @@ static void __init exynos5433_cmu_peris_init(struct device_node *np)
>
>  /* list of all parent clock list */
>  PNAME(mout_sclk_ufs_mphy_user_p)       = { "oscclk", "sclk_ufs_mphy", };
> -PNAME(mout_aclk_fsys_200_user_p)       = { "oscclk", "div_aclk_fsys_200", };
> +PNAME(mout_aclk_fsys_200_user_p)       = { "oscclk", "aclk_fsys_200", };
>  PNAME(mout_sclk_pcie_100_user_p)       = { "oscclk", "sclk_pcie_100_fsys",};
>  PNAME(mout_sclk_ufsunipro_user_p)      = { "oscclk", "sclk_ufsunipro_fsys",};
>  PNAME(mout_sclk_mmc2_user_p)           = { "oscclk", "sclk_mmc2_fsys", };

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
