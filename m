From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] ARM: dts: add hdmi regulators for exynos5420 based peach-pit
 board
Date: Wed, 18 Jun 2014 19:14:59 +0530
Message-ID: <1403099099-6599-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37134 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271AbaFRNqv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 09:46:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Adding regulators for hdmi for peach-pit board.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on for-next branch in Kukjin's tree.
Dependent on:
1) PMIC DT patch at http://www.gossamer-threads.com/lists/linux/kernel/1945703
2) tps65090 DT patch at https://lkml.org/lkml/2014/6/13/483

 arch/arm/boot/dts/exynos5420-peach-pit.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 1c5b8f9..0a6a1cb 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -229,6 +229,11 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
 	ddc = <&i2c_2>;
+
+	hdmi-en-supply = <&tps65090_fet7>;
+	vdd-supply = <&ldo8_reg>;
+	vdd_osc-supply = <&ldo10_reg>;
+	vdd_pll-supply = <&ldo8_reg>;
 };
 
 &usbdrd_phy0 {
-- 
1.7.9.5
