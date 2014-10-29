From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos4412-odroid-common: add reboot handler
Date: Wed, 29 Oct 2014 14:13:29 +0100
Message-ID: <1414588409-8065-2-git-send-email-m.szyprowski@samsung.com>
References: <1414588409-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <1414588409-8065-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sebastian Reichel <sre@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds node which enables board-specific reboot/poweroff code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 4ebb5572d8d0..3544bb255e58 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -32,6 +32,12 @@
 		};
 	};
 
+	odroid_reboot {
+		compatible = "hardkernel,odroid-reboot";
+		samsung,pmureg-phandle = <&pmu_system_controller>;
+		reset-gpios = <&gpk1 2 0>;
+	};
+
 	i2s0: i2s@03830000 {
 		pinctrl-0 = <&i2s0_bus>;
 		pinctrl-names = "default";
-- 
1.9.2

