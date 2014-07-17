From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V5 11/12] Documentation: Add DT bindings for ps8622/ps8625
 bridge driver
Date: Fri, 18 Jul 2014 02:13:57 +0530
Message-ID: <1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33659 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899AbaGQUrS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:18 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00AZJJ2TO970@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:17 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Vincent Palatin <vpalatin@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Vincent Palatin <vpalatin@chromium.org>

Add DT binding documentation for ps8622/ps8625 bridge driver.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/ps8622.txt b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
new file mode 100644
index 0000000..1d154ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
@@ -0,0 +1,21 @@
+ps8622-bridge bindings
+
+Required properties:
+	- compatible: "parade,ps8622" or "parade,ps8625"
+	- reg: first i2c address of the bridge
+	- sleep-gpios: OF device-tree gpio specification
+	- reset-gpios: OF device-tree gpio specification
+
+Optional properties:
+	- lane-count: number of DP lanes to use
+	- use-external-pwm: backlight will be controlled by an external PWM
+
+Example:
+	ps8622-bridge@48 {
+		compatible = "parade,ps8622";
+		reg = <0x48>;
+		sleep-gpios = <&gpc3 6 1 0 0>;
+		reset-gpios = <&gpc3 1 1 0 0>;
+		display-timings = <&lcd_display_timings>;
+		lane-count = <1>
+	};
-- 
1.7.9.5
