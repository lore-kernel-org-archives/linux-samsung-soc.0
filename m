From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/7] ARM: dts: exynos4412-odroid*: enable MFC device
Date: Wed, 09 Dec 2015 14:58:17 +0100
Message-ID: <1449669502-24601-3-git-send-email-m.szyprowski@samsung.com>
References: <1449669502-24601-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1449669502-24601-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable support for Multimedia Codec (MFC) device for all Exynos4412-based
Odroid boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index edf0fc8..5825abf 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -18,6 +18,24 @@
 		stdout-path = &serial_1;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mfc_left: region@77000000 {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x77000000 0x1000000>;
+		};
+
+		mfc_right: region@78000000 {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x78000000 0x1000000>;
+		};
+	};
+
 	firmware@0204F000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0204F000 0x1000>;
@@ -451,6 +469,12 @@
 	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 };
 
+&mfc {
+	memory-region = <&mfc_left>, <&mfc_right>;
+	memory-region-names = "left", "right";
+	status = "okay";
+};
+
 &mixer {
 	status = "okay";
 };
-- 
1.9.2
