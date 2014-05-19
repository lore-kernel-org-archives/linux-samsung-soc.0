From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v3] clk: exynos5420: Add 5800 specific clocks
Date: Mon, 19 May 2014 14:02:43 +0530
Message-ID: <CALt3h7-ZaNCgPk50jEDmN1qab_x4q52QXUfo7Nnxn0e_MHEG_w@mail.gmail.com>
References: <1400133374-26041-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:64715 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753179AbaESIco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 04:32:44 -0400
Received: by mail-qc0-f171.google.com with SMTP id x13so8510652qcv.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 01:32:43 -0700 (PDT)
In-Reply-To: <1400133374-26041-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arun Kumar <arunkk.samsung@gmail.com>

Hi Tomasz,

Can this patch be taken for the 3.16 merge?

Regards
Arun

On Thu, May 15, 2014 at 11:26 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Exynos5800 clock structure is mostly similar to 5420 with only
> a small delta changes. So the 5420 clock file is re-used for
> 5800 also. The common clocks for both are seggreagated and few
> clocks which are different for both are separately initialized.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
> Changes from v2
> - Rebased on Tomasz's samsung-clk-next branch of
>   samsung-clk [1] tree.
>   [1] git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git
> Changes from v1
> - Rebased on Shaik's clock consolidation for 5420
> - Addressed review comments from Tomasz
> ---
>  .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
>  drivers/clk/samsung/clk-exynos5420.c               |  309 ++++++++++++++++----
>  include/dt-bindings/clock/exynos5420.h             |    4 +
>  3 files changed, 259 insertions(+), 57 deletions(-)
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
> index 1c3674e..9d7d7ee 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -57,15 +57,19 @@
>  #define SRC_TOP5               0x10214
>  #define SRC_TOP6               0x10218
>  #define SRC_TOP7               0x1021c
> +#define SRC_TOP8               0x10220 /* 5800 specific */
> +#define SRC_TOP9               0x10224 /* 5800 specific */
>  #define SRC_DISP10             0x1022c
>  #define SRC_MAU                        0x10240
>  #define SRC_FSYS               0x10244
>  #define SRC_PERIC0             0x10250
>  #define SRC_PERIC1             0x10254
>  #define SRC_ISP                        0x10270
> +#define SRC_CAM                        0x10274 /* 5800 specific */
>  #define SRC_TOP10              0x10280
>  #define SRC_TOP11              0x10284
>  #define SRC_TOP12              0x10288
> +#define SRC_TOP13              0x1028c /* 5800 specific */
>  #define SRC_MASK_TOP2          0x10308
>  #define SRC_MASK_TOP7          0x1031c
>  #define SRC_MASK_DISP10                0x1032c
> @@ -76,6 +80,8 @@
>  #define DIV_TOP0               0x10500
>  #define DIV_TOP1               0x10504
>  #define DIV_TOP2               0x10508
> +#define DIV_TOP8               0x10520 /* 5800 specific */
> +#define DIV_TOP9               0x10524 /* 5800 specific */
>  #define DIV_DISP10             0x1052c
>  #define DIV_MAU                        0x10544
>  #define DIV_FSYS0              0x10548
> @@ -86,6 +92,7 @@
>  #define DIV_PERIC2             0x10560
>  #define DIV_PERIC3             0x10564
>  #define DIV_PERIC4             0x10568
> +#define DIV_CAM                        0x10574 /* 5800 specific */
>  #define SCLK_DIV_ISP0          0x10580
>  #define SCLK_DIV_ISP1          0x10584
>  #define DIV2_RATIO0            0x10590
> @@ -102,6 +109,7 @@
>  #define GATE_TOP_SCLK_ISP      0x10870
>  #define GATE_IP_GSCL0          0x10910
>  #define GATE_IP_GSCL1          0x10920
> +#define GATE_IP_CAM            0x10924 /* 5800 specific */
>  #define GATE_IP_MFC            0x1092c
>  #define GATE_IP_DISP1          0x10928
>  #define GATE_IP_G3D            0x10930
> @@ -123,23 +131,31 @@
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
>  };
>
>  static void __iomem *reg_base;
> +static enum exynos5x_soc exynos5x_soc;
>
>  #ifdef CONFIG_PM_SLEEP
> -static struct samsung_clk_reg_dump *exynos5420_save;
> +static struct samsung_clk_reg_dump *exynos5x_save;
> +static struct samsung_clk_reg_dump *exynos5800_save;
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
> @@ -222,18 +238,37 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
>         DIV_KFC0,
>  };
>
> +static unsigned long exynos5800_clk_regs[] __initdata = {
> +       SRC_TOP8,
> +       SRC_TOP9,
> +       SRC_CAM,
> +       SRC_TOP1,
> +       DIV_TOP8,
> +       DIV_TOP9,
> +       DIV_CAM,
> +       GATE_IP_CAM,
> +};
> +
>  static int exynos5420_clk_suspend(void)
>  {
> -       samsung_clk_save(reg_base, exynos5420_save,
> -                               ARRAY_SIZE(exynos5420_clk_regs));
> +       samsung_clk_save(reg_base, exynos5x_save,
> +                               ARRAY_SIZE(exynos5x_clk_regs));
> +
> +       if (exynos5x_soc == EXYNOS5800)
> +               samsung_clk_save(reg_base, exynos5800_save,
> +                               ARRAY_SIZE(exynos5800_clk_regs));
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
> +
> +       if (exynos5x_soc == EXYNOS5800)
> +               samsung_clk_restore(reg_base, exynos5800_save,
> +                               ARRAY_SIZE(exynos5800_clk_regs));
>  }
>
>  static struct syscore_ops exynos5420_clk_syscore_ops = {
> @@ -243,15 +278,29 @@ static struct syscore_ops exynos5420_clk_syscore_ops = {
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
>         }
>
> +       if (exynos5x_soc == EXYNOS5800) {
> +               exynos5800_save =
> +                       samsung_clk_alloc_reg_dump(exynos5800_clk_regs,
> +                                       ARRAY_SIZE(exynos5800_clk_regs));
> +               if (!exynos5800_save)
> +                       goto err_soc;
> +       }
> +
>         register_syscore_ops(&exynos5420_clk_syscore_ops);
> +       return;
> +err_soc:
> +       kfree(exynos5x_save);
> +       pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
> +               __func__);
> +       return;
>  }
>  #else
>  static void exynos5420_clk_sleep_init(void) {}
> @@ -369,14 +418,43 @@ PNAME(mout_maudio0_p) = {"fin_pll", "maudio_clk", "mout_sclk_dpll",
>                          "mout_sclk_epll", "mout_sclk_rpll"};
>  PNAME(mout_mau_epll_clk_p) = {"mout_sclk_epll", "mout_sclk_dpll",
>                                 "mout_sclk_mpll", "mout_sclk_spll"};
> +/* List of parents specific to exynos5800 */
> +PNAME(mout_epll2_5800_p)       = { "mout_sclk_epll", "ff_dout_epll2" };
> +PNAME(mout_group1_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                               "mout_sclk_mpll", "ff_dout_spll2" };
> +PNAME(mout_group2_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "ff_dout_spll2",
> +                                       "mout_epll2", "mout_sclk_ipll" };
> +PNAME(mout_group3_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "ff_dout_spll2",
> +                                       "mout_epll2" };
> +PNAME(mout_group5_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "mout_sclk_spll" };
> +PNAME(mout_group6_5800_p)      = { "mout_sclk_ipll", "mout_sclk_dpll",
> +                               "mout_sclk_mpll", "ff_dout_spll2" };
> +PNAME(mout_group7_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll", "mout_sclk_spll",
> +                                       "mout_epll2", "mout_sclk_ipll" };
> +PNAME(mout_mau_epll_clk_5800_p)        = { "mout_sclk_epll", "mout_sclk_dpll",
> +                                       "mout_sclk_mpll",
> +                                       "ff_dout_spll2" };
> +PNAME(mout_group8_5800_p)      = { "dout_aclk432_scaler", "dout_sclk_sw" };
> +PNAME(mout_group9_5800_p)      = { "dout_osc_div", "mout_sw_aclk432_scaler" };
> +PNAME(mout_group10_5800_p)     = { "dout_aclk432_cam", "dout_sclk_sw" };
> +PNAME(mout_group11_5800_p)     = { "dout_osc_div", "mout_sw_aclk432_cam" };
> +PNAME(mout_group12_5800_p)     = { "dout_aclkfl1_550_cam", "dout_sclk_sw" };
> +PNAME(mout_group13_5800_p)     = { "dout_osc_div", "mout_sw_aclkfl1_550_cam" };
> +PNAME(mout_group14_5800_p)     = { "dout_aclk550_cam", "dout_sclk_sw" };
> +PNAME(mout_group15_5800_p)     = { "dout_osc_div", "mout_sw_aclk550_cam" };
>
>  /* fixed rate clocks generated outside the soc */
> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_ext_clks[] __initdata = {
> +static struct samsung_fixed_rate_clock
> +               exynos5x_fixed_rate_ext_clks[] __initdata = {
>         FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
>  };
>
>  /* fixed rate clocks generated inside the soc */
> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata = {
> +static struct samsung_fixed_rate_clock exynos5x_fixed_rate_clks[] __initdata = {
>         FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(0, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(0, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
> @@ -384,52 +462,146 @@ static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata =
>         FRATE(0, "sclk_usbh20_scan_clk", NULL, CLK_IS_ROOT, 480000000),
>  };
>
> -static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[] __initdata = {
> +static struct samsung_fixed_factor_clock
> +               exynos5x_fixed_factor_clks[] __initdata = {
>         FFACTOR(0, "ff_hsic_12m", "fin_pll", 1, 2, 0),
>         FFACTOR(0, "ff_sw_aclk66", "mout_sw_aclk66", 1, 2, 0),
>  };
>
> -static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
> -       MUX(0, "mout_user_pclk66_gpio", mout_user_pclk66_gpio_p,
> -                       SRC_TOP7, 4, 1),
> -       MUX(0, "mout_mspll_kfc", mout_mspll_cpu_p, SRC_TOP7, 8, 2),
> -       MUX(0, "mout_mspll_cpu", mout_mspll_cpu_p, SRC_TOP7, 12, 2),
> -       MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_p, SRC_TOP7, 20, 2),
> +static struct samsung_fixed_factor_clock
> +               exynos5800_fixed_factor_clks[] __initdata = {
> +       FFACTOR(0, "ff_dout_epll2", "mout_sclk_epll", 1, 2, 0),
> +       FFACTOR(0, "ff_dout_spll2", "mout_sclk_spll", 1, 2, 0),
> +};
>
> -       MUX(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
> -       MUX(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
> -       MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
> -       MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
> +struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
> +       MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
> +       MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
> +       MUX(0, "mout_aclk400_wcore", mout_group2_5800_p, SRC_TOP0, 16, 3),
> +       MUX(0, "mout_aclk100_noc", mout_group1_5800_p, SRC_TOP0, 20, 2),
> +
> +       MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
> +       MUX(0, "mout_aclk333_432_isp", mout_group6_5800_p, SRC_TOP1, 4, 2),
> +       MUX(0, "mout_aclk333_432_isp0", mout_group6_5800_p, SRC_TOP1, 12, 2),
> +       MUX(0, "mout_aclk266", mout_group5_5800_p, SRC_TOP1, 20, 2),
> +       MUX(0, "mout_aclk333", mout_group1_5800_p, SRC_TOP1, 28, 2),
> +
> +       MUX(0, "mout_aclk400_disp1", mout_group7_5800_p, SRC_TOP2, 4, 3),
> +       MUX(0, "mout_aclk333_g2d", mout_group5_5800_p, SRC_TOP2, 8, 2),
> +       MUX(0, "mout_aclk266_g2d", mout_group5_5800_p, SRC_TOP2, 12, 2),
> +       MUX(0, "mout_aclk300_jpeg", mout_group5_5800_p, SRC_TOP2, 20, 2),
> +       MUX(0, "mout_aclk300_disp1", mout_group5_5800_p, SRC_TOP2, 24, 2),
> +       MUX(0, "mout_aclk300_gscl", mout_group5_5800_p, SRC_TOP2, 28, 2),
> +
> +       MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p, SRC_TOP7,
> +                       20, 2),
> +       MUX(0, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
> +       MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
> +
> +       MUX(0, "mout_aclk550_cam", mout_group3_5800_p, SRC_TOP8, 16, 3),
> +       MUX(0, "mout_aclkfl1_550_cam", mout_group3_5800_p, SRC_TOP8, 20, 3),
> +       MUX(0, "mout_aclk432_cam", mout_group6_5800_p, SRC_TOP8, 24, 2),
> +       MUX(0, "mout_aclk432_scaler", mout_group6_5800_p, SRC_TOP8, 28, 2),
> +
> +       MUX(0, "mout_user_aclk550_cam", mout_group15_5800_p,
> +                                                       SRC_TOP9, 16, 1),
> +       MUX(0, "mout_user_aclkfl1_550_cam", mout_group13_5800_p,
> +                                                       SRC_TOP9, 20, 1),
> +       MUX(0, "mout_user_aclk432_cam", mout_group11_5800_p,
> +                                                       SRC_TOP9, 24, 1),
> +       MUX(0, "mout_user_aclk432_scaler", mout_group9_5800_p,
> +                                                       SRC_TOP9, 28, 1),
> +
> +       MUX(0, "mout_sw_aclk550_cam", mout_group14_5800_p, SRC_TOP13, 16, 1),
> +       MUX(0, "mout_sw_aclkfl1_550_cam", mout_group12_5800_p,
> +                                                       SRC_TOP13, 20, 1),
> +       MUX(0, "mout_sw_aclk432_cam", mout_group10_5800_p,
> +                                                       SRC_TOP13, 24, 1),
> +       MUX(0, "mout_sw_aclk432_scaler", mout_group8_5800_p,
> +                                                       SRC_TOP13, 28, 1),
> +
> +       MUX(0, "mout_fimd1", mout_group2_p, SRC_DISP10, 4, 3),
> +};
>
> +struct samsung_div_clock exynos5800_div_clks[] __initdata = {
> +       DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore", DIV_TOP0, 16, 3),
> +
> +       DIV(0, "dout_aclk550_cam", "mout_aclk550_cam",
> +                               DIV_TOP8, 16, 3),
> +       DIV(0, "dout_aclkfl1_550_cam", "mout_aclkfl1_550_cam",
> +                               DIV_TOP8, 20, 3),
> +       DIV(0, "dout_aclk432_cam", "mout_aclk432_cam",
> +                               DIV_TOP8, 24, 3),
> +       DIV(0, "dout_aclk432_scaler", "mout_aclk432_scaler",
> +                               DIV_TOP8, 28, 3),
> +
> +       DIV(0, "dout_osc_div", "fin_pll", DIV_TOP9, 20, 3),
> +       DIV(0, "dout_sclk_sw", "sclk_spll", DIV_TOP9, 24, 6),
> +};
> +
> +struct samsung_gate_clock exynos5800_gate_clks[] __initdata = {
> +       GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
> +                               GATE_BUS_TOP, 24, 0, 0),
> +       GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
> +                               GATE_BUS_TOP, 27, 0, 0),
> +};
> +
> +struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
> +       MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
> +                               TOP_SPARE2, 4, 1),
>
>         MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
>         MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
> -                       SRC_TOP0, 4, 2, "aclk400_mscl"),
> -       MUX(0, "mout_aclk200", mout_group1_p, SRC_TOP0, 8, 2),
> -       MUX(0, "mout_aclk200_fsys2", mout_group1_p, SRC_TOP0, 12, 2),
> +                               SRC_TOP0, 4, 2, "aclk400_mscl"),
>         MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
>         MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
> -       MUX(0, "mout_pclk200_fsys", mout_group1_p, SRC_TOP0, 24, 2),
> -       MUX(0, "mout_aclk200_fsys", mout_group1_p, SRC_TOP0, 28, 2),
>
>         MUX(0, "mout_aclk333_432_gscl", mout_group4_p, SRC_TOP1, 0, 2),
>         MUX(0, "mout_aclk333_432_isp", mout_group4_p,
> -                       SRC_TOP1, 4, 2),
> -       MUX(0, "mout_aclk66", mout_group1_p, SRC_TOP1, 8, 2),
> +                               SRC_TOP1, 4, 2),
>         MUX(0, "mout_aclk333_432_isp0", mout_group4_p, SRC_TOP1, 12, 2),
>         MUX(0, "mout_aclk266", mout_group1_p, SRC_TOP1, 20, 2),
> -       MUX(0, "mout_aclk166", mout_group1_p, SRC_TOP1, 24, 2),
>         MUX(0, "mout_aclk333", mout_group1_p, SRC_TOP1, 28, 2),
>
>         MUX(0, "mout_aclk400_disp1", mout_group1_p, SRC_TOP2, 4, 2),
>         MUX(0, "mout_aclk333_g2d", mout_group1_p, SRC_TOP2, 8, 2),
>         MUX(0, "mout_aclk266_g2d", mout_group1_p, SRC_TOP2, 12, 2),
> -       MUX(0, "mout_aclk_g3d", mout_group5_p, SRC_TOP2, 16, 1),
>         MUX(0, "mout_aclk300_jpeg", mout_group1_p, SRC_TOP2, 20, 2),
>         MUX(0, "mout_aclk300_disp1", mout_group1_p, SRC_TOP2, 24, 2),
>         MUX(0, "mout_aclk300_gscl", mout_group1_p, SRC_TOP2, 28, 2),
>
> +       MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_p, SRC_TOP7, 20, 2),
> +
> +       MUX(0, "mout_fimd1", mout_group3_p, SRC_DISP10, 4, 1),
> +};
> +
> +struct samsung_div_clock exynos5420_div_clks[] __initdata = {
> +       DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore_bpll",
> +                       DIV_TOP0, 16, 3),
> +};
> +
> +static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
> +       MUX(0, "mout_user_pclk66_gpio", mout_user_pclk66_gpio_p,
> +                       SRC_TOP7, 4, 1),
> +       MUX(0, "mout_mspll_kfc", mout_mspll_cpu_p, SRC_TOP7, 8, 2),
> +       MUX(0, "mout_mspll_cpu", mout_mspll_cpu_p, SRC_TOP7, 12, 2),
> +
> +       MUX(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
> +       MUX(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
> +       MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
> +       MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
> +
> +       MUX(0, "mout_aclk200", mout_group1_p, SRC_TOP0, 8, 2),
> +       MUX(0, "mout_aclk200_fsys2", mout_group1_p, SRC_TOP0, 12, 2),
> +       MUX(0, "mout_pclk200_fsys", mout_group1_p, SRC_TOP0, 24, 2),
> +       MUX(0, "mout_aclk200_fsys", mout_group1_p, SRC_TOP0, 28, 2),
> +
> +       MUX(0, "mout_aclk66", mout_group1_p, SRC_TOP1, 8, 2),
> +       MUX(0, "mout_aclk166", mout_group1_p, SRC_TOP1, 24, 2),
> +
> +       MUX(0, "mout_aclk_g3d", mout_group5_p, SRC_TOP2, 16, 1),
> +
>         MUX(0, "mout_user_aclk400_isp", mout_user_aclk400_isp_p,
>                         SRC_TOP3, 0, 1),
>         MUX(0, "mout_user_aclk400_mscl", mout_user_aclk400_mscl_p,
> @@ -529,15 +701,12 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>                         SRC_TOP12, 28, 1),
>
>         /* DISP1 Block */
> -       MUX(0, "mout_fimd1", mout_group3_p, SRC_DISP10, 4, 1),
>         MUX(0, "mout_mipi1", mout_group2_p, SRC_DISP10, 16, 3),
>         MUX(0, "mout_dp1", mout_group2_p, SRC_DISP10, 20, 3),
>         MUX(0, "mout_pixel", mout_group2_p, SRC_DISP10, 24, 3),
>         MUX(CLK_MOUT_HDMI, "mout_hdmi", mout_hdmi_p, SRC_DISP10, 28, 1),
>         MUX(0, "mout_fimd1_opt", mout_group2_p, SRC_DISP10, 8, 3),
>
> -       MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
> -                       TOP_SPARE2, 4, 1),
>         MUX(0, "mout_fimd1_final", mout_fimd1_final_p, TOP_SPARE2, 8, 1),
>
>         /* MAU Block */
> @@ -574,7 +743,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(0, "mout_isp_sensor", mout_group2_p, SRC_ISP, 28, 3),
>  };
>
> -static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos5x_div_clks[] __initdata = {
>         DIV(0, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
>         DIV(0, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
>         DIV(0, "armclk2", "div_arm", DIV_CPU0, 28, 3),
> @@ -585,8 +754,6 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>         DIV(0, "dout_aclk400_mscl", "mout_aclk400_mscl", DIV_TOP0, 4, 3),
>         DIV(0, "dout_aclk200", "mout_aclk200", DIV_TOP0, 8, 3),
>         DIV(0, "dout_aclk200_fsys2", "mout_aclk200_fsys2", DIV_TOP0, 12, 3),
> -       DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore_bpll",
> -                       DIV_TOP0, 16, 3),
>         DIV(0, "dout_aclk100_noc", "mout_aclk100_noc", DIV_TOP0, 20, 3),
>         DIV(0, "dout_pclk200_fsys", "mout_pclk200_fsys", DIV_TOP0, 24, 3),
>         DIV(0, "dout_aclk200_fsys", "mout_aclk200_fsys", DIV_TOP0, 28, 3),
> @@ -692,7 +859,7 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>                         CLK_SET_RATE_PARENT, 0),
>  };
>
> -static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos5x_gate_clks[] __initdata = {
>         /* G2D */
>         GATE(CLK_MDMA0, "mdma0", "aclk266_g2d", GATE_IP_G2D, 1, 0, 0),
>         GATE(CLK_SSS, "sss", "aclk266_g2d", GATE_IP_G2D, 2, 0, 0),
> @@ -975,7 +1142,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>         GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
>  };
>
> -static struct samsung_pll_clock exynos5420_plls[nr_plls] __initdata = {
> +static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
>         [apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
>                 APLL_CON0, NULL),
>         [cpll] = PLL(pll_2550, CLK_FOUT_CPLL, "fout_cpll", "fin_pll", CPLL_LOCK,
> @@ -1006,7 +1173,8 @@ static struct of_device_id ext_clk_match[] __initdata = {
>  };
>
>  /* register exynos5420 clocks */
> -static void __init exynos5420_clk_init(struct device_node *np)
> +static void __init exynos5x_clk_init(struct device_node *np,
> +               enum exynos5x_soc soc)
>  {
>         struct samsung_clk_provider *ctx;
>
> @@ -1018,27 +1186,56 @@ static void __init exynos5420_clk_init(struct device_node *np)
>                 panic("%s: unable to determine soc\n", __func__);
>         }
>
> +       exynos5x_soc = soc;
> +
>         ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
>         if (!ctx)
>                 panic("%s: unable to allocate context.\n", __func__);
>
> -       samsung_clk_of_register_fixed_ext(ctx, exynos5420_fixed_rate_ext_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
> +       samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
>                         ext_clk_match);
> -       samsung_clk_register_pll(ctx, exynos5420_plls,
> -                       ARRAY_SIZE(exynos5420_plls),
> -                       reg_base);
> -       samsung_clk_register_fixed_rate(ctx, exynos5420_fixed_rate_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_rate_clks));
> -       samsung_clk_register_fixed_factor(ctx, exynos5420_fixed_factor_clks,
> -                       ARRAY_SIZE(exynos5420_fixed_factor_clks));
> -       samsung_clk_register_mux(ctx, exynos5420_mux_clks,
> -                       ARRAY_SIZE(exynos5420_mux_clks));
> -       samsung_clk_register_div(ctx, exynos5420_div_clks,
> -                       ARRAY_SIZE(exynos5420_div_clks));
> -       samsung_clk_register_gate(ctx, exynos5420_gate_clks,
> -                       ARRAY_SIZE(exynos5420_gate_clks));
> +       samsung_clk_register_pll(ctx, exynos5x_plls, ARRAY_SIZE(exynos5x_plls),
> +                                       reg_base);
> +       samsung_clk_register_fixed_rate(ctx, exynos5x_fixed_rate_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_rate_clks));
> +       samsung_clk_register_fixed_factor(ctx, exynos5x_fixed_factor_clks,
> +                       ARRAY_SIZE(exynos5x_fixed_factor_clks));
> +       samsung_clk_register_mux(ctx, exynos5x_mux_clks,
> +                       ARRAY_SIZE(exynos5x_mux_clks));
> +       samsung_clk_register_div(ctx, exynos5x_div_clks,
> +                       ARRAY_SIZE(exynos5x_div_clks));
> +       samsung_clk_register_gate(ctx, exynos5x_gate_clks,
> +                       ARRAY_SIZE(exynos5x_gate_clks));
> +
> +       if (soc == EXYNOS5420) {
> +               samsung_clk_register_mux(ctx, exynos5420_mux_clks,
> +                               ARRAY_SIZE(exynos5420_mux_clks));
> +               samsung_clk_register_div(ctx, exynos5420_div_clks,
> +                               ARRAY_SIZE(exynos5420_div_clks));
> +       } else {
> +               samsung_clk_register_fixed_factor(
> +                               ctx, exynos5800_fixed_factor_clks,
> +                               ARRAY_SIZE(exynos5800_fixed_factor_clks));
> +               samsung_clk_register_mux(ctx, exynos5800_mux_clks,
> +                               ARRAY_SIZE(exynos5800_mux_clks));
> +               samsung_clk_register_div(ctx, exynos5800_div_clks,
> +                               ARRAY_SIZE(exynos5800_div_clks));
> +               samsung_clk_register_gate(ctx, exynos5800_gate_clks,
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
> index 7dd1cc3..97dcb89 100644
> --- a/include/dt-bindings/clock/exynos5420.h
> +++ b/include/dt-bindings/clock/exynos5420.h
> @@ -193,6 +193,10 @@
>  #define CLK_SCLK_ISP_SENSOR0   514
>  #define CLK_SCLK_ISP_SENSOR1   515
>  #define CLK_SCLK_ISP_SENSOR2   516
> +#define CLK_ACLK432_SCALER     517
> +#define CLK_ACLK432_CAM                518
> +#define CLK_ACLK_FL1550_CAM    519
> +#define CLK_ACLK550_CAM                520
>
>  /* mux clocks */
>  #define CLK_MOUT_HDMI          640
> --
> 1.7.9.5
>
