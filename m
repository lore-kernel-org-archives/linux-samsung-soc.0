From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622
 DT properties
Date: Wed, 27 Aug 2014 20:09:57 +0530
Message-ID: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18911 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933698AbaH0OpB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:45:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add documentation for DT properties supported by ps8622/ps8625
eDP-LVDS converter.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt

diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
new file mode 100644
index 0000000..0ec8172
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
@@ -0,0 +1,20 @@
+ps8622-bridge bindings
+
+Required properties:
+	- compatible: "parade,ps8622" or "parade,ps8625"
+	- reg: first i2c address of the bridge
+	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
+	- reset-gpios: OF device-tree gpio specification for RST_ pin.
+
+Optional properties:
+	- lane-count: number of DP lanes to use
+	- use-external-pwm: backlight will be controlled by an external PWM
+
+Example:
+	lvds-bridge@48 {
+		compatible = "parade,ps8622";
+		reg = <0x48>;
+		sleep-gpios = <&gpc3 6 1 0 0>;
+		reset-gpios = <&gpc3 1 1 0 0>;
+		lane-count = <1>;
+	};
-- 
1.7.9.5
