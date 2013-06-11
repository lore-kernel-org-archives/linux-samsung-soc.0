From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/4] ARM: dts: Add mixer clocks to mixer node
Date: Tue, 11 Jun 2013 12:24:04 +0530
Message-ID: <1370933645-18344-4-git-send-email-rahul.sharma@samsung.com>
References: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24468 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752915Ab3FKGaZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 02:30:25 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO700436U2KUVP0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 15:30:21 +0900 (KST)
In-reply-to: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the mixer clocks to the mixer node in the dts file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0673524..9d9496a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -614,6 +614,8 @@
 		compatible = "samsung,exynos5-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		clocks = <&clock 343>, <&clock 136>;
+		clock-names = "mixer", "sclk_hdmi";
 	};
 
 	dp-controller {
-- 
1.7.10.4
