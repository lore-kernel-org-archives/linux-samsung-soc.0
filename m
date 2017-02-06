From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 4/5] arm: dts: Move the clock-frequency property for exynos4412
 dts
Date: Mon, 06 Feb 2017 11:19:43 +0900
Message-ID: <1486347584-6762-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p33404f327a8f0648c7e5b57a351fdce51@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56174 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752036AbdBFCTz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Feb 2017 21:19:55 -0500
In-reply-to: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

The OF graph is not needed because the panel is a child of dsi. So
removed the ports and moved burst, esc clock-frequency property to the
top.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 41ecd6d..86ce5e5 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -385,24 +385,11 @@
 &dsi_0 {
 	vddcore-supply = <&ldo8_reg>;
 	vddio-supply = <&ldo10_reg>;
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <20000000>;
 	samsung,pll-clock-frequency = <24000000>;
 	status = "okay";
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			dsi_out: endpoint {
-				remote-endpoint = <&dsi_in>;
-				samsung,burst-clock-frequency = <500000000>;
-				samsung,esc-clock-frequency = <20000000>;
-			};
-		};
-	};
-
 	panel@0 {
 		compatible = "samsung,s6e8aa0";
 		reg = <0>;
@@ -430,12 +417,6 @@
 				vsync-len = <2>;
 			};
 		};
-
-		port {
-			dsi_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
 	};
 };
 
-- 
1.9.1
