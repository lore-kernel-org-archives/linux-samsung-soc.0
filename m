From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/4] ARM: dts: add support for hdmi-phy to exynos4412
Date: Fri, 25 Jan 2013 05:39:44 -0500
Message-ID: <1359110384-28402-5-git-send-email-rahul.sharma@samsung.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13296 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924Ab3AYKST (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 05:18:19 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH6009V9FA612T0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:18:18 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH600LMIFA67490@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:18:17 +0900 (KST)
In-reply-to: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi         |  8 ++++++++
 arch/arm/boot/dts/exynos4412.dtsi      | 11 +++++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c |  2 ++
 3 files changed, 21 insertions(+)
 mode change 100644 => 100755 arch/arm/boot/dts/exynos4.dtsi
 mode change 100755 => 100644 arch/arm/boot/dts/exynos4412.dtsi

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
old mode 100644
new mode 100755
index a75e2f5..b0b13c9
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -230,6 +230,14 @@
 		status = "disabled";
 	};
 
+	i2c_8: i2c@138E0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "samsung,s3c2440-hdmiphy-i2c";
+		reg = <0x138E0000 0x100>;
+		interrupts = <0 93 0>;
+	};
+
 	spi_0: spi@13920000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x13920000 0x100>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
old mode 100755
new mode 100644
index d7dfe31..f4f6ce7
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -25,4 +25,15 @@
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
+
+	i2c_8: i2c@138E0000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <100000>;
+		samsung,i2c-slave-addr = <16>;
+
+		hdmiphy@38 {
+			compatible = "samsung,exynos4-hdmiphy";
+			reg = <0x38>;
+		};
+	};
 };
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index f3b85b64..796957e 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -69,6 +69,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 				"s3c2440-i2c.6", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(7),
 				"s3c2440-i2c.7", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-hdmiphy-i2c", EXYNOS4_PA_IIC_HDMIPHY,
+				"s3c2440-hdmiphy-i2c", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI0,
 				"exynos4210-spi.0", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI1,
-- 
1.8.0
