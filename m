From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/3] ARM: dts: add Exynos audio subsystem clock controller node
Date: Fri, 05 Apr 2013 11:53:48 +0530
Message-ID: <1365143029-16936-2-git-send-email-padma.v@samsung.com>
References: <1365143029-16936-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31906 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756751Ab3DEGXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Apr 2013 02:23:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKR00LBER3B0SK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Apr 2013 15:23:38 +0900 (KST)
In-reply-to: <1365143029-16936-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, sangsu4u.park@samsung.com

Audio subsystem introduced in exynos platforms which has a
internal clock controller. This patch adds a node for the same.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7751e69..14d454c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -67,6 +67,12 @@
 		#clock-cells = <1>;
 	};
 
+	clock_audss: audss-clock-controller@0x03810000 {
+		compatible = "samsung,exynos-audss-clock";
+		reg = <0x03810000 0x100>;
+		#clock-cells = <1>;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
1.7.4.4
