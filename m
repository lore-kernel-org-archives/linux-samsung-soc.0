From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/6] dt-bindings: clock: Add TMU clock ID to Exynos5410
Date: Tue, 31 May 2016 20:39:00 +0200
Message-ID: <1464719945-3417-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58815 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751133AbcEaSjX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2016 14:39:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>

Add ID for TMU clock to Exynos5410. Use the same number as for
Exynos5420 just in case in future these drivers were merged.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/clock/exynos5410.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index e94b7bbfd6af..705b2aa84317 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -50,6 +50,7 @@
 #define CLK_PWM			279
 #define CLK_MCT			315
 #define CLK_RTC			317
+#define CLK_TMU			318
 #define CLK_MMC0		351
 #define CLK_MMC1		352
 #define CLK_MMC2		353
-- 
2.7.4
