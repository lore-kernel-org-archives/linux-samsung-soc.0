From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v4] ARM: dts: exynos3250: add MFC codec device node
Date: Tue, 09 Sep 2014 15:09:29 +0200
Message-ID: <1410268169-18424-2-git-send-email-j.anaszewski@samsung.com>
References: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34350 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756890AbaIINJm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 09:09:42 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBM00AFBXW38EB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Sep 2014 22:09:39 +0900 (KST)
In-reply-to: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index bbc1e4c..95cc5a1 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -294,6 +294,18 @@
 			status = "disabled";
 		};
 
+		mfc-codec@13400000 {
+			compatible = "samsung,mfc-v7";
+			reg = <0x13400000 0x10000>;
+			interrupts = <0 102 0>;
+			clock-names = "mfc", "sclk_mfc";
+			clocks = <&cmu CLK_MFC>, <&cmu CLK_SCLK_MFC>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			samsung,power-domain = <&pd_mfc>;
+			status = "disabled";
+		};
+
 		serial_0: serial@13800000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x13800000 0x100>;
-- 
1.7.9.5
