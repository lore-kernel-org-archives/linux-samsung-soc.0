From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 1/4] ARM: dts: Add exynos_usbphy node for exynos3250
Date: Tue, 23 Dec 2014 21:46:29 +0900
Message-ID: <1419338792-22853-2-git-send-email-jaewon02.kim@samsung.com>
References: <1419338792-22853-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1419338792-22853-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds device tree node for exynos_usbphy to use USB 2.0 Device.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2246549..d976007 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -279,6 +279,17 @@
 			status = "disabled";
 		};
 
+		exynos_usbphy: exynos-usbphy@125B0000 {
+			compatible = "samsung,exynos3250-usb2-phy";
+			reg = <0x125B0000 0x100>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
+			samsung,sysreg-phandle = <&sys_reg>;
+			clocks = <&cmu CLK_USBOTG>, <&xusbxti>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		amba {
 			compatible = "arm,amba-bus";
 			#address-cells = <1>;
-- 
1.7.9.5
