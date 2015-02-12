From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 3/3] clk: Replace explicit clk assignment with __clk_hw_set_clk
Date: Thu, 12 Feb 2015 14:58:30 +0100
Message-ID: <1423749510-14525-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The change in the clk API to return a per-user clock instance, moved
the clock state to struct clk_core so now the struct clk_hw .core field
is used instead of .clk for most operations.

So for hardware clocks that needs to share the same clock state, both
the .core and .clk pointers have to be assigned but currently only the
.clk is set. This leads to NULL pointer dereference when the operations
try to access the hw clock .core. For example, the composite clock rate
and mux components didn't have a .core set which leads to this error:

Unable to handle kernel NULL pointer dereference at virtual address 00000034
pgd = c0004000
[00000034] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-next-20150211-00002-g1fb7f0e1150d #423
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
task: ee480000 ti: ee488000 task.ti: ee488000
PC is at clk_mux_determine_rate_flags+0x14/0x19c
LR is at __clk_mux_determine_rate+0x24/0x2c
pc : [<c03a355c>]    lr : [<c03a3734>]    psr: a0000113
sp : ee489ce8  ip : ee489d84  fp : ee489d84
r10: 0000005c  r9 : 00000001  r8 : 016e3600
r7 : 00000000  r6 : 00000000  r5 : ee442200  r4 : ee440c98
r3 : ffffffff  r2 : 00000000  r1 : 016e3600  r0 : ee440c98
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 4000406a  DAC: 00000015
Process swapper/0 (pid: 1, stack limit = 0xee488210)
Stack: (0xee489ce8 to 0xee48a000)
9ce0:                   00000000 ffffffff 60000113 ee440c98 ee442200 00000000
9d00: 016e3600 ffffffff 00000001 0000005c ee489d84 c03a3734 ee489d80 ee489d84
9d20: 00000000 c048b130 00000400 c03a5798 ee489d80 ee489d84 c0607f60 ffffffea
9d40: 00000001 00000001 ee489d5c c003f844 c06e3340 ee402680 ee440d0c ed935000
9d60: 016e3600 00000003 00000001 0000005c eded3700 c03a11a0 ee489d80 ee489d84
9d80: 016e3600 ee402680 c05b413a eddc9900 016e3600 c03a1228 00000000 ffffffff
9da0: ffffffff eddc9900 016e3600 c03a1c1c ffffffff 016e3600 ed8c6710 c03d6ce4
9dc0: eded3400 00000000 00000000 c03c797c 00000001 0000005c eded3700 eded3700
9de0: 000005e0 00000001 0000005c c03db8ac c06e7e54 c03c8f08 00000000 c06e7e64
9e00: c06b6e74 c06e7f64 000005e0 c06e7df8 c06e5100 00000000 c06e7e6c c06e7f54
9e20: 00000000 00000000 eebd9550 00000000 c06e7da0 c06e7e54 ee7b5010 c06e7da0
9e40: eddc9690 c06e7db4 c06b6e74 00000097 00000000 c03d4398 00000000 ee7b5010
9e60: eebd9550 c06e7da0 00000000 c03db824 ee7b5010 fffffffe c06e7db4 c0299c7c
9e80: ee7b5010 c072a05c 00000000 c0298858 ee7b5010 c06e7db4 ee7b5044 00000000
9ea0: eddc9580 c0298a04 c06e7db4 00000000 c0298978 c02971d4 ee405c78 ee732b40
9ec0: c06e7db4 eded3800 c06d6738 c0298044 c0608300 c06e7db4 00000000 c06e7db4
9ee0: 00000000 c06beb58 c06beb58 c0299024 00000000 c068dd00 00000000 c0008944
9f00: 00000038 c049013c ee462200 c0711920 ee480000 60000113 c06c2cb0 00000000
9f20: 00000000 c06c2cb0 60000113 00000000 ef7fcafc 00000000 c0640194 c00389ec
9f40: c05ec3a8 c063f824 00000006 00000006 c06c2c50 c0696444 00000006 c0696424
9f60: c06ee1c0 c066b588 c06b6e74 00000097 00000000 c066bd44 00000006 00000006
9f80: c066b588 c003d684 00000000 c0481938 00000000 00000000 00000000 00000000
9fa0: 00000000 c0481940 00000000 c000e680 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[<c03a355c>] (clk_mux_determine_rate_flags) from [<c03a3734>] (__clk_mux_determine_rate+0x24/0x2c)
[<c03a3734>] (__clk_mux_determine_rate) from [<c03a5798>] (clk_composite_determine_rate+0xbc/0x238)
[<c03a5798>] (clk_composite_determine_rate) from [<c03a11a0>] (clk_core_round_rate_nolock+0x5c/0x9c)
[<c03a11a0>] (clk_core_round_rate_nolock) from [<c03a1228>] (__clk_round_rate+0x38/0x40)
[<c03a1228>] (__clk_round_rate) from [<c03a1c1c>] (clk_round_rate+0x20/0x38)
[<c03a1c1c>] (clk_round_rate) from [<c03d6ce4>] (max98090_dai_set_sysclk+0x34/0x118)
[<c03d6ce4>] (max98090_dai_set_sysclk) from [<c03c797c>] (snd_soc_dai_set_sysclk+0x38/0x80)
[<c03c797c>] (snd_soc_dai_set_sysclk) from [<c03db8ac>] (snow_late_probe+0x24/0x48)
[<c03db8ac>] (snow_late_probe) from [<c03c8f08>] (snd_soc_register_card+0xf04/0x1070)
[<c03c8f08>] (snd_soc_register_card) from [<c03d4398>] (devm_snd_soc_register_card+0x30/0x64)
[<c03d4398>] (devm_snd_soc_register_card) from [<c03db824>] (snow_probe+0x68/0xcc)
[<c03db824>] (snow_probe) from [<c0299c7c>] (platform_drv_probe+0x48/0x98)
[<c0299c7c>] (platform_drv_probe) from [<c0298858>] (driver_probe_device+0x114/0x234)
[<c0298858>] (driver_probe_device) from [<c0298a04>] (__driver_attach+0x8c/0x90)
[<c0298a04>] (__driver_attach) from [<c02971d4>] (bus_for_each_dev+0x54/0x88)
[<c02971d4>] (bus_for_each_dev) from [<c0298044>] (bus_add_driver+0xd8/0x1cc)
[<c0298044>] (bus_add_driver) from [<c0299024>] (driver_register+0x78/0xf4)
[<c0299024>] (driver_register) from [<c0008944>] (do_one_initcall+0x80/0x1d0)
[<c0008944>] (do_one_initcall) from [<c066bd44>] (kernel_init_freeable+0x10c/0x1d8)
[<c066bd44>] (kernel_init_freeable) from [<c0481940>] (kernel_init+0x8/0xe4)
[<c0481940>] (kernel_init) from [<c000e680>] (ret_from_fork+0x14/0x34)
Code: e24dd00c e5907000 e1a08001 e88d000c (e5970034)

The changes were made using the following cocinelle semantic patch:

@i@
@@

@depends on i@
identifier dst;
@@

- dst->clk = hw->clk;
+ __clk_hw_set_clk(dst, hw);

@depends on i@
identifier dst;
@@

- dst->hw.clk = hw->clk;
+ __clk_hw_set_clk(&dst->hw, hw);

Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1:
 - Don't only fix the case of composite clocks but in all the places where a
   struct clk was assigned. Suggested by Stephen Boyd.
 - Use a coccinelle script to automate the replace.
---
 drivers/clk/clk-composite.c    | 20 ++++++++++----------
 drivers/clk/pxa/clk-pxa.c      |  2 +-
 drivers/clk/st/clk-flexgen.c   | 20 ++++++++++----------
 drivers/clk/st/clkgen-mux.c    | 14 +++++++-------
 drivers/clk/tegra/clk-periph.c | 14 +++++++-------
 5 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index dee81b83c4b3..956b7e54fa1c 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -27,7 +27,7 @@ static u8 clk_composite_get_parent(struct clk_hw *hw)
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return mux_ops->get_parent(mux_hw);
 }
@@ -38,7 +38,7 @@ static int clk_composite_set_parent(struct clk_hw *hw, u8 index)
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return mux_ops->set_parent(mux_hw, index);
 }
@@ -50,7 +50,7 @@ static unsigned long clk_composite_recalc_rate(struct clk_hw *hw,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	rate_hw->clk = hw->clk;
+	__clk_hw_set_clk(rate_hw, hw);
 
 	return rate_ops->recalc_rate(rate_hw, parent_rate);
 }
@@ -74,7 +74,7 @@ static long clk_composite_determine_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	if (rate_hw && rate_ops && rate_ops->determine_rate) {
-		rate_hw->clk = hw->clk;
+		__clk_hw_set_clk(rate_hw, hw);
 		return rate_ops->determine_rate(rate_hw, rate, min_rate,
 						max_rate,
 						best_parent_rate,
@@ -120,7 +120,7 @@ static long clk_composite_determine_rate(struct clk_hw *hw, unsigned long rate,
 
 		return best_rate;
 	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
-		mux_hw->clk = hw->clk;
+		__clk_hw_set_clk(mux_hw, hw);
 		return mux_ops->determine_rate(mux_hw, rate, min_rate,
 					       max_rate, best_parent_rate,
 					       best_parent_p);
@@ -137,7 +137,7 @@ static long clk_composite_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	rate_hw->clk = hw->clk;
+	__clk_hw_set_clk(rate_hw, hw);
 
 	return rate_ops->round_rate(rate_hw, rate, prate);
 }
@@ -149,7 +149,7 @@ static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	rate_hw->clk = hw->clk;
+	__clk_hw_set_clk(rate_hw, hw);
 
 	return rate_ops->set_rate(rate_hw, rate, parent_rate);
 }
@@ -160,7 +160,7 @@ static int clk_composite_is_enabled(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	gate_hw->clk = hw->clk;
+	__clk_hw_set_clk(gate_hw, hw);
 
 	return gate_ops->is_enabled(gate_hw);
 }
@@ -171,7 +171,7 @@ static int clk_composite_enable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	gate_hw->clk = hw->clk;
+	__clk_hw_set_clk(gate_hw, hw);
 
 	return gate_ops->enable(gate_hw);
 }
@@ -182,7 +182,7 @@ static void clk_composite_disable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	gate_hw->clk = hw->clk;
+	__clk_hw_set_clk(gate_hw, hw);
 
 	gate_ops->disable(gate_hw);
 }
diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 4e834753ab09..29cee9e8d4d9 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -46,7 +46,7 @@ static unsigned long cken_recalc_rate(struct clk_hw *hw,
 		fix = &pclk->lp;
 	else
 		fix = &pclk->hp;
-	fix->hw.clk = hw->clk;
+	__clk_hw_set_clk(&fix->hw, hw);
 	return clk_fixed_factor_ops.recalc_rate(&fix->hw, parent_rate);
 }
 
diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 3a484b3cb448..bf12a25eb3a2 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -37,8 +37,8 @@ static int flexgen_enable(struct clk_hw *hw)
 	struct clk_hw *pgate_hw = &flexgen->pgate.hw;
 	struct clk_hw *fgate_hw = &flexgen->fgate.hw;
 
-	pgate_hw->clk = hw->clk;
-	fgate_hw->clk = hw->clk;
+	__clk_hw_set_clk(pgate_hw, hw);
+	__clk_hw_set_clk(fgate_hw, hw);
 
 	clk_gate_ops.enable(pgate_hw);
 
@@ -54,7 +54,7 @@ static void flexgen_disable(struct clk_hw *hw)
 	struct clk_hw *fgate_hw = &flexgen->fgate.hw;
 
 	/* disable only the final gate */
-	fgate_hw->clk = hw->clk;
+	__clk_hw_set_clk(fgate_hw, hw);
 
 	clk_gate_ops.disable(fgate_hw);
 
@@ -66,7 +66,7 @@ static int flexgen_is_enabled(struct clk_hw *hw)
 	struct flexgen *flexgen = to_flexgen(hw);
 	struct clk_hw *fgate_hw = &flexgen->fgate.hw;
 
-	fgate_hw->clk = hw->clk;
+	__clk_hw_set_clk(fgate_hw, hw);
 
 	if (!clk_gate_ops.is_enabled(fgate_hw))
 		return 0;
@@ -79,7 +79,7 @@ static u8 flexgen_get_parent(struct clk_hw *hw)
 	struct flexgen *flexgen = to_flexgen(hw);
 	struct clk_hw *mux_hw = &flexgen->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return clk_mux_ops.get_parent(mux_hw);
 }
@@ -89,7 +89,7 @@ static int flexgen_set_parent(struct clk_hw *hw, u8 index)
 	struct flexgen *flexgen = to_flexgen(hw);
 	struct clk_hw *mux_hw = &flexgen->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return clk_mux_ops.set_parent(mux_hw, index);
 }
@@ -124,8 +124,8 @@ unsigned long flexgen_recalc_rate(struct clk_hw *hw,
 	struct clk_hw *fdiv_hw = &flexgen->fdiv.hw;
 	unsigned long mid_rate;
 
-	pdiv_hw->clk = hw->clk;
-	fdiv_hw->clk = hw->clk;
+	__clk_hw_set_clk(pdiv_hw, hw);
+	__clk_hw_set_clk(fdiv_hw, hw);
 
 	mid_rate = clk_divider_ops.recalc_rate(pdiv_hw, parent_rate);
 
@@ -141,8 +141,8 @@ static int flexgen_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long div = 0;
 	int ret = 0;
 
-	pdiv_hw->clk = hw->clk;
-	fdiv_hw->clk = hw->clk;
+	__clk_hw_set_clk(pdiv_hw, hw);
+	__clk_hw_set_clk(fdiv_hw, hw);
 
 	div = clk_best_div(parent_rate, rate);
 
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 79dc40b5cc68..9a15ec344a85 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -94,7 +94,7 @@ static int clkgena_divmux_enable(struct clk_hw *hw)
 	unsigned long timeout;
 	int ret = 0;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	ret = clk_mux_ops.set_parent(mux_hw, genamux->muxsel);
 	if (ret)
@@ -116,7 +116,7 @@ static void clkgena_divmux_disable(struct clk_hw *hw)
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *mux_hw = &genamux->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	clk_mux_ops.set_parent(mux_hw, CKGAX_CLKOPSRC_SWITCH_OFF);
 }
@@ -126,7 +126,7 @@ static int clkgena_divmux_is_enabled(struct clk_hw *hw)
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *mux_hw = &genamux->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return (s8)clk_mux_ops.get_parent(mux_hw) > 0;
 }
@@ -136,7 +136,7 @@ u8 clkgena_divmux_get_parent(struct clk_hw *hw)
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *mux_hw = &genamux->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	genamux->muxsel = clk_mux_ops.get_parent(mux_hw);
 	if ((s8)genamux->muxsel < 0) {
@@ -174,7 +174,7 @@ unsigned long clkgena_divmux_recalc_rate(struct clk_hw *hw,
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *div_hw = &genamux->div[genamux->muxsel].hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return clk_divider_ops.recalc_rate(div_hw, parent_rate);
 }
@@ -185,7 +185,7 @@ static int clkgena_divmux_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *div_hw = &genamux->div[genamux->muxsel].hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return clk_divider_ops.set_rate(div_hw, rate, parent_rate);
 }
@@ -196,7 +196,7 @@ static long clkgena_divmux_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *div_hw = &genamux->div[genamux->muxsel].hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return clk_divider_ops.round_rate(div_hw, rate, prate);
 }
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 9e899c18af86..d84ae49d0e05 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -28,7 +28,7 @@ static u8 clk_periph_get_parent(struct clk_hw *hw)
 	const struct clk_ops *mux_ops = periph->mux_ops;
 	struct clk_hw *mux_hw = &periph->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return mux_ops->get_parent(mux_hw);
 }
@@ -39,7 +39,7 @@ static int clk_periph_set_parent(struct clk_hw *hw, u8 index)
 	const struct clk_ops *mux_ops = periph->mux_ops;
 	struct clk_hw *mux_hw = &periph->mux.hw;
 
-	mux_hw->clk = hw->clk;
+	__clk_hw_set_clk(mux_hw, hw);
 
 	return mux_ops->set_parent(mux_hw, index);
 }
@@ -51,7 +51,7 @@ static unsigned long clk_periph_recalc_rate(struct clk_hw *hw,
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return div_ops->recalc_rate(div_hw, parent_rate);
 }
@@ -63,7 +63,7 @@ static long clk_periph_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return div_ops->round_rate(div_hw, rate, prate);
 }
@@ -75,7 +75,7 @@ static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
 
-	div_hw->clk = hw->clk;
+	__clk_hw_set_clk(div_hw, hw);
 
 	return div_ops->set_rate(div_hw, rate, parent_rate);
 }
@@ -86,7 +86,7 @@ static int clk_periph_is_enabled(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = periph->gate_ops;
 	struct clk_hw *gate_hw = &periph->gate.hw;
 
-	gate_hw->clk = hw->clk;
+	__clk_hw_set_clk(gate_hw, hw);
 
 	return gate_ops->is_enabled(gate_hw);
 }
@@ -97,7 +97,7 @@ static int clk_periph_enable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = periph->gate_ops;
 	struct clk_hw *gate_hw = &periph->gate.hw;
 
-	gate_hw->clk = hw->clk;
+	__clk_hw_set_clk(gate_hw, hw);
 
 	return gate_ops->enable(gate_hw);
 }
-- 
2.1.3
