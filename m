From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 2/5] ARM: Exynos4: dts: Specify address and size cells for
 i2c controllers
Date: Tue, 04 Sep 2012 10:50:06 +0200
Message-ID: <1346748609-11115-3-git-send-email-t.figa@samsung.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57810 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752850Ab2IDIuf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 04:50:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9T0086XHVDINR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:34 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9T00APCHVV47N0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:34 +0900 (KST)
In-reply-to: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 9b71b61..718e3d2 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -122,6 +122,8 @@
 	};
 
 	i2c@13860000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13860000 0x100>;
 		interrupts = <0 58 0>;
@@ -129,6 +131,8 @@
 	};
 
 	i2c@13870000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13870000 0x100>;
 		interrupts = <0 59 0>;
@@ -136,6 +140,8 @@
 	};
 
 	i2c@13880000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13880000 0x100>;
 		interrupts = <0 60 0>;
@@ -143,6 +149,8 @@
 	};
 
 	i2c@13890000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13890000 0x100>;
 		interrupts = <0 61 0>;
@@ -150,6 +158,8 @@
 	};
 
 	i2c@138A0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138A0000 0x100>;
 		interrupts = <0 62 0>;
@@ -157,6 +167,8 @@
 	};
 
 	i2c@138B0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138B0000 0x100>;
 		interrupts = <0 63 0>;
@@ -164,6 +176,8 @@
 	};
 
 	i2c@138C0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138C0000 0x100>;
 		interrupts = <0 64 0>;
@@ -171,6 +185,8 @@
 	};
 
 	i2c@138D0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138D0000 0x100>;
 		interrupts = <0 65 0>;
-- 
1.7.12
