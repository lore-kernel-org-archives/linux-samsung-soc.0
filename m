From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: include I2C devices for exynos5440 and ssdk5440
Date: Fri, 18 Jan 2013 21:18:17 -0800
Message-ID: <1358572697-28609-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16995 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab3ASFSw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 00:18:52 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGU001S4XFERH90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 14:18:50 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGU000LXXFB9H60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 14:18:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Giridhar Maruthy <giridhar.m@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    8 --------
 arch/arm/boot/dts/exynos5440.dtsi         |    4 ++--
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 4c411fa..ee60c57 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -27,12 +27,4 @@
 	spi {
 		status = "disabled";
 	};
-
-	i2c@F0000 {
-		status = "disabled";
-	};
-
-	i2c@100000 {
-		status = "disabled";
-	};
 };
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5406689..1ee3003 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -105,7 +105,7 @@
 	};
 
 	i2c@F0000 {
-		compatible = "samsung,s3c2440-i2c";
+		compatible = "samsung,exynos5440-i2c";
 		reg = <0xF0000 0x1000>;
 		interrupts = <0 5 0>;
 		#address-cells = <1>;
@@ -113,7 +113,7 @@
 	};
 
 	i2c@100000 {
-		compatible = "samsung,s3c2440-i2c";
+		compatible = "samsung,exynos5440-i2c";
 		reg = <0x100000 0x1000>;
 		interrupts = <0 6 0>;
 		#address-cells = <1>;
-- 
1.7.10.4
