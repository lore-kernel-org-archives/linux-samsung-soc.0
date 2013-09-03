From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: dts: Fix gpio pin of lcd_en node for exynos4210
Date: Tue, 03 Sep 2013 11:14:49 +0900
Message-ID: <001c01cea84b$5decd9e0$19c68da0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23749 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759206Ab3ICCO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Sep 2013 22:14:56 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSJ00HTI28NM0E0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Sep 2013 11:14:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

According to datasheet, 'lcd_en' node should use gpf0-2,
instead of gpe3-4. gpe3-4 is used for MDM_DATA[4]; thus,
it should be fixed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index a7c2128..da5dd8d 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -374,7 +374,7 @@
 		};
 
 		lcd_en: lcd-en {
-			samsung,pins = "gpe3-4";
+			samsung,pins = "gpf0-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
-- 
1.7.10.4
