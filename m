From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 10/13] ARM: dts: Add FIMC nodes for Exynos4210 Trats board
Date: Mon, 01 Jul 2013 17:22:32 +0200
Message-ID: <1372692155-17653-11-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51463 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753798Ab3GAPZr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 11:25:47 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP900CLNK6H58I0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Jul 2013 00:25:47 +0900 (KST)
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Enable FIMC devices on the Trats board. This allows using the
device in memory-to-memory mode only. The camera port pinctrl
property is now empty and will be updated while support for the
camera sensors is added.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 94eebff..6b1568e 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -301,4 +301,27 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	camera {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <>;
+
+		fimc_0: fimc@11800000 {
+			status = "okay";
+		};
+
+		fimc_1: fimc@11810000 {
+			status = "okay";
+		};
+
+		fimc_2: fimc@11820000 {
+			status = "okay";
+		};
+
+		fimc_3: fimc@11830000 {
+			status = "okay";
+		};
+	};
 };
-- 
1.7.9.5
