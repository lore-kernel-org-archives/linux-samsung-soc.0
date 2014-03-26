From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos4210-trats: add max8997 IRQ
Date: Wed, 26 Mar 2014 11:07:09 +0100
Message-ID: <1395828429-11023-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40677 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbaCZKHj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Mar 2014 06:07:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, t.figa@samsung.com, Robert Baldyga <r.baldyga@samsung.com>

This patch adds IRQ line specification for the MAX8997 chip and necessary
pinctrl group to configure pull-up and driver strength of the pin.
It's needed for proper handling of IRQs coming from MAX8997 multifunction
device (IRQs are used by PMIC, MUIC and RTC).

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---

Changelog:

v2:
- Corrected commit message.

v1: https://lkml.org/lkml/2014/3/14/124

 arch/arm/boot/dts/exynos4210-trats.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 662b482..5629eef 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -156,6 +156,14 @@
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
@@ -187,6 +195,11 @@
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
