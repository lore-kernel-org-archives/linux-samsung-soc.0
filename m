From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 3/3] ARM: dts: Fix MDMA0 clock number
Date: Thu, 12 Dec 2013 08:32:02 +0530
Message-ID: <1386817322-11265-3-git-send-email-a.kesavan@samsung.com>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31505 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3LLDBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 22:01:12 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXO00JSSB1YV1B0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 12:01:10 +0900 (KST)
In-reply-to: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dianders@chromium.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

Fix wrong clock number in mdma0 node.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9db5047..177becd 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -559,7 +559,7 @@
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x10800000 0x1000>;
 			interrupts = <0 33 0>;
-			clocks = <&clock 271>;
+			clocks = <&clock 346>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
 			#dma-channels = <8>;
-- 
1.7.9.5
