From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/6] ARM: dts: add clocks to hdmi dt node for exynos5250
Date: Thu, 29 Aug 2013 10:58:26 +0530
Message-ID: <1377754110-31084-2-git-send-email-rahul.sharma@samsung.com>
References: <1377754110-31084-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24702 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230Ab3H2FGq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 01:06:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSA005R80V0KI80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Aug 2013 14:06:40 +0900 (KST)
In-reply-to: <1377754110-31084-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Fix wrong clock numbers in hdmi dt node. Removed hdmiphy
clock which was a dummy clock earlier and not required now.
Also added mux clock to change the clock parent.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dcb6c03..19c8174 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -612,10 +612,10 @@
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
