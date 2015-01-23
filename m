From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH RESEND] ARM: dts: exynos3250: add JPEG codec device node
Date: Fri, 23 Jan 2015 16:39:56 +0100
Message-ID: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35546 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827AbbAWPkJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 10:40:09 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIM00IPDZIV7G00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Jan 2015 00:40:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2246549..3c043d9 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -228,6 +228,19 @@
 			interrupts = <0 240 0>;
 		};
 
+		jpeg: codec@11830000 {
+			compatible = "samsung,exynos3250-jpeg";
+			reg = <0x11830000 0x1000>;
+			interrupts = <0 171 0>;
+			clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
+			clock-names = "jpeg", "sclk";
+			samsung,power-domain = <&pd_cam>;
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
