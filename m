From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 8/8] ARM: dts: Add clock provider specific properties to
 max77686 node
Date: Thu, 12 Dec 2013 17:07:21 +0100
Message-ID: <1386864441-19561-9-git-send-email-t.figa@samsung.com>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51639 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab3LLQHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:07:48 -0500
In-reply-to: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch adds a label and #clock-cells property to device node of
max77686 PMIC to allow using it as a clock provider.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi   | 1 +
 arch/arm/boot/dts/exynos4412-odroidx.dts | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 42cef0a..a9dc776 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -48,6 +48,7 @@
 			pinctrl-0 = <&max77686_irq>;
 			wakeup-source;
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
1.8.4.3
