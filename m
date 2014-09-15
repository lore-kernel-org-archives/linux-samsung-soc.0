From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v5] ARM: dts: exynos3250 add MFC codec device node
Date: Mon, 15 Sep 2014 13:44:46 +0200
Message-ID: <1410781486-13983-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12918 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753526AbaIOLpE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 07:45:04 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBX00LMUXZ23Y60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Sep 2014 20:45:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 351871a..68c9e7c 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -283,6 +283,16 @@
 			status = "disabled";
 		};
 
+		mfc: codec@13400000 {
+			compatible = "samsung,mfc-v7";
+			reg = <0x13400000 0x10000>;
+			interrupts = <0 102 0>;
+			clock-names = "mfc", "sclk_mfc";
+			clocks = <&cmu CLK_MFC>, <&cmu CLK_SCLK_MFC>;
+			samsung,power-domain = <&pd_mfc>;
+			status = "disabled";
+		};
+
 		serial_0: serial@13800000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x13800000 0x100>;
-- 
1.7.9.5
