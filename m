From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] arm64: dts: Fix RTC by providing rtc_src clock
Date: Mon, 11 Jul 2016 09:34:18 +0200
Message-ID: <1468222458-4265-2-git-send-email-k.kozlowski@samsung.com>
References: <1468222458-4265-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1468222458-4265-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, krzk@kernel.org, k.kozlowski@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Alim Akhtar <alim.akhtar@samsung.com>

Add RTC source clock as Exynos7 needs source (32.768KHz) clock
for RTC block. Without this currently S3C RTC driver probe is broken
on this SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index d8767b00862e..14cd3a14fb7c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 #include "exynos7.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/samsung,s2mps11.h>
 
 / {
 	model = "Samsung Exynos7 Espresso board based on EXYNOS7";
@@ -43,6 +44,8 @@
 
 &rtc {
 	status = "okay";
+	clocks = <&clock_ccore PCLK_RTC>, <&s2mps15_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
 };
 
 &watchdog {
-- 
1.9.1
