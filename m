From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 5/5] ARM: dts: Add Peach Pit and Pi dts entry for ISL29018 sensor
Date: Wed, 20 Aug 2014 13:19:53 +0200
Message-ID: <1408533593-32346-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420 based Peach Pit and the Exynos5800 based Peach Pi
machines have an i2c ISL29018 light sensor. This patch adds the
device nodes needed to support this device.

These DTS snippets were taken from the downstream Chrome OS 3.8
kernel Device Tree for Peach Pit and Pi boards.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 6 ++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 94225e6..455bfb8 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -499,6 +499,12 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98090_irq>;
 	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29018";
+		reg = <0x44>;
+		vcc-supply = <&tps65090_fet5>;
+	};
 };
 
 &hsi2c_9 {
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 8f9d66e..03bbe79 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -497,6 +497,12 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98091_irq>;
 	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29018";
+		reg = <0x44>;
+		vcc-supply = <&tps65090_fet5>;
+	};
 };
 
 &hsi2c_9 {
-- 
2.0.1
