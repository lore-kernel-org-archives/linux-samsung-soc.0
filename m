From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/3] ARM: dts: Add lid GPIO key device node for Peach boards
Date: Fri, 12 Dec 2014 11:25:50 +0100
Message-ID: <1418379951-5551-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1418379951-5551-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33858 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757663AbaLLK0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 05:26:20 -0500
In-Reply-To: <1418379951-5551-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have both
a power and lid GPIO keys but only the former was defined in the
DTS. Add DTS snippets for the lid GPIO key too. These were taken
from the downstream ChromeOS 3.8 kernel tree.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 18 +++++++++++++++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 19 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 9a050e1..fa74a73 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -53,7 +53,7 @@
 		compatible = "gpio-keys";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&power_key_irq>;
+		pinctrl-0 = <&power_key_irq &lid_irq>;
 
 		power {
 			label = "Power";
@@ -61,6 +61,15 @@
 			linux,code = <KEY_POWER>;
 			gpio-key,wakeup;
 		};
+
+		lid-switch {
+			label = "Lid";
+			gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <5>; /* EV_SW */
+			linux,code = <0>; /* SW_LID */
+			debounce-interval = <1>;
+			gpio-key,wakeup;
+		};
 	};
 
 	memory {
@@ -658,6 +667,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	lid_irq: lid-irq {
+		samsung,pins = "gpx3-4";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	hdmi_hpd_irq: hdmi-hpd-irq {
 		samsung,pins = "gpx3-7";
 		samsung,pin-function = <0>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index e8fdda8..d603e73 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -52,7 +52,7 @@
 		compatible = "gpio-keys";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&power_key_irq>;
+		pinctrl-0 = <&power_key_irq &lid_irq>;
 
 		power {
 			label = "Power";
@@ -60,6 +60,16 @@
 			linux,code = <KEY_POWER>;
 			gpio-key,wakeup;
 		};
+
+		lid-switch {
+			label = "Lid";
+			gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <5>; /* EV_SW */
+			linux,code = <0>; /* SW_LID */
+			debounce-interval = <1>;
+			gpio-key,wakeup;
+		};
+
 	};
 
 	memory {
@@ -646,6 +656,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	lid_irq: lid-irq {
+		samsung,pins = "gpx3-4";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	hdmi_hpd_irq: hdmi-hpd-irq {
 		samsung,pins = "gpx3-7";
 		samsung,pin-function = <0>;
-- 
2.1.0
