From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RESEND PATCH v3] dt-bindings: Consolidate SRAM bindings from all
 vendors
Date: Thu, 19 Nov 2015 09:42:49 +0900
Message-ID: <1447893769-17088-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

SRAM bindings for various SoCs, using the mmio-sram genalloc
API, are spread over different places - per SoC vendor. Since all of
these are quite similar (they depend on mmio-sram) move them to a common
place.

Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

---

Changes since v2:
1. Update paths to sram.txt.

Changes since v1:
1. New patch. Extended suggestion from Rob.
---
 Documentation/devicetree/bindings/arm/arm,scpi.txt                      | 2 +-
 .../bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt}  | 0
 .../bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt}  | 2 +-
 .../bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt}       | 2 +-
 Documentation/devicetree/bindings/{misc => sram}/sram.txt               | 0
 .../devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt}     | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt} (92%)
 rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt} (95%)
 rename Documentation/devicetree/bindings/{misc => sram}/sram.txt (100%)
 rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt} (97%)

diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
index 86302de67c2c..313dabdc14f9 100644
--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -63,7 +63,7 @@ Required properties:
 - compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno
 
 The rest of the properties should follow the generic mmio-sram description
-found in ../../misc/sysram.txt
+found in ../../sram/sram.txt
 
 Each sub-node represents the reserved area for SCPI.
 
diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt b/Documentation/devicetree/bindings/sram/rockchip-pmu-sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
rename to Documentation/devicetree/bindings/sram/rockchip-pmu-sram.txt
diff --git a/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt b/Documentation/devicetree/bindings/sram/rockchip-smp-sram.txt
similarity index 92%
rename from Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
rename to Documentation/devicetree/bindings/sram/rockchip-smp-sram.txt
index d9416fb8db6f..800701ecffca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
+++ b/Documentation/devicetree/bindings/sram/rockchip-smp-sram.txt
@@ -12,7 +12,7 @@ Required sub-node properties:
 - compatible : should be "rockchip,rk3066-smp-sram"
 
 The rest of the properties should follow the generic mmio-sram discription
-found in ../../misc/sram.txt
+found in Documentation/devicetree/bindings/sram/sram.txt
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt b/Documentation/devicetree/bindings/sram/samsung-sram.txt
similarity index 95%
rename from Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt
rename to Documentation/devicetree/bindings/sram/samsung-sram.txt
index 4a0a4f70a0ce..6bc474b2b885 100644
--- a/Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt
+++ b/Documentation/devicetree/bindings/sram/samsung-sram.txt
@@ -15,7 +15,7 @@ Required sub-node properties:
 		"samsung,exynos4210-sysram-ns" : for Non-secure SYSRAM
 
 The rest of the properties should follow the generic mmio-sram discription
-found in ../../misc/sysram.txt
+found in Documentation/devicetree/bindings/sram/sram.txt
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/sram.txt
rename to Documentation/devicetree/bindings/sram/sram.txt
diff --git a/Documentation/devicetree/bindings/soc/sunxi/sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
similarity index 97%
rename from Documentation/devicetree/bindings/soc/sunxi/sram.txt
rename to Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 067698112f5f..8d5665468fe7 100644
--- a/Documentation/devicetree/bindings/soc/sunxi/sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -16,7 +16,7 @@ SRAM nodes
 ----------
 
 Each SRAM is described using the mmio-sram bindings documented in
-Documentation/devicetree/bindings/misc/sram.txt
+Documentation/devicetree/bindings/sram/sram.txt
 
 Each SRAM will have SRAM sections that are going to be handled by the
 SRAM controller as subnodes. These sections are represented following
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
