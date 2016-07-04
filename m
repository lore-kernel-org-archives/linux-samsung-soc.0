From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:16 -0400
Message-ID: <20160704211220.5685-7-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:39087 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932681AbcGDVNA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 17:13:00 -0400
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

arch/arm/mach-exynos/Kconfig:menuconfig ARCH_EXYNOS
arch/arm/mach-exynos/Kconfig:   bool "Samsung EXYNOS" if ARCH_MULTI_V7

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was already not used by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tags etc. since all that information
is already contained at the top of the file in the comments.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 4e9584d79089..42b62f865198 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -15,7 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/exynos-audss-clk.h>
@@ -278,14 +278,3 @@ static int __init exynos_audss_clk_init(void)
 	return platform_driver_register(&exynos_audss_clk_driver);
 }
 core_initcall(exynos_audss_clk_init);
-
-static void __exit exynos_audss_clk_exit(void)
-{
-	platform_driver_unregister(&exynos_audss_clk_driver);
-}
-module_exit(exynos_audss_clk_exit);
-
-MODULE_AUTHOR("Padmavathi Venna <padma.v@samsung.com>");
-MODULE_DESCRIPTION("Exynos Audio Subsystem Clock Controller");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:exynos-audss-clk");
-- 
2.8.4
