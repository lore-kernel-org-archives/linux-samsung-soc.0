From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/4] [media] exynos-gsc: Add compatible for Exynos 5250
 and 5420 specific version
Date: Wed, 13 Sep 2017 20:41:52 +0900
Message-ID: <1505302915-15699-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1505302915-15699-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170913114214epcas2p3158b964f9eec03fa24b4e8f6b919c2cb@epcas2p3.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1505302915-15699-1-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos 5250 and 5420 have different hardware rotation limits.
Since we have to distinguish between these two, we add different
compatible(samsung,exynos5250-gsc and samsung,exynos5420-gsc).

Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/media/exynos5-gsc.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
index 26ca25b..0d4fdae 100644
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -3,8 +3,11 @@
 G-Scaler is used for scaling and color space conversion on EXYNOS5 SoCs.
 
 Required properties:
-- compatible: should be "samsung,exynos5-gsc" (for Exynos 5250, 5420 and
-	      5422 SoCs) or "samsung,exynos5433-gsc" (Exynos 5433)
+- compatible: should be one of
+	      "samsung,exynos5250-gsc"
+	      "samsung,exynos5420-gsc"
+	      "samsung,exynos5433-gsc"
+	      "samsung,exynos5-gsc" (deprecated)
 - reg: should contain G-Scaler physical address location and length.
 - interrupts: should contain G-Scaler interrupt number
 
@@ -15,7 +18,7 @@ Optional properties:
 Example:
 
 gsc_0:  gsc@0x13e00000 {
-	compatible = "samsung,exynos5-gsc";
+	compatible = "samsung,exynos5250-gsc";
 	reg = <0x13e00000 0x1000>;
 	interrupts = <0 85 0>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
