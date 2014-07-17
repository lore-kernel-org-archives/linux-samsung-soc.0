From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V5 05/12] Documentation: Add DT bindings for panel-lvds driver
Date: Fri, 18 Jul 2014 02:13:51 +0530
Message-ID: <1405629839-12086-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50021 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752816AbaGQUrG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:06 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00DZSJ2GK830@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:04 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Add DT binding documentation for panel-lvds driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt

diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
new file mode 100644
index 0000000..fdf91da2
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
@@ -0,0 +1,50 @@
+panel interface for eDP/lvds panels
+
+Required properties:
+  - compatible: "panel-lvds"
+
+Optional properties:
+	-lcd-enable-gpios:
+		panel LCD poweron GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to powerup/enable the switch to the LCD panel.
+	-backlight-enable-gpios:
+		panel LED enable GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to enable the backlight.
+	-panel-prepare-delay:
+		delay value in ms required for panel_prepare process
+			Delay in ms needed for the panel LCD unit to
+			powerup completely.
+			ex: delay needed till eDP panel throws HPD.
+			    delay needed so that we cans tart reading edid.
+	-panel-enable-delay:
+		delay value in ms required for panel_enable process
+			Delay in ms needed for the panel backlight/LED unit
+			to powerup, and delay needed between video_enable and
+			backlight_enable.
+	-panel-disable-delay:
+		delay value in ms required for panel_disable process
+			Delay in ms needed for the panel backlight/LED unit
+			powerdown, and delay needed between backlight_disable
+			and video_disable.
+	-panel-unprepare-delay:
+		delay value in ms required for panel_post_disable process
+			Delay in ms needed for the panel LCD unit to
+			to powerdown completely, and the minimum delay needed
+			before powering it on again.
+	-panel-width-mm: physical panel width [mm]
+	-panel-height-mm: physical panel height [mm]
+
+Example:
+
+	panel-lvds {
+		compatible = "panel-lvds";
+		backlight-enable-gpios = <&gpx3 0 0>;
+		panel-prepare-delay = <40>;
+		panel-enable-delay = <20>;
+		panel-disable-delay = <20>;
+		panel-unprepare-delay = <30>;
+		panel-width-mm = <256>;
+		panel-height-mm = <144>;
+	};
-- 
1.7.9.5
