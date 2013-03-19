From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v8 2/4] ARM: dts: Add lcd pinctrl node entries for EXYNOS4412 SoC
Date: Tue, 19 Mar 2013 12:38:10 +0530
Message-ID: <1363676892-21296-3-git-send-email-vikas.sajjan@linaro.org>
References: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:36961 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932866Ab3CSHJB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 03:09:01 -0400
Received: by mail-pb0-f45.google.com with SMTP id ro8so182348pbb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 00:09:01 -0700 (PDT)
In-Reply-To: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com

From: Sachin Kamat <sachin.kamat@linaro.org>

Adds the lcd panel related picntrl nodes for Exynos4412 SoC

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 099cec7..a59d69c 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -354,6 +354,20 @@
 			samsung,pin-drv = <0>;
 		};
 
+		lcd_sync: lcd-sync {
+			samsung,pins = "gpf0-0", "gpf0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		lcd_en: lcd-en {
+			samsung,pins = "gpf0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
 		lcd_clk: lcd-clk {
 			samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
 			samsung,pin-function = <2>;
-- 
1.7.9.5
