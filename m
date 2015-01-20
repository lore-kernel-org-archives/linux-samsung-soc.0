From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V9 13/14] ARM: dts: snow: represent the connection between
 bridge and panel using videoport and endpoints
Date: Tue, 20 Jan 2015 22:08:54 +0530
Message-ID: <1421771935-31618-14-git-send-email-ajaykumar.rs@samsung.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43081 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755462AbbATQrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 11:47:19 -0500
In-reply-to: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Define videoports and use endpoints to describe the connection between
the encoder, bridge and the panel, instead of using phandles.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Rahul Sharma <rahul.sharma@samsung.com>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index b9aeec4..1bd5d3a 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -183,7 +183,20 @@
 			powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
 			reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
 			edid-emulation = <5>;
-			panel = <&panel>;
+
+			ports {
+				port@0 {
+					bridge_out: endpoint {
+						remote-endpoint = <&panel_in>;
+					};
+				};
+
+				port@1 {
+					bridge_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 	};
 
@@ -228,6 +241,12 @@
 		compatible = "auo,b116xw03";
 		power-supply = <&fet6>;
 		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
 	};
 };
 
@@ -242,7 +261,14 @@
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
 	samsung,hpd-gpio = <&gpx0 7 GPIO_ACTIVE_HIGH>;
-	bridge = <&ptn3460>;
+
+	ports {
+		port@0 {
+			dp_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
 };
 
 &ehci {
-- 
1.7.9.5
