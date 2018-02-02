From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 08/10] ARM: dts: exynos: Use camera label in
 exynos4412-odroid-common
Date: Fri, 02 Feb 2018 16:43:53 +0100
Message-ID: <1517586235-16603-9-git-send-email-m.purski@samsung.com>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
        <CGME20180202154410eucas1p2239c80ddb68e90ab9a7a30b22c46dbcd@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1517586235-16603-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Camera label has been defined in exynos4.dtsi. Use it in odroid-common
instead of defining a new node.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 556ea78..34f4e89 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -61,12 +61,6 @@
 		reset-gpios = <&gpk1 2 GPIO_ACTIVE_LOW>;
 	};
 
-	camera {
-		status = "okay";
-		pinctrl-names = "default";
-		pinctrl-0 = <>;
-	};
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -473,6 +467,12 @@
 	};
 };
 
+&camera {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
 &i2c_1 {
 	status = "okay";
 	max98090: max98090@10 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
