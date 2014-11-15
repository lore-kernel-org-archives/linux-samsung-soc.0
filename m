From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V8 11/14] Documentation: bridge: Add documentation for ps8622
 DT properties
Date: Sat, 15 Nov 2014 15:25:06 +0530
Message-ID: <1416045309-13359-12-git-send-email-ajaykumar.rs@samsung.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44703 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518AbaKOKCM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Nov 2014 05:02:12 -0500
In-reply-to: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, seanpaul@google.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add documentation for DT properties supported by ps8622/ps8625
eDP-LVDS converter.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/video/bridge/ps8622.txt    |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt

diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
new file mode 100644
index 0000000..c989c38
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
@@ -0,0 +1,31 @@
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
+	- video interfaces: Device node can contain video interface port
+			    nodes for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	lvds-bridge@48 {
+		compatible = "parade,ps8622";
+		reg = <0x48>;
+		sleep-gpios = <&gpc3 6 1 0 0>;
+		reset-gpios = <&gpc3 1 1 0 0>;
+		lane-count = <1>;
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
