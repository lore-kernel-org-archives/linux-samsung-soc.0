From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 3/3] dts: ARM: add a rotator node for exynos4
Date: Mon, 22 Jul 2013 15:49:27 +0900
Message-ID: <1374475767-30085-4-git-send-email-chanho61.park@samsung.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56463 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754790Ab3GVGty (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 02:49:54 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQB00LNRSB2IA20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 15:49:50 +0900 (KST)
In-reply-to: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Chanho Park <chanho61.park@samsung.com>

This patch adds a device node of rotator for exynos4 platform. It has proper
register and clock information. It also has limit table to get restrictions of
the image size.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3f94fe8..7d7dcef 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -398,4 +398,27 @@
 		samsung,power-domain = <&pd_lcd0>;
 		status = "disabled";
 	};
+
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
 };
-- 
1.7.9.5
