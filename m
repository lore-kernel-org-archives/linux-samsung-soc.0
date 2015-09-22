From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v5 07/17] ARM: dts: exynos/dp: remove some properties that deprecated by analogix_dp driver
Date: Tue, 22 Sep 2015 15:43:19 +0800
Message-ID: <1442907799-6266-1-git-send-email-ykk@rock-chips.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:48025 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756509AbbIVHpn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Sep 2015 03:45:43 -0400
In-Reply-To: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

After exynos_dp have been split the common IP code into analogix_dp driver,
the analogix_dp driver have deprecated some Samsung platform properties which
could be dynamically parsed from EDID/MODE/DPCD message, so this is an update
for Exynos DTS file for dp-controller.

Beside the backward compatibility is fully preserved, so there are no
bisectability break that make this change in a separate patch.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v5:
- Correct the misspell in commit message. (Krzysztof)

Changes in v4:
- Separate all DTS changes to a separate patch. (Krzysztof)

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/exynos5250-arndale.dts   | 2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts  | 2 --
 arch/arm/boot/dts/exynos5250-snow.dts      | 4 +---
 arch/arm/boot/dts/exynos5250-spring.dts    | 4 +---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 +---
 arch/arm/boot/dts/exynos5420-smdk5420.dts  | 2 --
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 +---
 7 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index db3f65f..4636862 100644
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
index c625e71..cd424d6 100644
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
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 0720caa..242b621 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -244,12 +244,10 @@
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
index 8f4d76c..7433683 100644
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
-	samsung,hpd-gpio = <&gpx2 6 0>;
+	hpd-gpio = <&gpx2 6 0>;
 
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 98871f9..b3df3c1 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -92,8 +92,6 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hpd>;
 	samsung,color-space = <0>;
-	samsung,dynamic-range = <0>;
-	samsung,ycbcr-coeff = <0>;
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <4>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 7d5b386..b89bff5 100644
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
-	samsung,hpd-gpio = <&gpx2 6 0>;
+	hpd-gpios = <&gpx2 6 0>;
 	panel = <&panel>;
 };
 
-- 
1.9.1
