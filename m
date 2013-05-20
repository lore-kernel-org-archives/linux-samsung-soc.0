From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 1/2] clk: samsung: add support for composite clocks
Date: Mon, 20 May 2013 19:47:07 +0530
Message-ID: <1369059428-26820-2-git-send-email-rahul.sharma@samsung.com>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29032 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756270Ab3ETNxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 09:53:37 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN300CPUNXBN4I0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 May 2013 22:53:36 +0900 (KST)
In-reply-to: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Earlier to CCF, many drivers need access to a common clock which
support gating and/or muxing and/or rate control operations. For
example hdmi which needs to switch between parents and call
enable/disable for "sclk_hdmi".

This patch add support for composite clocks which address above
driver requirements wrt clocks. By using composite clocks, drivers
also need not be modified for different S0Cs. This will handled
inside CCF.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk.c |  149 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk.h |   49 +++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index cd3c40a..fa6ceb2 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -280,6 +280,155 @@ void __init samsung_clk_register_gate(struct samsung_gate_clock *list,
 	}
 }
 
+static void __samsung_clk_register_composite
+		(struct samsung_composite_clock *entry)
+{
+	struct clk *clk = NULL;
+	struct clk_mux *mux = NULL;
+	struct clk_gate *gate = NULL;
+	struct clk_divider *divider = NULL;
+	struct clk_fixed_rate *fixrate = NULL;
+	struct clk_fixed_factor *fixfactor = NULL;
+	struct clk_hw *mux_hw, *gate_hw, *rate_hw;
+	const struct clk_ops *mux_ops, *gate_ops, *rate_ops;
+	unsigned int cf, ret;
+
+	cf = entry->composition_flags;
+	mux_hw = NULL;
+	gate_hw = NULL;
+	rate_hw = NULL;
+	mux_ops = NULL;
+	gate_ops = NULL;
+	rate_ops = NULL;
+
+	/* register a mux clock, if specified */
+	if (cf & SAMSUNG_CLK_TYPE_MUX) {
+		mux = kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
+		if (!mux) {
+			pr_err("%s: fail to allocate mux clk %s\n",
+				__func__, entry->name);
+			goto fail_mux;
+		}
+		mux_hw = &mux->hw;
+		mux_ops = &clk_mux_ops;
+
+		mux->reg = reg_base + entry->mux_clk.offset;
+		mux->shift = entry->mux_clk.shift;
+		mux->mask = entry->mux_clk.width;
+		mux->flags = entry->mux_clk.mux_flags;
+		mux->lock = &lock;
+	}
+
+	/* register a gate clock, if specified */
+	if (cf & SAMSUNG_CLK_TYPE_GATE) {
+		gate = kzalloc(sizeof(struct clk_gate), GFP_KERNEL);
+		if (!gate) {
+			pr_err("%s: fail to allocate gate clk %s\n",
+				__func__, entry->name);
+			goto fail_gate;
+		}
+		gate_hw = &gate->hw;
+		gate_ops = &clk_gate_ops;
+
+		gate->reg = reg_base + entry->gate_clk.offset;
+		gate->bit_idx = entry->gate_clk.bit_idx;
+		gate->flags = entry->gate_clk.gate_flags;
+		gate->lock = &lock;
+	}
+
+	/* register a rate clock, if specified */
+	if (cf & SAMSUNG_CLK_TYPE_DIVIDER) {
+		divider = kzalloc(sizeof(struct clk_divider), GFP_KERNEL);
+		if (!divider) {
+			pr_err("%s: fail to allocate div clk %s\n",
+				__func__, entry->name);
+			goto fail_rate;
+		}
+		rate_hw = &divider->hw;
+		rate_ops = &clk_divider_ops;
+
+		divider->reg = reg_base + entry->div_clk.offset;
+		divider->shift = entry->div_clk.shift;
+		divider->width = entry->div_clk.width;
+		divider->flags = entry->div_clk.div_flags;
+
+	} else if (cf & SAMSUNG_CLK_TYPE_FIXED_FACTOR) {
+		fixfactor = kzalloc(sizeof(struct clk_fixed_factor),
+				GFP_KERNEL);
+		if (!fixfactor) {
+			pr_err("%s: fail to allocate fixfactor clk %s\n",
+				__func__, entry->name);
+			goto fail_rate;
+		}
+		rate_hw = &fixfactor->hw;
+		rate_ops = &clk_fixed_factor_ops;
+
+		fixfactor->mult = entry->fixed_factor_clk.mult;
+		fixfactor->div = entry->fixed_factor_clk.div;
+
+	} else if (cf & SAMSUNG_CLK_TYPE_FIXED_RATE) {
+		fixrate = kzalloc(sizeof(struct clk_fixed_rate),
+				GFP_KERNEL);
+		if (!fixrate) {
+			pr_err("%s: fail to allocate fixrate clk %s\n",
+				__func__, entry->name);
+			goto fail_rate;
+		}
+		rate_hw = &fixrate->hw;
+		rate_ops = &clk_fixed_rate_ops;
+
+		fixrate->fixed_rate = entry->fixed_rate_clk.fixed_rate;
+	}
+
+	clk = clk_register_composite(NULL, entry->name,
+			entry->parent_names, entry->num_parents,
+			mux_hw, mux_ops,
+			rate_hw, rate_ops,
+			gate_hw, gate_ops,
+			CLK_IS_ROOT);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register clock %s\n", __func__,
+			entry->name);
+		goto fail_clk_register;
+	}
+
+	/* register a clock lookup only if a clock alias is specified */
+	if (entry->alias) {
+		ret = clk_register_clkdev(clk, entry->alias,
+			entry->dev_name);
+		if (ret)
+			pr_err("%s: failed to register lookup %s\n",
+					__func__, entry->alias);
+		goto fail_clk_register;
+	}
+
+	samsung_clk_add_lookup(clk, entry->id);
+	return;
+
+fail_clk_register:
+	kfree(divider);
+	kfree(fixfactor);
+	kfree(fixrate);
+fail_rate:
+	kfree(gate);
+fail_gate:
+	kfree(mux);
+fail_mux:
+	pr_err("%s: failed to register composite clock %s\n",
+			__func__, entry->name);
+	return;
+}
+
+/* register a list of composite clocks */
+void __init samsung_clk_register_composite(struct samsung_composite_clock *list,
+						unsigned int nr_clk)
+{
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clk; idx++, list++)
+		__samsung_clk_register_composite(list);
+}
+
 /*
  * obtain the clock speed of all external fixed clock sources from device
  * tree and register it
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index e4ad6ea..d52ada2 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -20,6 +20,16 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
+/*
+ * flags used represent the type of clock.
+ */
+
+#define SAMSUNG_CLK_TYPE_GATE		BIT(0)
+#define SAMSUNG_CLK_TYPE_MUX		BIT(1)
+#define SAMSUNG_CLK_TYPE_DIVIDER	BIT(2)
+#define SAMSUNG_CLK_TYPE_FIXED_FACTOR	BIT(3)
+#define SAMSUNG_CLK_TYPE_FIXED_RATE	BIT(4)
+
 /**
  * struct samsung_clock_alias: information about mux clock
  * @id: platform specific id of the clock.
@@ -249,6 +259,43 @@ struct samsung_gate_clock {
 #define PNAME(x) static const char *x[] __initdata
 
 /**
+ * struct samsung_composite_clock: information about composite clock
+ * @id: platform specific id of the clock.
+ * @dev_name: name of the device to which this clock belongs.
+ * @name: name of this mux clock.
+ * @parent_names: array of pointer to parent clock names.
+ * @num_parents: number of parents listed in @parent_names.
+ * @flags: optional flags for basic clock.
+ * @alias: optional clock alias name to be assigned to this clock.
+ * @composition_flags: mandatory flags represent the components this clock.
+ * @gate_clk: optional component clock of type gate.
+ * @mux_clk: optional component clock of type mux.
+ * @div_clk:  optional component clock of type divider.
+ * @fixed_factor_clk: optional component clock of type fixed factor.
+ * @fixed_rate_clk: optional component clock of type fixed rate.
+ */
+
+struct samsung_composite_clock {
+	unsigned int		id;
+	const char		*dev_name;
+	const char		*name;
+	const char		**parent_names;
+	u8			num_parents;
+	unsigned long		flags;
+	const char		*alias;
+	unsigned long		composition_flags;
+
+	/* gate clock */
+	struct samsung_gate_clock		gate_clk;
+	/* mux clock */
+	struct samsung_mux_clock		mux_clk;
+	/* rate clocks */
+	struct samsung_div_clock		div_clk;
+	struct samsung_fixed_factor_clock	fixed_factor_clk;
+	struct samsung_fixed_rate_clock		fixed_rate_clk;
+};
+
+/**
  * struct samsung_clk_reg_dump: register dump of clock controller registers.
  * @offset: clock register offset from the controller base address.
  * @value: the value to be register at offset.
@@ -281,6 +328,8 @@ extern void __init samsung_clk_register_div(struct samsung_div_clock *clk_list,
 		unsigned int nr_clk);
 extern void __init samsung_clk_register_gate(
 		struct samsung_gate_clock *clk_list, unsigned int nr_clk);
+extern void __init samsung_clk_register_composite(
+		struct samsung_composite_clock *list, unsigned int nr_clk);
 
 extern unsigned long _get_rate(const char *clk_name);
 
-- 
1.7.10.4
