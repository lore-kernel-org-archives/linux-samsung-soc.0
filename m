From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] ARM: dts: exynos: Add status property to Exynos 54xx
 Mixer nodes
Date: Fri, 15 Sep 2017 11:11:23 +0200
Message-ID: <1505466683-32148-6-git-send-email-m.szyprowski@samsung.com>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170915091141eucas1p2622dd1def1799e6bfde948ff17d497b9@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44227 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdIOJLo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 05:11:44 -0400
In-reply-to: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

HDMI support requires some additional off-SoC logic, so Mixer device (part
of HDMI display path) should be disabled by default in SoC dtsi and enabled
then in each board dts. This patch unifies Mixer handling with other
Exynos SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 4 ++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 4 ++++
 arch/arm/boot/dts/exynos5420.dtsi                  | 1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++++
 5 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index ee1bb9b8b366..b0ac10f124e6 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -360,6 +360,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	broken-cd;
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 683a4cfb4a23..38af8769711c 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -696,6 +696,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 /* eMMC flash */
 &mmc_0 {
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index cc44dc60d81e..310d8637ce9f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -352,6 +352,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	broken-cd;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 02d2f898efa6..7a8da011512d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -646,6 +646,7 @@
 			clock-names = "mixer", "hdmi", "sclk_hdmi";
 			power-domains = <&disp_pd>;
 			iommus = <&sysmmu_tv>;
+			status = "disabled";
 		};
 
 		rotator: rotator@11C00000 {
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 9409fbceedec..47d03b3d7a54 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -551,6 +551,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mmc_0 {
 	status = "okay";
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
1.9.1
