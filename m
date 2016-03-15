From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 7/7] ARM: dts: Add initial gpio setting of MMC2 device for
 exynos3250-monk
Date: Tue, 15 Mar 2016 11:08:15 +0900
Message-ID: <1458007695-3627-8-git-send-email-cw00.choi@samsung.com>
References: <1458007695-3627-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1458007695-3627-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds initial pin configuration of MMC2 device on exynos3250-monk
board because the MMC2 gpio pin (gpk2[0-6]) are NC (not connected) state.

Suggested-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos3250-monk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 443a35085846..dab965f35352 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -558,7 +558,17 @@
 
 &pinctrl_1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&sleep1>;
+	pinctrl-0 = <&initial1 &sleep1>;
+
+	initial1: initial-state {
+		PIN_IN(gpk2-0, DOWN, LV1);
+		PIN_IN(gpk2-1, DOWN, LV1);
+		PIN_IN(gpk2-2, DOWN, LV1);
+		PIN_IN(gpk2-3, DOWN, LV1);
+		PIN_IN(gpk2-4, DOWN, LV1);
+		PIN_IN(gpk2-5, DOWN, LV1);
+		PIN_IN(gpk2-6, DOWN, LV1);
+	};
 
 	sleep1: sleep-state {
 		PIN_SLP(gpe0-0, PREV, NONE);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
