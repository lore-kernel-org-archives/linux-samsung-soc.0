From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/5] clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL
 clocks
Date: Mon, 22 Aug 2016 18:30:59 +0200
Message-ID: <1471883463-1950-2-git-send-email-s.nawrocki@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The PDMA{0,1} and EPLL clock IDs are added separately in this
patch so the patch can be merged to the arm-soc tree as dependency.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/dt-bindings/clock/exynos5410.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 85b467b..a74442a 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -19,6 +19,7 @@
 #define CLK_FOUT_MPLL		4
 #define CLK_FOUT_BPLL		5
 #define CLK_FOUT_KPLL		6
+#define CLK_FOUT_EPLL		7
 
 /* gate for special clocks (sclk) */
 #define CLK_SCLK_UART0		128
@@ -48,6 +49,8 @@
 #define CLK_USI3		268
 #define CLK_UART3		260
 #define CLK_PWM			279
+#define CLK_PDMA0		280
+#define CLK_PDMA1		281
 #define CLK_MCT			315
 #define CLK_WDT			316
 #define CLK_RTC			317
-- 
1.9.1

