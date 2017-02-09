From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2 2/5] arm64: dts: exynos: Remove the OF graph from DSI node
 for exynos5433 dts
Date: Thu, 09 Feb 2017 10:26:38 +0900
Message-ID: <1486603601-26826-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170209012716epcas1p37a101e6937668ce09309bb636c8b6a52@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52925 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752115AbdBIB1V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 20:27:21 -0500
In-reply-to: <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

The OF graph is not needed because the panel is a child of dsi. So
Remove the ports node and move burst and esc clock frequency
properties to the parent (DSI node).

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 6ce93a3..77ba238 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -298,23 +298,11 @@
 	status = "okay";
 	vddcore-supply = <&ldo6_reg>;
 	vddio-supply = <&ldo7_reg>;
+	samsung,burst-clock-frequency = <512000000>;
+	samsung,esc-clock-frequency = <16000000>;
 	samsung,pll-clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&te_irq>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			dsi_out: endpoint {
-				samsung,burst-clock-frequency = <512000000>;
-				samsung,esc-clock-frequency = <16000000>;
-			};
-		};
-	};
 };
 
 &hdmi {
-- 
1.9.1
