From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/2] clk: samsung: exynos5440: move restart code into clock
 driver
Date: Wed, 01 Oct 2014 11:18:59 +0530
Message-ID: <1412142540-3667-2-git-send-email-pankaj.dubey@samsung.com>
References: <1412142540-3667-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51922 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbaJAFyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 01:54:04 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCR0025Y4E2I340@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Oct 2014 14:54:02 +0900 (KST)
In-reply-to: <1412142540-3667-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, vikas.sajjan@samsung.com, linux@roeck-us.net, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@linaro.org>

Let's register reboot_notifier for Exynos5440 from it's clock driver
for reboot functionality. So that we can cleanup restart hooks from
machine specific file.

CC: Sylwester Nawrocki <s.nawrocki@samsung.com>
CC: Mike Turquette <mturquette@linaro.org>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/exynos.c        |   13 ------------
 drivers/clk/samsung/clk-exynos5440.c |   37 ++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2f2f7b2..d56134a 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -143,19 +143,6 @@ static void exynos_restart(enum reboot_mode mode, const char *cmd)
 	u32 val = 0x1;
 	void __iomem *addr = pmu_base_addr + EXYNOS_SWRESET;
 
-	if (of_machine_is_compatible("samsung,exynos5440")) {
-		u32 status;
-		np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
-
-		addr = of_iomap(np, 0) + 0xbc;
-		status = __raw_readl(addr);
-
-		addr = of_iomap(np, 0) + 0xcc;
-		val = __raw_readl(addr);
-
-		val = (val & 0xffff0000) | (status & 0xffff);
-	}
-
 	__raw_writel(val, addr);
 }
 
diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index 00d1d00..171d3af 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -15,6 +15,8 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/notifier.h>
+#include <linux/reboot.h>
 
 #include "clk.h"
 #include "clk-pll.h"
@@ -89,6 +91,38 @@ static const struct of_device_id ext_clk_match[] __initconst = {
 	{},
 };
 
+static int exynos5440_clk_reboot_notify_handler(struct notifier_block *this,
+		unsigned long code, void *unused)
+{
+	if (code == SYS_RESTART) {
+		struct device_node *np;
+		void __iomem *addr;
+		u32 val, status;
+
+		np = of_find_compatible_node(NULL, NULL,
+				"samsung,exynos5440-clock");
+
+		addr = of_iomap(np, 0) + 0xbc;
+		status = readl_relaxed(addr);
+
+		addr = of_iomap(np, 0) + 0xcc;
+		val = readl_relaxed(addr);
+
+		val = (val & 0xffff0000) | (status & 0xffff);
+
+		writel_relaxed(val, addr);
+	}
+	return NOTIFY_DONE;
+}
+
+/*
+ * Exynos5440 Clock reboot notifier, handles reboot functionality
+ */
+static struct notifier_block exynos5440_clk_reboot_notifier = {
+	.notifier_call = exynos5440_clk_reboot_notify_handler,
+	.priority = 128,
+};
+
 /* register exynos5440 clocks */
 static void __init exynos5440_clk_init(struct device_node *np)
 {
@@ -125,6 +159,9 @@ static void __init exynos5440_clk_init(struct device_node *np)
 
 	samsung_clk_of_add_provider(np, ctx);
 
+	if (register_reboot_notifier(&exynos5440_clk_reboot_notifier))
+		pr_err("exynos5440 clock can't register reboot notifier\n");
+
 	pr_info("Exynos5440: arm_clk = %ldHz\n", _get_rate("arm_clk"));
 	pr_info("exynos5440 clock initialization complete\n");
 }
-- 
1.7.9.5
