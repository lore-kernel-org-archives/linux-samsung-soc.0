From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 09/10] dt-bindings: exynos5433-decon: remove
 i80-if-timings property
Date: Thu, 24 Aug 2017 15:33:58 +0200
Message-ID: <1503581639-580-10-git-send-email-a.hajda@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133411eucas1p2ea8efac5afa8d33d3497829f9bc0b314@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1503581639-580-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Since i80/command mode is determined in runtime by propagating info
from panel this property can be removed.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/display/exynos/exynos5433-decon.txt  | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
index 549c538..fc25882 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
@@ -25,12 +25,6 @@ Required properties:
 	 size-cells must 1 and 0, respectively.
 - port: contains an endpoint node which is connected to the endpoint in the mic
 	node. The reg value muset be 0.
-- i80-if-timings: specify whether the panel which is connected to decon uses
-		  i80 lcd interface or mipi video interface. This node contains
-		  no timing information as that of fimd does. Because there is
-		  no register in decon to specify i80 interface timing value,
-		  it is not needed, but make it remain to use same kind of node
-		  in fimd and exynos7 decon.
 
 Example:
 SoC specific DT entry:
@@ -59,9 +53,3 @@ decon: decon@13800000 {
 		};
 	};
 };
-
-Board specific DT entry:
-&decon {
-	i80-if-timings {
-	};
-};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
