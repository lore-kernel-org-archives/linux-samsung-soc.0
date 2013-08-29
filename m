From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v7 5/6] ARM: dts: add dt nodes for hdmi subsystem for exynos5420
Date: Thu, 29 Aug 2013 19:22:56 +0530
Message-ID: <1377784377-28426-6-git-send-email-rahul.sharma@samsung.com>
References: <1377784377-28426-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23225 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754287Ab3H2NbS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 09:31:18 -0400
In-reply-to: <1377784377-28426-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add hdmi and mixer device tree nodes for Exynos 5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 77805a5..09aa06c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -291,4 +291,23 @@
 		pinctrl-0 = <&i2c3_bus>;
 		status = "disabled";
 	};
+
+	hdmi@14530000 {
+		compatible = "samsung,exynos4212-hdmi";
+		reg = <0x14530000 0x70000>;
+		interrupts = <0 95 0>;
+		clocks = <&clock 413>, <&clock 143>, <&clock 768>,
+			<&clock 158>, <&clock 640>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+			"sclk_hdmiphy", "mout_hdmi";
+		status = "disabled";
+	};
+
+	mixer@14450000 {
+		compatible = "samsung,exynos5420-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+		clocks = <&clock 431>, <&clock 143>;
+		clock-names = "mixer", "sclk_hdmi";
+	};
 };
-- 
1.7.10.4
