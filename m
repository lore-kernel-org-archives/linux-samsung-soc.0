From: Shirish S <s.shirish@samsung.com>
Subject: [PATCH 1/4] ARM: dts: smdk5250: Add hdmi phy settings
Date: Thu, 19 Dec 2013 17:42:25 +0530
Message-ID: <1387455148-22999-2-git-send-email-s.shirish@samsung.com>
References: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22142 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756594Ab3LSMJy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 07:09:54 -0500
In-reply-to: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, shirish@chromium.org, linux-samsung-soc@vger.kernel.org, Shirish S <s.shirish@samsung.com>

This patch moves the hdmi phy setting to smdk5250
dts,as its more of a per board configuration and
also shall be easier for supporting future chipsets.

Signed-off-by: Shirish S <s.shirish@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 2538b32..10da02f 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -220,6 +220,80 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
+		hdmiphy-configs {
+			/*
+			* Eye diagram test passed for:
+			* Data de-emphasis: -0.7dB & Data Level: 880mV
+			* i.e., 0010 0110 = 0x26
+			* and Clock level of 515mV and diff 1030mV
+			* i.e., 0x66
+			*/
+			config0: config0 {
+				samsung,pixel-clock = <25200000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config1: config1 {
+				samsung,pixel-clock = <27000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config2: config2 {
+				samsung,pixel-clock = <27027000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config3: config3 {
+				samsung,pixel-clock = <36000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config4: config4 {
+				samsung,pixel-clock = <40000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config5: config5 {
+				samsung,pixel-clock = <65000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config6: config6 {
+				samsung,pixel-clock = <74176000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config7: config7 {
+				samsung,pixel-clock = <74250000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config8: config8 {
+				samsung,pixel-clock = <83500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config9: config9 {
+				samsung,pixel-clock = <106500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config10: config10 {
+				samsung,pixel-clock = <108000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config11: config11 {
+				samsung,pixel-clock = <146250000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config12: config12 {
+				samsung,pixel-clock = <148500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+		};
 	};
 
 	codec@11000000 {
-- 
1.7.9.5
