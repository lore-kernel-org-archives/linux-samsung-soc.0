From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 9/9] ARM/dts: update device tree binding documentation for hdmi
 susbsystem
Date: Tue, 11 Jun 2013 19:41:31 +0530
Message-ID: <1370959891-8923-10-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53021 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab3FKNxY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 09:53:24 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO8005C1EKZCJ20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 22:53:23 +0900 (KST)
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Update device tree binding documentation for hdmi subsystem with the
clock information, phy property information and compatible strings for
exynos5420.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/video/exynos_hdmi.txt       |   19 +++++++++++++++++++
 .../devicetree/bindings/video/exynos_hdmiphy.txt    |   10 ++++++++--
 .../devicetree/bindings/video/exynos_mixer.txt      |    7 +++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 2ac01ca..e3c5853 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: value should be one among the following:
 	1) "samsung,exynos4210-hdmi"
 	2) "samsung,exynos4212-hdmi"
+	3) "samsung,exynos5420-hdmi"
 - reg: physical base address of the hdmi and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
@@ -13,6 +14,20 @@ Required properties:
 	c) pin function mode.
 	d) optional flags and pull up/down.
 	e) drive strength.
+- clocks: list of clock IDs from SoC clock driver.
+	a) hdmi: It is required for gate operation on aclk_200_disp1 clock
+		which clocks the display1 block.
+	b) sclk_hdmi: It is required for gate operation on sclk_hdmi clock
+		which clocks hdmi IP.
+	c) sclk_pixel: Parent for mux mout_hdmi.
+	d) sclk_hdmiphy: Parent for mux mout_hdmi.
+	e) mout_hdmi: It is required by the driver to switch between the 2
+		parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
+		after configuration, parent is set to sclk_hdmiphy else
+		sclk_pixel.
+- clock-names: aliases as per driver requirements for above clock IDs:
+	"hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
+- phy: this property holds the phandle for hdmiphy node.
 
 Example:
 
@@ -21,4 +36,8 @@ Example:
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 0xf 1 3>;
+		clocks = <&clock 344>, <&clock 136>, <&clock 137>,
+				<&clock 157>, <&clock 1024>;
+		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+				"sclk_hdmiphy", "mout_hdmi";
 	};
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
index fb688a6..e2b12ed 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
@@ -1,8 +1,14 @@
 Device-Tree bindings for hdmiphy driver
 
 Required properties:
-- compatible: value should be "samsung,exynos4210-hdmiphy".
-- reg: I2C address of the hdmiphy device.
+- compatible: value should be one among the following
+	1) Samsung,exynos4210-hdmiphy".
+	2) Samsung,exynos5420-hdmiphy".
+
+- reg: it holds the physical address infomration for the hdmiphy device.
+	If it is a i2c device, reg holds the I2C address of the phy. For
+	platform bus mapped phy, reg property holds physical address as
+	well as size of the register region.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index a8b063f..38e4e5c 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -4,10 +4,15 @@ Required properties:
 - compatible: value should be:
 	1) "samsung,exynos4210-mixer"
 	2) "samsung,exynos5250-mixer"
+	3) "samsung,exynos5420-mixer"
 
 - reg: physical base address of the mixer and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
+- clocks: list of clock IDs from SoC clock driver.
+	a) mixer: It is required for gate operation on aclk_200_disp1 clock
+		which clocks the display1 block.
+	b) sclk_hdmi: Parent for mux mout_mixer.
 
 Example:
 
@@ -15,4 +20,6 @@ Example:
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		clocks = <&clock 343>, <&clock 136>;
+		clock-names = "mixer", "sclk_hdmi";
 	};
-- 
1.7.10.4
