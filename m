From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ARM: dts: Hook up internal PHY on Arndale
Date: Thu, 15 Aug 2013 00:27:01 +0100
Message-ID: <1376522821-16133-2-git-send-email-broonie@kernel.org>
References: <1376522821-16133-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52189 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932309Ab3HNX13 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 19:27:29 -0400
In-Reply-To: <1376522821-16133-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

While the Linux driver stack is capable of figuring this out for itself
document the fact that we really do use the internal PHY even with the
directly wired hub on the board to save anyone else having to work this
out for themselves.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 2428ffd..e477e23 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -553,4 +553,8 @@
 			connect-gpios = <&gpd1 7 1>;
 		};
 	};
+
+	usb@12110000 {
+		usb-phy = <&usb2_phy>;
+	};
 };
-- 
1.8.4.rc2
