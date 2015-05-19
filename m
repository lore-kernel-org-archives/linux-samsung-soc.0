From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH 3/4] ARM: dts: Add SPI flash node to exynos5250-snow
Date: Tue, 19 May 2015 15:34:13 +0200
Message-ID: <1432042454-19234-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Doug Anderson <dianders@chromium.org>

Exynos5250 Snow machine has a SPI flash memory that is used to
store firmware and different system parameters and data.

Add information about the SPI flash chip so that user-space tools
can access it.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Olof Johansson <olofj@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1eca97ee4bd6..e9a2dbe2e0b9 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -615,6 +615,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	spi_cs: spi-cs {
+		samsung,pins = "gpa2-5";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
 	tps65090_irq: tps65090-irq {
 		samsung,pins = "gpx2-6";
 		samsung,pin-function = <0>;
@@ -690,6 +697,19 @@
 	status = "okay";
 	samsung,spi-src-clk = <0>;
 	num-cs = <1>;
+	cs-gpios = <&gpa2 5 0>;
+
+	spidev@0 {
+		compatible = "google,spi-flash";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi_cs>;
+
+		controller-data {
+			samsung,spi-feedback-delay = <2>;
+		};
+	};
 };
 
 &usbdrd_dwc3 {
-- 
2.1.4
