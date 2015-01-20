From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V9 09/14] Documentation: drm: bridge: move to video/bridge
Date: Tue, 20 Jan 2015 22:08:50 +0530
Message-ID: <1421771935-31618-10-git-send-email-ajaykumar.rs@samsung.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43064 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754351AbbATQrI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 11:47:08 -0500
In-reply-to: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Move drm/bridge documentation to video/bridge.
Also, add proper documentation for gpios used by ptn3460.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Rahul Sharma <rahul.sharma@samsung.com>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 .../devicetree/bindings/drm/bridge/ptn3460.txt     |   39 --------------------
 .../devicetree/bindings/video/bridge/ptn3460.txt   |   39 ++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ptn3460.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt b/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
deleted file mode 100644
index 663fe6c..0000000
--- a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-ptn3460 bridge bindings
-
-Required properties:
-	- compatible: "nxp,ptn3460"
-	- reg: i2c address of the bridge
-	- powerdown-gpio: OF device-tree gpio specification
-	- reset-gpio: OF device-tree gpio specification
-	- edid-emulation: The EDID emulation entry to use
-		+-------+------------+------------------+
-		| Value | Resolution | Description      |
-		|   0   |  1024x768  | NXP Generic      |
-		|   1   |  1920x1080 | NXP Generic      |
-		|   2   |  1920x1080 | NXP Generic      |
-		|   3   |  1600x900  | Samsung LTM200KT |
-		|   4   |  1920x1080 | Samsung LTM230HT |
-		|   5   |  1366x768  | NXP Generic      |
-		|   6   |  1600x900  | ChiMei M215HGE   |
-		+-------+------------+------------------+
-
-	- video interfaces: Device node can contain video interface port
-			    nodes for panel according to [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	lvds-bridge@20 {
-		compatible = "nxp,ptn3460";
-		reg = <0x20>;
-		powerdown-gpio = <&gpy2 5 1 0 0>;
-		reset-gpio = <&gpx1 5 1 0 0>;
-		edid-emulation = <5>;
-		ports {
-			port@0 {
-				bridge_out: endpoint {
-					remote-endpoint = <&panel_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/video/bridge/ptn3460.txt b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
new file mode 100644
index 0000000..361971b
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
@@ -0,0 +1,39 @@
+ptn3460 bridge bindings
+
+Required properties:
+	- compatible: "nxp,ptn3460"
+	- reg: i2c address of the bridge
+	- powerdown-gpio: OF device-tree gpio specification  for PD_N pin.
+	- reset-gpio: OF device-tree gpio specification for RST_N pin.
+	- edid-emulation: The EDID emulation entry to use
+		+-------+------------+------------------+
+		| Value | Resolution | Description      |
+		|   0   |  1024x768  | NXP Generic      |
+		|   1   |  1920x1080 | NXP Generic      |
+		|   2   |  1920x1080 | NXP Generic      |
+		|   3   |  1600x900  | Samsung LTM200KT |
+		|   4   |  1920x1080 | Samsung LTM230HT |
+		|   5   |  1366x768  | NXP Generic      |
+		|   6   |  1600x900  | ChiMei M215HGE   |
+		+-------+------------+------------------+
+
+	- video interfaces: Device node can contain video interface port
+			    nodes for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	lvds-bridge@20 {
+		compatible = "nxp,ptn3460";
+		reg = <0x20>;
+		powerdown-gpio = <&gpy2 5 1 0 0>;
+		reset-gpio = <&gpx1 5 1 0 0>;
+		edid-emulation = <5>;
+		ports {
+			port@0 {
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
-- 
1.7.9.5
