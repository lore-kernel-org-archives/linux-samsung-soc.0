From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/3] ARM: dts: Enable sound support on smdk5420
Date: Wed, 07 Aug 2013 14:20:34 +0530
Message-ID: <1375865442-5323-3-git-send-email-padma.v@samsung.com>
References: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10521 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757071Ab3HGIt3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 04:49:29 -0400
In-reply-to: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

This patch enables i2s0 and sound support on smdk5420.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index e86c1ae..b979405 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -126,4 +126,14 @@
 		};
 	};
 
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "samsung,smdk-wm8994";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&wm8994>;
+	};
 };
-- 
1.7.4.4
