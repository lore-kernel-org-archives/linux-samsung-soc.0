From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 01/22] dt-bindings: clock: Add license and reformat Exynos5410 clock IDs
Date: Sun, 15 May 2016 22:13:42 +0200
Message-ID: <1463343243-26429-2-git-send-email-krzk@kernel.org>
References: <1463343243-26429-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54073 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752012AbcEOUOX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 May 2016 16:14:23 -0400
In-Reply-To: <1463343243-26429-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>

Add license and copyrights (file introduced in 2014) to header with
Exynos5410 clock IDs. Additionally reformat it to improve readability.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 include/dt-bindings/clock/exynos5410.h | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 9b180f032e2d..213f19e02870 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -1,33 +1,43 @@
+/*
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Device Tree binding constants for Exynos5421 clock controller.
+*/
+
 #ifndef _DT_BINDINGS_CLOCK_EXYNOS_5410_H
 #define _DT_BINDINGS_CLOCK_EXYNOS_5410_H
 
 /* core clocks */
-#define CLK_FIN_PLL 1
-#define CLK_FOUT_APLL 2
-#define CLK_FOUT_CPLL 3
-#define CLK_FOUT_MPLL 4
-#define CLK_FOUT_BPLL 5
-#define CLK_FOUT_KPLL 6
+#define CLK_FIN_PLL		1
+#define CLK_FOUT_APLL		2
+#define CLK_FOUT_CPLL		3
+#define CLK_FOUT_MPLL		4
+#define CLK_FOUT_BPLL		5
+#define CLK_FOUT_KPLL		6
 
 /* gate for special clocks (sclk) */
-#define CLK_SCLK_UART0 128
-#define CLK_SCLK_UART1 129
-#define CLK_SCLK_UART2 130
-#define CLK_SCLK_UART3 131
-#define CLK_SCLK_MMC0 132
-#define CLK_SCLK_MMC1 133
-#define CLK_SCLK_MMC2 134
+#define CLK_SCLK_UART0		128
+#define CLK_SCLK_UART1		129
+#define CLK_SCLK_UART2		130
+#define CLK_SCLK_UART3		131
+#define CLK_SCLK_MMC0		132
+#define CLK_SCLK_MMC1		133
+#define CLK_SCLK_MMC2		134
 
 /* gate clocks */
-#define CLK_UART0 257
-#define CLK_UART1 258
-#define CLK_UART2 259
-#define CLK_UART3 260
-#define CLK_MCT 315
-#define CLK_MMC0 351
-#define CLK_MMC1 352
-#define CLK_MMC2 353
+#define CLK_UART0		257
+#define CLK_UART1		258
+#define CLK_UART2		259
+#define CLK_UART3		260
+#define CLK_MCT			315
+#define CLK_MMC0		351
+#define CLK_MMC1		352
+#define CLK_MMC2		353
 
-#define CLK_NR_CLKS 512
+#define CLK_NR_CLKS		512
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5410_H */
-- 
2.5.0
