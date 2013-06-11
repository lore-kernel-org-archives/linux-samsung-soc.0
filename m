From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/9] drm/exynos: rename compatible strings for hdmi subsystem
Date: Tue, 11 Jun 2013 19:41:24 +0530
Message-ID: <1370959891-8923-3-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52722 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab3FKNtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 09:49:46 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO800NABEEE1050@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 22:49:44 +0900 (KST)
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

This patch renames the combatible strings for hdmi, mixer, ddc
and hdmiphy. It follows the convention of using compatible string
which represent the SoC in which the IP was added for the first
time.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos_hdmi.txt    |    6 ++++--
 Documentation/devicetree/bindings/video/exynos_hdmiddc.txt |    4 ++--
 Documentation/devicetree/bindings/video/exynos_hdmiphy.txt |    4 ++--
 Documentation/devicetree/bindings/video/exynos_mixer.txt   |    7 +++++--
 arch/arm/boot/dts/cros5250-common.dtsi                     |    4 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts                  |    4 ++--
 arch/arm/boot/dts/exynos5250.dtsi                          |    4 ++--
 drivers/gpu/drm/exynos/exynos_ddc.c                        |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c                       |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmiphy.c                    |    2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c                      |   12 ++++++------
 11 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 589edee..2ac01ca 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -1,7 +1,9 @@
 Device-Tree bindings for drm hdmi driver
 
 Required properties:
-- compatible: value should be "samsung,exynos5-hdmi".
+- compatible: value should be one among the following:
+	1) "samsung,exynos4210-hdmi"
+	2) "samsung,exynos4212-hdmi"
 - reg: physical base address of the hdmi and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
@@ -15,7 +17,7 @@ Required properties:
 Example:
 
 	hdmi {
-		compatible = "samsung,exynos5-hdmi";
+		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 0xf 1 3>;
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
index fa166d9..c1bd2ea 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
@@ -1,12 +1,12 @@
 Device-Tree bindings for hdmiddc driver
 
 Required properties:
-- compatible: value should be "samsung,exynos5-hdmiddc".
+- compatible: value should be "samsung,exynos4210-hdmiddc".
 - reg: I2C address of the hdmiddc device.
 
 Example:
 
 	hdmiddc {
-		compatible = "samsung,exynos5-hdmiddc";
+		compatible = "samsung,exynos4210-hdmiddc";
 		reg = <0x50>;
 	};
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
index 858f4f9..fb688a6 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
@@ -1,12 +1,12 @@
 Device-Tree bindings for hdmiphy driver
 
 Required properties:
-- compatible: value should be "samsung,exynos5-hdmiphy".
+- compatible: value should be "samsung,exynos4210-hdmiphy".
 - reg: I2C address of the hdmiphy device.
 
 Example:
 
 	hdmiphy {
-		compatible = "samsung,exynos5-hdmiphy";
+		compatible = "samsung,exynos4210-hdmiphy";
 		reg = <0x38>;
 	};
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index 9b2ea03..a8b063f 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -1,7 +1,10 @@
 Device-Tree bindings for mixer driver
 
 Required properties:
-- compatible: value should be "samsung,exynos5-mixer".
+- compatible: value should be:
+	1) "samsung,exynos4210-mixer"
+	2) "samsung,exynos5250-mixer"
+
 - reg: physical base address of the mixer and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
@@ -9,7 +12,7 @@ Required properties:
 Example:
 
 	mixer {
-		compatible = "samsung,exynos5-mixer";
+		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 3f0239e..0a319c3 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -190,7 +190,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiddc@50 {
-			compatible = "samsung,exynos5-hdmiddc";
+			compatible = "samsung,exynos4210-hdmiddc";
 			reg = <0x50>;
 		};
 	};
@@ -224,7 +224,7 @@
 		samsung,i2c-max-bus-freq = <378000>;
 
 		hdmiphy@38 {
-			compatible = "samsung,exynos5-hdmiphy";
+			compatible = "samsung,exynos4210-hdmiphy";
 			reg = <0x38>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 3e0c792..0ec6856 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -72,7 +72,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiddc@50 {
-			compatible = "samsung,exynos5-hdmiddc";
+			compatible = "samsung,exynos4210-hdmiddc";
 			reg = <0x50>;
 		};
 	};
@@ -102,7 +102,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiphy@38 {
-			compatible = "samsung,exynos5-hdmiphy";
+			compatible = "samsung,exynos4210-hdmiphy";
 			reg = <0x38>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 5549236..0157fec 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -601,7 +601,7 @@
 	};
 
 	hdmi {
-		compatible = "samsung,exynos5-hdmi";
+		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
 		clocks = <&clock 344>, <&clock 136>, <&clock 137>,
@@ -617,7 +617,7 @@
 	};
 
 	mixer {
-		compatible = "samsung,exynos5-mixer";
+		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 		clocks = <&clock 343>, <&clock 136>;
diff --git a/drivers/gpu/drm/exynos/exynos_ddc.c b/drivers/gpu/drm/exynos/exynos_ddc.c
index 4e9b5ba..1a0cca1 100644
--- a/drivers/gpu/drm/exynos/exynos_ddc.c
+++ b/drivers/gpu/drm/exynos/exynos_ddc.c
@@ -51,7 +51,7 @@ static struct i2c_device_id ddc_idtable[] = {
 #ifdef CONFIG_OF
 static struct of_device_id hdmiddc_match_types[] = {
 	{
-		.compatible = "samsung,exynos5-hdmiddc",
+		.compatible = "samsung,exynos4210-hdmiddc",
 	}, {
 		/* end node */
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9384ffc..a7f7ab3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1981,7 +1981,7 @@ static struct platform_device_id hdmi_driver_types[] = {
 #ifdef CONFIG_OF
 static struct of_device_id hdmi_match_types[] = {
 	{
-		.compatible = "samsung,exynos5-hdmi",
+		.compatible = "samsung,exynos4212-hdmi",
 		.data	= (void	*)HDMI_VER_EXYNOS4212,
 	}, {
 		/* end node */
diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
index ea49d13..60dbe6c 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
@@ -49,7 +49,7 @@ static const struct i2c_device_id hdmiphy_id[] = {
 #ifdef CONFIG_OF
 static struct of_device_id hdmiphy_match_types[] = {
 	{
-		.compatible = "samsung,exynos5-hdmiphy",
+		.compatible = "samsung,exynos4210-hdmiphy",
 	}, {
 		/* end node */
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 978894e..58dfd3f 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1127,12 +1127,12 @@ static int vp_resources_init(struct exynos_drm_hdmi_context *ctx,
 	return 0;
 }
 
-static struct mixer_drv_data exynos5_mxr_drv_data = {
+static struct mixer_drv_data exynos5250_mxr_drv_data = {
 	.version = MXR_VER_16_0_33_0,
 	.is_vp_enabled = 0,
 };
 
-static struct mixer_drv_data exynos4_mxr_drv_data = {
+static struct mixer_drv_data exynos4210_mxr_drv_data = {
 	.version = MXR_VER_0_0_0_16,
 	.is_vp_enabled = 1,
 };
@@ -1140,10 +1140,10 @@ static struct mixer_drv_data exynos4_mxr_drv_data = {
 static struct platform_device_id mixer_driver_types[] = {
 	{
 		.name		= "s5p-mixer",
-		.driver_data	= (unsigned long)&exynos4_mxr_drv_data,
+		.driver_data	= (unsigned long)&exynos4210_mxr_drv_data,
 	}, {
 		.name		= "exynos5-mixer",
-		.driver_data	= (unsigned long)&exynos5_mxr_drv_data,
+		.driver_data	= (unsigned long)&exynos5250_mxr_drv_data,
 	}, {
 		/* end node */
 	}
@@ -1151,8 +1151,8 @@ static struct platform_device_id mixer_driver_types[] = {
 
 static struct of_device_id mixer_match_types[] = {
 	{
-		.compatible = "samsung,exynos5-mixer",
-		.data	= &exynos5_mxr_drv_data,
+		.compatible = "samsung,exynos5250-mixer",
+		.data	= &exynos5250_mxr_drv_data,
 	}, {
 		/* end node */
 	}
-- 
1.7.10.4
