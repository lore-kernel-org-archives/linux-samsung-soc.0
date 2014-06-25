From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 5/5] ARM: dts: exynos4412-odroid-common: disable 'always on'
 for BUCK8 regulator
Date: Wed, 25 Jun 2014 15:26:13 +0200
Message-ID: <1403702773-9141-6-git-send-email-m.szyprowski@samsung.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9716 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752780AbaFYN02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 09:26:28 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Q00KBH7ZMSH10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 14:26:10 +0100 (BST)
In-reply-to: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

From: Kamil Debski <k.debski@samsung.com>

On Odroid U2/U3 BUCK8 is used for providing power to also to P3V3
source, which is also connected to LAN9730 chip's nRESET signal. To
reset lan chip on system reboot, the BUCK8 output should not be used in
'always on' mode. This change has no impact on X/X2 boards.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index f793f3b8f0b9..ad2cb32a3439 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -297,7 +297,6 @@
 					regulator-name = "BUCK8_2.8V";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
-					regulator-always-on;
 				};
 			};
 		};
-- 
1.9.2
