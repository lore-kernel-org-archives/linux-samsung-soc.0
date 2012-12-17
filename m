From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH 4/4] ODROID-X: dts: Add mshc node for ODROID-X board
Date: Tue, 18 Dec 2012 04:55:07 +0900
Message-ID: <1355774107-364-5-git-send-email-tobetter@gmail.com>
References: <1355774107-364-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355774107-364-1-git-send-email-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Dongjin Kim <tobetter@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding the device node to support eMMC storage on SDCARD4 ports, controlled by
Mobile Storage Host Controller.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 3943011..fbd0b51 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -73,4 +73,25 @@
 			linux,default-trigger = "mmc0";
 		};
 	};
+
+	mshc@12550000 {
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3 3>;
+		samsung,dw-mshc-ddr-timing = <1 2 3>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+			gpios = <&gpk0 0 3>, <&gpk0 1 3>,
+				<&gpk0 3 3>, <&gpk0 4 3>,
+				<&gpk0 5 3>, <&gpk0 6 3>,
+				<&gpk1 3 4>, <&gpk1 4 4>,
+				<&gpk1 5 4>, <&gpk1 6 4>;
+		};
+	};
 };
-- 
1.7.9.5
