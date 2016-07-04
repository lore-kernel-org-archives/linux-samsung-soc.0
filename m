From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 07/10] clk: samsung: make clk-s5pv210-audss explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:17 -0400
Message-ID: <20160704211220.5685-8-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

arch/arm/mach-s5pv210/Kconfig:config ARCH_S5PV210
arch/arm/mach-s5pv210/Kconfig:  bool "Samsung S5PV210/S5PC110" if ARCH_MULTI_V7

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since this code is already not using module_init, case, the init
ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tags etc. since all that information
is already contained at the top of the file in the comments.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/samsung/clk-s5pv210-audss.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index eefb84b22566..c66ed2d1450e 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -18,7 +18,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/s5pv210-audss.h>
@@ -194,20 +194,6 @@ unregister:
 	return ret;
 }
 
-static int s5pv210_audss_clk_remove(struct platform_device *pdev)
-{
-	int i;
-
-	of_clk_del_provider(pdev->dev.of_node);
-
-	for (i = 0; i < clk_data.clk_num; i++) {
-		if (!IS_ERR(clk_table[i]))
-			clk_unregister(clk_table[i]);
-	}
-
-	return 0;
-}
-
 static const struct of_device_id s5pv210_audss_clk_of_match[] = {
 	{ .compatible = "samsung,s5pv210-audss-clock", },
 	{},
@@ -216,10 +202,10 @@ static const struct of_device_id s5pv210_audss_clk_of_match[] = {
 static struct platform_driver s5pv210_audss_clk_driver = {
 	.driver	= {
 		.name = "s5pv210-audss-clk",
+		.suppress_bind_attrs = true,
 		.of_match_table = s5pv210_audss_clk_of_match,
 	},
 	.probe = s5pv210_audss_clk_probe,
-	.remove = s5pv210_audss_clk_remove,
 };
 
 static int __init s5pv210_audss_clk_init(void)
@@ -227,14 +213,3 @@ static int __init s5pv210_audss_clk_init(void)
 	return platform_driver_register(&s5pv210_audss_clk_driver);
 }
 core_initcall(s5pv210_audss_clk_init);
-
-static void __exit s5pv210_audss_clk_exit(void)
-{
-	platform_driver_unregister(&s5pv210_audss_clk_driver);
-}
-module_exit(s5pv210_audss_clk_exit);
-
-MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
-MODULE_DESCRIPTION("S5PV210 Audio Subsystem Clock Controller");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:s5pv210-audss-clk");
-- 
2.8.4
