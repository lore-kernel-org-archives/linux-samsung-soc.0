From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/6] ARM: Exynos4: dts: Specify address and size cells for i2c
 controllers
Date: Thu, 30 Aug 2012 09:31:40 +0200
Message-ID: <1346311903-15920-4-git-send-email-t.figa@samsung.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37306 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751191Ab2H3HcS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 03:32:18 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9K00DL24X4I4B0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:18 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9K00G074XCNR40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:17 +0900 (KST)
In-reply-to: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5e99503..5935588 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -116,48 +116,64 @@
 	};
 
 	i2c@13860000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13860000 0x100>;
 		interrupts = <0 58 0>;
 	};
 
 	i2c@13870000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13870000 0x100>;
 		interrupts = <0 59 0>;
 	};
 
 	i2c@13880000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13880000 0x100>;
 		interrupts = <0 60 0>;
 	};
 
 	i2c@13890000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x13890000 0x100>;
 		interrupts = <0 61 0>;
 	};
 
 	i2c@138A0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138A0000 0x100>;
 		interrupts = <0 62 0>;
 	};
 
 	i2c@138B0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138B0000 0x100>;
 		interrupts = <0 63 0>;
 	};
 
 	i2c@138C0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138C0000 0x100>;
 		interrupts = <0 64 0>;
 	};
 
 	i2c@138D0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "samsung,s3c2440-i2c";
 		reg = <0x138D0000 0x100>;
 		interrupts = <0 65 0>;
-- 
1.7.12
