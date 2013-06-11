From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 1/4] ARM: dts: exynos4210: Add PWM related pinctrl entries
Date: Tue, 11 Jun 2013 11:59:49 +0530
Message-ID: <1370932192-19365-2-git-send-email-sachin.kamat@linaro.org>
References: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:58618 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751787Ab3FKGo2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 02:44:28 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so3844664pde.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2013 23:44:27 -0700 (PDT)
In-Reply-To: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

PWM nodes are added to Exynos4210 pinctrl DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index 55a2efb..62d5b99 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -330,6 +330,34 @@
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <0>;
 		};
+
+		pwm0_out: pwm0-out {
+			samsung,pins = "gpd0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm1_out: pwm1-out {
+			samsung,pins = "gpd0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm2_out: pwm2-out {
+			samsung,pins = "gpd0-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		pwm3_out: pwm3-out {
+			samsung,pins = "gpd0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@11000000 {
-- 
1.7.9.5
