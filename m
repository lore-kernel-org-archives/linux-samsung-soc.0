From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 2/5] ARM: dts: Add rotator node for exynos4210
Date: Fri, 09 Aug 2013 16:40:50 +0900
Message-ID: <1376034053-31910-3-git-send-email-chanho61.park@samsung.com>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24448 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967519Ab3HIHlK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 03:41:10 -0400
In-reply-to: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

This patch adds a rotator node for exynos4210. The exynos4210 has different
limitation of image size compared with later chips.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 597cfcf..002b2b8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -243,6 +243,15 @@
 		status = "disabled";
 	};
 
+	rotator: rotator@12810000 {
+		compatible = "samsung,exynos4210-rotator";
+		reg = <0x12810000 0x1000>;
+		interrupts = <0 83 0>;
+		clocks = <&clock 278>;
+		clock-names = "rotator";
+		status = "disabled";
+	};
+
 	mfc: codec@13400000 {
 		compatible = "samsung,mfc-v5";
 		reg = <0x13400000 0x10000>;
-- 
1.7.9.5
