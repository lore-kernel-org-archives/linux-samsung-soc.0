From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 06/10] ARM: dts: exynos3250-artik5: Add MSHC0 dt node for eMMC
 device
Date: Mon, 14 Mar 2016 11:04:12 +0900
Message-ID: <1457921056-21257-8-git-send-email-cw00.choi@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58147 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933201AbcCNCEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Mar 2016 22:04:31 -0400
In-reply-to: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

From: Jaehoon Chung <jh80.chung@samsung.com>

This patch adds MSHC (Mobile Storage Host Controller) dt node for Exynos3250
SoC. MSHC is an interface between the system and the eMMC device.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 97d0087efb9f..75b291c10cdc 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -277,6 +277,25 @@
 	};
 };
 
+&mshc_0 {
+	num-slots = <1>;
+	broken-cd;
+	non-removable;
+	cap-mmc-highspeed;
+	desc-num = <4>;
+	card-detect-delay = <200>;
+	vmmc-supply = <&ldo11_reg>;
+	clock-frequency = <100000000>;
+	clock-freq-min-max = <400000 100000000>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	bus-width = <8>;
+	status = "okay";
+};
+
 &xusbxti {
 	clock-frequency = <24000000>;
 };
-- 
1.9.1
