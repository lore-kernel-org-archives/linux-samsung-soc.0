From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 6/9] exynos/drm: add DT bindings
Date: Mon, 14 Apr 2014 15:09:51 +0900
Message-ID: <1397455794-7759-7-git-send-email-inki.dae@samsung.com>
References: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28739 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbaDNGJ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 02:09:59 -0400
In-reply-to: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

This patch adds bindings for Exynos drm display subsystem.
The bindings describes ports containing a list of phandles
pointing to display controller, image enhancer, and display
interfaces nodes.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../bindings/drm/exynos/samsung-exynos-drm.txt     |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt
new file mode 100644
index 0000000..6f7fae0
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt
@@ -0,0 +1,32 @@
+Samsung Exynos DRM master device
+================================
+
+The Samsung Exynos DRM master device is a virtual device needed to list all
+display controller, image enhancer, and display interface nodes that comprise
+the graphics subsystem.
+
+Required properties:
+- compatible: Should be "samsung,exynos-display-subsystem"
+- ports: Should contain a list of phandles pointing to display controller,
+  image enhancer, and display interface ports.
+
+Examples:
+
+In case of using MIPI-DSI,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>, <&dsi>;
+};
+
+
+In case of using DisplayPort,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>, <&dp>;
+};
+
+In case of using parallel panel,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>;
+};
-- 
1.7.9.5
