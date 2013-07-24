From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 11/13] ARM: dts: Add FIMC nodes for Exynos4210 Trats board
Date: Wed, 24 Jul 2013 15:17:23 +0200
Message-ID: <1374671845-30373-12-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9063 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3GXNTn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:43 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Enable FIMC devices on the Trats board. This allows using the
device in memory-to-memory mode only. The camera port pinctrl
property is now empty and will be updated while support for the
camera sensors is added.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 94eebff..199ff1e 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -301,4 +301,26 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	camera {
+		pinctrl-names = "default";
+		pinctrl-0 = <>;
+		status = "okay";
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
