From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 11/22] ARM: dts: Remove '0x's from Exynos5440 DTS file
Date: Mon, 22 Jul 2013 11:52:30 +0100
Message-ID: <1374490361-25769-11-git-send-email-lee.jones@linaro.org>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, linus.walleij@stericsson.com, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/exynos5440.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index ff7f5d8..0cedba4 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -20,7 +20,7 @@
 		spi0 = &spi_0;
 	};
 
-	clock: clock-controller@0x160000 {
+	clock: clock-controller@160000 {
 		compatible = "samsung,exynos5440-clock";
 		reg = <0x160000 0x1000>;
 		#clock-cells = <1>;
-- 
1.8.1.2
