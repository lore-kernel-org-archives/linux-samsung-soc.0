From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: TM2 - add support for GScaler devices
Date: Thu, 17 Nov 2016 01:59:24 +0900
Message-ID: <CAGTfZH2JBdccVTgzHTCEZR75AwqKbAWLhHytpg0NLp__tnieNQ@mail.gmail.com>
References: <CGME20161116131137eucas1p198803f55c69c10f95031b54d878c72d3@eucas1p1.samsung.com>
 <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com> <1479301889-11393-2-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34387 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKPQ7q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:59:46 -0500
Received: by mail-qk0-f194.google.com with SMTP id 124so22116074qkh.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 08:59:45 -0800 (PST)
In-Reply-To: <1479301889-11393-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,


2016-11-16 22:11 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> This patch adds device nodes for GScaler devices to Exynos 5433 SoC dtsi
> and proper initial clock configuration to TM2 dts.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  7 +++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 81 +++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 5ab1028..5ff5c30 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -909,6 +909,13 @@
>         assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;
>  };
>
> +&cmu_gscl {
> +       assigned-clocks = <&cmu_gscl CLK_MOUT_ACLK_GSCL_111_USER>,
> +                         <&cmu_gscl CLK_MOUT_ACLK_GSCL_333_USER>;
> +       assigned-clock-parents = <&cmu_top CLK_ACLK_GSCL_111>,
> +                                <&cmu_top CLK_ACLK_GSCL_333>;
> +};
> +
>  &spi_1 {
>         cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>         status = "okay";
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index ab29352..8ecde41 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -26,6 +26,12 @@
>
>         interrupt-parent = <&gic>;
>
> +       aliases {
> +               gsc0 = &gsc_0;
> +               gsc1 = &gsc_1;
> +               gsc2 = &gsc_2;
> +       };

The all alias of exynos5333 were defined in the exynos5433-tm2.dts.
I think that you better to move the gsc's alias to exynos5433-tm2.dts file.

[snip]

Best Regards,
Chanwoo Choi
