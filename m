From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 6/7] ARM: dts: update hdmiphy dt node for exynos5250
Date: Tue, 22 Oct 2013 15:41:07 +0530
Message-ID: <1382436668-15813-7-git-send-email-rahul.sharma@samsung.com>
References: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58968 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab3JVJu5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 05:50:57 -0400
In-reply-to: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

hdmiphy dt node needs a child node called 'phy-power-control'
which represents the PMU register for power controlling the
hdmiphy.

hdmi driver dt node provides phy property which points to
the hdmiphy dt node.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49f18c2..99a83412 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -134,9 +134,15 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
-		hdmiphy@38 {
+		hdmiphy: hdmiphy@38 {
 			compatible = "samsung,exynos4212-hdmiphy";
 			reg = <0x38>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			phy-power-control {
+				reg = <0x10040700 0x04>;
+			};
 		};
 	};
 
@@ -220,6 +226,7 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
+		phy = <&hdmiphy>;
 	};
 
 	codec@11000000 {
-- 
1.7.10.4
