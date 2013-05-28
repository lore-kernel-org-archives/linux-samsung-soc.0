From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 3/4] ARM: dts: add Exynos audio subsystem clock controller
 node
Date: Tue, 28 May 2013 15:32:57 +0530
Message-ID: <1369735378-10003-4-git-send-email-padma.v@samsung.com>
References: <1369735378-10003-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55923 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754462Ab3E1J7v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 05:59:51 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNI00LBM6FHO440@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 May 2013 18:59:50 +0900 (KST)
In-reply-to: <1369735378-10003-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org

Audio subsystem introduced in s5pv210 and exynos platforms
which has a internal clock controller. This patch adds a node
for the same on exynos5250.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index bccda67..388983e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -72,6 +72,12 @@
 		#clock-cells = <1>;
 	};
 
+	clock_audss: audss-clock-controller@3810000 {
+		compatible = "samsung,exynos5250-audss-clock";
+		reg = <0x03810000 0x0C>;
+		#clock-cells = <1>;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
1.7.4.4
