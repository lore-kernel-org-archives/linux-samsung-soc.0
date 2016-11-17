From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 2/2] clk/samsung: exynos5433: Add documentation for audio
 block parent clocks
Date: Thu, 17 Nov 2016 21:53:20 +0900
Message-ID: <CAGTfZH16kXhhCiXXvjReUDD0Exh2BxKQgoT_RgN7k_grRXfiyw@mail.gmail.com>
References: <CGME20161117085106eucas1p13370631ebbc7ec93effef606d80ac310@eucas1p1.samsung.com>
 <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com> <1479372648-11242-2-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36737 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933798AbcKQRIm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:08:42 -0500
Received: by mail-qk0-f196.google.com with SMTP id h201so27163713qke.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2016 09:08:41 -0800 (PST)
In-Reply-To: <1479372648-11242-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-17 17:50 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Audio block requires access to two parent clocks: audio PLL and oscillator,
> so add this information to device tree bindings documentation.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5433-clock.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> index ffff67a0e9cd..1dc80f8811fe 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -104,6 +104,10 @@ Required Properties:
>                 - sclk_decon_tv_vclk_disp
>                 - aclk_disp_333
>
> +       Input clocks for audio clock controller:
> +               - oscclk
> +               - fout_aud_pll
> +
>         Input clocks for bus0 clock controller:
>                 - aclk_bus0_400
>
> @@ -297,6 +301,9 @@ Example 2: Examples of clock controller nodes are listed below.
>                 compatible = "samsung,exynos5433-cmu-aud";
>                 reg = <0x114c0000 0x0b04>;
>                 #clock-cells = <1>;
> +
> +               clock-names = "oscclk", "fout_aud_pll";
> +               clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
>         };
>
>         cmu_bus0: clock-controller@13600000 {


Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
