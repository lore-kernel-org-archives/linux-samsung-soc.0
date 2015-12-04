From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [PATCH 3/3] ARM: dts: Addition of binding for gpio switches on peach-pi
Date: Fri,  4 Dec 2015 17:31:15 +0000
Message-ID: <1449250275-23435-4-git-send-email-martyn.welch@collabora.co.uk>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Martyn Welch <martyn.welch@collabora.co.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

The peach pi has a GPIO connected to the firmware write protect, developer
mode and recovery mode lines (which are primarily controlled via external
switches on developer test board). This patch adds the required nodes to
the device tree to configure the pinmuxing and allow these to be read from
user space.

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 49a4f43..2937372 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -53,6 +53,31 @@
 		};
 	};
 
+	gpio-switch {
+		compatible = "gpio-switch";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wp_gpio &dev_mode &rec_mode>;
+
+		write-protect {
+			label = "write-protect";
+			gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
+			read-only;
+		};
+
+		developer-switch {
+			label = "developer-switch";
+			gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
+			read-only;
+		};
+
+		recovery-switch {
+			label = "recovery-switch";
+			gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
+			read-only;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -731,6 +756,13 @@
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
@@ -752,6 +784,13 @@
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
@@ -773,6 +812,13 @@
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
