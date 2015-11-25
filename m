From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: dts: Remove unneeded GPIO include in exynos4412-odroidu3
Date: Wed, 25 Nov 2015 09:11:23 -0300
Message-ID: <1448453483-3338-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The <dt-bindings/gpio/gpio.h> header is already included in the
exynos4412-odroid-common DTSI so there's no need to do it again
in the DTS file.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos4412-odroidu3.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 646ff0bd001a..dd89f7b37c9f 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -13,7 +13,6 @@
 
 /dts-v1/;
 #include "exynos4412-odroid-common.dtsi"
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Hardkernel ODROID-U3 board based on Exynos4412";
-- 
2.4.3
