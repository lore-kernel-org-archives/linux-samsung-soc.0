From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 4/5] clk/exynos5250: add clock for tv sysmmu
Date: Fri, 21 Jun 2013 10:20:48 +0530
Message-ID: <CAPdUM4MHd2LPVkJ88ZJiWYG-fJJTa+szP18_G+SzkQDttC7vcw@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
	<1370862062-16680-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:60072 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274Ab3FUEut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:50:49 -0400
Received: by mail-we0-f178.google.com with SMTP id u53so5928613wes.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:50:48 -0700 (PDT)
In-Reply-To: <1370862062-16680-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, Mike Turquette <mturquette@linaro.org>

+Mike

On Mon, Jun 10, 2013 at 4:31 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Adding sysmmu clock for tv for exynos5250 SoC. It also
> adds aclk200_disp1 mux which is the actual parent of the
> disp1 block (contains hdmi, mixer, sysmmu_tv).
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    1 +
>  drivers/clk/samsung/clk-exynos5250.c                         |    6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> index f333d61..f1c7e7f 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -156,6 +156,7 @@ clock which they consume.
>    dp                   342
>    mixer                        343
>    hdmi                 344
> +  smmu_tv              345
>
>
>     [Clock Muxes]
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 88cdb13..bb93d61 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -24,6 +24,7 @@
>  #define SRC_CORE1              0x4204
>  #define SRC_TOP0               0x10210
>  #define SRC_TOP2               0x10218
> +#define SRC_TOP3               0x1021C
>  #define SRC_GSCL               0x10220
>  #define SRC_DISP1_0            0x1022c
>  #define SRC_MAU                        0x10240
> @@ -99,7 +100,7 @@ enum exynos5250_clks {
>         spi2, i2s1, i2s2, pcm1, pcm2, pwm, spdif, ac97, hsi2c0, hsi2c1, hsi2c2,
>         hsi2c3, chipid, sysreg, pmu, cmu_top, cmu_core, cmu_mem, tzpc0, tzpc1,
>         tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9, hdmi_cec, mct,
> -       wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi,
> +       wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, smmu_tv,
>
>         /* mux clocks */
>         mout_hdmi = 1024,
> @@ -172,6 +173,7 @@ PNAME(mout_mpll_user_p)     = { "fin_pll", "sclk_mpll" };
>  PNAME(mout_bpll_user_p)        = { "fin_pll", "sclk_bpll" };
>  PNAME(mout_aclk166_p)  = { "sclk_cpll", "sclk_mpll_user" };
>  PNAME(mout_aclk200_p)  = { "sclk_mpll_user", "sclk_bpll_user" };
> +PNAME(mout_aclk200_disp1_sub_p) = { "fin_pll", "aclk200" };
>  PNAME(mout_hdmi_p)     = { "div_hdmi_pixel", "sclk_hdmiphy" };
>  PNAME(mout_usb3_p)     = { "sclk_mpll_user", "sclk_cpll" };
>  PNAME(mout_group1_p)   = { "fin_pll", "fin_pll", "sclk_hdmi27m",
> @@ -227,6 +229,7 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
>         MUX(none, "mout_aclk166", mout_aclk166_p, SRC_TOP0, 8, 1),
>         MUX(none, "mout_aclk333", mout_aclk166_p, SRC_TOP0, 16, 1),
>         MUX(none, "mout_aclk200", mout_aclk200_p, SRC_TOP0, 12, 1),
> +       MUX(none, "aclk200_disp1", mout_aclk200_disp1_sub_p, SRC_TOP3, 4, 1),
>         MUX(none, "mout_cam_bayer", mout_group1_p, SRC_GSCL, 12, 4),
>         MUX(none, "mout_cam0", mout_group1_p, SRC_GSCL, 16, 4),
>         MUX(none, "mout_cam1", mout_group1_p, SRC_GSCL, 20, 4),
> @@ -328,6 +331,7 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>         GATE(smmu_gscl1, "smmu_gscl1", "aclk266", GATE_IP_GSCL, 8, 0, 0),
>         GATE(smmu_gscl2, "smmu_gscl2", "aclk266", GATE_IP_GSCL, 9, 0, 0),
>         GATE(smmu_gscl3, "smmu_gscl3", "aclk266", GATE_IP_GSCL, 10, 0, 0),
> +       GATE(smmu_tv, "smmu_tv", "aclk200_disp1", GATE_IP_DISP1, 9, 0, 0),
>         GATE(mfc, "mfc", "aclk333", GATE_IP_MFC, 0, 0, 0),
>         GATE(smmu_mfcl, "smmu_mfcl", "aclk333", GATE_IP_MFC, 1, 0, 0),
>         GATE(smmu_mfcr, "smmu_mfcr", "aclk333", GATE_IP_MFC, 2, 0, 0),
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
