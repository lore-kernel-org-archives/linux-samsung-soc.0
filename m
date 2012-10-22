From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 3/6] dts: exynos: add device tree support for exynos5 hdmiphy
Date: Mon, 22 Oct 2012 17:01:04 +0530
Message-ID: <1350905467-23832-4-git-send-email-rahul.sharma@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25164 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab2JVLUP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 07:20:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCA004NNKTP2QT0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:20:13 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCA00260KJ6TJ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:20:13 +0900 (KST)
In-reply-to: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
hdmiphy.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/hdmiphy.txt     |   12 ++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
 4 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt b/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
new file mode 100644
index 0000000..858f4f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
@@ -0,0 +1,12 @@
+Device-Tree bindings for hdmiphy driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-hdmiphy".
+- reg: I2C address of the hdmiphy device.
+
+Example:
+
+	hdmiphy {
+		compatible = "samsung,exynos5-hdmiphy";
+		reg = <0x38>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 2a478ab..7dc196f 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -79,6 +79,16 @@
 		status = "disabled";
 	};
 
+	i2c@12CE0000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+
+		hdmiphy@38 {
+			compatible = "samsung,exynos5-hdmiphy";
+			reg = <0x38>;
+		};
+	};
+
 	dwmmc_0: dwmmc0@12200000 {
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dd02b40..cc42bac 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -152,6 +152,14 @@
 		#size-cells = <0>;
 	};
 
+	i2c@12CE0000 {
+		compatible = "samsung,s3c2440-hdmiphy-i2c";
+		reg = <0x12CE0000 0x1000>;
+		interrupts = <0 64 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d20000 0x100>;
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index bb2d1ae..7d2bcf1 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -47,6 +47,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"s3c2440-i2c.0", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(1),
 				"s3c2440-i2c.1", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-hdmiphy-i2c", EXYNOS5_PA_IIC(8),
+				"s3c2440-hdmiphy-i2c", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI0,
 				"dw_mmc.0", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI1,
-- 
1.7.0.4
