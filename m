From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] ARM: dts: moving dt binding documents for video devices to
 common place
Date: Wed, 06 Feb 2013 09:51:39 -0500
Message-ID: <1360162299-8893-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57959 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294Ab3BFOba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 09:31:30 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHS00I11Z0F7L70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 23:31:29 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHS00IPFYYLHJ30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 23:31:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Binding Documents for drm-devices are placed in
Documentation/devicetree/bindings/drm/*. But these devices are common
for v4l framework, hence moved to a common place at
Documentation/devicetree/bindings/video/. 'exynos_' prefix is added to
associate them with exynos soc series.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
It is base on for-next branch of
git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
 .../devicetree/bindings/drm/exynos/hdmi.txt        | 22 ----------------------
 .../devicetree/bindings/drm/exynos/hdmiddc.txt     | 12 ------------
 .../devicetree/bindings/drm/exynos/hdmiphy.txt     | 12 ------------
 .../devicetree/bindings/drm/exynos/mixer.txt       | 15 ---------------
 .../devicetree/bindings/video/exynos_hdmi.txt      | 22 ++++++++++++++++++++++
 .../devicetree/bindings/video/exynos_hdmiddc.txt   | 12 ++++++++++++
 .../devicetree/bindings/video/exynos_hdmiphy.txt   | 12 ++++++++++++
 .../devicetree/bindings/video/exynos_mixer.txt     | 15 +++++++++++++++
 8 files changed, 61 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
 delete mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
 delete mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
 create mode 100644 Documentation/devicetree/bindings/video/exynos_mixer.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
deleted file mode 100644
index 589edee..0000000
--- a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device-Tree bindings for drm hdmi driver
-
-Required properties:
-- compatible: value should be "samsung,exynos5-hdmi".
-- reg: physical base address of the hdmi and length of memory mapped
-	region.
-- interrupts: interrupt number to the cpu.
-- hpd-gpio: following information about the hotplug gpio pin.
-	a) phandle of the gpio controller node.
-	b) pin number within the gpio controller.
-	c) pin function mode.
-	d) optional flags and pull up/down.
-	e) drive strength.
-
-Example:
-
-	hdmi {
-		compatible = "samsung,exynos5-hdmi";
-		reg = <0x14530000 0x100000>;
-		interrupts = <0 95 0>;
-		hpd-gpio = <&gpx3 7 0xf 1 3>;
-	};
diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt b/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
deleted file mode 100644
index fa166d9..0000000
--- a/Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Device-Tree bindings for hdmiddc driver
-
-Required properties:
-- compatible: value should be "samsung,exynos5-hdmiddc".
-- reg: I2C address of the hdmiddc device.
-
-Example:
-
-	hdmiddc {
-		compatible = "samsung,exynos5-hdmiddc";
-		reg = <0x50>;
-	};
diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt b/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
deleted file mode 100644
index 858f4f9..0000000
--- a/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Device-Tree bindings for hdmiphy driver
-
-Required properties:
-- compatible: value should be "samsung,exynos5-hdmiphy".
-- reg: I2C address of the hdmiphy device.
-
-Example:
-
-	hdmiphy {
-		compatible = "samsung,exynos5-hdmiphy";
-		reg = <0x38>;
-	};
diff --git a/Documentation/devicetree/bindings/drm/exynos/mixer.txt b/Documentation/devicetree/bindings/drm/exynos/mixer.txt
deleted file mode 100644
index 9b2ea03..0000000
--- a/Documentation/devicetree/bindings/drm/exynos/mixer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Device-Tree bindings for mixer driver
-
-Required properties:
-- compatible: value should be "samsung,exynos5-mixer".
-- reg: physical base address of the mixer and length of memory mapped
-	region.
-- interrupts: interrupt number to the cpu.
-
-Example:
-
-	mixer {
-		compatible = "samsung,exynos5-mixer";
-		reg = <0x14450000 0x10000>;
-		interrupts = <0 94 0>;
-	};
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
new file mode 100644
index 0000000..589edee
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -0,0 +1,22 @@
+Device-Tree bindings for drm hdmi driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-hdmi".
+- reg: physical base address of the hdmi and length of memory mapped
+	region.
+- interrupts: interrupt number to the cpu.
+- hpd-gpio: following information about the hotplug gpio pin.
+	a) phandle of the gpio controller node.
+	b) pin number within the gpio controller.
+	c) pin function mode.
+	d) optional flags and pull up/down.
+	e) drive strength.
+
+Example:
+
+	hdmi {
+		compatible = "samsung,exynos5-hdmi";
+		reg = <0x14530000 0x100000>;
+		interrupts = <0 95 0>;
+		hpd-gpio = <&gpx3 7 0xf 1 3>;
+	};
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
new file mode 100644
index 0000000..fa166d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
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
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
new file mode 100644
index 0000000..858f4f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
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
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
new file mode 100644
index 0000000..9b2ea03
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -0,0 +1,15 @@
+Device-Tree bindings for mixer driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-mixer".
+- reg: physical base address of the mixer and length of memory mapped
+	region.
+- interrupts: interrupt number to the cpu.
+
+Example:
+
+	mixer {
+		compatible = "samsung,exynos5-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+	};
-- 
1.8.0
