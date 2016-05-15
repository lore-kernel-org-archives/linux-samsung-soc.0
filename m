From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 02/22] dt-bindings: clock: Add PWM and USB clock IDs to
 Exynos5410
Date: Sun, 15 May 2016 22:13:43 +0200
Message-ID: <1463343243-26429-3-git-send-email-krzk@kernel.org>
References: <1463343243-26429-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1463343243-26429-1-git-send-email-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add IDs for PWM and USB clocks to Exynos5410. Use the same number as for
Exynos5420 just in case in future these drivers were merged.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 include/dt-bindings/clock/exynos5410.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 213f19e02870..34c8e96987a1 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2016 Krzysztof Kozlowski
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -27,16 +28,25 @@
 #define CLK_SCLK_MMC0		132
 #define CLK_SCLK_MMC1		133
 #define CLK_SCLK_MMC2		134
+#define CLK_SCLK_USBD300	150
+#define CLK_SCLK_USBD301	151
+#define CLK_SCLK_USBPHY300	152
+#define CLK_SCLK_USBPHY301	153
+#define CLK_SCLK_PWM		155
 
 /* gate clocks */
 #define CLK_UART0		257
 #define CLK_UART1		258
 #define CLK_UART2		259
 #define CLK_UART3		260
+#define CLK_PWM			279
 #define CLK_MCT			315
 #define CLK_MMC0		351
 #define CLK_MMC1		352
 #define CLK_MMC2		353
+#define CLK_USBH20		365
+#define CLK_USBD300		366
+#define CLK_USBD301		367
 
 #define CLK_NR_CLKS		512
 
-- 
2.5.0
