From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 09/12] Documentation: drm: bridge: move to video/bridge
Date: Wed, 27 Aug 2014 20:09:59 +0530
Message-ID: <1409150399-12534-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26608 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933802AbaH0Oqs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:46:48 -0400
In-reply-to: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Move drm/bridge documentation to video/bridge.
Also, add proper documentation for gpios used by ptn3460.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 --------------------
 .../devicetree/bindings/video/bridge/ptn3460.txt   |   27 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ptn3460.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt b/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
deleted file mode 100644
index 52b93b2..0000000
--- a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
+++ /dev/null
@@ -1,27 +0,0 @@
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
-Example:
-	lvds-bridge@20 {
-		compatible = "nxp,ptn3460";
-		reg = <0x20>;
-		powerdown-gpio = <&gpy2 5 1 0 0>;
-		reset-gpio = <&gpx1 5 1 0 0>;
-		edid-emulation = <5>;
-	};
diff --git a/Documentation/devicetree/bindings/video/bridge/ptn3460.txt b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
new file mode 100644
index 0000000..d9281dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
@@ -0,0 +1,27 @@
+ptn3460 bridge bindings
+
+Required properties:
+	- compatible: "nxp,ptn3460"
+	- reg: i2c address of the bridge
+	- powerdown-gpios: OF device-tree gpio specification for PD_N pin.
+	- reset-gpios: OF device-tree gpio specification for RST_N pin.
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
+Example:
+	lvds-bridge@20 {
+		compatible = "nxp,ptn3460";
+		reg = <0x20>;
+		powerdown-gpios = <&gpy2 5 1 0 0>;
+		reset-gpios = <&gpx1 5 1 0 0>;
+		edid-emulation = <5>;
+	};
-- 
1.7.9.5
