From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/6] memory: samsung/exynos-srom: make it explicitly non-modular
Date: Thu, 16 Jun 2016 20:37:47 -0400
Message-ID: <20160617003748.12188-6-paul.gortmaker@windriver.com>
References: <20160617003748.12188-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160617003748.12188-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

memory/samsung/Kconfig:config EXYNOS_SROM
memory/samsung/Kconfig: bool "Exynos SROM controller driver" if COMPILE_TEST

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/memory/samsung/exynos-srom.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
index 96756fb4d6bd..b8904e33d3dd 100644
--- a/drivers/memory/samsung/exynos-srom.c
+++ b/drivers/memory/samsung/exynos-srom.c
@@ -11,7 +11,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -159,16 +159,6 @@ static int exynos_srom_probe(struct platform_device *pdev)
 	return of_platform_populate(np, NULL, NULL, dev);
 }
 
-static int exynos_srom_remove(struct platform_device *pdev)
-{
-	struct exynos_srom *srom = platform_get_drvdata(pdev);
-
-	kfree(srom->reg_offset);
-	iounmap(srom->reg_base);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static void exynos_srom_save(void __iomem *base,
 				    struct exynos_srom_reg_dump *rd,
@@ -211,21 +201,16 @@ static const struct of_device_id of_exynos_srom_ids[] = {
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, of_exynos_srom_ids);
 
 static SIMPLE_DEV_PM_OPS(exynos_srom_pm_ops, exynos_srom_suspend, exynos_srom_resume);
 
 static struct platform_driver exynos_srom_driver = {
 	.probe = exynos_srom_probe,
-	.remove = exynos_srom_remove,
 	.driver = {
 		.name = "exynos-srom",
 		.of_match_table = of_exynos_srom_ids,
 		.pm = &exynos_srom_pm_ops,
+		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver(exynos_srom_driver);
-
-MODULE_AUTHOR("Pankaj Dubey <pankaj.dubey@samsung.com>");
-MODULE_DESCRIPTION("Exynos SROM Controller Driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(exynos_srom_driver);
-- 
2.8.4
