From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 3/4] dt: exynos5420: Enable support for USB 3.0 PHY controller
Date: Thu, 31 Oct 2013 13:15:43 +0530
Message-ID: <1383205544-32244-4-git-send-email-gautam.vivek@samsung.com>
References: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, kishon@ti.com, kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, t.figa@samsung.com, balbi@ti.com, jwerner@chromium.org, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree nodes for USB 3.0 PHY present alongwith
USB 3.0 controller Exynos 5420 SoC. This phy driver is
based on generic phy framework.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..5df3308 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -235,4 +235,20 @@
 		io-channel-ranges;
 		status = "disabled";
 	};
+
+	usbphy@12100000 {
+		compatible = "samsung,exynos5420-usb3phy";
+		reg = <0x12100000 0x100 0x10040704 0x4>;
+		clocks = <&clock 366>, <&clock 1>, <&clock 152>;
+		clock-names = "phy", "usb3drd", "sclk_usbphy30";
+		#phy-cells = <0>;
+	};
+
+	usbphy@12500000 {
+		compatible = "samsung,exynos5420-usb3phy";
+		reg = <0x12500000 0x100 0x10040708 0x4>;
+		clocks = <&clock 367>, <&clock 1>, <&clock 153>;
+		clock-names = "phy", "usb3drd", "sclk_usbphy30";
+		#phy-cells = <0>;
+	};
 };
-- 
1.7.6.5
