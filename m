From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 2/9] ARM: dts: exynos5250: add clocks to hdmi dt node
Date: Thu, 25 Jul 2013 13:04:30 +0530
Message-ID: <1374737677-3215-3-git-send-email-rahul.sharma@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43545 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573Ab3GYHL5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 03:11:57 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00HOKDAQIAI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 16:11:56 +0900 (KST)
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Fix wrong clock numbers in hdmi dt node. Removed hdmiphy
clock which was a dummy clock earlier and not required now.
Also added mux clock to change the clock parent.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 1dfd3ad..93d6cc5 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -602,10 +602,10 @@
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
-		clocks = <&clock 333>, <&clock 136>, <&clock 137>,
-				<&clock 333>, <&clock 333>;
+		clocks = <&clock 344>, <&clock 136>, <&clock 137>,
+				<&clock 159>, <&clock 1024>;
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-				"sclk_hdmiphy", "hdmiphy";
+				"sclk_hdmiphy", "mout_hdmi";
 	};
 
 	mixer {
-- 
1.7.10.4
