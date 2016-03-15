From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 8/8] ARM: dts: Add MSHC2 dt node for SD card for
 exynos3250-artik5-eval board
Date: Tue, 15 Mar 2016 16:38:10 +0900
Message-ID: <1458027490-13787-9-git-send-email-cw00.choi@samsung.com>
References: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53154 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934304AbcCOHiq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2016 03:38:46 -0400
In-reply-to: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

From: Jaehoon Chung <jh80.chung@samsung.com>

This patch adds MSHC (Mobile Storage Host Controller) dt node for
Exynos3250 SoC. MSHC is an interface between the system and the SD card

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5-eval.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
index b476154590a5..be4d6aa379f3 100644
--- a/arch/arm/boot/dts/exynos3250-artik5-eval.dts
+++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
@@ -21,6 +21,23 @@
 			"samsung,exynos3250", "samsung,exynos3";
 };
 
+&mshc_2 {
+	num-slots = <1>;
+	cap-sd-highspeed;
+	disable-wp;
+	vqmmc-supply = <&ldo3_reg>;
+	card-detect-delay = <200>;
+	clock-frequency = <100000000>;
+	clock-freq-min-max = <400000 100000000>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_cmd &sd2_clk &sd2_cd &sd2_bus1 &sd2_bus4>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &serial_2 {
 	status = "okay";
 };
-- 
1.9.1
