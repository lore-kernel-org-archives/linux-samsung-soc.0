From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: Enable USB node for exynos3250-rinato
Date: Wed, 24 Dec 2014 14:45:32 +0900
Message-ID: <1419399933-3707-4-git-send-email-jaewon02.kim@samsung.com>
References: <1419399933-3707-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1419399933-3707-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables hsotg and usbphy node to use USB 2.0 Device.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 80aa8b4..bf4c17b 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -125,6 +125,16 @@
 	};
 };
 
+&exynos_usbphy {
+	status = "okay";
+};
+
+&hsotg {
+	vusb_d-supply = <&ldo15_reg>;
+	vusb_a-supply = <&ldo12_reg>;
+	status = "okay";
+};
+
 &i2c_0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
1.7.9.5
