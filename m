From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/3] drm/exynos: add dt-binding documentation for rotator
Date: Mon, 22 Jul 2013 15:49:26 +0900
Message-ID: <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56463 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754133Ab3GVGty (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 02:49:54 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQB00LNTSB2IA20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 15:49:50 +0900 (KST)
In-reply-to: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Chanho Park <chanho61.park@samsung.com>

This patch adds a dt-binding document for exynos rotator. It describes which
nodes should be defined to use the rotator.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../bindings/drm/exynos/samsung-rotator.txt        |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
new file mode 100644
index 0000000..6b1d704
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
@@ -0,0 +1,35 @@
+* Samsung Image Rotator
+
+Required properties:
+  - compatible : value should be the "samsung,exynos4210".
+  - reg : Physical base address of the IP registers and length of memory
+	  mapped region.
+  - interrupts : interrupt number to the CPU.
+  - clocks : clock number of exynos4 rotator clock.
+  - clocks : clock name of rotator
+  - status : "okay" or "disabled"
+  - limit table for image formats : min_w/min_h/max_w/max_h for min/max of image
+
+Example:
+	rotator: rotator@12810000 {
+		compatible = "samsung,exynos4210-rotator";
+		reg = <0x12810000 0x1000>;
+		interrupts = <0 83 0>;
+		clocks = <&clock 278>;
+		clock-names = "rotator";
+		status = "disabled";
+		ycbcr420_2p {
+			min_w = <32>;
+			min_h = <32>;
+			max_w = <32768>;
+			max_h = <32768>;
+			align = <3>;
+		};
+		rgb888 {
+			min_w = <8>;
+			min_h = <8>;
+			max_w = <8192>;
+			max_h = <8192>;
+			align = <2>;
+		};
+	};
-- 
1.7.9.5
