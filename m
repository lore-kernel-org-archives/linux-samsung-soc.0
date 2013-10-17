From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 8/8] ARM: dts: Add clock provider specific properties to
 max77686 node
Date: Thu, 17 Oct 2013 18:30:42 +0200
Message-ID: <1382027442-1992-9-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51885 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757879Ab3JQQbG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 12:31:06 -0400
In-reply-to: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds a label and #clock-cells property to device node of
max77686 PMIC to allow using it as a clock provider.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi   | 1 +
 arch/arm/boot/dts/exynos4412-odroidx.dts | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index dc259e8b..c33a01e 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -36,6 +36,7 @@
 		max77686@09 {
 			compatible = "maxim,max77686";
 			reg = <0x09>;
+			#clock-cells = <1>;
 
 			voltage-regulators {
 				ldo1_reg: LDO1 {
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 46c678e..8d337cc 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -119,6 +119,7 @@
 		max77686: pmic@09 {
 			compatible = "maxim,max77686";
 			reg = <0x09>;
+			#clock-cells = <1>;
 
 			voltage-regulators {
 				ldo1_reg: LDO1 {
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index fb7b9ae..c21a8b9 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -139,6 +139,7 @@
 			interrupt-parent = <&gpx0>;
 			interrupts = <7 0>;
 			reg = <0x09>;
+			#clock-cells = <1>;
 
 			voltage-regulators {
 				ldo1_reg: ldo1 {
-- 
1.8.3.2
