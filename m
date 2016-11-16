From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: Add missing parent clocks to
 audio block in Exynos 5433 SoC
Date: Thu, 17 Nov 2016 01:35:39 +0900
Message-ID: <CAGTfZH3Rfd=hsLYB1+JGRUANye1hEBr2edFrS9g5oyO-YoAHfQ@mail.gmail.com>
References: <CGME20161116130708eucas1p19e0c5866df4ee5c9b0eac92e8b160779@eucas1p1.samsung.com>
 <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com> <1479301615-11240-3-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36848 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbcKPQgA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:36:00 -0500
Received: by mail-qk0-f193.google.com with SMTP id h201so21989307qke.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 08:36:00 -0800 (PST)
In-Reply-To: <1479301615-11240-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-16 22:06 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Audio pll and oscilator clocks are proper parent clocks for AUD CMU.
> They are not visible as such on first glance on Exynos 5433 SoC docs,
> but they are needed for this CMU to operate properly.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 6564875..a80eb4c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -374,6 +374,8 @@
>                         compatible = "samsung,exynos5433-cmu-aud";
>                         reg = <0x114c0000 0x1000>;
>                         #clock-cells = <1>;
> +                       clock-names = "oscclk", "fout_aud_pll";
> +                       clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
>                 };
>
>                 cmu_bus0: clock-controller@13600000 {

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Also, you should update the binding documentation of exynos5433's clock[1].
[1] Documentation/devicetree/bindings/clock/exynos5433-clock.txt

Best Regards,
Chanwoo Choi
