From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 5/5] arm: dts: Move the clock-frequency property for exynos4210
 dts
Date: Mon, 06 Feb 2017 11:19:44 +0900
Message-ID: <1486347584-6762-6-git-send-email-hoegeun.kwon@samsung.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p3162cfecb8b03bc7843504cc425a6e75b@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44474 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752801AbdBFCTy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Feb 2017 21:19:54 -0500
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
 arch/arm/boot/dts/exynos4210-trats.dts | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 0ca1b4d..9452bed 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -197,24 +197,11 @@
 &dsi_0 {
 	vddcore-supply = <&vusb_reg>;
 	vddio-supply = <&vmipi_reg>;
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
 		reg = <0>;
 		compatible = "samsung,s6e8aa0";
@@ -242,12 +229,6 @@
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
