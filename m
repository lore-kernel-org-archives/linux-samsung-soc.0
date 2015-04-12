From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 5/6] ARM: dts: Enable thermal_zone for exynos5422.
Date: Mon, 13 Apr 2015 00:24:11 +0930
Message-ID: <1428850452-4178-6-git-send-email-linux.amoon@gmail.com>
References: <1428850452-4178-1-git-send-email-linux.amoon@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428850452-4178-1-git-send-email-linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Include exynos5-cpu-thermal.dtsi to enable thermal_zone support.

Changes since v1 : Seperate the include previous patch.
Changes since v2 : None

Tested-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
Acked-by: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 6e7ee53..16a5f10 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -12,6 +12,7 @@
 
 /dts-v1/;
 #include "exynos5800.dtsi"
+#include "exynos5-cpu-thermal.dtsi"
 
 / {
 	model = "Hardkernel Odroid XU3";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
