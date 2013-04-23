From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 01/13] Documentation: Add device tree bindings for Samsung
 PWM timers
Date: Tue, 23 Apr 2013 17:46:22 +0200
Message-ID: <1366731994-7478-2-git-send-email-t.figa@samsung.com>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53400 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756593Ab3DWPrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 11:47:21 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP001J4T6W7M20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Apr 2013 00:47:20 +0900 (KST)
In-reply-to: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, olof@lixom.net, ben-linux@fluff.org, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

This patch adds missing documentation describing Device Tree bindings
for Samsung PWM timers.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/pwm/pwm-samsung.txt        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
new file mode 100644
index 0000000..ac67c68
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
@@ -0,0 +1,43 @@
+* Samsung PWM timers
+
+Samsung SoCs contain PWM timer blocks which can be used for system clock source
+and clock event timers, as well as to drive SoC outputs with PWM signal. Each
+PWM timer block provides 5 PWM channels (not all of them can drive physical
+outputs - see SoC and board manual).
+
+Be aware that the clocksource driver supports only uniprocessor systems.
+
+Required properties:
+- compatible : should be one of following:
+    samsung,s3c2410-pwm - for 16-bit timers present on S3C24xx SoCs
+    samsung,s3c6400-pwm - for 32-bit timers present on S3C64xx SoCs
+    samsung,s5p6440-pwm - for 32-bit timers present on S5P64x0 SoCs
+    samsung,s5pc100-pwm - for 32-bit timers present on S5PC100, S5PV210,
+			  Exynos4210 rev0 SoCs
+    samsung,exynos4210-pwm - for 32-bit timers present on Exynos4210,
+                          Exynos4x12 and Exynos5250 SoCs
+- reg: base address and size of register area
+- interrupts: list of timer interrupts (one interrupt per timer, starting at
+  timer 0)
+- #pwm-cells: number of cells used for PWM specifier - must be 3
+   the specifier format is as follows:
+     - phandle to PWM controller node
+     - index of PWM channel (from 0 to 4)
+     - PWM signal period in nanoseconds
+     - bitmask of optional PWM flags:
+        0x1 - invert PWM signal
+
+Optional properties:
+- samsung,pwm-outputs: list of PWM channels used as PWM outputs on particular
+    platform - an array of up to 5 elements being indices of PWM channels
+    (from 0 to 4), the order does not matter.
+
+Example:
+	pwm@7f006000 {
+		compatible = "samsung,s3c6400-pwm";
+		reg = <0x7f006000 0x1000>;
+		interrupt-parent = <&vic0>;
+		interrupts = <23>, <24>, <25>, <27>, <28>;
+		samsung,pwm-outputs = <0>, <1>;
+		#pwm-cells = <3>;
+	}
-- 
1.8.2.1
