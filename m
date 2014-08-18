From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v9 1/6] clk: max77686: Add DT include for MAX77686 PMIC clock
Date: Mon, 18 Aug 2014 10:32:59 +0200
Message-ID: <1408350784-15577-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1408350784-15577-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408350784-15577-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a dt-binding include for Maxim 77686
PMIC clock IDs that can be used by both the max77686
clock driver and Device Tree source files.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Mike Turquette <mturquette@linaro.org>
Acked-by: Mike Turquette <mturquette@linaro.org>
---

Changes since v6: None

Changes since v5:
 - Improve wording in commit message. Suggested by Andreas Farber.

Changes since v4: None

Changes since v3:
 - Keep the note that this patch needs another change due wakeup
   ordering problems.
---
 drivers/clk/clk-max77686.c                 |  7 +------
 include/dt-bindings/clock/maxim,max77686.h | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/maxim,max77686.h

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 3d7e8dd..185b611 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -30,12 +30,7 @@
 #include <linux/mutex.h>
 #include <linux/clkdev.h>
 
-enum {
-	MAX77686_CLK_AP = 0,
-	MAX77686_CLK_CP,
-	MAX77686_CLK_PMIC,
-	MAX77686_CLKS_NUM,
-};
+#include <dt-bindings/clock/maxim,max77686.h>
 
 struct max77686_clk {
 	struct max77686_dev *iodev;
diff --git a/include/dt-bindings/clock/maxim,max77686.h b/include/dt-bindings/clock/maxim,max77686.h
new file mode 100644
index 0000000..7b28b09
--- /dev/null
+++ b/include/dt-bindings/clock/maxim,max77686.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2014 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Device Tree binding constants clocks for the Maxim 77686 PMIC.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MAXIM_MAX77686_CLOCK_H
+#define _DT_BINDINGS_CLOCK_MAXIM_MAX77686_CLOCK_H
+
+/* Fixed rate clocks. */
+
+#define MAX77686_CLK_AP		0
+#define MAX77686_CLK_CP		1
+#define MAX77686_CLK_PMIC	2
+
+/* Total number of clocks. */
+#define MAX77686_CLKS_NUM		(MAX77686_CLK_PMIC + 1)
+
+#endif /* _DT_BINDINGS_CLOCK_MAXIM_MAX77686_CLOCK_H */
-- 
2.0.1
