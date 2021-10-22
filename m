Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3DC4604DA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhJVWv1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 18:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbhJVWv1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 18:51:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99248C061764;
        Fri, 22 Oct 2021 15:49:08 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r6so2647880ljg.6;
        Fri, 22 Oct 2021 15:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=AEcM+oBN8gPPeH2m1DlxdSpIdKcVXUX5eGTjr05AXfM=;
        b=MyCt2AH9tFvDjelIT8z65PJHZVH4ZvfToAyd9O098NT4FecaQgO4uZ9t9coUp0yT3N
         IHwZEmuOslCt1GrIGpsp9YcyKpNuz0jKZ1NKxRcG+RYqp+9Xh4YHlVqz+qpB5QmHcsDN
         JwlFxOljAQ7wrl5iVHyUnsDuUyVy/LOT/5V+XXMzBO+CpJvfZXZZpthQfWTvU2Mww7PU
         MhKCyDebFsqHalyDhVobnqJpKsVn+nrKXeaN9vN9lzF7EjjnmPjBKZ7kN4bmrQn3fEKv
         IxCrgBJqVpG7wkJBNvnJRuPzbNDhIcfgwIcvB3mD0dpq7LlolX9jCGBPb0CDM0IUZNgM
         3Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=AEcM+oBN8gPPeH2m1DlxdSpIdKcVXUX5eGTjr05AXfM=;
        b=V02e+GJUn0ToS0rc60NyZRO85frnkvbPPcExuTyF9h2UnfvSJYRB5mZBF4fVo86QwN
         defDl1JWR0S7sy4iLpYHyy4TjfIOjTpVmgKjbBXMWVdvPxR24kYSUU0TxWiRMVqOXE8m
         Jd26IBT5fXh0Nw8+/NPFxX9scz/wGX67RaosVMCQL8qf8VD+y/Nkk/Yz7TkHoYf7kZ+e
         wQWzuPjIaBX00AEbM4a/Hkz1E0IFkBjH+Er4+HIAYKtFZUJ+yGmiL3adAiWqBnfpRG9O
         DhvvW4XLoK4WUdRBWABlECFvkFCuHUfkKJckivIfMgIDV5TgNiwlV2XO7LP7E3Fh4isx
         ohag==
X-Gm-Message-State: AOAM531k0mK9r0HY0dN5UCzzQM1HYE2Ma7MQqj/Y7lvy6tWo/b6Y6VEg
        ESWFy8N5k40yQRcxUMKHkOdfSXnx/yI16xGjb9E=
X-Google-Smtp-Source: ABdhPJz27C5V4pA2YbUjkA3ZjOpHMwtpAvlPyw1GrxzEdWBOvQj45fupOGLWaFQHOt6EVgjpWA76XqvZYPrbAVjWXIA=
X-Received: by 2002:a2e:804d:: with SMTP id p13mr2840836ljg.454.1634942946902;
 Fri, 22 Oct 2021 15:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211022224556.18742-1-semen.protsenko@linaro.org> <20211022224556.18742-2-semen.protsenko@linaro.org>
In-Reply-To: <20211022224556.18742-2-semen.protsenko@linaro.org>
Reply-To: cwchoi00@gmail.com
From:   Chanwoo Choi <cwchoi00@gmail.com>
Date:   Sat, 23 Oct 2021 07:48:30 +0900
Message-ID: <CAGTfZH0TGXwPQLE7k_WMzjSYk=wUpNCuewH7_Fr3aAQ4SVoOsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos850: Implement CMU_APM domain
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 23, 2021 at 7:46 AM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
>
> CMU_APM clock domain provides clocks for APM IP-core (Active Power
> Management). According to Exynos850 TRM, CMU_APM generates I3C, Mailbox,
> Speedy, Timer, WDT, RTC and PMU clocks for BLK_ALIVE.
>
> This patch adds next clocks:
>   - bus clocks in CMU_TOP needed for CMU_APM
>   - all internal CMU_APM clocks
>   - leaf clocks for I3C, Speedy and RTC IP-cores
>   - bus clocks for CMU_CMGP and CMU_CHUB
>
> CMU_APM doesn't belong to Power Domains, but platform driver is used for
> its registration to keep its bus clock always running. Otherwise rtc-s3c
> driver disables that clock and system freezes.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> Changes in v2:
>   - Reworked clock IDs to be contiguous (don't break ABI)
>   - Added R-b tag by Krzysztof Kozlowski
>
>  drivers/clk/samsung/clk-exynos850.c   | 142 +++++++++++++++++++++++++-
>  include/dt-bindings/clock/exynos850.h |  29 +++++-
>  2 files changed, 169 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> index 2294989e244c..95e373d17b42 100644
> --- a/drivers/clk/samsung/clk-exynos850.c
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -72,6 +72,7 @@ static void __init exynos850_init_clocks(struct device_node *np,
>  #define PLL_CON3_PLL_SHARED0                   0x014c
>  #define PLL_CON0_PLL_SHARED1                   0x0180
>  #define PLL_CON3_PLL_SHARED1                   0x018c
> +#define CLK_CON_MUX_MUX_CLKCMU_APM_BUS         0x1000
>  #define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS                0x1014
>  #define CLK_CON_MUX_MUX_CLKCMU_CORE_CCI                0x1018
>  #define CLK_CON_MUX_MUX_CLKCMU_CORE_MMC_EMBD   0x101c
> @@ -83,6 +84,7 @@ static void __init exynos850_init_clocks(struct device_node *np,
>  #define CLK_CON_MUX_MUX_CLKCMU_PERI_BUS                0x1070
>  #define CLK_CON_MUX_MUX_CLKCMU_PERI_IP         0x1074
>  #define CLK_CON_MUX_MUX_CLKCMU_PERI_UART       0x1078
> +#define CLK_CON_DIV_CLKCMU_APM_BUS             0x180c
>  #define CLK_CON_DIV_CLKCMU_CORE_BUS            0x1820
>  #define CLK_CON_DIV_CLKCMU_CORE_CCI            0x1824
>  #define CLK_CON_DIV_CLKCMU_CORE_MMC_EMBD       0x1828
> @@ -100,6 +102,7 @@ static void __init exynos850_init_clocks(struct device_node *np,
>  #define CLK_CON_DIV_PLL_SHARED1_DIV2           0x1898
>  #define CLK_CON_DIV_PLL_SHARED1_DIV3           0x189c
>  #define CLK_CON_DIV_PLL_SHARED1_DIV4           0x18a0
> +#define CLK_CON_GAT_GATE_CLKCMU_APM_BUS                0x2008
>  #define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS       0x201c
>  #define CLK_CON_GAT_GATE_CLKCMU_CORE_CCI       0x2020
>  #define CLK_CON_GAT_GATE_CLKCMU_CORE_MMC_EMBD  0x2024
> @@ -122,6 +125,7 @@ static const unsigned long top_clk_regs[] __initconst = {
>         PLL_CON3_PLL_SHARED0,
>         PLL_CON0_PLL_SHARED1,
>         PLL_CON3_PLL_SHARED1,
> +       CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
>         CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
>         CLK_CON_MUX_MUX_CLKCMU_CORE_CCI,
>         CLK_CON_MUX_MUX_CLKCMU_CORE_MMC_EMBD,
> @@ -133,6 +137,7 @@ static const unsigned long top_clk_regs[] __initconst = {
>         CLK_CON_MUX_MUX_CLKCMU_PERI_BUS,
>         CLK_CON_MUX_MUX_CLKCMU_PERI_IP,
>         CLK_CON_MUX_MUX_CLKCMU_PERI_UART,
> +       CLK_CON_DIV_CLKCMU_APM_BUS,
>         CLK_CON_DIV_CLKCMU_CORE_BUS,
>         CLK_CON_DIV_CLKCMU_CORE_CCI,
>         CLK_CON_DIV_CLKCMU_CORE_MMC_EMBD,
> @@ -150,6 +155,7 @@ static const unsigned long top_clk_regs[] __initconst = {
>         CLK_CON_DIV_PLL_SHARED1_DIV2,
>         CLK_CON_DIV_PLL_SHARED1_DIV3,
>         CLK_CON_DIV_PLL_SHARED1_DIV4,
> +       CLK_CON_GAT_GATE_CLKCMU_APM_BUS,
>         CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
>         CLK_CON_GAT_GATE_CLKCMU_CORE_CCI,
>         CLK_CON_GAT_GATE_CLKCMU_CORE_MMC_EMBD,
> @@ -183,6 +189,8 @@ static const struct samsung_pll_clock top_pll_clks[] __initconst = {
>  PNAME(mout_shared0_pll_p)      = { "oscclk", "fout_shared0_pll" };
>  PNAME(mout_shared1_pll_p)      = { "oscclk", "fout_shared1_pll" };
>  PNAME(mout_mmc_pll_p)          = { "oscclk", "fout_mmc_pll" };
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_APM */
> +PNAME(mout_clkcmu_apm_bus_p)   = { "dout_shared0_div4", "pll_shared1_div4" };
>  /* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
>  PNAME(mout_core_bus_p)         = { "dout_shared1_div2", "dout_shared0_div3",
>                                     "dout_shared1_div3", "dout_shared0_div4" };
> @@ -222,6 +230,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
>             PLL_CON0_PLL_MMC, 4, 1),
>
> +       /* APM */
> +       MUX(CLK_MOUT_CLKCMU_APM_BUS, "mout_clkcmu_apm_bus",
> +           mout_clkcmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
> +
>         /* CORE */
>         MUX(CLK_MOUT_CORE_BUS, "mout_core_bus", mout_core_bus_p,
>             CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> @@ -268,6 +280,10 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
>         DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div2",
>             CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
>
> +       /* APM */
> +       DIV(CLK_DOUT_CLKCMU_APM_BUS, "dout_clkcmu_apm_bus",
> +           "gout_clkcmu_apm_bus", CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
> +
>         /* CORE */
>         DIV(CLK_DOUT_CORE_BUS, "dout_core_bus", "gout_core_bus",
>             CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> @@ -310,6 +326,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>         GATE(CLK_GOUT_CORE_SSS, "gout_core_sss", "mout_core_sss",
>              CLK_CON_GAT_GATE_CLKCMU_CORE_SSS, 21, 0, 0),
>
> +       /* APM */
> +       GATE(CLK_GOUT_CLKCMU_APM_BUS, "gout_clkcmu_apm_bus",
> +            "mout_clkcmu_apm_bus", CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, 0, 0),
> +
>         /* DPU */
>         GATE(CLK_GOUT_DPU, "gout_dpu", "mout_dpu",
>              CLK_CON_GAT_GATE_CLKCMU_DPU, 21, 0, 0),
> @@ -354,6 +374,124 @@ static void __init exynos850_cmu_top_init(struct device_node *np)
>  CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
>                exynos850_cmu_top_init);
>
> +/* ---- CMU_APM ------------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_APM (0x11800000) */
> +#define PLL_CON0_MUX_CLKCMU_APM_BUS_USER               0x0600
> +#define PLL_CON0_MUX_CLK_RCO_APM_I3C_USER              0x0610
> +#define PLL_CON0_MUX_CLK_RCO_APM_USER                  0x0620
> +#define PLL_CON0_MUX_DLL_USER                          0x0630
> +#define CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS                        0x1000
> +#define CLK_CON_MUX_MUX_CLK_APM_BUS                    0x1004
> +#define CLK_CON_MUX_MUX_CLK_APM_I3C                    0x1008
> +#define CLK_CON_DIV_CLKCMU_CHUB_BUS                    0x1800
> +#define CLK_CON_DIV_DIV_CLK_APM_BUS                    0x1804
> +#define CLK_CON_DIV_DIV_CLK_APM_I3C                    0x1808
> +#define CLK_CON_GAT_CLKCMU_CMGP_BUS                    0x2000
> +#define CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS               0x2014
> +#define CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK            0x2024
> +#define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK                0x2028
> +#define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK       0x2034
> +#define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK       0x2038
> +#define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK           0x20bc
> +
> +static const unsigned long apm_clk_regs[] __initconst = {
> +       PLL_CON0_MUX_CLKCMU_APM_BUS_USER,
> +       PLL_CON0_MUX_CLK_RCO_APM_I3C_USER,
> +       PLL_CON0_MUX_CLK_RCO_APM_USER,
> +       PLL_CON0_MUX_DLL_USER,
> +       CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS,
> +       CLK_CON_MUX_MUX_CLK_APM_BUS,
> +       CLK_CON_MUX_MUX_CLK_APM_I3C,
> +       CLK_CON_DIV_CLKCMU_CHUB_BUS,
> +       CLK_CON_DIV_DIV_CLK_APM_BUS,
> +       CLK_CON_DIV_DIV_CLK_APM_I3C,
> +       CLK_CON_GAT_CLKCMU_CMGP_BUS,
> +       CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS,
> +       CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK,
> +       CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK,
> +       CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK,
> +       CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
> +       CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_APM */
> +PNAME(mout_apm_bus_user_p)     = { "oscclk_rco_apm", "dout_clkcmu_apm_bus" };
> +PNAME(mout_rco_apm_i3c_user_p) = { "oscclk_rco_apm", "clk_rco_i3c_pmic" };
> +PNAME(mout_rco_apm_user_p)     = { "oscclk_rco_apm", "clk_rco_apm__alv" };
> +PNAME(mout_dll_user_p)         = { "oscclk_rco_apm", "clk_dll_dco" };
> +PNAME(mout_clkcmu_chub_bus_p)  = { "mout_apm_bus_user", "mout_dll_user" };
> +PNAME(mout_apm_bus_p)          = { "mout_rco_apm_user", "mout_apm_bus_user",
> +                                   "mout_dll_user", "oscclk_rco_apm" };
> +PNAME(mout_apm_i3c_p)          = { "dout_apm_i3c", "mout_rco_apm_i3c_user" };
> +
> +static const struct samsung_fixed_rate_clock apm_fixed_clks[] __initconst = {
> +       FRATE(CLK_RCO_I3C_PMIC, "clk_rco_i3c_pmic", NULL, 0, 491520000),
> +       FRATE(OSCCLK_RCO_APM, "oscclk_rco_apm", NULL, 0, 24576000),
> +       FRATE(CLK_RCO_APM__ALV, "clk_rco_apm__alv", NULL, 0, 49152000),
> +       FRATE(CLK_DLL_DCO, "clk_dll_dco", NULL, 0, 360000000),
> +};
> +
> +static const struct samsung_mux_clock apm_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_APM_BUS_USER, "mout_apm_bus_user", mout_apm_bus_user_p,
> +           PLL_CON0_MUX_CLKCMU_APM_BUS_USER, 4, 1),
> +       MUX(CLK_MOUT_RCO_APM_I3C_USER, "mout_rco_apm_i3c_user",
> +           mout_rco_apm_i3c_user_p, PLL_CON0_MUX_CLK_RCO_APM_I3C_USER, 4, 1),
> +       MUX(CLK_MOUT_RCO_APM_USER, "mout_rco_apm_user", mout_rco_apm_user_p,
> +           PLL_CON0_MUX_CLK_RCO_APM_USER, 4, 1),
> +       MUX(CLK_MOUT_DLL_USER, "mout_dll_user", mout_dll_user_p,
> +           PLL_CON0_MUX_DLL_USER, 4, 1),
> +       MUX(CLK_MOUT_CLKCMU_CHUB_BUS, "mout_clkcmu_chub_bus",
> +           mout_clkcmu_chub_bus_p, CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS, 0, 1),
> +       MUX(CLK_MOUT_APM_BUS, "mout_apm_bus", mout_apm_bus_p,
> +           CLK_CON_MUX_MUX_CLK_APM_BUS, 0, 2),
> +       MUX(CLK_MOUT_APM_I3C, "mout_apm_i3c", mout_apm_i3c_p,
> +           CLK_CON_MUX_MUX_CLK_APM_I3C, 0, 1),
> +};
> +
> +static const struct samsung_div_clock apm_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_CLKCMU_CHUB_BUS, "dout_clkcmu_chub_bus",
> +           "gout_clkcmu_chub_bus",
> +           CLK_CON_DIV_CLKCMU_CHUB_BUS, 0, 3),
> +       DIV(CLK_DOUT_APM_BUS, "dout_apm_bus", "mout_apm_bus",
> +           CLK_CON_DIV_DIV_CLK_APM_BUS, 0, 3),
> +       DIV(CLK_DOUT_APM_I3C, "dout_apm_i3c", "mout_apm_bus",
> +           CLK_CON_DIV_DIV_CLK_APM_I3C, 0, 3),
> +};
> +
> +static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CLKCMU_CMGP_BUS, "gout_clkcmu_cmgp_bus", "dout_apm_bus",
> +            CLK_CON_GAT_CLKCMU_CMGP_BUS, 21, 0, 0),
> +       GATE(CLK_GOUT_CLKCMU_CHUB_BUS, "gout_clkcmu_chub_bus",
> +            "mout_clkcmu_chub_bus",
> +            CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS, 21, 0, 0),
> +       GATE(CLK_GOUT_RTC_PCLK, "gout_rtc_pclk", "dout_apm_bus",
> +            CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
> +       GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
> +            CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
> +       GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
> +       GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
> +       GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
> +            CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info apm_cmu_info __initconst = {
> +       .mux_clks               = apm_mux_clks,
> +       .nr_mux_clks            = ARRAY_SIZE(apm_mux_clks),
> +       .div_clks               = apm_div_clks,
> +       .nr_div_clks            = ARRAY_SIZE(apm_div_clks),
> +       .gate_clks              = apm_gate_clks,
> +       .nr_gate_clks           = ARRAY_SIZE(apm_gate_clks),
> +       .fixed_clks             = apm_fixed_clks,
> +       .nr_fixed_clks          = ARRAY_SIZE(apm_fixed_clks),
> +       .nr_clk_ids             = APM_NR_CLK,
> +       .clk_regs               = apm_clk_regs,
> +       .nr_clk_regs            = ARRAY_SIZE(apm_clk_regs),
> +       .clk_name               = "dout_clkcmu_apm_bus",
> +};
> +
>  /* ---- CMU_HSI ------------------------------------------------------------- */
>
>  /* Register Offset definitions for CMU_HSI (0x13400000) */
> @@ -801,9 +939,11 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -/* CMUs which belong to Power Domains and need runtime PM to be implemented */
>  static const struct of_device_id exynos850_cmu_of_match[] = {
>         {
> +               .compatible = "samsung,exynos850-cmu-apm",
> +               .data = &apm_cmu_info,
> +       }, {
>                 .compatible = "samsung,exynos850-cmu-hsi",
>                 .data = &hsi_cmu_info,
>         }, {
> diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> index 8999184f94a2..df3978b58304 100644
> --- a/include/dt-bindings/clock/exynos850.h
> +++ b/include/dt-bindings/clock/exynos850.h
> @@ -55,7 +55,34 @@
>  #define CLK_GOUT_PERI_BUS              43
>  #define CLK_GOUT_PERI_UART             44
>  #define CLK_GOUT_PERI_IP               45
> -#define TOP_NR_CLK                     46
> +#define CLK_MOUT_CLKCMU_APM_BUS                46
> +#define CLK_DOUT_CLKCMU_APM_BUS                47
> +#define CLK_GOUT_CLKCMU_APM_BUS                48
> +#define TOP_NR_CLK                     49
> +
> +/* CMU_APM */
> +#define CLK_RCO_I3C_PMIC               1
> +#define OSCCLK_RCO_APM                 2
> +#define CLK_RCO_APM__ALV               3
> +#define CLK_DLL_DCO                    4
> +#define CLK_MOUT_APM_BUS_USER          5
> +#define CLK_MOUT_RCO_APM_I3C_USER      6
> +#define CLK_MOUT_RCO_APM_USER          7
> +#define CLK_MOUT_DLL_USER              8
> +#define CLK_MOUT_CLKCMU_CHUB_BUS       9
> +#define CLK_MOUT_APM_BUS               10
> +#define CLK_MOUT_APM_I3C               11
> +#define CLK_DOUT_CLKCMU_CHUB_BUS       12
> +#define CLK_DOUT_APM_BUS               13
> +#define CLK_DOUT_APM_I3C               14
> +#define CLK_GOUT_CLKCMU_CMGP_BUS       15
> +#define CLK_GOUT_CLKCMU_CHUB_BUS       16
> +#define CLK_GOUT_RTC_PCLK              17
> +#define CLK_GOUT_TOP_RTC_PCLK          18
> +#define CLK_GOUT_I3C_PCLK              19
> +#define CLK_GOUT_I3C_SCLK              20
> +#define CLK_GOUT_SPEEDY_PCLK           21
> +#define APM_NR_CLK                     22
>
>  /* CMU_HSI */
>  #define CLK_MOUT_HSI_BUS_USER          1
> --
> 2.30.2
>

Thanks for update.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
