From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/7] clk: samsung: exynos5410: Add clock IDs for PDMA and
 EPLL clocks
Date: Tue, 06 Sep 2016 14:04:50 +0200
Message-ID: <1473163496-17820-2-git-send-email-s.nawrocki@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The PDMA{0,1} and EPLL clock IDs are added separately in this
patch so the patch can be merged to the arm-soc tree as dependency.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes since v1:
 - used same index values as for exynos5420.
---
 include/dt-bindings/clock/exynos5410.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 85b467b..6cb4e90 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -19,6 +19,7 @@
 #define CLK_FOUT_MPLL		4
 #define CLK_FOUT_BPLL		5
 #define CLK_FOUT_KPLL		6
+#define CLK_FOUT_EPLL		7

 /* gate for special clocks (sclk) */
 #define CLK_SCLK_UART0		128
@@ -55,6 +56,8 @@
 #define CLK_MMC0		351
 #define CLK_MMC1		352
 #define CLK_MMC2		353
+#define CLK_PDMA0		362
+#define CLK_PDMA1		363
 #define CLK_USBH20		365
 #define CLK_USBD300		366
 #define CLK_USBD301		367
--
1.9.1

