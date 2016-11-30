From: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] arm64: dts: exynos: Add flash led dt node for TM2 board
Date: Wed, 30 Nov 2016 13:48:57 +0900
Message-ID: <1480481337-3941-1-git-send-email-sw0312.kim@samsung.com>
References: <1480480062-3472-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1480480062-3472-1-git-send-email-sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds Kinetic ktd2692 flash led device node for TM2 board.

Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Change from v1:
- gpio active value is set with defined macro instead of value.
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index f21bdc2..0d454aa 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -58,6 +58,19 @@
 		reg = <0x0 0x20000000 0x0 0xc0000000>;
 	};
 
+	camera-flash {
+		compatible = "kinetic,ktd2692";
+		ctrl-gpios = <&gpc0 1 GPIO_ACTIVE_HIGH>;
+		aux-gpios = <&gpc0 2 GPIO_ACTIVE_HIGH>;
+
+		flash-led {
+			label = "ktd2692-flash";
+			led-max-microamp = <300000>;
+			flash-max-microamp = <1500000>;
+			flash-max-timeout-us = <1835000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
