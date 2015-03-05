From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos4: Add JPEG codec node
Date: Thu, 05 Mar 2015 14:10:41 +0100
Message-ID: <1425561042-28258-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48482 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932075AbbCENK5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 08:10:57 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKQ00KALPY8Y610@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Mar 2015 22:10:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch adds an entry for JPEG codec found in Exynos 4210
and 4x12 SoCs.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos4.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 77ea547..e157d98 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -452,6 +452,16 @@
 		status = "disabled";
 	};
 
+	jpeg: codec@11840000 {
+		compatible = "samsung,exynos4210-jpeg";
+		reg = <0x11840000 0x1000>;
+		interrupts = <0 88 0>;
+		clocks = <&clock CLK_JPEG>;
+		clock-names = "jpeg";
+		samsung,power-domain = <&pd_cam>;
+		status = "disabled";
+	};
+
 	i2c_0: i2c@13860000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.7.9.5
