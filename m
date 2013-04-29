From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2] clk: exynos4: Add clock entries for TMU
Date: Mon, 29 Apr 2013 16:04:37 +0530
Message-ID: <CAK9yfHw1AcnDrQXm5U7ECaq4dVC2Ln5viSR-RaJE0+R0=1dzMw@mail.gmail.com>
References: <1366602946-8264-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:39036 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757065Ab3D2Keh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 06:34:37 -0400
Received: by mail-ob0-f177.google.com with SMTP id ef5so5194239obb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2013 03:34:37 -0700 (PDT)
In-Reply-To: <1366602946-8264-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>, Mike Turquette <mturquette@linaro.org>

On 22 April 2013 09:25, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Added clock entries for thermal management unit (TMU) for
> Exynos4 SoCs.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Mike Turquette <mturquette@linaro.org>
> ---
> Should be applied on top of the below patches:
> https://patchwork.kernel.org/patch/2448711/
> https://patchwork.kernel.org/patch/2459831/
>
> Changes since v1:
> Changed clock name 'tmu' to 'tmu_apbif' as per the SoC user manual.
> ---
>  .../devicetree/bindings/clock/exynos4-clock.txt    |    1 +
>  drivers/clk/samsung/clk-exynos4.c                  |    4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
> index 14d5c2a..8fc1151 100644
> --- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
> @@ -236,6 +236,7 @@ Exynos4 SoC and this is specified where applicable.
>    spi0_isp_sclk       380     Exynos4x12
>    spi1_isp_sclk       381     Exynos4x12
>    uart_isp_sclk       382     Exynos4x12
> +  tmu_apbif          383
>
>                 [Mux Clocks]
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 09cf161..0be7d05 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -170,7 +170,7 @@ enum exynos4_clks {
>         gicisp, smmu_isp, smmu_drc, smmu_fd, smmu_lite0, smmu_lite1, mcuctl_isp,
>         mpwm_isp, i2c0_isp, i2c1_isp, mtcadc_isp, pwm_isp, wdt_isp, uart_isp,
>         asyncaxim, smmu_ispcx, spi0_isp, spi1_isp, pwm_isp_sclk, spi0_isp_sclk,
> -       spi1_isp_sclk, uart_isp_sclk,
> +       spi1_isp_sclk, uart_isp_sclk, tmu_apbif,
>
>         /* mux clocks */
>         mout_fimc0 = 384, mout_fimc1, mout_fimc2, mout_fimc3, mout_cam0,
> @@ -815,6 +815,7 @@ static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
>         GATE_A(keyif, "keyif", "aclk100", E4210_GATE_IP_PERIR, 16, 0, 0, "keypad"),
>         GATE_DA(sclk_fimd1, "exynos4-fb.1", "sclk_fimd1", "div_fimd1",
>                         E4210_SRC_MASK_LCD1, 0, CLK_SET_RATE_PARENT, 0, "sclk_fimd"),
> +       GATE(tmu_apbif, "tmu_apbif", "aclk100", E4210_GATE_IP_PERIR, 17, 0, 0),
>  };
>
>  /* list of gate clocks supported in exynos4x12 soc */
> @@ -915,6 +916,7 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
>         GATE(spi1_isp, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
>                         CLK_IGNORE_UNUSED, 0),
>         GATE(g2d, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
> +       GATE(tmu_apbif, "tmu_apbif", "aclk100", E4X12_GATE_IP_PERIR, 17, 0, 0),
>  };
>
>  #ifdef CONFIG_OF
> --
> 1.7.9.5
>

Ping...


-- 
With warm regards,
Sachin
