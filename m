From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 2/4] ARM: dts: Add hsotg node for exynos3250
Date: Tue, 23 Dec 2014 21:46:30 +0900
Message-ID: <1419338792-22853-3-git-send-email-jaewon02.kim@samsung.com>
References: <1419338792-22853-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1419338792-22853-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds device tree node for hsotg to control USB 2.0 Device.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index d976007..e5c891a 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -255,6 +255,17 @@
 			status = "disabled";
 		};
 
+		hsotg: hsotg@12480000 {
+			compatible = "snps,dwc2";
+			reg = <0x12480000 0x20000>;
+			interrupts = <0 141 0>;
+			clocks = <&cmu CLK_USBOTG>;
+			clock-names = "otg";
+			phys = <&exynos_usbphy 0>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
 		mshc_0: mshc@12510000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12510000 0x1000>;
-- 
1.7.9.5
