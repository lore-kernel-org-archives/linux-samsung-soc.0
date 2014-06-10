From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 3/3] ARM: DTS: move "cs-gpio" from "controller-data" to under
 spi node
Date: Tue, 10 Jun 2014 14:30:59 +0530
Message-ID: <1402390859-28287-4-git-send-email-ch.naveen@samsung.com>
References: <1402390859-28287-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11845 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058AbaFJJDz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 05:03:55 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6Y00ALZ3UAEY10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jun 2014 18:03:47 +0900 (KST)
In-reply-to: <1402390859-28287-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>

This patch moves the "cs-gpio" field from "controller-data" child
node to under the spi device node.

Respective changes are preposed to spi-s3c64xx.c driver.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
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
