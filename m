From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] pinctrl: dt-bindings: samsung: Add Exynos7 specific
 pinctrl macro definitions
Date: Fri, 20 Jan 2017 09:49:56 +0530
Message-ID: <1484885997-21004-3-git-send-email-pankaj.dubey@samsung.com>
References: <1484885997-21004-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170120041720epcas5p175081a95d4a1041beba586fecb2a4cfb@epcas5p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1484885997-21004-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos7 SoC pinctrl configurations are similar to existing Exynos4/5 except
for FSYS1 pinctrl drive strengths. So adding Exynos7 specific FSYS1 blocks
pinctrl driver strength related macros which will be used in Exynos7
DTSi files.

Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/pinctrl/samsung.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index 6276eb7..3f1d583 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -54,4 +54,12 @@
 #define EXYNOS_PIN_FUNC_6		6
 #define EXYNOS_PIN_FUNC_F		0xf
 
+/* Drive strengths for Exynos7 FSYS1 block */
+#define EXYNOS7_FSYS1_PIN_DRV_LV1	0
+#define EXYNOS7_FSYS1_PIN_DRV_LV2	4
+#define EXYNOS7_FSYS1_PIN_DRV_LV3	2
+#define EXYNOS7_FSYS1_PIN_DRV_LV4	6
+#define EXYNOS7_FSYS1_PIN_DRV_LV5	1
+#define EXYNOS7_FSYS1_PIN_DRV_LV6	5
+
 #endif /* __DT_BINDINGS_PINCTRL_SAMSUNG_H__ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
