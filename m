From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v3] ARM: dts: exynos3250: add JPEG codec device node
Date: Wed, 06 May 2015 09:41:05 +0200
Message-ID: <1430898065-19093-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46306 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157AbbEFHlb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 03:41:31 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNX00BL940ZV740@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 May 2015 16:41:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch adds device tree node for JPEG IP.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index e3bfb11..e25088c 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -243,6 +243,19 @@
 			interrupts = <0 240 0>;
 		};
 
+		jpeg: codec@11830000 {
+			compatible = "samsung,exynos3250-jpeg";
+			reg = <0x11830000 0x1000>;
+			interrupts = <0 171 0>;
+			clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
+			clock-names = "jpeg", "sclk";
+			power-domains = <&pd_cam>;
+			assigned-clocks = <&cmu CLK_MOUT_CAM_BLK>, <&cmu CLK_SCLK_JPEG>;
+			assigned-clock-rates = <0>, <150000000>;
+			assigned-clock-parents = <&cmu CLK_DIV_MPLL_PRE>;
+			status = "disabled";
+		};
+
 		fimd: fimd@11c00000 {
 			compatible = "samsung,exynos3250-fimd";
 			reg = <0x11c00000 0x30000>;
-- 
1.7.9.5
