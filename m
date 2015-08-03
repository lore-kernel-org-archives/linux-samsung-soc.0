From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/2] ARM: dts: Fix power off method on exynos5422-odroidxu3
Date: Mon,  3 Aug 2015 21:37:27 +0900
Message-ID: <1438605447-6836-3-git-send-email-k.kozlowski.k@gmail.com>
References: <1438605447-6836-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438605447-6836-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Odroid XU3 family boards have ACOKB pin of PMIC grounded, instead of
pulled up as usual. This means that PMIC must manually set PWRHOLD field
in its CTRL1 register to low before initiating power down.

This fixes Odroid XU3 powering off:
[   25.966053] reboot: Power down
[   25.967679] Power down.
[   26.070174] Power down failed, please power off system manually.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Reported-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 1565667e6f69..48cecc8cf26e 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -159,6 +159,7 @@
 		s2mps11,buck2-ramp-enable = <1>;
 		s2mps11,buck3-ramp-enable = <1>;
 		s2mps11,buck4-ramp-enable = <1>;
+		samsung,s2mps11-acokb-ground;
 
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-- 
2.1.4
