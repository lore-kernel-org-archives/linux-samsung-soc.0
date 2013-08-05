From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH RESEND] ARM: dts: Add USBPHY nodes to Exynos4x12
Date: Tue,  6 Aug 2013 03:18:43 +0900
Message-ID: <1375726723-20862-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds device nodes for USBPHY to Exynos4x12.

CC: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 01da194..9c3335b 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -73,4 +73,22 @@
 		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
+
+	usbphy@125B00000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "samsung,exynos4x12-usb2phy";
+		reg = <0x125B0000 0x100>;
+		ranges;
+
+		clocks = <&clock 2>, <&clock 305>;
+		clock-names = "xusbxti", "otg";
+		status = "disabled";
+
+		usbphy-sys {
+			/* USB device and host PHY_CONTROL registers */
+			reg = <0x10020704 0xc>,
+			      <0x1001021c 0x4>;
+		};
+	};
 };
-- 
1.7.9.5
