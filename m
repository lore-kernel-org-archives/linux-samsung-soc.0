From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 1/9] ARM: dts: exynos5250: add mixer clocks to mixer node
Date: Thu, 25 Jul 2013 13:04:29 +0530
Message-ID: <1374737677-3215-2-git-send-email-rahul.sharma@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27260 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573Ab3GYHLz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 03:11:55 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQH00K21D8UIMT0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Jul 2013 16:11:54 +0900 (KST)
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the mixer clocks to the mixer node in the
exynos 5250 dts file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..1dfd3ad 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -612,6 +612,8 @@
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		clocks = <&clock 343>, <&clock 136>;
+		clock-names = "mixer", "sclk_hdmi";
 	};
 
 	dp-controller {
-- 
1.7.10.4
