From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Add required clock tree for UFS
Date: Mon, 31 Aug 2015 21:02:36 +0530
Message-ID: <CAGOxZ50Y6h13MzmF0ubx6xoQTJAWX22=fAXRYp_94A396wULLA@mail.gmail.com>
References: <1440754083-11829-1-git-send-email-alim.akhtar@samsung.com> <CAJKOXPe2vzB3J=7qqSajxnHLViMymV7OuE4Bj0WESu5Ntvx6og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:35651 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717AbbHaPdS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Aug 2015 11:33:18 -0400
Received: by igbut12 with SMTP id ut12so24279011igb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2015 08:33:16 -0700 (PDT)
In-Reply-To: <CAJKOXPe2vzB3J=7qqSajxnHLViMymV7OuE4Bj0WESu5Ntvx6og@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kgene <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "amit.daniel@samsung.com" <amit.daniel@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hello,

On Sat, Aug 29, 2015 at 2:23 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-08-28 18:28 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
>> Adding required mux/div/gate clocks for UFS controller
>> present on Exynos7.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>> This patch has a dependency on [1]
>> [1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46122.html
>>
>>  drivers/clk/samsung/clk-exynos7.c       |  117 +++++++++++++++++++++++++++++++
>>  include/dt-bindings/clock/exynos7-clk.h |   34 +++++++--
>>  2 files changed, 146 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> index 380608b..069af8c 100644
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
>> @@ -35,6 +35,7 @@
>>  #define DIV_TOPC1              0x0604
>>  #define DIV_TOPC3              0x060C
>>  #define ENABLE_ACLK_TOPC1      0x0804
>> +#define ENABLE_SCLK_TOPC1      0x0A04
>>
>>  static struct samsung_fixed_factor_clock topc_fixed_factor_clks[] __initdata = {
>>         FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_bus0_pll_ctrl", 1, 2, 0),
>> @@ -143,6 +144,15 @@ static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
>>  static struct samsung_gate_clock topc_gate_clks[] __initdata = {
>>         GATE(ACLK_MSCL_532, "aclk_mscl_532", "dout_aclk_mscl_532",
>>                 ENABLE_ACLK_TOPC1, 20, 0, 0),
>> +
>> +       GATE(SCLK_MFC_PLL_B, "dout_sclk_mfc_pll_b", "dout_sclk_mfc_pll",
>> +               ENABLE_SCLK_TOPC1, 17, 0, 0),
>> +       GATE(SCLK_MFC_PLL_A, "dout_sclk_mfc_pll_a", "dout_sclk_mfc_pll",
>> +               ENABLE_SCLK_TOPC1, 16, 0, 0),
>> +       GATE(SCLK_BUS1_PLL_B, "dout_sclk_bus1_pll_b", "dout_sclk_bus1_pll",
>> +               ENABLE_SCLK_TOPC1, 13, 0, 0),
>> +       GATE(SCLK_BUS1_PLL_B, "dout_sclk_bus1_pll_a", "dout_sclk_bus1_pll",
>> +               ENABLE_SCLK_TOPC1, 12, 0, 0),
>
> 1. s/SCLK_BUS1_PLL_B/SCLK_BUS1_PLL_A/?
> 2. Why have they name prefixed with "dout"? These are gates, not dividers.
>
well right, went again over the whole clock file and looks like there
are other GATE clocks will starts with _dout_ prefix,
let me send another sets of patches will clean/rename these clock to
match the user manual, so that it will be easy for review.
Thanks for pointing it out.
>>  };
>>
>>  static struct samsung_pll_clock topc_pll_clks[] __initdata = {
>> @@ -433,12 +443,21 @@ static struct samsung_mux_clock top1_mux_clks[] __initdata = {
>>         MUX(0, "mout_aclk_fsys1_200", mout_top1_group1, MUX_SEL_TOP13, 24, 2),
>>         MUX(0, "mout_aclk_fsys0_200", mout_top1_group1, MUX_SEL_TOP13, 28, 2),
>>
>> +       MUX(0, "mout_sclk_phy_fsys0_26m", mout_top1_group1,
>> +               MUX_SEL_TOP1_FSYS0, 0, 2),
>>         MUX(0, "mout_sclk_mmc2", mout_top1_group1, MUX_SEL_TOP1_FSYS0, 16, 2),
>>         MUX(0, "mout_sclk_usbdrd300", mout_top1_group1,
>>                 MUX_SEL_TOP1_FSYS0, 28, 2),
>>
>> +       MUX(0, "mout_sclk_phy_fsys1", mout_top1_group1,
>> +               MUX_SEL_TOP1_FSYS1, 0, 2),
>> +       MUX(0, "mout_sclk_ufsunipro20", mout_top1_group1,
>> +               MUX_SEL_TOP1_FSYS1, 16, 2),
>> +
>>         MUX(0, "mout_sclk_mmc1", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 0, 2),
>>         MUX(0, "mout_sclk_mmc0", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 12, 2),
>> +       MUX(0, "mout_sclk_phy_fsys1_26m", mout_top1_group1,
>> +               MUX_SEL_TOP1_FSYS11, 24, 2),
>>  };
>>
>>  static struct samsung_div_clock top1_div_clks[] __initdata = {
>> @@ -447,6 +466,13 @@ static struct samsung_div_clock top1_div_clks[] __initdata = {
>>         DIV(DOUT_ACLK_FSYS0_200, "dout_aclk_fsys0_200", "mout_aclk_fsys0_200",
>>                 DIV_TOP13, 28, 4),
>>
>> +       DIV(DOUT_SCLK_PHY_FSYS1, "dout_sclk_phy_fsys1",
>> +               "mout_sclk_phy_fsys1", DIV_TOP1_FSYS1, 0, 6),
>> +
>> +       DIV(DOUT_SCLK_UFSUNIPRO20, "dout_sclk_ufsunipro20",
>> +               "mout_sclk_ufsunipro20",
>> +               DIV_TOP1_FSYS1, 16, 6),
>> +
>>         DIV(DOUT_SCLK_MMC2, "dout_sclk_mmc2", "mout_sclk_mmc2",
>>                 DIV_TOP1_FSYS0, 16, 10),
>>         DIV(0, "dout_sclk_usbdrd300", "mout_sclk_usbdrd300",
>> @@ -456,6 +482,9 @@ static struct samsung_div_clock top1_div_clks[] __initdata = {
>>                 DIV_TOP1_FSYS11, 0, 10),
>>         DIV(DOUT_SCLK_MMC0, "dout_sclk_mmc0", "mout_sclk_mmc0",
>>                 DIV_TOP1_FSYS11, 12, 10),
>> +
>> +       DIV(DOUT_SCLK_PHY_FSYS1_26M, "dout_sclk_phy_fsys1_26m",
>> +               "mout_sclk_phy_fsys1_26m", DIV_TOP1_FSYS11, 24, 6),
>>  };
>>
>>  static struct samsung_gate_clock top1_gate_clks[] __initdata = {
>> @@ -464,10 +493,20 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
>>         GATE(0, "sclk_usbdrd300", "dout_sclk_usbdrd300",
>>                 ENABLE_SCLK_TOP1_FSYS0, 28, 0, 0),
>>
>> +       GATE(CLK_SCLK_PHY_FSYS1, "sclk_phy_fsys1", "dout_sclk_phy_fsys1",
>> +               ENABLE_SCLK_TOP1_FSYS1, 0, CLK_SET_RATE_PARENT, 0),
>> +
>> +       GATE(CLK_SCLK_UFSUNIPRO20, "sclk_ufsunipro20", "dout_sclk_ufsunipro20",
>> +               ENABLE_SCLK_TOP1_FSYS1, 16, CLK_SET_RATE_PARENT, 0),
>> +
>>         GATE(CLK_SCLK_MMC1, "sclk_mmc1", "dout_sclk_mmc1",
>>                 ENABLE_SCLK_TOP1_FSYS11, 0, CLK_SET_RATE_PARENT, 0),
>>         GATE(CLK_SCLK_MMC0, "sclk_mmc0", "dout_sclk_mmc0",
>>                 ENABLE_SCLK_TOP1_FSYS11, 12, CLK_SET_RATE_PARENT, 0),
>> +
>> +       GATE(CLK_SCLK_PHY_FSYS1_26M, "sclk_phy_fsys1_26m",
>> +               "dout_sclk_phy_fsys1_26m", ENABLE_SCLK_TOP1_FSYS11,
>> +               24, CLK_SET_RATE_PARENT, 0),
>>  };
>>
>>  static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
>> @@ -902,39 +941,117 @@ CLK_OF_DECLARE(exynos7_clk_fsys0, "samsung,exynos7-clock-fsys0",
>>  /* Register Offset definitions for CMU_FSYS1 (0x156E0000) */
>>  #define MUX_SEL_FSYS10                 0x0200
>>  #define MUX_SEL_FSYS11                 0x0204
>> +#define MUX_SEL_FSYS12                 0x0208
>> +#define DIV_FSYS1                      0x0600
>>  #define ENABLE_ACLK_FSYS1              0x0800
>> +#define ENABLE_PCLK_FSYS1               0x0900
>> +#define ENABLE_SCLK_FSYS11              0x0A04
>> +#define ENABLE_SCLK_FSYS12              0x0A08
>> +#define ENABLE_SCLK_FSYS13              0x0A0C
>>
>>  /*
>>   * List of parent clocks for Muxes in CMU_FSYS1
>>   */
>>  PNAME(mout_aclk_fsys1_200_p)   = { "fin_pll",  "dout_aclk_fsys1_200" };
>> +PNAME(mout_fsys1_group_p)      = { "fin_pll", "fin_pll_26m",
>> +                               "sclk_phy_fsys1_26m" };
>>  PNAME(mout_sclk_mmc0_p)                = { "fin_pll", "sclk_mmc0" };
>>  PNAME(mout_sclk_mmc1_p)                = { "fin_pll", "sclk_mmc1" };
>> +PNAME(mout_sclk_ufsunipro20_user_p)  = { "fin_pll", "sclk_ufsunipro20" };
>> +PNAME(mout_phyclk_ufs20_tx0_user_p) = { "fin_pll", "phyclk_ufs20_tx0_symbol" };
>> +PNAME(mout_phyclk_ufs20_rx0_user_p) = { "fin_pll", "phyclk_ufs20_rx0_symbol" };
>> +PNAME(mout_phyclk_ufs20_rx1_user_p) = { "fin_pll", "phyclk_ufs20_rx1_symbol" };
>> +
>> +/* fixed rate clocks used in the FSYS1 block */
>> +struct samsung_fixed_rate_clock fixed_rate_clks_fsys1[] __initdata = {
>> +       FRATE(PHYCLK_UFS20_TX0_SYMBOL, "phyclk_ufs20_tx0_symbol", NULL,
>> +                       CLK_IS_ROOT, 300000000),
>> +       FRATE(PHYCLK_UFS20_RX0_SYMBOL, "phyclk_ufs20_rx0_symbol", NULL,
>> +                       CLK_IS_ROOT, 300000000),
>> +       FRATE(PHYCLK_UFS20_RX1_SYMBOL, "phyclk_ufs20_rx1_symbol", NULL,
>> +                       CLK_IS_ROOT, 300000000),
>> +};
>>
>>  static unsigned long fsys1_clk_regs[] __initdata = {
>>         MUX_SEL_FSYS10,
>>         MUX_SEL_FSYS11,
>> +       MUX_SEL_FSYS12,
>> +       DIV_FSYS1,
>>         ENABLE_ACLK_FSYS1,
>> +       ENABLE_PCLK_FSYS1,
>> +       ENABLE_SCLK_FSYS11,
>> +       ENABLE_SCLK_FSYS12,
>> +       ENABLE_SCLK_FSYS13,
>>  };
>>
>>  static struct samsung_mux_clock fsys1_mux_clks[] __initdata = {
>> +       MUX(MOUT_FSYS1_PHYCLK_SEL1, "mout_fsys1_phyclk_sel1",
>> +               mout_fsys1_group_p, MUX_SEL_FSYS10, 16, 2),
>> +       MUX(0, "mout_fsys1_phyclk_sel0", mout_fsys1_group_p,
>> +                MUX_SEL_FSYS10, 20, 2),
>>         MUX(0, "mout_aclk_fsys1_200_user", mout_aclk_fsys1_200_p,
>>                 MUX_SEL_FSYS10, 28, 1),
>>
>> +       MUX(0, "mout_sclk_ufsunipro20_user", mout_sclk_ufsunipro20_user_p,
>> +               MUX_SEL_FSYS11, 20, 1),
>>         MUX(0, "mout_sclk_mmc1_user", mout_sclk_mmc1_p, MUX_SEL_FSYS11, 24, 1),
>>         MUX(0, "mout_sclk_mmc0_user", mout_sclk_mmc0_p, MUX_SEL_FSYS11, 28, 1),
>> +
>> +       MUX(0, "mout_phyclk_ufs20_rx1_symbol_user",
>> +               mout_phyclk_ufs20_rx1_user_p, MUX_SEL_FSYS12, 16, 1),
>> +       MUX(0, "mout_phyclk_ufs20_rx0_symbol_user",
>> +               mout_phyclk_ufs20_rx0_user_p, MUX_SEL_FSYS12, 24, 1),
>> +       MUX(0, "mout_phyclk_ufs20_tx0_symbol_user",
>> +               mout_phyclk_ufs20_tx0_user_p, MUX_SEL_FSYS12, 28, 1),
>> +};
>> +
>> +static struct samsung_div_clock fsys1_div_clks[] __initdata = {
>> +       DIV(DOUT_PCLK_FSYS1, "dout_pclk_fsys1", "mout_aclk_fsys1_200_user",
>> +               DIV_FSYS1, 0, 2),
>>  };
>>
>>  static struct samsung_gate_clock fsys1_gate_clks[] __initdata = {
>> +       GATE(SCLK_UFSUNIPRO20, "sclk_ufsunipro20_user",
>> +               "mout_sclk_ufsunipro20_user",
>> +               ENABLE_SCLK_FSYS11, 20, 0, 0),
>> +
>>         GATE(ACLK_MMC1, "aclk_mmc1", "mout_aclk_fsys1_200_user",
>>                 ENABLE_ACLK_FSYS1, 29, 0, 0),
>>         GATE(ACLK_MMC0, "aclk_mmc0", "mout_aclk_fsys1_200_user",
>>                 ENABLE_ACLK_FSYS1, 30, 0, 0),
>> +
>> +       GATE(ACLK_UFS20_LINK, "ACLK_UFS20_LINK", "dout_pclk_fsys1",
>> +               ENABLE_ACLK_FSYS1, 31, 0, 0),
>> +       GATE(PCLK_GPIO_FSYS1, "pclk_gpio_fsys1", "mout_aclk_fsys1_200_user",
>> +               ENABLE_PCLK_FSYS1, 30, 0, 0),
>> +
>> +       GATE(PHYCLK_UFS20_RX1_SYMBOL_USER, "phyclk_ufs20_rx1_symbol_user",
>> +               "mout_phyclk_ufs20_rx1_symbol_user",
>> +               ENABLE_SCLK_FSYS12, 16, 0, 0),
>> +       GATE(PHYCLK_UFS20_RX0_SYMBOL_USER, "phyclk_ufs20_rx0_symbol_user",
>> +               "mout_phyclk_ufs20_rx0_symbol_user",
>> +               ENABLE_SCLK_FSYS12, 24, 0, 0),
>> +       GATE(PHYCLK_UFS20_TX0_SYMBOL_USER, "phyclk_ufs20_tx0_symbol_user",
>> +               "mout_phyclk_ufs20_tx0_symbol_user",
>> +               ENABLE_SCLK_FSYS12, 28, 0, 0),
>> +
>> +       GATE(OSCCLK_PHY_CLKOUT_EMBEDDED_COMBO_PHY,
>> +               "oscclk_phy_clkout_embedded_combo_phy",
>> +               "fin_pll",
>> +               ENABLE_SCLK_FSYS12, 4, CLK_IGNORE_UNUSED, 0),
>> +
>> +       GATE(SCLK_COMBO_PHY_EMBEDDED_26M, "sclk_combo_phy_embedded_26m",
>> +               "mout_fsys1_phyclk_sel1",
>> +               ENABLE_SCLK_FSYS13, 24, CLK_IGNORE_UNUSED, 0),
>>  };
>>
>>  static struct samsung_cmu_info fsys1_cmu_info __initdata = {
>> +       .fixed_clks             = fixed_rate_clks_fsys1,
>> +       .nr_fixed_clks          = ARRAY_SIZE(fixed_rate_clks_fsys1),
>>         .mux_clks               = fsys1_mux_clks,
>>         .nr_mux_clks            = ARRAY_SIZE(fsys1_mux_clks),
>> +       .div_clks               = fsys1_div_clks,
>> +       .nr_div_clks            = ARRAY_SIZE(fsys1_div_clks),
>>         .gate_clks              = fsys1_gate_clks,
>>         .nr_gate_clks           = ARRAY_SIZE(fsys1_gate_clks),
>>         .nr_clk_ids             = FSYS1_NR_CLK,
>> diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
>> index e33c75a..c5f7fd0 100644
>> --- a/include/dt-bindings/clock/exynos7-clk.h
>> +++ b/include/dt-bindings/clock/exynos7-clk.h
>> @@ -21,7 +21,11 @@
>>  #define ACLK_MSCL_532                  8
>>  #define DOUT_SCLK_AUD_PLL              9
>>  #define FOUT_AUD_PLL                   10
>> -#define TOPC_NR_CLK                    11
>> +#define SCLK_MFC_PLL_A                 11
>> +#define SCLK_MFC_PLL_B                 12
>> +#define SCLK_BUS1_PLL_A                        13
>> +#define SCLK_BUS1_PLL_B                        14
>> +#define TOPC_NR_CLK                    15
>>
>>  /* TOP0 */
>>  #define DOUT_ACLK_PERIC1               1
>> @@ -49,7 +53,14 @@
>>  #define CLK_SCLK_MMC2                  6
>>  #define CLK_SCLK_MMC1                  7
>>  #define CLK_SCLK_MMC0                  8
>> -#define TOP1_NR_CLK                    9
>> +#define CLK_SCLK_PHY_FSYS1             9
>> +#define CLK_SCLK_PHY_FSYS1_26M         10
>> +#define MOUT_SCLK_UFSUNIPRO20          11
>> +#define DOUT_SCLK_UFSUNIPRO20          12
>> +#define CLK_SCLK_UFSUNIPRO20           13
>> +#define DOUT_SCLK_PHY_FSYS1            15
>> +#define DOUT_SCLK_PHY_FSYS1_26M                16
>> +#define TOP1_NR_CLK                    17
>>
>>  /* CCORE */
>>  #define PCLK_RTC                       1
>> @@ -122,9 +133,22 @@
>>  #define FSYS0_NR_CLK                   11
>>
>>  /* FSYS1 */
>> -#define ACLK_MMC1                      1
>> -#define ACLK_MMC0                      2
>> -#define FSYS1_NR_CLK                   3
>> +#define ACLK_MMC1                              1
>> +#define ACLK_MMC0                              2
>> +#define PHYCLK_UFS20_TX0_SYMBOL                        3
>> +#define PHYCLK_UFS20_RX0_SYMBOL                        4
>> +#define PHYCLK_UFS20_RX1_SYMBOL                        5
>> +#define ACLK_UFS20_LINK                                6
>> +#define SCLK_UFSUNIPRO20                       7
>
> That's confusing ID. You already have "CLK_SCLK_UFSUNIPRO20" and now
> "SCLK_UFSUNIPRO20". From the naming perspective this is the same
> clock... In the same time one has name "sclk_ufsunipro20" and the
> second "sclk_ufsunipro20_user". That's confusing even more :) .
>
Will change these to more meaningful names in next re-spin.
> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
