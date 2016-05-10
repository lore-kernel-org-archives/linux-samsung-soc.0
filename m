From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 23/27] dt-bindings: clock: Add I2C, HSI2C and RTC clock IDs to Exynos5410
Date: Tue, 10 May 2016 22:09:26 +0200
Message-ID: <1462910970-1812-24-git-send-email-krzk@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add IDs for I2C, USI (HSI2C) and RTC clocks to Exynos5410. Use the same
number as for Exynos5420 just in case in future these drivers were
merged.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/clock/exynos5410.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 34c8e96987a1..e94b7bbfd6af 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -38,9 +38,18 @@
 #define CLK_UART0		257
 #define CLK_UART1		258
 #define CLK_UART2		259
+#define CLK_I2C0		261
+#define CLK_I2C1		262
+#define CLK_I2C2		263
+#define CLK_I2C3		264
+#define CLK_USI0		265
+#define CLK_USI1		266
+#define CLK_USI2		267
+#define CLK_USI3		268
 #define CLK_UART3		260
 #define CLK_PWM			279
 #define CLK_MCT			315
+#define CLK_RTC			317
 #define CLK_MMC0		351
 #define CLK_MMC1		352
 #define CLK_MMC2		353
-- 
2.5.0
