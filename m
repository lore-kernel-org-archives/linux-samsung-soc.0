From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module on
 EXYNOS5440
Date: Wed, 02 Jan 2013 16:20:22 -0800
Message-ID: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45281 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752853Ab3ACA11 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 19:27:27 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000JO3X9MV030@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 09:27:25 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG000A0GX9LNY20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 09:27:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org

From: Thomas Abraham <thomas.ab@samsung.com>

Fix the incorrect compatible property value of pin-controller module
EXYNOS5440 SoC.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
[kgene.kim@samsung.com: fixed it in gpio together for exynos5440]
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org
---
 arch/arm/boot/dts/exynos5440.dtsi |    2 +-
 drivers/gpio/gpio-samsung.c       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 024269d..25f0fa6 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -86,7 +86,7 @@
 	};
 
 	pinctrl {
-		compatible = "samsung,pinctrl-exynos5440";
+		compatible = "samsung,exynos5440-pinctrl";
 		reg = <0xE0000 0x1000>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 953737d..cac4b45 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3026,7 +3026,7 @@ static __init int samsung_gpiolib_init(void)
 	static const struct of_device_id exynos_pinctrl_ids[] = {
 		{ .compatible = "samsung,pinctrl-exynos4210", },
 		{ .compatible = "samsung,pinctrl-exynos4x12", },
-		{ .compatible = "samsung,pinctrl-exynos5440", },
+		{ .compatible = "samsung,exynos5440-pinctrl", },
 	};
 	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
 		if (pctrl_np && of_device_is_available(pctrl_np))
-- 
1.7.10.4
