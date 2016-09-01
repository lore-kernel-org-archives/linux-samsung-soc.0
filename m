From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/6] pinctrl: dt-bindings: samsung: Update documentation with
 new macros
Date: Thu, 01 Sep 2016 11:21:50 +0200
Message-ID: <1472721715-2833-2-git-send-email-k.kozlowski@samsung.com>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1472721715-2833-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Update examples in Samsung pinctrl dt-bindings with new macros coming
from header file.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/pinctrl/samsung-pinctrl.txt           | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 6db16b90873a..828ef7fdd437 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -238,53 +238,53 @@ Example 1: A pin-controller node with pin groups.
 
 		uart0_data: uart0-data {
 			samsung,pins = "gpa0-0", "gpa0-1";
-			samsung,pin-function = <2>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 		};
 
 		uart0_fctl: uart0-fctl {
 			samsung,pins = "gpa0-2", "gpa0-3";
-			samsung,pin-function = <2>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 		};
 
 		uart1_data: uart1-data {
 			samsung,pins = "gpa0-4", "gpa0-5";
-			samsung,pin-function = <2>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 		};
 
 		uart1_fctl: uart1-fctl {
 			samsung,pins = "gpa0-6", "gpa0-7";
-			samsung,pin-function = <2>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 		};
 
 		i2c2_bus: i2c2-bus {
 			samsung,pins = "gpa0-6", "gpa0-7";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 		};
 
 		sd4_bus8: sd4-bus-width8 {
 			part-1 {
 				samsung,pins = "gpk0-3", "gpk0-4",
 						"gpk0-5", "gpk0-6";
-				samsung,pin-function = <3>;
-				samsung,pin-pud = <3>;
-				samsung,pin-drv = <3>;
+				samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+				samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+				samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 			};
 			part-2 {
 				samsung,pins = "gpk1-3", "gpk1-4",
 						"gpk1-5", "gpk1-6";
-				samsung,pin-function = <4>;
-				samsung,pin-pud = <4>;
-				samsung,pin-drv = <3>;
+				samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+				samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+				samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 			};
 		};
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
