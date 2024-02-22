Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D10168AC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570961; cv=none; b=d50UsfBa/CuCbPIflKre5iTKm5jdf+LQwjPwrny1BQZXG710tyc6G0XqepbQusYjbiEVXEvmWCgWGxsXATFv0PDg8zRV6dR7rP/nHmaqWmZCEpQbFUo5M6WTCN85sGU9PUXOje+PyZkofTuKsTVjmIEypbs1cJVrIqM/x19VDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570961; c=relaxed/simple;
	bh=uZG6rIezhXsyWplCJqZ7/urIXrrd+bul5maJ05GL/rU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XKvQ1v/6RUf40jPkSfbdbipujLbrivsFOdjitxU55d3I8qbLVpEqDDklpX+MNcgOkkNsX0EjNOzAIamK6Ap98qQqPB9MluzjQu+QMz2BDd9hiMwhOGCrJbaFc6rRHMkOudunldkQZUMOT2W3ZVV/C31eSsZPfcdlv/1L/fBEqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSkjnudl; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSkjnudl"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c0467b94c6so4628709b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 19:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570958; x=1709175758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1pfBB+u8QXOb34PTpTkMpZc8xqCfgfeq0PGtHjjjvY=;
        b=KSkjnudlXr3NRs8r1l+qEM7fxY3aolriiy5q3kMcVchEGb8M7m7j06icfYzzhfLAd7
         z56Xywq/4uF22/8pv72lyQIvppI9zkUANar0ozCa73wuNWdnpw9ncB+eN5LbWsZAVhe0
         56HSVLwyuqYvgVWZdRsy9h/U6JlfpXtZOZ2bOUdmcM6uhn/0qS/vTPP9oGf4AU9t/LaN
         OGE7KcnPeSTNnF6HDoGNLO4lxhYB02tv1q770zzbaDiQHVLY12iG0MOOCCuw98/1yb75
         prFo0vDdvwLsF8Grt4wFlSr68y2QmtijqSv7d+3EINC4O1Nwi5nMB4YtSltZsFZ3CyyV
         +HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570958; x=1709175758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1pfBB+u8QXOb34PTpTkMpZc8xqCfgfeq0PGtHjjjvY=;
        b=RaAJxBwBGVyd55xGwAELATBvupRL+ItZ3ggMW2dmzuqoRsZMMfVijop5JxGo/3JDmU
         EHdnz/BDzULKYPWgFDc6sbMSxOhY6dSuH1/hN4kTAi/CPBwvy0oA91nvUckf3aFD21yv
         CCEGSIzQU/29tj9e/HfVdZpQrHhYJwu5WU7w/mkj9guiAoKIOYT9gyXx46aKf+/sXnrP
         td6EGhKhEPa0svB3OeSz4DYbcYlIdfeRX7W+E/uFtXSQ36aTRdDhPhxnEflZXjZPAFrN
         0qFaSiMVEUp520GaAIH7vM68EexOr+0Yc4v9K5ryaNByMKARd6Zxj/nuvfhdl7L8kRfB
         4tGw==
X-Forwarded-Encrypted: i=1; AJvYcCUk+YQFxo8kdU8q/17WDDPBFacgjM8sdGGilsP6hshKgTRWIVFrzXpNkPHRAAEe27qA+Fj7ch0L1Agrv2KAoMjwTuU1U3lJccEH8/8rdgO/IfU=
X-Gm-Message-State: AOJu0YzLw/U6heFaR4pFLUKEIWs0rlIJgelyfBXNTSGUVMNNWmL1si2m
	PTijprZD+grPzYTJMBUGsjHjynn4YIfNvjow84wFIwqJwWA9wetYNCvbYtYX43A=
X-Google-Smtp-Source: AGHT+IFs7TI8/WNQwjC08imFX21rZ3Fe6t1Il+3aP48yWhxzOWcUVNG9WmsJflmZmKAh5mbvd2uhfQ==
X-Received: by 2002:a05:6808:138f:b0:3c1:5515:2599 with SMTP id c15-20020a056808138f00b003c155152599mr14479119oiw.39.1708570957820;
        Wed, 21 Feb 2024 19:02:37 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id ct24-20020a056808361800b003c045697003sm1810987oib.41.2024.02.21.19.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:37 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/15] clk: samsung: Improve clk-cpu.c style
Date: Wed, 21 Feb 2024 21:02:22 -0600
Message-Id: <20240222030235.27815-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222030235.27815-1-semen.protsenko@linaro.org>
References: <20240222030235.27815-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-cpu.c has numerous style issues reported by checkpatch and easily
identified otherwise. Give it some love and fix those warnings where it
makes sense. Also make stabilization time a named constant to get rid of
the magic number in clk-cpu.c.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - none

 drivers/clk/samsung/clk-cpu.c | 65 ++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 3e62ade120c5..e02730776aaa 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -16,18 +16,18 @@
  * of the SoC or supplied after the SoC characterization.
  *
  * The below implementation of the CPU clock allows the rate changes of the CPU
- * clock and the corresponding rate changes of the auxillary clocks of the CPU
+ * clock and the corresponding rate changes of the auxiliary clocks of the CPU
  * domain. The platform clock driver provides a clock register configuration
  * for each configurable rate which is then used to program the clock hardware
- * registers to acheive a fast co-oridinated rate change for all the CPU domain
+ * registers to achieve a fast coordinated rate change for all the CPU domain
  * clocks.
  *
  * On a rate change request for the CPU clock, the rate change is propagated
- * upto the PLL supplying the clock to the CPU domain clock blocks. While the
+ * up to the PLL supplying the clock to the CPU domain clock blocks. While the
  * CPU domain PLL is reconfigured, the CPU domain clocks are driven using an
  * alternate clock source. If required, the alternate clock source is divided
  * down in order to keep the output clock rate within the previous OPP limits.
-*/
+ */
 
 #include <linux/errno.h>
 #include <linux/io.h>
@@ -50,17 +50,19 @@
 #define E5433_DIV_STAT_CPU0	0x500
 #define E5433_DIV_STAT_CPU1	0x504
 
-#define E4210_DIV0_RATIO0_MASK	0x7
-#define E4210_DIV1_HPM_MASK	(0x7 << 4)
-#define E4210_DIV1_COPY_MASK	(0x7 << 0)
-#define E4210_MUX_HPM_MASK	(1 << 20)
+#define E4210_DIV0_RATIO0_MASK	GENMASK(2, 0)
+#define E4210_DIV1_HPM_MASK	GENMASK(6, 4)
+#define E4210_DIV1_COPY_MASK	GENMASK(2, 0)
+#define E4210_MUX_HPM_MASK	BIT(20)
 #define E4210_DIV0_ATB_SHIFT	16
 #define E4210_DIV0_ATB_MASK	(DIV_MASK << E4210_DIV0_ATB_SHIFT)
 
+/* Divider stabilization time, msec */
+#define MAX_STAB_TIME		10
 #define MAX_DIV			8
-#define DIV_MASK		7
-#define DIV_MASK_ALL		0xffffffff
-#define MUX_MASK		7
+#define DIV_MASK		GENMASK(2, 0)
+#define DIV_MASK_ALL		GENMASK(31, 0)
+#define MUX_MASK		GENMASK(2, 0)
 
 /*
  * Helper function to wait until divider(s) have stabilized after the divider
@@ -68,7 +70,7 @@
  */
 static void wait_until_divider_stable(void __iomem *div_reg, unsigned long mask)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(10);
+	unsigned long timeout = jiffies + msecs_to_jiffies(MAX_STAB_TIME);
 
 	do {
 		if (!(readl(div_reg) & mask))
@@ -86,9 +88,9 @@ static void wait_until_divider_stable(void __iomem *div_reg, unsigned long mask)
  * value was changed.
  */
 static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
-					unsigned long mux_value)
+				  unsigned long mux_value)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(10);
+	unsigned long timeout = jiffies + msecs_to_jiffies(MAX_STAB_TIME);
 
 	do {
 		if (((readl(mux_reg) >> mux_pos) & MUX_MASK) == mux_value)
@@ -101,18 +103,18 @@ static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
 	pr_err("%s: re-parenting mux timed-out\n", __func__);
 }
 
-/* common round rate callback useable for all types of CPU clocks */
-static long exynos_cpuclk_round_rate(struct clk_hw *hw,
-			unsigned long drate, unsigned long *prate)
+/* common round rate callback usable for all types of CPU clocks */
+static long exynos_cpuclk_round_rate(struct clk_hw *hw, unsigned long drate,
+				     unsigned long *prate)
 {
 	struct clk_hw *parent = clk_hw_get_parent(hw);
 	*prate = clk_hw_round_rate(parent, drate);
 	return *prate;
 }
 
-/* common recalc rate callback useable for all types of CPU clocks */
+/* common recalc rate callback usable for all types of CPU clocks */
 static unsigned long exynos_cpuclk_recalc_rate(struct clk_hw *hw,
-			unsigned long parent_rate)
+					       unsigned long parent_rate)
 {
 	/*
 	 * The CPU clock output (armclk) rate is the same as its parent
@@ -135,7 +137,7 @@ static const struct clk_ops exynos_cpuclk_clk_ops = {
  * dividers to be programmed.
  */
 static void exynos_set_safe_div(void __iomem *base, unsigned long div,
-					unsigned long mask)
+				unsigned long mask)
 {
 	unsigned long div0;
 
@@ -151,7 +153,6 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 {
 	const struct exynos_cpuclk_cfg_data *cfg_data = cpuclk->cfg;
 	unsigned long alt_prate = clk_hw_get_rate(cpuclk->alt_parent);
-	unsigned long alt_div = 0, alt_div_mask = DIV_MASK;
 	unsigned long div0, div1 = 0, mux_reg;
 	unsigned long flags;
 
@@ -187,6 +188,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	 */
 	if (alt_prate > ndata->old_rate || ndata->old_rate > ndata->new_rate) {
 		unsigned long tmp_rate = min(ndata->old_rate, ndata->new_rate);
+		unsigned long alt_div, alt_div_mask = DIV_MASK;
 
 		alt_div = DIV_ROUND_UP(alt_prate, tmp_rate) - 1;
 		WARN_ON(alt_div >= MAX_DIV);
@@ -215,7 +217,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	if (cpuclk->flags & CLK_CPU_HAS_DIV1) {
 		writel(div1, base + E4210_DIV_CPU1);
 		wait_until_divider_stable(base + E4210_DIV_STAT_CPU1,
-				DIV_MASK_ALL);
+					  DIV_MASK_ALL);
 	}
 
 	spin_unlock_irqrestore(cpuclk->lock, flags);
@@ -263,7 +265,7 @@ static int exynos_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
  * dividers to be programmed.
  */
 static void exynos5433_set_safe_div(void __iomem *base, unsigned long div,
-					unsigned long mask)
+				    unsigned long mask)
 {
 	unsigned long div0;
 
@@ -279,7 +281,6 @@ static int exynos5433_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 {
 	const struct exynos_cpuclk_cfg_data *cfg_data = cpuclk->cfg;
 	unsigned long alt_prate = clk_hw_get_rate(cpuclk->alt_parent);
-	unsigned long alt_div = 0, alt_div_mask = DIV_MASK;
 	unsigned long div0, div1 = 0, mux_reg;
 	unsigned long flags;
 
@@ -309,6 +310,7 @@ static int exynos5433_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	 */
 	if (alt_prate > ndata->old_rate || ndata->old_rate > ndata->new_rate) {
 		unsigned long tmp_rate = min(ndata->old_rate, ndata->new_rate);
+		unsigned long alt_div, alt_div_mask = DIV_MASK;
 
 		alt_div = DIV_ROUND_UP(alt_prate, tmp_rate) - 1;
 		WARN_ON(alt_div >= MAX_DIV);
@@ -358,7 +360,7 @@ static int exynos5433_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
  * notifications of the parent clock of cpuclk.
  */
 static int exynos_cpuclk_notifier_cb(struct notifier_block *nb,
-				unsigned long event, void *data)
+				     unsigned long event, void *data)
 {
 	struct clk_notifier_data *ndata = data;
 	struct exynos_cpuclk *cpuclk;
@@ -381,7 +383,7 @@ static int exynos_cpuclk_notifier_cb(struct notifier_block *nb,
  * notifications of the parent clock of cpuclk.
  */
 static int exynos5433_cpuclk_notifier_cb(struct notifier_block *nb,
-				unsigned long event, void *data)
+					 unsigned long event, void *data)
 {
 	struct clk_notifier_data *ndata = data;
 	struct exynos_cpuclk *cpuclk;
@@ -438,11 +440,10 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	else
 		cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
 
-
 	ret = clk_notifier_register(parent->clk, &cpuclk->clk_nb);
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for %s\n",
-				__func__, name);
+		       __func__, name);
 		goto free_cpuclk;
 	}
 
@@ -454,7 +455,7 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 
 	ret = clk_hw_register(NULL, &cpuclk->hw);
 	if (ret) {
-		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
+		pr_err("%s: could not register cpuclk %s\n", __func__, name);
 		goto free_cpuclk_data;
 	}
 
@@ -482,8 +483,8 @@ void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
 			num_cfgs++;
 
-		exynos_register_cpu_clock(ctx, list->id, list->name, hws[list->parent_id],
-				hws[list->alt_parent_id], list->offset, list->cfg, num_cfgs,
-				list->flags);
+		exynos_register_cpu_clock(ctx, list->id, list->name,
+			hws[list->parent_id], hws[list->alt_parent_id],
+			list->offset, list->cfg, num_cfgs, list->flags);
 	}
 }
-- 
2.39.2

