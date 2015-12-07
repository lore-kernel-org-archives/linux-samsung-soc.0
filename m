From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v10 06/17] ARM: dts: exynos/dp: remove some properties that deprecated by analogix_dp driver
Date: Mon,  7 Dec 2015 14:39:17 +0800
Message-ID: <1449470357-31105-1-git-send-email-ykk@rock-chips.com>
References: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449470239-30667-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

After exynos_dp have been split the common IP code into analogix_dp driver,
the analogix_dp driver have deprecated some Samsung platform properties which
could be dynamically parsed from EDID/MODE/DPCD message, so this is an update
for Exynos DTS file for dp-controller.

Beside the backward compatibility is fully preserved, so there are no
bisectability break that make this change in a separate patch.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---
Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
- Fix Peach Pit hpd property name error:
-       hpd-gpio = <&gpx2 6 0>;
+       hpd-gpios = <&gpx2 6 0>;

Changes in v5:
- Correct the misspell in commit message. (Krzysztof)

Changes in v4:
- Separate all DTS changes to a separate patch. (Krzysztof)

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/exynos5250-arndale.dts      | 2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts     | 2 --
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 4 +---
 arch/arm/boot/dts/exynos5250-spring.dts       | 4 +---
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 4 +---
 arch/arm/boot/dts/exynos5420-smdk5420.dts     | 2 --
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 4 +---
 7 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index c000532..b1790cf 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -124,8 +124,6 @@
 &dp {
 	status = "okay";
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <4>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 0f5dcd4..f30c2db 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -80,8 +80,6 @@
 
 &dp {
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <4>;
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 5cb33ba..b96624b 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -236,12 +236,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx0 7 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
 
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index c1edd6d..91881d7 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -74,12 +74,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd_gpio>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <1>;
-	samsung,hpd-gpio = <&gpc3 0 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpc3 0 GPIO_ACTIVE_HIGH>;
 };
 
 &ehci {
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 35cfb07..2f37c87 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -148,12 +148,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd_gpio>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x06>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index ac35aef..f67344f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -93,8 +93,6 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <4>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 7b018e4..363c95f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -142,12 +142,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd_gpio>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 	panel = <&panel>;
 };
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
