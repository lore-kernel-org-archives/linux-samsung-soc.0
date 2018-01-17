From: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Subject: [PATCH v4 1/4] dt-bindings: samsung: document bindings for Midas family boards
Date: Wed, 17 Jan 2018 23:58:42 +1100
Message-ID: <20180117125845.3954-2-simon@lineageos.org>
References: <20180117125845.3954-1-simon@lineageos.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180117125845.3954-1-simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Document GT-I9300, GT-I9305, GT-N7100, and GT-N7105 bindings, along
with the shared "midas" binding.

Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index e13459618581..e09b0ea5a8b9 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -9,7 +9,11 @@ Required root node properties:
 	- "samsung,smdkv310"	- for Exynos4210-based Samsung SMDKV310 eval board.
 	- "samsung,trats"	- for Exynos4210-based Tizen Reference board.
 	- "samsung,universal_c210" - for Exynos4210-based Samsung board.
+	- "samsung,i9300"          - for Exynos4412-based Samsung GT-I9300 board.
+	- "samsung,i9305"          - for Exynos4412-based Samsung GT-I9305 board.
+	- "samsung,midas"       - for Exynos4412-based Samsung Midas board.
 	- "samsung,smdk4412",	- for Exynos4412-based Samsung SMDK4412 eval board.
+	- "samsung,n710x"          - for Exynos4412-based Samsung GT-N7100/GT-N7105 board.
 	- "samsung,trats2"	- for Exynos4412-based Tizen Reference board.
 	- "samsung,smdk5250"	- for Exynos5250-based Samsung SMDK5250 eval board.
 	- "samsung,xyref5260"	- for Exynos5260-based Samsung board.
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
