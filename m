From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 2/2] arm64: dts: exynos: add OF graph between USB-PHY and
 MUIC
Date: Tue, 15 May 2018 14:12:39 +0200
Message-ID: <20180515121239.18192-3-a.hajda@samsung.com>
References: <20180515121239.18192-1-a.hajda@samsung.com>
        <CGME20180515121251eucas1p160dd3dcff49f0dad845ed6be98f33bbe@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180515121239.18192-1-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

OF graph describes USB data lanes between USB-PHY and respective MUIC.
Since graph is present and DWC driver can use it to get extcon, obsolete
extcon property can be removed.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 03453b822093..042e5894a138 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -868,6 +868,18 @@
 					};
 				};
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					muic_to_usb: endpoint {
+						remote-endpoint = <&usb_to_muic>;
+					};
+				};
+			};
 		};
 
 		regulators {
@@ -1287,12 +1299,17 @@
 
 &usbdrd_dwc3 {
 	dr_mode = "otg";
-	extcon = <&muic>;
 };
 
 &usbdrd30_phy {
 	vbus-supply = <&safeout1_reg>;
 	status = "okay";
+
+	port {
+		usb_to_muic: endpoint {
+			remote-endpoint = <&muic_to_usb>;
+		};
+	};
 };
 
 &xxti {
-- 
2.17.0
