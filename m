From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: dts: Remove DP PHY node from exynos5250.dtsi
Date: Mon, 26 Aug 2013 15:29:38 +0900
Message-ID: <003401cea225$a3dc0c40$eb9424c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24084 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755568Ab3HZG3k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 02:29:40 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Vikas Sajjan' <vikas.sajjan@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'devicetree' <devicetree@vger.kernel.org>, 'InKi Dae' <inki.dae@samsung.com>, 'Ajay kumar' <ajaynumb@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

Since DP PHY driver is not yet merged, DP PHY node should be
removed from exynos5250.dtsi.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 864ae90..72aec7f 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -625,17 +625,16 @@
 		interrupts = <0 94 0>;
 	};
 
-	dp_phy: video-phy@10040720 {
-		compatible = "samsung,exynos5250-dp-video-phy";
-		reg = <0x10040720 4>;
-		#phy-cells = <0>;
-	};
-
 	dp-controller@145B0000 {
 		clocks = <&clock 342>;
 		clock-names = "dp";
-		phys = <&dp_phy>;
-		phy-names = "dp";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dptx-phy {
+			reg = <0x10040720>;
+			samsung,enable-mask = <1>;
+		};
 	};
 
 	fimd@14400000 {
-- 
1.7.10.4
