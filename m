From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add vmmc-supply to MMC on Arndale octa board
Date: Wed, 18 Dec 2013 14:15:39 +0530
Message-ID: <1387356339-14082-2-git-send-email-sachin.kamat@linaro.org>
References: <1387356339-14082-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:34116 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753091Ab3LRIsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:48:53 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so7958964pde.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:48:52 -0800 (PST)
In-Reply-To: <1387356339-14082-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

LDO10 is directly connected to MMC controller. Register this
through vmmc-supply property.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 240caab5129f..9f3a3231158b 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -48,6 +48,7 @@
 		samsung,dw-mshc-ddr-timing = <0 2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+		vmmc-supply = <&ldo10_reg>;
 
 		slot@0 {
 			reg = <0>;
@@ -64,6 +65,7 @@
 		samsung,dw-mshc-ddr-timing = <1 2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+		vmmc-supply = <&ldo10_reg>;
 
 		slot@0 {
 			reg = <0>;
-- 
1.7.9.5
