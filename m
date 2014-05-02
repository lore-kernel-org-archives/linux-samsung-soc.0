From: Andrew Bresticker <abrestic@google.com>
Subject: Re: [PATCH 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Fri, 2 May 2014 10:51:19 -0700
Message-ID: <CAL1qeaHTuQ1Br=WLt0xd5a-rA0MjzKez0esgKYTpKs9Y8Gnsxw@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:47011 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752711AbaEBRvW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 13:51:22 -0400
Received: by mail-lb0-f182.google.com with SMTP id q8so919419lbi.41
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 May 2014 10:51:19 -0700 (PDT)
In-Reply-To: <1399035821-25096-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, arunkk.samsung@gmail.com

Hi Arun,

On Fri, May 2, 2014 at 6:03 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Exynos5800 clock structure is mostly similar to 5420 with only
> a small delta changes. So the 5420 clock file is re-used for
> 5800 also. The common clocks for both are seggreagated and few
> clocks which are different for both are separately initialized.

As Tomasz mentioned, this will certainly conflict with Shaik and
Rahul's 5420 clock cleanup series.  That series adds/fixes the MAU,
WCORE, and ISP blocks which also have differences from 5420 to 5800.

>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
>  drivers/clk/samsung/clk-exynos5420.c               |  192 +++++++++++++++-----
>  include/dt-bindings/clock/exynos5420.h             |    1 +
>  3 files changed, 150 insertions(+), 46 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> index ca88c97..d54f42c 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> @@ -1,12 +1,13 @@
>  * Samsung Exynos5420 Clock Controller
>
>  The Exynos5420 clock controller generates and supplies clock to various
> -controllers within the Exynos5420 SoC.
> +controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
>
>  Required Properties:
>
>  - compatible: should be one of the following.
>    - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
> +  - "samsung,exynos5800-clock" - controller compatible with Exynos5800 SoC.
>
>  - reg: physical base address of the controller and length of memory mapped
>    region.
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 60b2681..0543cb7 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -51,6 +51,7 @@
>  #define SRC_TOP5               0x10214
>  #define SRC_TOP6               0x10218
>  #define SRC_TOP7               0x1021c
> +#define SRC_TOP9               0x10224 /* 5800 specific */
>  #define SRC_DISP10             0x1022c
>  #define SRC_MAU                        0x10240
>  #define SRC_FSYS               0x10244
> @@ -59,6 +60,7 @@
>  #define SRC_TOP10              0x10280
>  #define SRC_TOP11              0x10284
>  #define SRC_TOP12              0x10288
> +#define SRC_TOP13              0x1028c /* 5800 specific */
>  #define        SRC_MASK_DISP10         0x1032c
>  #define SRC_MASK_FSYS          0x10340
>  #define SRC_MASK_PERIC0                0x10350
> @@ -66,6 +68,7 @@
>  #define DIV_TOP0               0x10500
>  #define DIV_TOP1               0x10504
>  #define DIV_TOP2               0x10508
> +#define DIV_TOP9               0x10524 /* 5800 specific */
>  #define DIV_DISP10             0x1052c
>  #define DIV_MAU                        0x10544
>  #define DIV_FSYS0              0x10548
> @@ -102,8 +105,14 @@
>  #define SRC_KFC                        0x28200
>  #define DIV_KFC0               0x28500
>
> +/* Exynos5x SoC type */
> +enum exynos5x_soc {
> +       EXYNOS5420,
> +       EXYNOS5800,
> +};
> +
>  /* list of PLLs */
> -enum exynos5420_plls {
> +enum exynos5x_plls {
>         apll, cpll, dpll, epll, rpll, ipll, spll, vpll, mpll,
>         bpll, kpll,
>         nr_plls                 /* number of PLLs */
> @@ -112,13 +121,13 @@ enum exynos5420_plls {
>  static void __iomem *reg_base;
>
>  #ifdef CONFIG_PM_SLEEP
> -static struct samsung_clk_reg_dump *exynos5420_save;
> +static struct samsung_clk_reg_dump *exynos5x_save;
>
>  /*
>   * list of controller registers to be saved and restored during a
>   * suspend/resume cycle.
>   */
> -static unsigned long exynos5420_clk_regs[] __initdata = {
> +static unsigned long exynos5x_clk_regs[] __initdata = {
>         SRC_CPU,
>         DIV_CPU0,
>         DIV_CPU1,
> @@ -182,16 +191,16 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
>
>  static int exynos5420_clk_suspend(void)
>  {
> -       samsung_clk_save(reg_base, exynos5420_save,
> -                               ARRAY_SIZE(exynos5420_clk_regs));
> +       samsung_clk_save(reg_base, exynos5x_save,
> +                               ARRAY_SIZE(exynos5x_clk_regs));
>
>         return 0;
>  }
>
>  static void exynos5420_clk_resume(void)
>  {
> -       samsung_clk_restore(reg_base, exynos5420_save,
> -                               ARRAY_SIZE(exynos5420_clk_regs));
> +       samsung_clk_restore(reg_base, exynos5x_save,
> +                               ARRAY_SIZE(exynos5x_clk_regs));
>  }
>
>  static struct syscore_ops exynos5420_clk_syscore_ops = {
> @@ -201,9 +210,9 @@ static struct syscore_ops exynos5420_clk_syscore_ops = {
>
>  static void exynos5420_clk_sleep_init(void)
>  {
> -       exynos5420_save = samsung_clk_alloc_reg_dump(exynos5420_clk_regs,
> -                                       ARRAY_SIZE(exynos5420_clk_regs));
> -       if (!exynos5420_save) {
> +       exynos5x_save = samsung_clk_alloc_reg_dump(exynos5x_clk_regs,
> +                                       ARRAY_SIZE(exynos5x_clk_regs));
> +       if (!exynos5x_save) {
>                 pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
>                         __func__);
>                 return;
> @@ -296,13 +305,29 @@ PNAME(hdmi_p)     = { "dout_hdmi_pixel", "sclk_hdmiphy" };
>  PNAME(maudio0_p)       = { "fin_pll", "maudio_clk", "sclk_dpll", "sclk_mpll",
>                           "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
>
> +/* List of parents specific to exynos5800 */
> +PNAME(mout_epll2_5800_p)       = { "mout_sclk_epll", "ffactor_dout_epll2" };
> +PNAME(mout_group1_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                               "mout_sclk_mpll", "ffactor_dout_spll2" };
> +PNAME(mout_group3_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "ffactor_dout_spll2",
> +                                       "mout_epll2" };
> +PNAME(mout_group5_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "mout_sclk_spll" };
> +PNAME(mout_group6_5800_p)      = { "mout_sclk_ipll", "mout_sclk_dpll",
> +                               "mout_sclk_mpll", "ffactor_dout_spll2" };
> +PNAME(mout_group8_5800_p)      = { "dout_aclk432_scaler", "dout_sclk_sw" };
> +PNAME(mout_group9_5800_p)      = { "dout_osc_div", "mout_sw_aclk432_scaler" };
> +
>  /* fixed rate clocks generated outside the soc */
> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_ext_clks[] __initdata = {
> +static struct
> +samsung_fixed_rate_clock exynos5x_fixed_rate_ext_clks[] __initdata = {
>         FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
>  };
>
>  /* fixed rate clocks generated inside the soc */
> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata = {
> +static struct
> +samsung_fixed_rate_clock exynos5x_fixed_rate_clks[] __initdata = {
>         FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(0, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(0, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
> @@ -310,39 +335,88 @@ static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata =
>         FRATE(0, "sclk_usbh20_scan_clk", NULL, CLK_IS_ROOT, 480000000),
>  };
>
> -static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[] __initdata = {
> +static struct
> +samsung_fixed_factor_clock exynos5x_fixed_factor_clks[] __initdata = {
>         FFACTOR(0, "sclk_hsic_12m", "fin_pll", 1, 2, 0),
>  };
>
> -static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
> -       MUX(0, "mout_mspll_kfc", mspll_cpu_p, SRC_TOP7, 8, 2),
> -       MUX(0, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2),
> -       MUX(0, "mout_apll", apll_p, SRC_CPU, 0, 1),
> -       MUX(0, "mout_cpu", cpu_p, SRC_CPU, 16, 1),
> -       MUX(0, "mout_kpll", kpll_p, SRC_KFC, 0, 1),
> -       MUX(0, "mout_cpu_kfc", kfc_p, SRC_KFC, 16, 1),
> +static struct
> +samsung_fixed_factor_clock exynos5800_fixed_factor_clks[] __initdata = {
> +       FFACTOR(0, "ffactor_dout_epll2", "mout_sclk_epll", 1, 2, 0),
> +       FFACTOR(0, "ffactor_dout_spll2", "mout_sclk_spll", 1, 2, 0),
> +};
> +
> +struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
> +       MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
> +
> +       MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
> +       MUX(0, "mout_aclk266", mout_group5_5800_p, SRC_TOP1, 20, 2),
> +       MUX(0, "mout_aclk333", mout_group1_5800_p, SRC_TOP1, 28, 2),
> +
> +       MUX(0, "mout_aclk333_g2d", mout_group5_5800_p, SRC_TOP2, 8, 2),
> +       MUX(0, "mout_aclk266_g2d", mout_group5_5800_p, SRC_TOP2, 12, 2),
> +       MUX(0, "mout_aclk300_jpeg", mout_group5_5800_p, SRC_TOP2, 20, 2),
> +       MUX(0, "mout_aclk300_disp1", mout_group5_5800_p, SRC_TOP2, 24, 2),
> +       MUX(0, "mout_aclk300_gscl", mout_group5_5800_p, SRC_TOP2, 28, 2),
> +
> +       MUX(0, "sclk_bpll", bpll_p, SRC_TOP7, 24, 1),
> +       MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
> +
> +       MUX(0, "mout_user_aclk432_scaler", mout_group9_5800_p,
> +                                                       SRC_TOP9, 28, 1),
>
> +       MUX(0, "mout_sw_aclk432_scaler", mout_group8_5800_p,
> +                                                       SRC_TOP13, 28, 1),

The aclk432_scaler tree is incomplete - you're missing
mout_aclk432_scaler and dout_aclk432_scaler.  The rest of the CAM
block (aclk432_cam, aclkfl1_550_cam, and aclk550_cam) is also missing,
though I suppose that could go in a later patch.

> +
> +       MUX(0, "mout_fimd1", group2_p, SRC_DISP10, 4, 3),
> +};
> +
> +struct samsung_div_clock exynos5800_div_clks[] __initdata = {
> +       DIV(0, "dout_osc_div", "fin_pll", DIV_TOP9, 20, 3),
> +       DIV(0, "dout_sclk_sw", "sclk_spll", DIV_TOP9, 24, 6),
> +};
> +
> +struct samsung_gate_clock exynos5800_gate_clks[] __initdata = {
> +       GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
> +                       GATE_BUS_TOP, 27, 0, 0),
> +};
> +
> +struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "sclk_bpll", bpll_p, SRC_CDREX, 0, 1),
>
>         MUX_A(0, "mout_aclk400_mscl", group1_p,
>                         SRC_TOP0, 4, 2, "aclk400_mscl"),
> -       MUX(0, "mout_aclk200", group1_p, SRC_TOP0, 8, 2),
> -       MUX(0, "mout_aclk200_fsys2", group1_p, SRC_TOP0, 12, 2),
> -       MUX(0, "mout_aclk200_fsys", group1_p, SRC_TOP0, 28, 2),
>
>         MUX(0, "mout_aclk333_432_gscl", group4_p, SRC_TOP1, 0, 2),
> -       MUX(0, "mout_aclk66", group1_p, SRC_TOP1, 8, 2),
>         MUX(0, "mout_aclk266", group1_p, SRC_TOP1, 20, 2),
> -       MUX(0, "mout_aclk166", group1_p, SRC_TOP1, 24, 2),
>         MUX(0, "mout_aclk333", group1_p, SRC_TOP1, 28, 2),
>
>         MUX(0, "mout_aclk333_g2d", group1_p, SRC_TOP2, 8, 2),
>         MUX(0, "mout_aclk266_g2d", group1_p, SRC_TOP2, 12, 2),
> -       MUX(0, "mout_aclk_g3d", group5_p, SRC_TOP2, 16, 1),
>         MUX(0, "mout_aclk300_jpeg", group1_p, SRC_TOP2, 20, 2),
>         MUX(0, "mout_aclk300_disp1", group1_p, SRC_TOP2, 24, 2),
>         MUX(0, "mout_aclk300_gscl", group1_p, SRC_TOP2, 28, 2),
>
> +       MUX(0, "mout_fimd1", group3_p, SRC_DISP10, 4, 1),
> +};
> +
> +static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
> +       MUX(0, "mout_mspll_kfc", mspll_cpu_p, SRC_TOP7, 8, 2),
> +       MUX(0, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2),
> +       MUX(0, "mout_apll", apll_p, SRC_CPU, 0, 1),
> +       MUX(0, "mout_cpu", cpu_p, SRC_CPU, 16, 1),
> +       MUX(0, "mout_kpll", kpll_p, SRC_KFC, 0, 1),
> +       MUX(0, "mout_cpu_kfc", kfc_p, SRC_KFC, 16, 1),
> +
> +       MUX(0, "mout_aclk200", group1_p, SRC_TOP0, 8, 2),
> +       MUX(0, "mout_aclk200_fsys2", group1_p, SRC_TOP0, 12, 2),
> +       MUX(0, "mout_aclk200_fsys", group1_p, SRC_TOP0, 28, 2),
> +
> +       MUX(0, "mout_aclk66", group1_p, SRC_TOP1, 8, 2),
> +       MUX(0, "mout_aclk166", group1_p, SRC_TOP1, 24, 2),
> +
> +       MUX(0, "mout_aclk_g3d", group5_p, SRC_TOP2, 16, 1),
> +
>         MUX(0, "mout_user_aclk400_mscl", user_aclk400_mscl_p,
>                         SRC_TOP3, 4, 1),
>         MUX_A(0, "mout_aclk200_disp1", aclk200_disp1_p,
> @@ -402,7 +476,6 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "mout_sw_aclk300_gscl", sw_aclk300_gscl_p, SRC_TOP12, 28, 1),
>
>         /* DISP1 Block */
> -       MUX(0, "mout_fimd1", group3_p, SRC_DISP10, 4, 1),
>         MUX(0, "mout_mipi1", group2_p, SRC_DISP10, 16, 3),
>         MUX(0, "mout_dp1", group2_p, SRC_DISP10, 20, 3),
>         MUX(0, "mout_pixel", group2_p, SRC_DISP10, 24, 3),
> @@ -434,7 +507,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "mout_spi2", group2_p, SRC_PERIC1, 28, 3),
>  };
>
> -static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos5x_div_clks[] __initdata = {
>         DIV(0, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
>         DIV(0, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
>         DIV(0, "armclk2", "div_arm", DIV_CPU0, 28, 3),
> @@ -514,7 +587,7 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>         DIV(0, "dout_pre_spi2", "dout_spi2", DIV_PERIC4, 24, 8),
>  };
>
> -static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos5x_gate_clks[] __initdata = {
>         /* TODO: Re-verify the CG bits for all the gate clocks */
>         GATE_A(CLK_MCT, "pclk_st", "aclk66_psgen", GATE_BUS_PERIS1, 2, 0, 0,
>                 "mct"),
> @@ -745,7 +818,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>                 0),
>  };
>
> -static struct samsung_pll_clock exynos5420_plls[nr_plls] __initdata = {
> +static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
>         [apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
>                 APLL_CON0, NULL),
>         [cpll] = PLL(pll_2550, CLK_FOUT_CPLL, "fout_cpll", "fin_pll", CPLL_LOCK,
> @@ -776,7 +849,8 @@ static struct of_device_id ext_clk_match[] __initdata = {
>  };
>
>  /* register exynos5420 clocks */
> -static void __init exynos5420_clk_init(struct device_node *np)
> +static void __init exynos5x_clk_init(struct device_node *np,
> +               enum exynos5x_soc exynos5x_soc)
>  {
>         if (np) {
>                 reg_base = of_iomap(np, 0);
> @@ -787,22 +861,50 @@ static void __init exynos5420_clk_init(struct device_node *np)
>         }
>
>         samsung_clk_init(np, reg_base, CLK_NR_CLKS);
> -       samsung_clk_of_register_fixed_ext(exynos5420_fixed_rate_ext_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
> +
> +       samsung_clk_of_register_fixed_ext(exynos5x_fixed_rate_ext_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
>                         ext_clk_match);
> -       samsung_clk_register_pll(exynos5420_plls, ARRAY_SIZE(exynos5420_plls),
> -                                       reg_base);
> -       samsung_clk_register_fixed_rate(exynos5420_fixed_rate_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_rate_clks));
> -       samsung_clk_register_fixed_factor(exynos5420_fixed_factor_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_factor_clks));
> -       samsung_clk_register_mux(exynos5420_mux_clks,
> -                       ARRAY_SIZE(exynos5420_mux_clks));
> -       samsung_clk_register_div(exynos5420_div_clks,
> -                       ARRAY_SIZE(exynos5420_div_clks));
> -       samsung_clk_register_gate(exynos5420_gate_clks,
> -                       ARRAY_SIZE(exynos5420_gate_clks));
> +       samsung_clk_register_pll(exynos5x_plls,
> +                       ARRAY_SIZE(exynos5x_plls),
> +                       reg_base);
> +       samsung_clk_register_fixed_rate(exynos5x_fixed_rate_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_rate_clks));
> +       samsung_clk_register_fixed_factor(exynos5x_fixed_factor_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_factor_clks));
> +       samsung_clk_register_mux(exynos5x_mux_clks,
> +                       ARRAY_SIZE(exynos5x_mux_clks));
> +       samsung_clk_register_div(exynos5x_div_clks,
> +                       ARRAY_SIZE(exynos5x_div_clks));
> +       samsung_clk_register_gate(exynos5x_gate_clks,
> +                       ARRAY_SIZE(exynos5x_gate_clks));
> +
> +       if (exynos5x_soc == EXYNOS5420) {
> +               samsung_clk_register_mux(exynos5420_mux_clks,
> +                               ARRAY_SIZE(exynos5420_mux_clks));
> +       } else {
> +               samsung_clk_register_fixed_factor(
> +                               exynos5800_fixed_factor_clks,
> +                               ARRAY_SIZE(exynos5800_fixed_factor_clks));
> +               samsung_clk_register_mux(exynos5800_mux_clks,
> +                               ARRAY_SIZE(exynos5800_mux_clks));
> +               samsung_clk_register_div(exynos5800_div_clks,
> +                               ARRAY_SIZE(exynos5800_div_clks));
> +               samsung_clk_register_gate(exynos5800_gate_clks,
> +                               ARRAY_SIZE(exynos5800_gate_clks));
> +       }
>
>         exynos5420_clk_sleep_init();
>  }
> +
> +static void __init exynos5420_clk_init(struct device_node *np)
> +{
> +       exynos5x_clk_init(np, EXYNOS5420);
> +}
>  CLK_OF_DECLARE(exynos5420_clk, "samsung,exynos5420-clock", exynos5420_clk_init);
> +
> +static void __init exynos5800_clk_init(struct device_node *np)
> +{
> +       exynos5x_clk_init(np, EXYNOS5800);
> +}
> +CLK_OF_DECLARE(exynos5800_clk, "samsung,exynos5800-clock", exynos5800_clk_init);
> diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
> index 5eefd88..a8b2e3a 100644
> --- a/include/dt-bindings/clock/exynos5420.h
> +++ b/include/dt-bindings/clock/exynos5420.h
> @@ -175,6 +175,7 @@
>  #define CLK_ACLK_G3D           500
>  #define CLK_G3D                        501
>  #define CLK_SMMU_MIXER         502
> +#define CLK_ACLK432_SCALER     503
>
>  /* mux clocks */
>  #define CLK_MOUT_HDMI          640
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
