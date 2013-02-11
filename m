From: Shirish S <s.shirish@samsung.com>
Subject: [PATCH] ARM: dts: Correct the pin configuration for eMMC
Date: Mon, 11 Feb 2013 05:01:28 -0500
Message-ID: <1360576888-19778-1-git-send-email-s.shirish@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9988 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751666Ab3BKJkZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 04:40:25 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI100J6JUVBZBF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 18:40:23 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI1003RWUV7SK50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 18:40:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Shirish S <s.shirish@samsung.com>

This patch corrects the pin function value of sd4_bus8 from 3
to 4.
This is verified on origen board for testing eMMC on
dw_mci controller.

Signed-off-by: Shirish S <s.shirish@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 8e6115a..099cec7 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -661,7 +661,7 @@
 
 		sd4_bus8: sd4-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
-			samsung,pin-function = <3>;
+			samsung,pin-function = <4>;
 			samsung,pin-pud = <4>;
 			samsung,pin-drv = <3>;
 		};
-- 
1.8.0
