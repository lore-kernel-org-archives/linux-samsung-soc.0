From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH 3/3] Addition of binding for firmware signals on peach-pi
Date: Tue,  1 Dec 2015 19:12:51 +0000
Message-ID: <1448997171-7064-4-git-send-email-martyn.welch@collabora.co.uk>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448997171-7064-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

The peach pi has a GPIO connected to the firmware write protect, developer
mode and recovery mode lines. This patch adds the required nodes to the
device tree to configure the pinmuxing and allow these to be read from
user space.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 49a4f43..485c18f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -53,6 +53,25 @@
 		};
 	};
 
+	chromeos-firmware {
+		compatible = "google,gpio-firmware";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wp_gpio &dev_mode &rec_mode>;
+
+		write-protect {
+			gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		developer-switch {
+			gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		recovery-switch {
+			gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -731,6 +750,13 @@
 		samsung,pin-val = <0>;
 	};
 
+	rec_mode: rec-mode {
+		samsung,pins = "gpx0-7";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	tpm_irq: tpm-irq {
 		samsung,pins = "gpx1-0";
 		samsung,pin-function = <0>;
@@ -752,6 +778,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	dev_mode: dev-mode {
+		samsung,pins = "gpx1-3";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
+
 	ec_irq: ec-irq {
 		samsung,pins = "gpx1-5";
 		samsung,pin-function = <0>;
@@ -773,6 +806,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	wp_gpio: wp_gpio {
+		samsung,pins = "gpx3-0";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	max77802_irq: max77802-irq {
 		samsung,pins = "gpx3-1";
 		samsung,pin-function = <0>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
