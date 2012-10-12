From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 4/6] dts: exynos: add device tree support for exynos5 hdmiddc
Date: Sat, 13 Oct 2012 02:12:33 +0530
Message-ID: <1350074555-26018-5-git-send-email-rahul.sharma@samsung.com>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25364 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787Ab2JLLRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 07:17:34 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBS005YI218Z6A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:17:32 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBS006L91SLP040@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:17:32 +0900 (KST)
In-reply-to: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
hdmi ddc.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/hdmiddc.txt     |   12 ++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +++++++++-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
 3 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt b/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
new file mode 100644
index 0000000..c408892
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
@@ -0,0 +1,12 @@
+Device-Tree bindings for hdmiddc driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-hdmiddc".
+- reg: I2C address of the hdmiddc device.
+
+Example:
+
+	hdmiddc {
+		compatible = "samsung,exynos5-hdmiddc";
+		reg = <0x50>;
+	};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index af9271c..be22a83 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -56,7 +56,15 @@
 	};
 
 	i2c@12C80000 {
-		status = "disabled";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		gpios = <&gpa0 6 3 3 0>,
+			<&gpa0 7 3 3 0>;
+
+		hdmiddc {
+			compatible = "samsung,exynos5-hdmiddc";
+			reg = <0x50>;
+		};
 	};
 
 	i2c@12C90000 {
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 3f129db..003963c 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -47,6 +47,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"s3c2440-i2c.0", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(1),
 				"s3c2440-i2c.1", NULL),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(2),
+				"s3c2440-i2c.2", NULL),
 	OF_DEV_AUXDATA("samsung,s3c2440-hdmiphy-i2c", EXYNOS5_PA_IIC(8),
 				"s3c2440-hdmiphy-i2c", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5250-dw-mshc", EXYNOS5_PA_DWMCI0,
-- 
1.7.0.4
