From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos prefix
Date: Fri, 13 Sep 2013 13:09:56 +0100
Message-ID: <1379074196-9834-4-git-send-email-broonie@kernel.org>
References: <1379074196-9834-1-git-send-email-broonie@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379074196-9834-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Make it easier to notice the common file for ChromeOS devices based on
the Exynos5250 by giving it the exynos5250 prefix that the boards have.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/{cros5250-common.dtsi => exynos5250-cros-common.dtsi} | 0
 arch/arm/boot/dts/exynos5250-snow.dts                                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm/boot/dts/{cros5250-common.dtsi => exynos5250-cros-common.dtsi} (100%)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
similarity index 100%
rename from arch/arm/boot/dts/cros5250-common.dtsi
rename to arch/arm/boot/dts/exynos5250-cros-common.dtsi
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e2..7e2669c 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -10,7 +10,7 @@
 
 /dts-v1/;
 #include "exynos5250.dtsi"
-#include "cros5250-common.dtsi"
+#include "exynos5250-cros-common.dtsi"
 
 / {
 	model = "Google Snow";
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
