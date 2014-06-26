From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] ARM: dts: add hdmi regulators for exynos5800 based peach-pi
 board
Date: Thu, 26 Jun 2014 10:56:22 +0530
Message-ID: <1403760382-12533-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55545 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752799AbaFZF1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 01:27:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Adding regulators for HDMI for exynos5800 based Peach-pi board.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on Kukjin's for-next branch.
Depends on:
1) PMIC addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg33166.html
2) tps65090 addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg32464.html

 arch/arm/boot/dts/exynos5800-peach-pi.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 2c2c137..30d1a26 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -127,6 +127,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
 	ddc = <&i2c_2>;
+	hdmi-en-supply = <&tps65090_fet7>;
+	vdd-supply = <&ldo8_reg>;
+	vdd_osc-supply = <&ldo10_reg>;
+	vdd_pll-supply = <&ldo8_reg>;
 };
 
 &hsi2c_7 {
-- 
1.7.9.5
