From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 7/7] ARM: dts: exynos4412-odroid*: enable MFC device
Date: Tue, 24 May 2016 15:31:30 +0200
Message-ID: <1464096690-23605-8-git-send-email-m.szyprowski@samsung.com>
References: <1464096690-23605-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1464096690-23605-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Uli Middelberg <uli@middelberg.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable support for Multimedia Codec (MFC) device for all Exynos4412-based
Odroid boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ec7619a..276ac9a 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -13,6 +13,7 @@
 #include "exynos4412.dtsi"
 #include "exynos4412-ppmu-common.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include "exynos-mfc-reserved-memory.dtsi"
 
 / {
 	chosen {
@@ -499,6 +500,11 @@
 	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 };
 
+&mfc {
+	memory-region = <&mfc_left>, <&mfc_right>;
+	status = "okay";
+};
+
 &mixer {
 	status = "okay";
 };
-- 
1.9.2
