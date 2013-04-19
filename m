From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Fix gpio number for UART3 in exynos5250
Date: Fri, 19 Apr 2013 17:09:33 +0530
Message-ID: <1366371573-19310-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:51899 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968300Ab3DSLvz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 07:51:55 -0400
Received: by mail-pd0-f181.google.com with SMTP id y10so2184148pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2013 04:51:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

UART3 uses GPA1-4 and GPA1-5 instead.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index d1650fb..299d786 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -256,7 +256,7 @@
 		};
 
 		uart3_data: uart3-data {
-			samsung,pins = "gpa1-4", "gpa1-4";
+			samsung,pins = "gpa1-4", "gpa1-5";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
-- 
1.7.9.5
