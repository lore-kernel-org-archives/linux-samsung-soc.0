From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 4/5] ARM: dts: Add rotator node for exynos5250
Date: Fri, 09 Aug 2013 16:40:52 +0900
Message-ID: <1376034053-31910-5-git-send-email-chanho61.park@samsung.com>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24448 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967569Ab3HIHlM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 03:41:12 -0400
In-reply-to: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

This patch adds a rotator node for exynos5250. It has different align value of
image size compared with any other chips. So, we should define new compatible
for the exynos5250.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6f356ce..7ee2da8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -570,6 +570,15 @@
 		};
 	};
 
+	rotator: rotator@11C00000 {
+		compatible = "samsung,exynos5250-rotator";
+		reg = <0x11C00000 0x1000>;
+		interrupts = <0 84 0>;
+		clocks = <&clock 269>;
+		clock-names = "rotator";
+		status = "disabled";
+	};
+
 	gsc_0:  gsc@0x13e00000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
-- 
1.7.9.5
