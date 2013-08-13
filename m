From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv3 3/4] ARM: dts: Add rotator node for exynos4x12
Date: Tue, 13 Aug 2013 14:12:58 +0900
Message-ID: <1376370779-26930-4-git-send-email-chanho61.park@samsung.com>
References: <1376370779-26930-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62296 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753818Ab3HMFNe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 01:13:34 -0400
In-reply-to: <1376370779-26930-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

This patch adds a rotator node for exynos4212 and 4412. These have different
limitation of image size compared with the exynos4210. So, we should define
new compatible to distinguish it from the exynos4210.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 954628c..280c56f 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -176,4 +176,8 @@
 			};
 		};
 	};
+
+	rotator@12810000 {
+		compatible = "samsung,exynos4212-rotator";
+	};
 };
-- 
1.7.9.5
