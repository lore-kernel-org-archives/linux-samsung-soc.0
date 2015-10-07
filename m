From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 5/5] ARM: dts: Use GPIO constants for flags cells in exynos5440 boards
Date: Wed,  7 Oct 2015 15:14:17 +0200
Message-ID: <1444223657-7248-6-git-send-email-javier@osg.samsung.com>
References: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The board DTS are using numeric values instead of the defined GPIO
constanst to express polarity, use them to make the DTS more clear.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos5440-ssdk5440.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index e4443f4e6572..6a0d802e87c8 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos5440.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "SAMSUNG SSDK5440 board based on EXYNOS5440";
@@ -29,12 +30,12 @@
 };
 
 &pcie_0 {
-	reset-gpio = <&pin_ctrl 5 0>;
+	reset-gpio = <&pin_ctrl 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
 &pcie_1 {
-	reset-gpio = <&pin_ctrl 22 0>;
+	reset-gpio = <&pin_ctrl 22 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
-- 
2.4.3
