From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] ARM: dts: use vqmmc-supply of emmc/sd for
 exynos4412-odroid-common
Date: Thu, 27 Aug 2015 18:29:18 +0900
Message-ID: <1440667758-14960-1-git-send-email-jh80.chung@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55848 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbbH0J3q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 05:29:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

Currently vmmc's property is wrong.
If it needs to control two supplies, then it has to use vmmc/vqmmc-supply.
(Card supply power and I/O Line supply Power.)

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ca7d168..4ddabfd 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -461,10 +461,10 @@
 &mshc_0 {
 	pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
 	pinctrl-names = "default";
-	vmmc-supply = <&ldo20_reg &buck8_reg>;
+	vmmc-supply = <&ldo20_reg>;
+	vqmmc-supply = <&buck8_reg>;
 	mmc-pwrseq = <&emmc_pwrseq>;
 	status = "okay";
-
 	num-slots = <1>;
 	broken-cd;
 	card-detect-delay = <200>;
@@ -485,7 +485,8 @@
 	bus-width = <4>;
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 	pinctrl-names = "default";
-	vmmc-supply = <&ldo4_reg &ldo21_reg>;
+	vmmc-supply = <&ldo21_reg>;
+	vqmmc-supply = <&ldo4_reg>;
 	cd-gpios = <&gpk2 2 0>;
 	cd-inverted;
 	status = "okay";
-- 
1.9.1
