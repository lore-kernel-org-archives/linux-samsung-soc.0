From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH] ARM: dts: exynos4210-trats: add max8997 IRQ
Date: Fri, 14 Mar 2014 11:13:21 +0100
Message-ID: <1394792001-7837-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15980 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794AbaCNKNj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Mar 2014 06:13:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, t.figa@samsung.com, Robert Baldyga <r.baldyga@samsung.com>

This patch adds device tree node for IRQ used by max8997.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 1d18428..0e1fc19 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -148,6 +148,14 @@
 		};
 	};
 
+	pinctrl@11000000 {
+		max8997_irq: max8997-irq {
+			samsung,pins = "gpx0-7";
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
 	i2c@13890000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
@@ -179,6 +187,11 @@
 		max8997_pmic@66 {
 			compatible = "maxim,max8997-pmic";
 
+			pinctrl-0 = <&max8997_irq>;
+			pinctrl-names = "default";
+
+			interrupt-parent = <&gpx0>;
+			interrupts = <7 0>;
 			reg = <0x66>;
 
 			max8997,pmic-buck1-uses-gpio-dvs;
-- 
1.7.9.5
