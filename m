Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64719C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 13:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C72F611F2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 13:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhJVNmE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 09:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbhJVNmD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 09:42:03 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51841C061767
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 06:39:46 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id h4so7777373uaw.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qUTPar5KpB5wYbx4wyFhP+vXIfo/35pqqP/SR1uct9s=;
        b=TAg107YTYBVMnauQAv+le2FhhVoA2kgfwJzfQegfk7RECxRtF+7h0RU/NICBCs+5E3
         oBx4dD8eVQied8RDRnqeFB/c4+q4eF9oeegHShCeib4RxT0SDiQAnFWFriKMGOAuGmgU
         in0wtG+iXXXrmXAtd7nWk8pxnBaAsvhgLhqvxPuHiTHYn6qJE5xkOGgWSuvS6yFMXPl2
         6z5jVzPkXAoWowEBKy+g43SpcdbV40Tb0Y5p/XbBYSY4YWnZvNpRLjHiwrwqk/2NF5w+
         zR9UTv6DiQpAtQeKZbNIafRjsiJM/g3gwrkQrT5ZfXF4f7m+ecRw0P2VCX3Ar2/Ln+ej
         FgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qUTPar5KpB5wYbx4wyFhP+vXIfo/35pqqP/SR1uct9s=;
        b=4uQSDePcO6bQ2T9+ajRp3xT+bGVsHxPPNebW32E503G8B7b+UDeLj8scOIUZPJjW/z
         w/AL5lwWzb3UW2+miIHhUMgAonkeFG7TY2IRD0pzr3zFZBbH7XPEKniWlxNorH9GCcuU
         Yy2oLrj4ZJGaHqkDIB+hcoWIpQU8jSgIF1kG2rYzce3dKDada2EIyXpAwKouqvYfb7Ur
         A1skG4IPAadR1qXtQwE3vdIkPPYQ3JrlJ9Q45e2tLCurK6zC6Z+WeCTggPyLdRqezkVN
         QKZkr3E823HY6dPua2zG7Ha4JTHfnbRZivfZe9DF6Gs5gK+x08+s/FY0RTOxXhf7KbVV
         aNjQ==
X-Gm-Message-State: AOAM531aikO+yDrSZ+N6LR/YnBbsfk5oOGPdXBRJUD9yRRf+gLMS0g5k
        9z5mVgdEC4Yj+KfDWMIPHXletD8aEV5dna2FnFIwLg==
X-Google-Smtp-Source: ABdhPJz6Rn+kW+HOq4oqKt0vHlDLho0PqI/eoALoLGEdPluj/nE0xgbdkEYdoaALnuJqcgcWb9NYryX8mugtydEEv/U=
X-Received: by 2002:ab0:3303:: with SMTP id r3mr14533235uao.17.1634909985414;
 Fri, 22 Oct 2021 06:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021203152.29312-1-semen.protsenko@linaro.org>
 <20211021203152.29312-2-semen.protsenko@linaro.org> <864f52d2-1336-eaca-1647-99a0f55da6f9@gmail.com>
In-Reply-To: <864f52d2-1336-eaca-1647-99a0f55da6f9@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 22 Oct 2021 16:39:33 +0300
Message-ID: <CAPLW+4kgAKut9fPJzZapBvVpprno++O3g3CFOE-Pj=0Oxb9McQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: samsung: exynos850: Implement CMU_APM domain
To:     Chanwoo Choi <cwchoi00@gmail.com>
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
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 22 Oct 2021 at 11:58, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> On 21. 10. 22. =EC=98=A4=EC=A0=84 5:31, Sam Protsenko wrote:
> > CMU_APM clock domain provides clocks for APM IP-core (Active Power
> > Management). According to Exynos850 TRM, CMU_APM generates I3C, Mailbox=
,
> > Speedy, Timer, WDT, RTC and PMU clocks for BLK_ALIVE.
> >
> > This patch adds next clocks:
> >    - bus clocks in CMU_TOP needed for CMU_APM
> >    - all internal CMU_APM clocks
> >    - leaf clocks for I3C, Speedy and RTC IP-cores
> >    - bus clocks for CMU_CMGP and CMU_CHUB
> >
> > CMU_APM doesn't belong to Power Domains, but platform driver is used fo=
r
> > its registration to keep its bus clock always running. Otherwise rtc-s3=
c
> > driver disables that clock and system freezes.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   drivers/clk/samsung/clk-exynos850.c   | 142 +++++++++++++++++++++++++=
-
> >   include/dt-bindings/clock/exynos850.h | 107 +++++++++++--------
> >   2 files changed, 208 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/=
clk-exynos850.c
> > index 2294989e244c..95e373d17b42 100644
> > --- a/drivers/clk/samsung/clk-exynos850.c
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -72,6 +72,7 @@ static void __init exynos850_init_clocks(struct devic=
e_node *np,
> >   #define PLL_CON3_PLL_SHARED0                        0x014c
> >   #define PLL_CON0_PLL_SHARED1                        0x0180
> >   #define PLL_CON3_PLL_SHARED1                        0x018c
> > +#define CLK_CON_MUX_MUX_CLKCMU_APM_BUS               0x1000
> >   #define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS             0x1014
> >   #define CLK_CON_MUX_MUX_CLKCMU_CORE_CCI             0x1018
> >   #define CLK_CON_MUX_MUX_CLKCMU_CORE_MMC_EMBD        0x101c
> > @@ -83,6 +84,7 @@ static void __init exynos850_init_clocks(struct devic=
e_node *np,
> >   #define CLK_CON_MUX_MUX_CLKCMU_PERI_BUS             0x1070
> >   #define CLK_CON_MUX_MUX_CLKCMU_PERI_IP              0x1074
> >   #define CLK_CON_MUX_MUX_CLKCMU_PERI_UART    0x1078
> > +#define CLK_CON_DIV_CLKCMU_APM_BUS           0x180c
> >   #define CLK_CON_DIV_CLKCMU_CORE_BUS         0x1820
> >   #define CLK_CON_DIV_CLKCMU_CORE_CCI         0x1824
> >   #define CLK_CON_DIV_CLKCMU_CORE_MMC_EMBD    0x1828
> > @@ -100,6 +102,7 @@ static void __init exynos850_init_clocks(struct dev=
ice_node *np,
> >   #define CLK_CON_DIV_PLL_SHARED1_DIV2                0x1898
> >   #define CLK_CON_DIV_PLL_SHARED1_DIV3                0x189c
> >   #define CLK_CON_DIV_PLL_SHARED1_DIV4                0x18a0
> > +#define CLK_CON_GAT_GATE_CLKCMU_APM_BUS              0x2008
> >   #define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS    0x201c
> >   #define CLK_CON_GAT_GATE_CLKCMU_CORE_CCI    0x2020
> >   #define CLK_CON_GAT_GATE_CLKCMU_CORE_MMC_EMBD       0x2024
> > @@ -122,6 +125,7 @@ static const unsigned long top_clk_regs[] __initcon=
st =3D {
> >       PLL_CON3_PLL_SHARED0,
> >       PLL_CON0_PLL_SHARED1,
> >       PLL_CON3_PLL_SHARED1,
> > +     CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
> >       CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
> >       CLK_CON_MUX_MUX_CLKCMU_CORE_CCI,
> >       CLK_CON_MUX_MUX_CLKCMU_CORE_MMC_EMBD,
> > @@ -133,6 +137,7 @@ static const unsigned long top_clk_regs[] __initcon=
st =3D {
> >       CLK_CON_MUX_MUX_CLKCMU_PERI_BUS,
> >       CLK_CON_MUX_MUX_CLKCMU_PERI_IP,
> >       CLK_CON_MUX_MUX_CLKCMU_PERI_UART,
> > +     CLK_CON_DIV_CLKCMU_APM_BUS,
> >       CLK_CON_DIV_CLKCMU_CORE_BUS,
> >       CLK_CON_DIV_CLKCMU_CORE_CCI,
> >       CLK_CON_DIV_CLKCMU_CORE_MMC_EMBD,
> > @@ -150,6 +155,7 @@ static const unsigned long top_clk_regs[] __initcon=
st =3D {
> >       CLK_CON_DIV_PLL_SHARED1_DIV2,
> >       CLK_CON_DIV_PLL_SHARED1_DIV3,
> >       CLK_CON_DIV_PLL_SHARED1_DIV4,
> > +     CLK_CON_GAT_GATE_CLKCMU_APM_BUS,
> >       CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
> >       CLK_CON_GAT_GATE_CLKCMU_CORE_CCI,
> >       CLK_CON_GAT_GATE_CLKCMU_CORE_MMC_EMBD,
> > @@ -183,6 +189,8 @@ static const struct samsung_pll_clock top_pll_clks[=
] __initconst =3D {
> >   PNAME(mout_shared0_pll_p)   =3D { "oscclk", "fout_shared0_pll" };
> >   PNAME(mout_shared1_pll_p)   =3D { "oscclk", "fout_shared1_pll" };
> >   PNAME(mout_mmc_pll_p)               =3D { "oscclk", "fout_mmc_pll" };
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_APM */
> > +PNAME(mout_clkcmu_apm_bus_p) =3D { "dout_shared0_div4", "pll_shared1_d=
iv4" };
> >   /* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
> >   PNAME(mout_core_bus_p)              =3D { "dout_shared1_div2", "dout_=
shared0_div3",
> >                                   "dout_shared1_div3", "dout_shared0_di=
v4" };
> > @@ -222,6 +230,10 @@ static const struct samsung_mux_clock top_mux_clks=
[] __initconst =3D {
> >       MUX(CLK_MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
> >           PLL_CON0_PLL_MMC, 4, 1),
> >
> > +     /* APM */
> > +     MUX(CLK_MOUT_CLKCMU_APM_BUS, "mout_clkcmu_apm_bus",
> > +         mout_clkcmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
> > +
> >       /* CORE */
> >       MUX(CLK_MOUT_CORE_BUS, "mout_core_bus", mout_core_bus_p,
> >           CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> > @@ -268,6 +280,10 @@ static const struct samsung_div_clock top_div_clks=
[] __initconst =3D {
> >       DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div=
2",
> >           CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> >
> > +     /* APM */
> > +     DIV(CLK_DOUT_CLKCMU_APM_BUS, "dout_clkcmu_apm_bus",
> > +         "gout_clkcmu_apm_bus", CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
> > +
> >       /* CORE */
> >       DIV(CLK_DOUT_CORE_BUS, "dout_core_bus", "gout_core_bus",
> >           CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> > @@ -310,6 +326,10 @@ static const struct samsung_gate_clock top_gate_cl=
ks[] __initconst =3D {
> >       GATE(CLK_GOUT_CORE_SSS, "gout_core_sss", "mout_core_sss",
> >            CLK_CON_GAT_GATE_CLKCMU_CORE_SSS, 21, 0, 0),
> >
> > +     /* APM */
> > +     GATE(CLK_GOUT_CLKCMU_APM_BUS, "gout_clkcmu_apm_bus",
> > +          "mout_clkcmu_apm_bus", CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, =
0, 0),
> > +
> >       /* DPU */
> >       GATE(CLK_GOUT_DPU, "gout_dpu", "mout_dpu",
> >            CLK_CON_GAT_GATE_CLKCMU_DPU, 21, 0, 0),
> > @@ -354,6 +374,124 @@ static void __init exynos850_cmu_top_init(struct =
device_node *np)
> >   CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
> >              exynos850_cmu_top_init);
> >
> > +/* ---- CMU_APM ------------------------------------------------------=
------- */
> > +
> > +/* Register Offset definitions for CMU_APM (0x11800000) */
> > +#define PLL_CON0_MUX_CLKCMU_APM_BUS_USER             0x0600
> > +#define PLL_CON0_MUX_CLK_RCO_APM_I3C_USER            0x0610
> > +#define PLL_CON0_MUX_CLK_RCO_APM_USER                        0x0620
> > +#define PLL_CON0_MUX_DLL_USER                                0x0630
> > +#define CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS                      0x1000
> > +#define CLK_CON_MUX_MUX_CLK_APM_BUS                  0x1004
> > +#define CLK_CON_MUX_MUX_CLK_APM_I3C                  0x1008
> > +#define CLK_CON_DIV_CLKCMU_CHUB_BUS                  0x1800
> > +#define CLK_CON_DIV_DIV_CLK_APM_BUS                  0x1804
> > +#define CLK_CON_DIV_DIV_CLK_APM_I3C                  0x1808
> > +#define CLK_CON_GAT_CLKCMU_CMGP_BUS                  0x2000
> > +#define CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS             0x2014
> > +#define CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK          0x2024
> > +#define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK              0x2028
> > +#define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK     0x2034
> > +#define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK     0x2038
> > +#define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK         0x20bc
> > +
> > +static const unsigned long apm_clk_regs[] __initconst =3D {
> > +     PLL_CON0_MUX_CLKCMU_APM_BUS_USER,
> > +     PLL_CON0_MUX_CLK_RCO_APM_I3C_USER,
> > +     PLL_CON0_MUX_CLK_RCO_APM_USER,
> > +     PLL_CON0_MUX_DLL_USER,
> > +     CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS,
> > +     CLK_CON_MUX_MUX_CLK_APM_BUS,
> > +     CLK_CON_MUX_MUX_CLK_APM_I3C,
> > +     CLK_CON_DIV_CLKCMU_CHUB_BUS,
> > +     CLK_CON_DIV_DIV_CLK_APM_BUS,
> > +     CLK_CON_DIV_DIV_CLK_APM_I3C,
> > +     CLK_CON_GAT_CLKCMU_CMGP_BUS,
> > +     CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS,
> > +     CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK,
> > +     CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK,
> > +     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK,
> > +     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
> > +     CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
> > +};
> > +
> > +/* List of parent clocks for Muxes in CMU_APM */
> > +PNAME(mout_apm_bus_user_p)   =3D { "oscclk_rco_apm", "dout_clkcmu_apm_=
bus" };
> > +PNAME(mout_rco_apm_i3c_user_p)       =3D { "oscclk_rco_apm", "clk_rco_=
i3c_pmic" };
> > +PNAME(mout_rco_apm_user_p)   =3D { "oscclk_rco_apm", "clk_rco_apm__alv=
" };
> > +PNAME(mout_dll_user_p)               =3D { "oscclk_rco_apm", "clk_dll_=
dco" };
> > +PNAME(mout_clkcmu_chub_bus_p)        =3D { "mout_apm_bus_user", "mout_=
dll_user" };
> > +PNAME(mout_apm_bus_p)                =3D { "mout_rco_apm_user", "mout_=
apm_bus_user",
> > +                                 "mout_dll_user", "oscclk_rco_apm" };
> > +PNAME(mout_apm_i3c_p)                =3D { "dout_apm_i3c", "mout_rco_a=
pm_i3c_user" };
> > +
> > +static const struct samsung_fixed_rate_clock apm_fixed_clks[] __initco=
nst =3D {
> > +     FRATE(CLK_RCO_I3C_PMIC, "clk_rco_i3c_pmic", NULL, 0, 491520000),
> > +     FRATE(OSCCLK_RCO_APM, "oscclk_rco_apm", NULL, 0, 24576000),
> > +     FRATE(CLK_RCO_APM__ALV, "clk_rco_apm__alv", NULL, 0, 49152000),
> > +     FRATE(CLK_DLL_DCO, "clk_dll_dco", NULL, 0, 360000000),
> > +};
> > +
> > +static const struct samsung_mux_clock apm_mux_clks[] __initconst =3D {
> > +     MUX(CLK_MOUT_APM_BUS_USER, "mout_apm_bus_user", mout_apm_bus_user=
_p,
> > +         PLL_CON0_MUX_CLKCMU_APM_BUS_USER, 4, 1),
> > +     MUX(CLK_MOUT_RCO_APM_I3C_USER, "mout_rco_apm_i3c_user",
> > +         mout_rco_apm_i3c_user_p, PLL_CON0_MUX_CLK_RCO_APM_I3C_USER, 4=
, 1),
> > +     MUX(CLK_MOUT_RCO_APM_USER, "mout_rco_apm_user", mout_rco_apm_user=
_p,
> > +         PLL_CON0_MUX_CLK_RCO_APM_USER, 4, 1),
> > +     MUX(CLK_MOUT_DLL_USER, "mout_dll_user", mout_dll_user_p,
> > +         PLL_CON0_MUX_DLL_USER, 4, 1),
> > +     MUX(CLK_MOUT_CLKCMU_CHUB_BUS, "mout_clkcmu_chub_bus",
> > +         mout_clkcmu_chub_bus_p, CLK_CON_MUX_MUX_CLKCMU_CHUB_BUS, 0, 1=
),
> > +     MUX(CLK_MOUT_APM_BUS, "mout_apm_bus", mout_apm_bus_p,
> > +         CLK_CON_MUX_MUX_CLK_APM_BUS, 0, 2),
> > +     MUX(CLK_MOUT_APM_I3C, "mout_apm_i3c", mout_apm_i3c_p,
> > +         CLK_CON_MUX_MUX_CLK_APM_I3C, 0, 1),
> > +};
> > +
> > +static const struct samsung_div_clock apm_div_clks[] __initconst =3D {
> > +     DIV(CLK_DOUT_CLKCMU_CHUB_BUS, "dout_clkcmu_chub_bus",
> > +         "gout_clkcmu_chub_bus",
> > +         CLK_CON_DIV_CLKCMU_CHUB_BUS, 0, 3),
> > +     DIV(CLK_DOUT_APM_BUS, "dout_apm_bus", "mout_apm_bus",
> > +         CLK_CON_DIV_DIV_CLK_APM_BUS, 0, 3),
> > +     DIV(CLK_DOUT_APM_I3C, "dout_apm_i3c", "mout_apm_bus",
> > +         CLK_CON_DIV_DIV_CLK_APM_I3C, 0, 3),
> > +};
> > +
> > +static const struct samsung_gate_clock apm_gate_clks[] __initconst =3D=
 {
> > +     GATE(CLK_GOUT_CLKCMU_CMGP_BUS, "gout_clkcmu_cmgp_bus", "dout_apm_=
bus",
> > +          CLK_CON_GAT_CLKCMU_CMGP_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_CLKCMU_CHUB_BUS, "gout_clkcmu_chub_bus",
> > +          "mout_clkcmu_chub_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_RTC_PCLK, "gout_rtc_pclk", "dout_apm_bus",
> > +          CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
> > +     GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
> > +          CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
> > +     GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
> > +          CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
> > +     GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
> > +          CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
> > +     GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
> > +          CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
> > +};
> > +
> > +static const struct samsung_cmu_info apm_cmu_info __initconst =3D {
> > +     .mux_clks               =3D apm_mux_clks,
> > +     .nr_mux_clks            =3D ARRAY_SIZE(apm_mux_clks),
> > +     .div_clks               =3D apm_div_clks,
> > +     .nr_div_clks            =3D ARRAY_SIZE(apm_div_clks),
> > +     .gate_clks              =3D apm_gate_clks,
> > +     .nr_gate_clks           =3D ARRAY_SIZE(apm_gate_clks),
> > +     .fixed_clks             =3D apm_fixed_clks,
> > +     .nr_fixed_clks          =3D ARRAY_SIZE(apm_fixed_clks),
> > +     .nr_clk_ids             =3D APM_NR_CLK,
> > +     .clk_regs               =3D apm_clk_regs,
> > +     .nr_clk_regs            =3D ARRAY_SIZE(apm_clk_regs),
> > +     .clk_name               =3D "dout_clkcmu_apm_bus",
> > +};
> > +
> >   /* ---- CMU_HSI -----------------------------------------------------=
-------- */
> >
> >   /* Register Offset definitions for CMU_HSI (0x13400000) */
> > @@ -801,9 +939,11 @@ static int __init exynos850_cmu_probe(struct platf=
orm_device *pdev)
> >       return 0;
> >   }
> >
> > -/* CMUs which belong to Power Domains and need runtime PM to be implem=
ented */
> >   static const struct of_device_id exynos850_cmu_of_match[] =3D {
> >       {
> > +             .compatible =3D "samsung,exynos850-cmu-apm",
> > +             .data =3D &apm_cmu_info,
> > +     }, {
> >               .compatible =3D "samsung,exynos850-cmu-hsi",
> >               .data =3D &hsi_cmu_info,
> >       }, {
> > diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-binding=
s/clock/exynos850.h
> > index 8999184f94a2..c65e0300a8d3 100644
> > --- a/include/dt-bindings/clock/exynos850.h
> > +++ b/include/dt-bindings/clock/exynos850.h
> > @@ -16,46 +16,73 @@
> >   #define CLK_MOUT_SHARED0_PLL                4
> >   #define CLK_MOUT_SHARED1_PLL                5
> >   #define CLK_MOUT_MMC_PLL            6
> > -#define CLK_MOUT_CORE_BUS            7
> > -#define CLK_MOUT_CORE_CCI            8
> > -#define CLK_MOUT_CORE_MMC_EMBD               9
> > -#define CLK_MOUT_CORE_SSS            10
> > -#define CLK_MOUT_DPU                 11
> > -#define CLK_MOUT_HSI_BUS             12
> > -#define CLK_MOUT_HSI_MMC_CARD                13
> > -#define CLK_MOUT_HSI_USB20DRD                14
> > -#define CLK_MOUT_PERI_BUS            15
> > -#define CLK_MOUT_PERI_UART           16
> > -#define CLK_MOUT_PERI_IP             17
> > -#define CLK_DOUT_SHARED0_DIV3                18
> > -#define CLK_DOUT_SHARED0_DIV2                19
> > -#define CLK_DOUT_SHARED1_DIV3                20
> > -#define CLK_DOUT_SHARED1_DIV2                21
> > -#define CLK_DOUT_SHARED0_DIV4                22
> > -#define CLK_DOUT_SHARED1_DIV4                23
> > -#define CLK_DOUT_CORE_BUS            24
> > -#define CLK_DOUT_CORE_CCI            25
> > -#define CLK_DOUT_CORE_MMC_EMBD               26
> > -#define CLK_DOUT_CORE_SSS            27
> > -#define CLK_DOUT_DPU                 28
> > -#define CLK_DOUT_HSI_BUS             29
> > -#define CLK_DOUT_HSI_MMC_CARD                30
> > -#define CLK_DOUT_HSI_USB20DRD                31
> > -#define CLK_DOUT_PERI_BUS            32
> > -#define CLK_DOUT_PERI_UART           33
> > -#define CLK_DOUT_PERI_IP             34
> > -#define CLK_GOUT_CORE_BUS            35
> > -#define CLK_GOUT_CORE_CCI            36
> > -#define CLK_GOUT_CORE_MMC_EMBD               37
> > -#define CLK_GOUT_CORE_SSS            38
> > -#define CLK_GOUT_DPU                 39
> > -#define CLK_GOUT_HSI_BUS             40
> > -#define CLK_GOUT_HSI_MMC_CARD                41
> > -#define CLK_GOUT_HSI_USB20DRD                42
> > -#define CLK_GOUT_PERI_BUS            43
> > -#define CLK_GOUT_PERI_UART           44
> > -#define CLK_GOUT_PERI_IP             45
> > -#define TOP_NR_CLK                   46
> > +#define CLK_MOUT_CLKCMU_APM_BUS              7
> > +#define CLK_MOUT_CORE_BUS            8
>
>
> Basically, you can never change the already defined clock id
> in nclude/dt-bindings/clock/*.h because of supporting
> the compatibility of dtb files which were using the
> already defined clock id instead of changed clock id
>
> If you want to add new clock with new clock id,
> you have to define the new clock id at the end of defined clock
> like the next of CLK_GOUT_PERI_IP for TOP domain case.
>

Thanks for explaining that in details, Chanwoo. As Krzysztof pointed
out, right now there are no dts users of this clock driver in upstream
kernel (I didn't submit it yet), so it'd nice if this one can be taken
as is. In future I'll increment the last clock ID. Guess it was my OCD
talking, trying to keep all clock IDs grouped by clock type :)

> (snip)
>
> --
> Best Regards,
> Samsung Electronics
> Chanwoo Choi
