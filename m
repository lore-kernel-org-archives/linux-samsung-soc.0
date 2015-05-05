From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos3250: add JPEG codec device node
Date: Tue, 05 May 2015 09:18:19 +0200
Message-ID: <1430810299-23512-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12595 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756508AbbEEHSr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 03:18:47 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNV00F258B93W70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 May 2015 16:18:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

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
