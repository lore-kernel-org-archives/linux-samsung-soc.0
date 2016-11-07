From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/6] ARM: dts: Extend the S3C RTC node with rtc_src clock
Date: Mon, 07 Nov 2016 15:39:36 +0530
Message-ID: <1478513376-14307-7-git-send-email-pankaj.dubey@samsung.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1478513376-14307-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Extend the S3C RTC node with rtc_src clock so it could be operational.
The rtc_src clock is provided by MAX8997.

CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 6c7ef4e..4cac9b6 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -18,6 +18,7 @@
 #include "exynos4210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/maxim,max8997.h>
 #include "exynos-mfc-reserved-memory.dtsi"
 
 / {
@@ -324,6 +325,8 @@
 
 &rtc {
 	status = "okay";
+	clocks = <&clock CLK_RTC>, <&max8997 MAX8997_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
 };
 
 &tmu {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
