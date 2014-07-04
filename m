From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] ARM: dts: Add sound-card name for Snow/Peach-Pit/Peach-Pi
Date: Fri,  4 Jul 2014 14:50:52 +0530
Message-ID: <1404465652-26637-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:53701 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729AbaGDJYY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 05:24:24 -0400
Received: by mail-pd0-f176.google.com with SMTP id ft15so1704522pdb.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 02:24:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@kernel.org, dianders@chromium.org

Add sound-card name property to Snow/Peach-Pit/Peach-Pi boards.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
Patch to update driver is submitted here[1].

[1] ASoC: samsung: Update sound-card name for Snow
https://lkml.org/lkml/2014/7/4/125

 arch/arm/boot/dts/exynos5250-snow.dts      |    1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |    1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 7bd2df1..c682c88 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -262,6 +262,7 @@
 	sound {
 		compatible = "google,snow-audio-max98095";
 
+		samsung,model = "Snow-I2S-MAX98095";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98095>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 7649982..6c7cab0 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -62,6 +62,7 @@
 	sound {
 		compatible = "google,snow-audio-max98090";
 
+		samsung,model = "Peach-Pit-I2S-MAX98090";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98090>;
 	};
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 2c2c137..28f2a25 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -60,6 +60,7 @@
 	sound {
 		compatible = "google,snow-audio-max98091";
 
+		samsung,model = "Peach-Pi-I2S-MAX98091";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98091>;
 	};
-- 
1.7.9.5
