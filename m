From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] clk: make several parent names const
Date: Thu, 28 May 2015 10:45:51 +0200
Message-ID: <1432802751-6397-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57908 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbE1Iqg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 04:46:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Since commit 2893c379461a ("clk: make strings in parent name arrays
const") the name of parent clocks can be const. So add more const in
several clock drivers.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

commit 2893c379461a isn't in Linus Torvald's tree yet, so the commit
message needs adaption if clk-next is rewritten.

Should I split this patch per subdir?

Best regards
Uwe

 drivers/clk/hisilicon/clk-hi3620.c   | 70 ++++++++++++++--------------
 drivers/clk/hisilicon/clk-hix5hd2.c  |  6 +--
 drivers/clk/hisilicon/clk.h          |  2 +-
 drivers/clk/mxs/clk-imx23.c          | 12 ++---
 drivers/clk/mxs/clk-imx28.c          | 18 ++++----
 drivers/clk/mxs/clk.h                |  2 +-
 drivers/clk/pxa/clk-pxa.h            |  2 +-
 drivers/clk/rockchip/clk-cpu.c       |  2 +-
 drivers/clk/rockchip/clk-mmc-phase.c |  2 +-
 drivers/clk/rockchip/clk-pll.c       |  8 ++--
 drivers/clk/rockchip/clk.c           |  8 ++--
 drivers/clk/rockchip/clk.h           | 20 ++++----
 drivers/clk/samsung/clk-pll.c        |  4 +-
 drivers/clk/samsung/clk-s5pv210.c    | 88 ++++++++++++++++++----------=
--------
 drivers/clk/samsung/clk.c            | 13 +++---
 drivers/clk/samsung/clk.h            | 18 ++++----
 drivers/clk/zynq/clkc.c              | 25 ++++++----
 17 files changed, 154 insertions(+), 146 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon=
/clk-hi3620.c
index 472dd2cb10b3..715d34a5ef9b 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -38,44 +38,44 @@
 #include "clk.h"
=20
 /* clock parent list */
-static const char *timer0_mux_p[] __initdata =3D { "osc32k", "timerclk=
01", };
-static const char *timer1_mux_p[] __initdata =3D { "osc32k", "timerclk=
01", };
-static const char *timer2_mux_p[] __initdata =3D { "osc32k", "timerclk=
23", };
-static const char *timer3_mux_p[] __initdata =3D { "osc32k", "timerclk=
23", };
-static const char *timer4_mux_p[] __initdata =3D { "osc32k", "timerclk=
45", };
-static const char *timer5_mux_p[] __initdata =3D { "osc32k", "timerclk=
45", };
-static const char *timer6_mux_p[] __initdata =3D { "osc32k", "timerclk=
67", };
-static const char *timer7_mux_p[] __initdata =3D { "osc32k", "timerclk=
67", };
-static const char *timer8_mux_p[] __initdata =3D { "osc32k", "timerclk=
89", };
-static const char *timer9_mux_p[] __initdata =3D { "osc32k", "timerclk=
89", };
-static const char *uart0_mux_p[] __initdata =3D { "osc26m", "pclk", };
-static const char *uart1_mux_p[] __initdata =3D { "osc26m", "pclk", };
-static const char *uart2_mux_p[] __initdata =3D { "osc26m", "pclk", };
-static const char *uart3_mux_p[] __initdata =3D { "osc26m", "pclk", };
-static const char *uart4_mux_p[] __initdata =3D { "osc26m", "pclk", };
-static const char *spi0_mux_p[] __initdata =3D { "osc26m", "rclk_cfgax=
i", };
-static const char *spi1_mux_p[] __initdata =3D { "osc26m", "rclk_cfgax=
i", };
-static const char *spi2_mux_p[] __initdata =3D { "osc26m", "rclk_cfgax=
i", };
+static const char *const timer0_mux_p[] __initconst =3D { "osc32k", "t=
imerclk01", };
+static const char *const timer1_mux_p[] __initconst =3D { "osc32k", "t=
imerclk01", };
+static const char *const timer2_mux_p[] __initconst =3D { "osc32k", "t=
imerclk23", };
+static const char *const timer3_mux_p[] __initconst =3D { "osc32k", "t=
imerclk23", };
+static const char *const timer4_mux_p[] __initconst =3D { "osc32k", "t=
imerclk45", };
+static const char *const timer5_mux_p[] __initconst =3D { "osc32k", "t=
imerclk45", };
+static const char *const timer6_mux_p[] __initconst =3D { "osc32k", "t=
imerclk67", };
+static const char *const timer7_mux_p[] __initconst =3D { "osc32k", "t=
imerclk67", };
+static const char *const timer8_mux_p[] __initconst =3D { "osc32k", "t=
imerclk89", };
+static const char *const timer9_mux_p[] __initconst =3D { "osc32k", "t=
imerclk89", };
+static const char *const uart0_mux_p[] __initconst =3D { "osc26m", "pc=
lk", };
+static const char *const uart1_mux_p[] __initconst =3D { "osc26m", "pc=
lk", };
+static const char *const uart2_mux_p[] __initconst =3D { "osc26m", "pc=
lk", };
+static const char *const uart3_mux_p[] __initconst =3D { "osc26m", "pc=
lk", };
+static const char *const uart4_mux_p[] __initconst =3D { "osc26m", "pc=
lk", };
+static const char *const spi0_mux_p[] __initconst =3D { "osc26m", "rcl=
k_cfgaxi", };
+static const char *const spi1_mux_p[] __initconst =3D { "osc26m", "rcl=
k_cfgaxi", };
+static const char *const spi2_mux_p[] __initconst =3D { "osc26m", "rcl=
k_cfgaxi", };
 /* share axi parent */
-static const char *saxi_mux_p[] __initdata =3D { "armpll3", "armpll2",=
 };
-static const char *pwm0_mux_p[] __initdata =3D { "osc32k", "osc26m", }=
;
-static const char *pwm1_mux_p[] __initdata =3D { "osc32k", "osc26m", }=
;
-static const char *sd_mux_p[] __initdata =3D { "armpll2", "armpll3", }=
;
-static const char *mmc1_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *mmc1_mux2_p[] __initdata =3D { "osc26m", "mmc1_div"=
, };
-static const char *g2d_mux_p[] __initdata =3D { "armpll2", "armpll3", =
};
-static const char *venc_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *vdec_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *vpp_mux_p[] __initdata =3D { "armpll2", "armpll3", =
};
-static const char *edc0_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *ldi0_mux_p[] __initdata =3D { "armpll2", "armpll4",
+static const char *const saxi_mux_p[] __initconst =3D { "armpll3", "ar=
mpll2", };
+static const char *const pwm0_mux_p[] __initconst =3D { "osc32k", "osc=
26m", };
+static const char *const pwm1_mux_p[] __initconst =3D { "osc32k", "osc=
26m", };
+static const char *const sd_mux_p[] __initconst =3D { "armpll2", "armp=
ll3", };
+static const char *const mmc1_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const mmc1_mux2_p[] __initconst =3D { "osc26m", "mm=
c1_div", };
+static const char *const g2d_mux_p[] __initconst =3D { "armpll2", "arm=
pll3", };
+static const char *const venc_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const vdec_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const vpp_mux_p[] __initconst =3D { "armpll2", "arm=
pll3", };
+static const char *const edc0_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const ldi0_mux_p[] __initconst =3D { "armpll2", "ar=
mpll4",
 					     "armpll3", "armpll5", };
-static const char *edc1_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *ldi1_mux_p[] __initdata =3D { "armpll2", "armpll4",
+static const char *const edc1_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const ldi1_mux_p[] __initconst =3D { "armpll2", "ar=
mpll4",
 					     "armpll3", "armpll5", };
-static const char *rclk_hsic_p[] __initdata =3D { "armpll3", "armpll2"=
, };
-static const char *mmc2_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
-static const char *mmc3_mux_p[] __initdata =3D { "armpll2", "armpll3",=
 };
+static const char *const rclk_hsic_p[] __initconst =3D { "armpll3", "a=
rmpll2", };
+static const char *const mmc2_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
+static const char *const mmc3_mux_p[] __initconst =3D { "armpll2", "ar=
mpll3", };
=20
=20
 /* fixed rate clocks */
diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilico=
n/clk-hix5hd2.c
index f1d239435826..d8915a02c661 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -46,15 +46,15 @@ static struct hisi_fixed_rate_clock hix5hd2_fixed_r=
ate_clks[] __initdata =3D {
 	{ HIX5HD2_FIXED_83M, "83m", NULL, CLK_IS_ROOT, 83333333, },
 };
=20
-static const char *sfc_mux_p[] __initdata =3D {
+static const char *const sfc_mux_p[] __initconst =3D {
 		"24m", "150m", "200m", "100m", "75m", };
 static u32 sfc_mux_table[] =3D {0, 4, 5, 6, 7};
=20
-static const char *sdio_mux_p[] __initdata =3D {
+static const char *const sdio_mux_p[] __initconst =3D {
 		"75m", "100m", "50m", "15m", };
 static u32 sdio_mux_table[] =3D {0, 1, 2, 3};
=20
-static const char *fephy_mux_p[] __initdata =3D { "25m", "125m"};
+static const char *const fephy_mux_p[] __initconst =3D { "25m", "125m"=
};
 static u32 fephy_mux_table[] =3D {0, 1};
=20
=20
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 31083ffc0650..7da3261a90a6 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -55,7 +55,7 @@ struct hisi_fixed_factor_clock {
 struct hisi_mux_clock {
 	unsigned int		id;
 	const char		*name;
-	const char		**parent_names;
+	const char		*const *parent_names;
 	u8			num_parents;
 	unsigned long		flags;
 	unsigned long		offset;
diff --git a/drivers/clk/mxs/clk-imx23.c b/drivers/clk/mxs/clk-imx23.c
index 22d136aa699f..32216f9b7f03 100644
--- a/drivers/clk/mxs/clk-imx23.c
+++ b/drivers/clk/mxs/clk-imx23.c
@@ -77,12 +77,12 @@ static void __init clk_misc_init(void)
 	writel_relaxed(30 << BP_FRAC_IOFRAC, FRAC + SET);
 }
=20
-static const char *sel_pll[]  __initdata =3D { "pll", "ref_xtal", };
-static const char *sel_cpu[]  __initdata =3D { "ref_cpu", "ref_xtal", =
};
-static const char *sel_pix[]  __initdata =3D { "ref_pix", "ref_xtal", =
};
-static const char *sel_io[]   __initdata =3D { "ref_io", "ref_xtal", }=
;
-static const char *cpu_sels[] __initdata =3D { "cpu_pll", "cpu_xtal", =
};
-static const char *emi_sels[] __initdata =3D { "emi_pll", "emi_xtal", =
};
+static const char *const sel_pll[]  __initconst =3D { "pll", "ref_xtal=
", };
+static const char *const sel_cpu[]  __initconst =3D { "ref_cpu", "ref_=
xtal", };
+static const char *const sel_pix[]  __initconst =3D { "ref_pix", "ref_=
xtal", };
+static const char *const sel_io[]   __initconst =3D { "ref_io", "ref_x=
tal", };
+static const char *const cpu_sels[] __initconst =3D { "cpu_pll", "cpu_=
xtal", };
+static const char *const emi_sels[] __initconst =3D { "emi_pll", "emi_=
xtal", };
=20
 enum imx23_clk {
 	ref_xtal, pll, ref_cpu, ref_emi, ref_pix, ref_io, saif_sel,
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index b1be3746ce95..a68670868baa 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -125,15 +125,15 @@ static void __init clk_misc_init(void)
 	writel_relaxed(val, FRAC0);
 }
=20
-static const char *sel_cpu[]  __initdata =3D { "ref_cpu", "ref_xtal", =
};
-static const char *sel_io0[]  __initdata =3D { "ref_io0", "ref_xtal", =
};
-static const char *sel_io1[]  __initdata =3D { "ref_io1", "ref_xtal", =
};
-static const char *sel_pix[]  __initdata =3D { "ref_pix", "ref_xtal", =
};
-static const char *sel_gpmi[] __initdata =3D { "ref_gpmi", "ref_xtal",=
 };
-static const char *sel_pll0[] __initdata =3D { "pll0", "ref_xtal", };
-static const char *cpu_sels[] __initdata =3D { "cpu_pll", "cpu_xtal", =
};
-static const char *emi_sels[] __initdata =3D { "emi_pll", "emi_xtal", =
};
-static const char *ptp_sels[] __initdata =3D { "ref_xtal", "pll0", };
+static const char *const sel_cpu[]  __initconst =3D { "ref_cpu", "ref_=
xtal", };
+static const char *const sel_io0[]  __initconst =3D { "ref_io0", "ref_=
xtal", };
+static const char *const sel_io1[]  __initconst =3D { "ref_io1", "ref_=
xtal", };
+static const char *const sel_pix[]  __initconst =3D { "ref_pix", "ref_=
xtal", };
+static const char *const sel_gpmi[] __initconst =3D { "ref_gpmi", "ref=
_xtal", };
+static const char *const sel_pll0[] __initconst =3D { "pll0", "ref_xta=
l", };
+static const char *const cpu_sels[] __initconst =3D { "cpu_pll", "cpu_=
xtal", };
+static const char *const emi_sels[] __initconst =3D { "emi_pll", "emi_=
xtal", };
+static const char *const ptp_sels[] __initconst =3D { "ref_xtal", "pll=
0", };
=20
 enum imx28_clk {
 	ref_xtal, pll0, pll1, pll2, ref_cpu, ref_emi, ref_io0, ref_io1,
diff --git a/drivers/clk/mxs/clk.h b/drivers/clk/mxs/clk.h
index ef10ad9b5daa..f07d821dd75d 100644
--- a/drivers/clk/mxs/clk.h
+++ b/drivers/clk/mxs/clk.h
@@ -49,7 +49,7 @@ static inline struct clk *mxs_clk_gate(const char *na=
me,
 }
=20
 static inline struct clk *mxs_clk_mux(const char *name, void __iomem *=
reg,
-		u8 shift, u8 width, const char **parent_names, int num_parents)
+		u8 shift, u8 width, const char *const *parent_names, int num_parents=
)
 {
 	return clk_register_mux(NULL, name, parent_names, num_parents,
 				CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index b04c5b9c0ea8..7bf532dca709 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -14,7 +14,7 @@
 #define _CLK_PXA_
=20
 #define PARENTS(name) \
-	static const char *name ## _parents[] __initdata
+	static const char *const name ## _parents[] __initconst
 #define MUX_RO_RATE_RO_OPS(name, clk_name)			\
 	static struct clk_hw name ## _mux_hw;			\
 	static struct clk_hw name ## _rate_hw;			\
diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-=
cpu.c
index 8539c4fd34cc..fb7721bd37e6 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -231,7 +231,7 @@ static int rockchip_cpuclk_notifier_cb(struct notif=
ier_block *nb,
 }
=20
 struct clk *rockchip_clk_register_cpuclk(const char *name,
-			const char **parent_names, u8 num_parents,
+			const char *const *parent_names, u8 num_parents,
 			const struct rockchip_cpuclk_reg_data *reg_data,
 			const struct rockchip_cpuclk_rate_table *rates,
 			int nrates, void __iomem *reg_base, spinlock_t *lock)
diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchi=
p/clk-mmc-phase.c
index c842e3b60f21..e9f8df324e7c 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -120,7 +120,7 @@ static const struct clk_ops rockchip_mmc_clk_ops =3D=
 {
 };
=20
 struct clk *rockchip_clk_register_mmc(const char *name,
-				const char **parent_names, u8 num_parents,
+				const char *const *parent_names, u8 num_parents,
 				void __iomem *reg, int shift)
 {
 	struct clk_init_data init;
diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
index f8d3baf275b2..76027261f7ed 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -329,10 +329,10 @@ static const struct clk_ops rockchip_rk3066_pll_c=
lk_ops =3D {
  */
=20
 struct clk *rockchip_clk_register_pll(enum rockchip_pll_type pll_type,
-		const char *name, const char **parent_names, u8 num_parents,
-		void __iomem *base, int con_offset, int grf_lock_offset,
-		int lock_shift, int mode_offset, int mode_shift,
-		struct rockchip_pll_rate_table *rate_table,
+		const char *name, const char *const *parent_names,
+		u8 num_parents, void __iomem *base, int con_offset,
+		int grf_lock_offset, int lock_shift, int mode_offset,
+		int mode_shift, struct rockchip_pll_rate_table *rate_table,
 		u8 clk_pll_flags, spinlock_t *lock)
 {
 	const char *pll_parents[3];
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index edb5d489ae61..052b94db0ff9 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -39,7 +39,7 @@
  * sometimes without one of those components.
  */
 static struct clk *rockchip_clk_register_branch(const char *name,
-		const char **parent_names, u8 num_parents, void __iomem *base,
+		const char *const *parent_names, u8 num_parents, void __iomem *base,
 		int muxdiv_offset, u8 mux_shift, u8 mux_width, u8 mux_flags,
 		u8 div_shift, u8 div_width, u8 div_flags,
 		struct clk_div_table *div_table, int gate_offset,
@@ -103,8 +103,8 @@ static struct clk *rockchip_clk_register_branch(con=
st char *name,
 }
=20
 static struct clk *rockchip_clk_register_frac_branch(const char *name,
-		const char **parent_names, u8 num_parents, void __iomem *base,
-		int muxdiv_offset, u8 div_flags,
+		const char *const *parent_names, u8 num_parents,
+		void __iomem *base, int muxdiv_offset, u8 div_flags,
 		int gate_offset, u8 gate_shift, u8 gate_flags,
 		unsigned long flags, spinlock_t *lock)
 {
@@ -297,7 +297,7 @@ void __init rockchip_clk_register_branches(
 }
=20
 void __init rockchip_clk_register_armclk(unsigned int lookup_id,
-			const char *name, const char **parent_names,
+			const char *name, const char *const *parent_names,
 			u8 num_parents,
 			const struct rockchip_cpuclk_reg_data *reg_data,
 			const struct rockchip_cpuclk_rate_table *rates,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index e63cafe893e1..6b092673048a 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -108,7 +108,7 @@ struct rockchip_pll_rate_table {
 struct rockchip_pll_clock {
 	unsigned int		id;
 	const char		*name;
-	const char		**parent_names;
+	const char		*const *parent_names;
 	u8			num_parents;
 	unsigned long		flags;
 	int			con_offset;
@@ -140,10 +140,10 @@ struct rockchip_pll_clock {
 	}
=20
 struct clk *rockchip_clk_register_pll(enum rockchip_pll_type pll_type,
-		const char *name, const char **parent_names, u8 num_parents,
-		void __iomem *base, int con_offset, int grf_lock_offset,
-		int lock_shift, int reg_mode, int mode_shift,
-		struct rockchip_pll_rate_table *rate_table,
+		const char *name, const char *const *parent_names,
+		u8 num_parents, void __iomem *base, int con_offset,
+		int grf_lock_offset, int lock_shift, int reg_mode,
+		int mode_shift, struct rockchip_pll_rate_table *rate_table,
 		u8 clk_pll_flags, spinlock_t *lock);
=20
 struct rockchip_cpuclk_clksel {
@@ -173,16 +173,16 @@ struct rockchip_cpuclk_reg_data {
 };
=20
 struct clk *rockchip_clk_register_cpuclk(const char *name,
-			const char **parent_names, u8 num_parents,
+			const char *const *parent_names, u8 num_parents,
 			const struct rockchip_cpuclk_reg_data *reg_data,
 			const struct rockchip_cpuclk_rate_table *rates,
 			int nrates, void __iomem *reg_base, spinlock_t *lock);
=20
 struct clk *rockchip_clk_register_mmc(const char *name,
-				const char **parent_names, u8 num_parents,
+				const char *const *parent_names, u8 num_parents,
 				void __iomem *reg, int shift);
=20
-#define PNAME(x) static const char *x[] __initdata
+#define PNAME(x) static const char *const x[] __initconst
=20
 enum rockchip_clk_branch_type {
 	branch_composite,
@@ -197,7 +197,7 @@ struct rockchip_clk_branch {
 	unsigned int			id;
 	enum rockchip_clk_branch_type	branch_type;
 	const char			*name;
-	const char			**parent_names;
+	const char			*const *parent_names;
 	u8				num_parents;
 	unsigned long			flags;
 	int				muxdiv_offset;
@@ -403,7 +403,7 @@ void rockchip_clk_register_branches(struct rockchip=
_clk_branch *clk_list,
 void rockchip_clk_register_plls(struct rockchip_pll_clock *pll_list,
 				unsigned int nr_pll, int grf_lock_offset);
 void rockchip_clk_register_armclk(unsigned int lookup_id, const char *=
name,
-			const char **parent_names, u8 num_parents,
+			const char *const *parent_names, u8 num_parents,
 			const struct rockchip_cpuclk_reg_data *reg_data,
 			const struct rockchip_cpuclk_rate_table *rates,
 			int nrates);
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pl=
l.c
index 9d70e5c03804..bebc61b5fce1 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1156,7 +1156,7 @@ static const struct clk_ops samsung_pll2650xx_clk=
_min_ops =3D {
 };
=20
 static void __init _samsung_clk_register_pll(struct samsung_clk_provid=
er *ctx,
-				struct samsung_pll_clock *pll_clk,
+				const struct samsung_pll_clock *pll_clk,
 				void __iomem *base)
 {
 	struct samsung_clk_pll *pll;
@@ -1303,7 +1303,7 @@ static void __init _samsung_clk_register_pll(stru=
ct samsung_clk_provider *ctx,
 }
=20
 void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
-			struct samsung_pll_clock *pll_list,
+			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_pll, void __iomem *base)
 {
 	int cnt;
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/cl=
k-s5pv210.c
index e668e479a697..cf7e8fa7b624 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -169,44 +169,44 @@ static inline void s5pv210_clk_sleep_init(void) {=
 }
 #endif
=20
 /* Mux parent lists. */
-static const char *fin_pll_p[] __initdata =3D {
+static const char *const fin_pll_p[] __initconst =3D {
 	"xxti",
 	"xusbxti"
 };
=20
-static const char *mout_apll_p[] __initdata =3D {
+static const char *const mout_apll_p[] __initconst =3D {
 	"fin_pll",
 	"fout_apll"
 };
=20
-static const char *mout_mpll_p[] __initdata =3D {
+static const char *const mout_mpll_p[] __initconst =3D {
 	"fin_pll",
 	"fout_mpll"
 };
=20
-static const char *mout_epll_p[] __initdata =3D {
+static const char *const mout_epll_p[] __initconst =3D {
 	"fin_pll",
 	"fout_epll"
 };
=20
-static const char *mout_vpllsrc_p[] __initdata =3D {
+static const char *const mout_vpllsrc_p[] __initconst =3D {
 	"fin_pll",
 	"sclk_hdmi27m"
 };
=20
-static const char *mout_vpll_p[] __initdata =3D {
+static const char *const mout_vpll_p[] __initconst =3D {
 	"mout_vpllsrc",
 	"fout_vpll"
 };
=20
-static const char *mout_group1_p[] __initdata =3D {
+static const char *const mout_group1_p[] __initconst =3D {
 	"dout_a2m",
 	"mout_mpll",
 	"mout_epll",
 	"mout_vpll"
 };
=20
-static const char *mout_group2_p[] __initdata =3D {
+static const char *const mout_group2_p[] __initconst =3D {
 	"xxti",
 	"xusbxti",
 	"sclk_hdmi27m",
@@ -218,7 +218,7 @@ static const char *mout_group2_p[] __initdata =3D {
 	"mout_vpll",
 };
=20
-static const char *mout_audio0_p[] __initdata =3D {
+static const char *const mout_audio0_p[] __initconst =3D {
 	"xxti",
 	"pcmcdclk0",
 	"sclk_hdmi27m",
@@ -230,7 +230,7 @@ static const char *mout_audio0_p[] __initdata =3D {
 	"mout_vpll",
 };
=20
-static const char *mout_audio1_p[] __initdata =3D {
+static const char *const mout_audio1_p[] __initconst =3D {
 	"i2scdclk1",
 	"pcmcdclk1",
 	"sclk_hdmi27m",
@@ -242,7 +242,7 @@ static const char *mout_audio1_p[] __initdata =3D {
 	"mout_vpll",
 };
=20
-static const char *mout_audio2_p[] __initdata =3D {
+static const char *const mout_audio2_p[] __initconst =3D {
 	"i2scdclk2",
 	"pcmcdclk2",
 	"sclk_hdmi27m",
@@ -254,63 +254,63 @@ static const char *mout_audio2_p[] __initdata =3D=
 {
 	"mout_vpll",
 };
=20
-static const char *mout_spdif_p[] __initdata =3D {
+static const char *const mout_spdif_p[] __initconst =3D {
 	"dout_audio0",
 	"dout_audio1",
 	"dout_audio3",
 };
=20
-static const char *mout_group3_p[] __initdata =3D {
+static const char *const mout_group3_p[] __initconst =3D {
 	"mout_apll",
 	"mout_mpll"
 };
=20
-static const char *mout_group4_p[] __initdata =3D {
+static const char *const mout_group4_p[] __initconst =3D {
 	"mout_mpll",
 	"dout_a2m"
 };
=20
-static const char *mout_flash_p[] __initdata =3D {
+static const char *const mout_flash_p[] __initconst =3D {
 	"dout_hclkd",
 	"dout_hclkp"
 };
=20
-static const char *mout_dac_p[] __initdata =3D {
+static const char *const mout_dac_p[] __initconst =3D {
 	"mout_vpll",
 	"sclk_hdmiphy"
 };
=20
-static const char *mout_hdmi_p[] __initdata =3D {
+static const char *const mout_hdmi_p[] __initconst =3D {
 	"sclk_hdmiphy",
 	"dout_tblk"
 };
=20
-static const char *mout_mixer_p[] __initdata =3D {
+static const char *const mout_mixer_p[] __initconst =3D {
 	"mout_dac",
 	"mout_hdmi"
 };
=20
-static const char *mout_vpll_6442_p[] __initdata =3D {
+static const char *const mout_vpll_6442_p[] __initconst =3D {
 	"fin_pll",
 	"fout_vpll"
 };
=20
-static const char *mout_mixer_6442_p[] __initdata =3D {
+static const char *const mout_mixer_6442_p[] __initconst =3D {
 	"mout_vpll",
 	"dout_mixer"
 };
=20
-static const char *mout_d0sync_6442_p[] __initdata =3D {
+static const char *const mout_d0sync_6442_p[] __initconst =3D {
 	"mout_dsys",
 	"div_apll"
 };
=20
-static const char *mout_d1sync_6442_p[] __initdata =3D {
+static const char *const mout_d1sync_6442_p[] __initconst =3D {
 	"mout_psys",
 	"div_apll"
 };
=20
-static const char *mout_group2_6442_p[] __initdata =3D {
+static const char *const mout_group2_6442_p[] __initconst =3D {
 	"fin_pll",
 	"none",
 	"none",
@@ -322,7 +322,7 @@ static const char *mout_group2_6442_p[] __initdata =
=3D {
 	"mout_vpll",
 };
=20
-static const char *mout_audio0_6442_p[] __initdata =3D {
+static const char *const mout_audio0_6442_p[] __initconst =3D {
 	"fin_pll",
 	"pcmcdclk0",
 	"none",
@@ -334,7 +334,7 @@ static const char *mout_audio0_6442_p[] __initdata =
=3D {
 	"mout_vpll",
 };
=20
-static const char *mout_audio1_6442_p[] __initdata =3D {
+static const char *const mout_audio1_6442_p[] __initconst =3D {
 	"i2scdclk1",
 	"pcmcdclk1",
 	"none",
@@ -347,7 +347,7 @@ static const char *mout_audio1_6442_p[] __initdata =
=3D {
 	"fin_pll",
 };
=20
-static const char *mout_clksel_p[] __initdata =3D {
+static const char *const mout_clksel_p[] __initconst =3D {
 	"fout_apll_clkout",
 	"fout_mpll_clkout",
 	"fout_epll",
@@ -370,7 +370,7 @@ static const char *mout_clksel_p[] __initdata =3D {
 	"div_dclk"
 };
=20
-static const char *mout_clksel_6442_p[] __initdata =3D {
+static const char *const mout_clksel_6442_p[] __initconst =3D {
 	"fout_apll_clkout",
 	"fout_mpll_clkout",
 	"fout_epll",
@@ -393,7 +393,7 @@ static const char *mout_clksel_6442_p[] __initdata =
=3D {
 	"div_dclk"
 };
=20
-static const char *mout_clkout_p[] __initdata =3D {
+static const char *const mout_clkout_p[] __initconst =3D {
 	"dout_clkout",
 	"none",
 	"xxti",
@@ -401,20 +401,20 @@ static const char *mout_clkout_p[] __initdata =3D=
 {
 };
=20
 /* Common fixed factor clocks. */
-static struct samsung_fixed_factor_clock ffactor_clks[] __initdata =3D=
 {
+static const struct samsung_fixed_factor_clock ffactor_clks[] __initco=
nst =3D {
 	FFACTOR(FOUT_APLL_CLKOUT, "fout_apll_clkout", "fout_apll", 1, 4, 0),
 	FFACTOR(FOUT_MPLL_CLKOUT, "fout_mpll_clkout", "fout_mpll", 1, 2, 0),
 	FFACTOR(DOUT_APLL_CLKOUT, "dout_apll_clkout", "dout_apll", 1, 4, 0),
 };
=20
 /* PLL input mux (fin_pll), which needs to be registered before PLLs. =
*/
-static struct samsung_mux_clock early_mux_clks[] __initdata =3D {
+static const struct samsung_mux_clock early_mux_clks[] __initconst =3D=
 {
 	MUX_F(FIN_PLL, "fin_pll", fin_pll_p, OM_STAT, 0, 1,
 					CLK_MUX_READ_ONLY, 0),
 };
=20
 /* Common clock muxes. */
-static struct samsung_mux_clock mux_clks[] __initdata =3D {
+static const struct samsung_mux_clock mux_clks[] __initconst =3D {
 	MUX(MOUT_FLASH, "mout_flash", mout_flash_p, CLK_SRC0, 28, 1),
 	MUX(MOUT_PSYS, "mout_psys", mout_group4_p, CLK_SRC0, 24, 1),
 	MUX(MOUT_DSYS, "mout_dsys", mout_group4_p, CLK_SRC0, 20, 1),
@@ -427,7 +427,7 @@ static struct samsung_mux_clock mux_clks[] __initda=
ta =3D {
 };
=20
 /* S5PV210-specific clock muxes. */
-static struct samsung_mux_clock s5pv210_mux_clks[] __initdata =3D {
+static const struct samsung_mux_clock s5pv210_mux_clks[] __initconst =3D=
 {
 	MUX(MOUT_VPLL, "mout_vpll", mout_vpll_p, CLK_SRC0, 12, 1),
=20
 	MUX(MOUT_VPLLSRC, "mout_vpllsrc", mout_vpllsrc_p, CLK_SRC1, 28, 1),
@@ -472,7 +472,7 @@ static struct samsung_mux_clock s5pv210_mux_clks[] =
__initdata =3D {
 };
=20
 /* S5P6442-specific clock muxes. */
-static struct samsung_mux_clock s5p6442_mux_clks[] __initdata =3D {
+static const struct samsung_mux_clock s5p6442_mux_clks[] __initconst =3D=
 {
 	MUX(MOUT_VPLL, "mout_vpll", mout_vpll_6442_p, CLK_SRC0, 12, 1),
=20
 	MUX(MOUT_FIMD, "mout_fimd", mout_group2_6442_p, CLK_SRC1, 20, 4),
@@ -504,7 +504,7 @@ static struct samsung_mux_clock s5p6442_mux_clks[] =
__initdata =3D {
 };
=20
 /* S5PV210-specific fixed rate clocks generated inside the SoC. */
-static struct samsung_fixed_rate_clock s5pv210_frate_clks[] __initdata=
 =3D {
+static const struct samsung_fixed_rate_clock s5pv210_frate_clks[] __in=
itconst =3D {
 	FRATE(SCLK_HDMI27M, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
 	FRATE(SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
 	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 48000000),
@@ -512,12 +512,12 @@ static struct samsung_fixed_rate_clock s5pv210_fr=
ate_clks[] __initdata =3D {
 };
=20
 /* S5P6442-specific fixed rate clocks generated inside the SoC. */
-static struct samsung_fixed_rate_clock s5p6442_frate_clks[] __initdata=
 =3D {
+static const struct samsung_fixed_rate_clock s5p6442_frate_clks[] __in=
itconst =3D {
 	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 30000000),
 };
=20
 /* Common clock dividers. */
-static struct samsung_div_clock div_clks[] __initdata =3D {
+static const struct samsung_div_clock div_clks[] __initconst =3D {
 	DIV(DOUT_PCLKP, "dout_pclkp", "dout_hclkp", CLK_DIV0, 28, 3),
 	DIV(DOUT_PCLKD, "dout_pclkd", "dout_hclkd", CLK_DIV0, 20, 3),
 	DIV(DOUT_A2M, "dout_a2m", "mout_apll", CLK_DIV0, 4, 3),
@@ -549,7 +549,7 @@ static struct samsung_div_clock div_clks[] __initda=
ta =3D {
 };
=20
 /* S5PV210-specific clock dividers. */
-static struct samsung_div_clock s5pv210_div_clks[] __initdata =3D {
+static const struct samsung_div_clock s5pv210_div_clks[] __initconst =3D=
 {
 	DIV(DOUT_HCLKP, "dout_hclkp", "mout_psys", CLK_DIV0, 24, 4),
 	DIV(DOUT_HCLKD, "dout_hclkd", "mout_dsys", CLK_DIV0, 16, 4),
 	DIV(DOUT_PCLKM, "dout_pclkm", "dout_hclkm", CLK_DIV0, 12, 3),
@@ -578,7 +578,7 @@ static struct samsung_div_clock s5pv210_div_clks[] =
__initdata =3D {
 };
=20
 /* S5P6442-specific clock dividers. */
-static struct samsung_div_clock s5p6442_div_clks[] __initdata =3D {
+static const struct samsung_div_clock s5p6442_div_clks[] __initconst =3D=
 {
 	DIV(DOUT_HCLKP, "dout_hclkp", "mout_d1sync", CLK_DIV0, 24, 4),
 	DIV(DOUT_HCLKD, "dout_hclkd", "mout_d0sync", CLK_DIV0, 16, 4),
=20
@@ -586,7 +586,7 @@ static struct samsung_div_clock s5p6442_div_clks[] =
__initdata =3D {
 };
=20
 /* Common clock gates. */
-static struct samsung_gate_clock gate_clks[] __initdata =3D {
+static const struct samsung_gate_clock gate_clks[] __initconst =3D {
 	GATE(CLK_ROTATOR, "rotator", "dout_hclkd", CLK_GATE_IP0, 29, 0, 0),
 	GATE(CLK_FIMC2, "fimc2", "dout_hclkd", CLK_GATE_IP0, 26, 0, 0),
 	GATE(CLK_FIMC1, "fimc1", "dout_hclkd", CLK_GATE_IP0, 25, 0, 0),
@@ -666,7 +666,7 @@ static struct samsung_gate_clock gate_clks[] __init=
data =3D {
 };
=20
 /* S5PV210-specific clock gates. */
-static struct samsung_gate_clock s5pv210_gate_clks[] __initdata =3D {
+static const struct samsung_gate_clock s5pv210_gate_clks[] __initconst=
 =3D {
 	GATE(CLK_CSIS, "clk_csis", "dout_hclkd", CLK_GATE_IP0, 31, 0, 0),
 	GATE(CLK_MFC, "mfc", "dout_hclkm", CLK_GATE_IP0, 16, 0, 0),
 	GATE(CLK_G2D, "g2d", "dout_hclkd", CLK_GATE_IP0, 12, 0, 0),
@@ -728,7 +728,7 @@ static struct samsung_gate_clock s5pv210_gate_clks[=
] __initdata =3D {
 };
=20
 /* S5P6442-specific clock gates. */
-static struct samsung_gate_clock s5p6442_gate_clks[] __initdata =3D {
+static const struct samsung_gate_clock s5p6442_gate_clks[] __initconst=
 =3D {
 	GATE(CLK_JPEG, "jpeg", "dout_hclkd", CLK_GATE_IP0, 28, 0, 0),
 	GATE(CLK_MFC, "mfc", "dout_hclkd", CLK_GATE_IP0, 16, 0, 0),
 	GATE(CLK_G2D, "g2d", "dout_hclkd", CLK_GATE_IP0, 12, 0, 0),
@@ -748,14 +748,14 @@ static struct samsung_gate_clock s5p6442_gate_clk=
s[] __initdata =3D {
  * Clock aliases for legacy clkdev look-up.
  * NOTE: Needed only to support legacy board files.
  */
-static struct samsung_clock_alias s5pv210_aliases[] =3D {
+static const struct samsung_clock_alias s5pv210_aliases[] __initconst =
=3D {
 	ALIAS(DOUT_APLL, NULL, "armclk"),
 	ALIAS(DOUT_HCLKM, NULL, "hclk_msys"),
 	ALIAS(MOUT_DMC0, NULL, "sclk_dmc0"),
 };
=20
 /* S5PV210-specific PLLs. */
-static struct samsung_pll_clock s5pv210_pll_clks[] __initdata =3D {
+static const struct samsung_pll_clock s5pv210_pll_clks[] __initconst =3D=
 {
 	[apll] =3D PLL(pll_4508, FOUT_APLL, "fout_apll", "fin_pll",
 						APLL_LOCK, APLL_CON0, NULL),
 	[mpll] =3D PLL(pll_4502, FOUT_MPLL, "fout_mpll", "fin_pll",
@@ -767,7 +767,7 @@ static struct samsung_pll_clock s5pv210_pll_clks[] =
__initdata =3D {
 };
=20
 /* S5P6442-specific PLLs. */
-static struct samsung_pll_clock s5p6442_pll_clks[] __initdata =3D {
+static const struct samsung_pll_clock s5p6442_pll_clks[] __initconst =3D=
 {
 	[apll] =3D PLL(pll_4502, FOUT_APLL, "fout_apll", "fin_pll",
 						APLL_LOCK, APLL_CON0, NULL),
 	[mpll] =3D PLL(pll_4502, FOUT_MPLL, "fout_mpll", "fin_pll",
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9e1f88c04fd4..04735921cedf 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -98,7 +98,7 @@ void samsung_clk_add_lookup(struct samsung_clk_provid=
er *ctx, struct clk *clk,
=20
 /* register a list of aliases */
 void __init samsung_clk_register_alias(struct samsung_clk_provider *ct=
x,
-				struct samsung_clock_alias *list,
+				const struct samsung_clock_alias *list,
 				unsigned int nr_clk)
 {
 	struct clk *clk;
@@ -132,7 +132,8 @@ void __init samsung_clk_register_alias(struct samsu=
ng_clk_provider *ctx,
=20
 /* register a list of fixed clocks */
 void __init samsung_clk_register_fixed_rate(struct samsung_clk_provide=
r *ctx,
-		struct samsung_fixed_rate_clock *list, unsigned int nr_clk)
+		const struct samsung_fixed_rate_clock *list,
+		unsigned int nr_clk)
 {
 	struct clk *clk;
 	unsigned int idx, ret;
@@ -161,7 +162,7 @@ void __init samsung_clk_register_fixed_rate(struct =
samsung_clk_provider *ctx,
=20
 /* register a list of fixed factor clocks */
 void __init samsung_clk_register_fixed_factor(struct samsung_clk_provi=
der *ctx,
-		struct samsung_fixed_factor_clock *list, unsigned int nr_clk)
+		const struct samsung_fixed_factor_clock *list, unsigned int nr_clk)
 {
 	struct clk *clk;
 	unsigned int idx;
@@ -181,7 +182,7 @@ void __init samsung_clk_register_fixed_factor(struc=
t samsung_clk_provider *ctx,
=20
 /* register a list of mux clocks */
 void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
-				struct samsung_mux_clock *list,
+				const struct samsung_mux_clock *list,
 				unsigned int nr_clk)
 {
 	struct clk *clk;
@@ -213,7 +214,7 @@ void __init samsung_clk_register_mux(struct samsung=
_clk_provider *ctx,
=20
 /* register a list of div clocks */
 void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
-				struct samsung_div_clock *list,
+				const struct samsung_div_clock *list,
 				unsigned int nr_clk)
 {
 	struct clk *clk;
@@ -252,7 +253,7 @@ void __init samsung_clk_register_div(struct samsung=
_clk_provider *ctx,
=20
 /* register a list of gate clocks */
 void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx=
,
-				struct samsung_gate_clock *list,
+				const struct samsung_gate_clock *list,
 				unsigned int nr_clk)
 {
 	struct clk *clk;
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index e4c75383cea7..b775fc29caa5 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -121,7 +121,7 @@ struct samsung_mux_clock {
 	unsigned int		id;
 	const char		*dev_name;
 	const char		*name;
-	const char		**parent_names;
+	const char		*const *parent_names;
 	u8			num_parents;
 	unsigned long		flags;
 	unsigned long		offset;
@@ -368,28 +368,28 @@ extern void __init samsung_clk_of_register_fixed_=
ext(
 extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
 			struct clk *clk, unsigned int id);
=20
-extern void samsung_clk_register_alias(struct samsung_clk_provider *ct=
x,
-			struct samsung_clock_alias *list,
+extern void __init samsung_clk_register_alias(struct samsung_clk_provi=
der *ctx,
+			const struct samsung_clock_alias *list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_fixed_rate(
 			struct samsung_clk_provider *ctx,
-			struct samsung_fixed_rate_clock *clk_list,
+			const struct samsung_fixed_rate_clock *clk_list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_fixed_factor(
 			struct samsung_clk_provider *ctx,
-			struct samsung_fixed_factor_clock *list,
+			const struct samsung_fixed_factor_clock *list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_mux(struct samsung_clk_provide=
r *ctx,
-			struct samsung_mux_clock *clk_list,
+			const struct samsung_mux_clock *clk_list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_div(struct samsung_clk_provide=
r *ctx,
-			struct samsung_div_clock *clk_list,
+			const struct samsung_div_clock *clk_list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_gate(struct samsung_clk_provid=
er *ctx,
-			struct samsung_gate_clock *clk_list,
+			const struct samsung_gate_clock *clk_list,
 			unsigned int nr_clk);
 extern void __init samsung_clk_register_pll(struct samsung_clk_provide=
r *ctx,
-			struct samsung_pll_clock *pll_list,
+			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
=20
 extern struct samsung_clk_provider __init *samsung_cmu_register_one(
diff --git a/drivers/clk/zynq/clkc.c b/drivers/clk/zynq/clkc.c
index 40cb113be6af..de614384bb44 100644
--- a/drivers/clk/zynq/clkc.c
+++ b/drivers/clk/zynq/clkc.c
@@ -85,22 +85,29 @@ static DEFINE_SPINLOCK(canmioclk_lock);
 static DEFINE_SPINLOCK(dbgclk_lock);
 static DEFINE_SPINLOCK(aperclk_lock);
=20
-static const char *armpll_parents[] __initdata =3D {"armpll_int", "ps_=
clk"};
-static const char *ddrpll_parents[] __initdata =3D {"ddrpll_int", "ps_=
clk"};
-static const char *iopll_parents[] __initdata =3D {"iopll_int", "ps_cl=
k"};
+static const char *const armpll_parents[] __initconst =3D {"armpll_int=
",
+	"ps_clk"};
+static const char *const ddrpll_parents[] __initconst =3D {"ddrpll_int=
",
+	"ps_clk"};
+static const char *const iopll_parents[] __initconst =3D {"iopll_int",
+	"ps_clk"};
 static const char *gem0_mux_parents[] __initdata =3D {"gem0_div1", "du=
mmy_name"};
 static const char *gem1_mux_parents[] __initdata =3D {"gem1_div1", "du=
mmy_name"};
-static const char *can0_mio_mux2_parents[] __initdata =3D {"can0_gate"=
,
+static const char *const can0_mio_mux2_parents[] __initconst =3D {"can=
0_gate",
 	"can0_mio_mux"};
-static const char *can1_mio_mux2_parents[] __initdata =3D {"can1_gate"=
,
+static const char *const can1_mio_mux2_parents[] __initconst =3D {"can=
1_gate",
 	"can1_mio_mux"};
 static const char *dbg_emio_mux_parents[] __initdata =3D {"dbg_div",
 	"dummy_name"};
=20
-static const char *dbgtrc_emio_input_names[] __initdata =3D {"trace_em=
io_clk"};
-static const char *gem0_emio_input_names[] __initdata =3D {"gem0_emio_=
clk"};
-static const char *gem1_emio_input_names[] __initdata =3D {"gem1_emio_=
clk"};
-static const char *swdt_ext_clk_input_names[] __initdata =3D {"swdt_ex=
t_clk"};
+static const char *const dbgtrc_emio_input_names[] __initconst =3D {
+	"trace_emio_clk"};
+static const char *const gem0_emio_input_names[] __initconst =3D {
+	"gem0_emio_clk"};
+static const char *const gem1_emio_input_names[] __initconst =3D {
+	"gem1_emio_clk"};
+static const char *const swdt_ext_clk_input_names[] __initconst =3D {
+	"swdt_ext_clk"};
=20
 static void __init zynq_clk_register_fclk(enum zynq_clk fclk,
 		const char *clk_name, void __iomem *fclk_ctrl_reg,
--=20
2.1.4
