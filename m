From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add missing irq pinctrl for max77686 on smdk5250
Date: Tue, 18 Nov 2014 17:38:29 +0530
Message-ID: <1416312509-11530-2-git-send-email-yadi.brar@samsung.com>
References: <1416312509-11530-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55383 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266AbaKRMKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 07:10:18 -0500
In-reply-to: <1416312509-11530-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, kgene.kim@samsung.com, yadi.brar01@gmail.com, Yadwinder Singh Brar <yadi.brar@samsung.com>

This patch adds pinctrl configuration for using configuring gpx3-2 as an
external interrupt from max77686. Though max77686 RTC is enabled and gets
probed by default, it doesnt work as its unable to get interrupt.

This patch makes max77686 RTC work and also configures it as wakeup source.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 95b5b51..19cd918 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -131,6 +131,9 @@
 		reg = <0x09>;
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_NONE>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&max77686_irq>;
+		wakeup-source;
 
 		voltage-regulators {
 			ldo1_reg: LDO1 {
@@ -411,3 +414,12 @@
 		};
 	};
 };
+
+&pinctrl_0 {
+	max77686_irq: max77686-irq {
+		samsung,pins = "gpx3-2";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+};
-- 
1.7.0.4
