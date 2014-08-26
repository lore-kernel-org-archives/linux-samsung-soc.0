From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: dts: exynos4x12: Fix pull setting in sd4_width8 pin group
Date: Tue, 26 Aug 2014 16:13:25 +0200
Message-ID: <1409062405-15215-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41922 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758272AbaHZONg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 10:13:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

The group has the samsung,pin-pud property set to 4, which is not a
correct value. This patch fixes this by replacing it with 3, which is
the correct value for pull-up.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 927fec6..c141931 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -691,7 +691,7 @@
 		sd4_bus8: sd4-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <4>;
-			samsung,pin-pud = <4>;
+			samsung,pin-pud = <3>;
 			samsung,pin-drv = <3>;
 		};
 
-- 
2.0.4
