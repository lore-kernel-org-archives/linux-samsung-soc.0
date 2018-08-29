From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] clk: s2mps11: Fix matching when built as module and DT node contains compatible
Date: Wed, 29 Aug 2018 21:20:10 +0200
Message-ID: <20180829192010.14182-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

When driver is built as module and DT node contains clocks compatible
(e.g. "samsung,s2mps11-clk"), the module will not be autoloaded because
module aliases won't match.

The modalias from uevent: of:NclocksT<NULL>Csamsung,s2mps11-clk
The modalias from driver: platform:s2mps11-clk

The devices are instantiated by parent's MFD.  However both Device Tree
bindings and parent define the compatible for clocks devices.  In case
of module matching this DT compatible will be used.

The issue will not happen if this is a built-in (no need for module
matching) or when clocks DT node does not contain compatible (not
correct from bindings perspective but working for driver).

Note when backporting to stable kernels: adjust the list of device ID
entries.

Cc: <stable@vger.kernel.org>
Fixes: 53c31b3437a6 ("mfd: sec-core: Add of_compatible strings for clock MFD cells")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Add Stephen's ack.
2. Minor language changes to comment.


Stephen, can you apply it to clk tree? I think you acked it so I could take
it... but anyway I cannot combine it with DT changes.

---
 drivers/clk/clk-s2mps11.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d44e0eea31ec..0934d3724495 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -245,6 +245,36 @@ static const struct platform_device_id s2mps11_clk_id[] = {
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
 
+#ifdef CONFIG_OF
+/*
+ * Device is instantiated through parent MFD device and device matching is done
+ * through platform_device_id.
+ *
+ * However if device's DT node contains proper clock compatible and driver is
+ * built as a module, then the *module* matching will be done trough DT aliases.
+ * This requires of_device_id table.  In the same time this will not change the
+ * actual *device* matching so do not add .of_match_table.
+ */
+static const struct of_device_id s2mps11_dt_match[] = {
+	{
+		.compatible = "samsung,s2mps11-clk",
+		.data = (void *)S2MPS11X,
+	}, {
+		.compatible = "samsung,s2mps13-clk",
+		.data = (void *)S2MPS13X,
+	}, {
+		.compatible = "samsung,s2mps14-clk",
+		.data = (void *)S2MPS14X,
+	}, {
+		.compatible = "samsung,s5m8767-clk",
+		.data = (void *)S5M8767X,
+	}, {
+		/* Sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, s2mps11_dt_match);
+#endif
+
 static struct platform_driver s2mps11_clk_driver = {
 	.driver = {
 		.name  = "s2mps11-clk",
-- 
2.14.1
