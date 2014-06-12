From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 3/3 v4] ARM: DTS: fix the chip select gpios definition in the
 SPI nodes
Date: Thu, 12 Jun 2014 18:43:41 +0530
Message-ID: <1402578821-27338-3-git-send-email-ch.naveen@samsung.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14599 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781AbaFLNTT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 09:19:19 -0400
In-reply-to: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

This patch replaces the "cs-gpio" from "controller-data" node
as was specified in the old binding and use the standard
"cs-gpios" property expected by the SPI core as is defined in
the new binding.

Respective changes are preposed to spi-s3c64xx.c driver.
@ http://www.spinics.net/lists/linux-samsung-soc/msg32282.html

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts   |    2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 636d166..9191491 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -169,6 +169,7 @@
 
 	spi_2: spi@13940000 {
 		status = "okay";
+		cs-gpios = <&gpc1 2 0>;
 
 		w25x80@0 {
 			#address-cells = <1>;
@@ -178,7 +179,6 @@
 			spi-max-frequency = <1000000>;
 
 			controller-data {
-				cs-gpio = <&gpc1 2 0>;
 				samsung,spi-feedback-delay = <0>;
 			};
 
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 8a558b7..204b0de 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -512,6 +512,7 @@
 	spi_1: spi@13930000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi1_bus>;
+		cs-gpios = <&gpb 5 0>;
 		status = "okay";
 
 		s5c73m3_spi: s5c73m3 {
@@ -519,7 +520,6 @@
 			spi-max-frequency = <50000000>;
 			reg = <0>;
 			controller-data {
-				cs-gpio = <&gpb 5 0>;
 				samsung,spi-feedback-delay = <2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index a794a70..0c6433a 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -316,6 +316,7 @@
 	};
 
 	spi_1: spi@12d30000 {
+		cs-gpios = <&gpa2 5 0>;
 		status = "okay";
 
 		w25q80bw@0 {
@@ -326,7 +327,6 @@
 			spi-max-frequency = <1000000>;
 
 			controller-data {
-				cs-gpio = <&gpa2 5 0>;
 				samsung,spi-feedback-delay = <0>;
 			};
 
-- 
1.7.9.5
