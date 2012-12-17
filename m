From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH 3/4] ODROID-X: dts: Add nodes for leds based on GPIO.
Date: Tue, 18 Dec 2012 04:55:06 +0900
Message-ID: <1355774107-364-4-git-send-email-tobetter@gmail.com>
References: <1355774107-364-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355774107-364-1-git-send-email-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Dongjin Kim <tobetter@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds GPIO connected LEDS on ODROID-X board, and describe its
properties.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 2d45dcb..3943011 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -59,4 +59,18 @@
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			label = "led1:heart";
+			gpios = <&gpc1 0 0>;
+			linux,default-trigger = "heartbeat";
+		};
+		led2 {
+			label = "led2:mmc0";
+			gpios = <&gpc1 2 0>;
+			linux,default-trigger = "mmc0";
+		};
+	};
 };
-- 
1.7.9.5
