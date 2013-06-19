From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/3] ARM: dts: Add MFC clock entry for 5250
Date: Wed, 19 Jun 2013 14:22:47 +0530
Message-ID: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20952 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933939Ab3FSI3J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 04:29:09 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00HXCSWIV1L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 17:29:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, arunkk.samsung@gmail.com

The patch adds the MFC clock entry for the 5250 SoC

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d04ab0a..9c6cda6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -168,6 +168,8 @@
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 266>;
+		clock-names = "mfc";
 	};
 
 	rtc {
-- 
1.7.9.5
