From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/5] ARM: dts: remove old USB2 PHY node hook for Arndale
Date: Fri, 22 Aug 2014 18:59:01 +0200
Message-ID: <1408726745-31135-2-git-send-email-b.zolnierkie@samsung.com>
References: <1408726745-31135-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17008 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932409AbaHVQ7v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 12:59:51 -0400
In-reply-to: <1408726745-31135-1-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

drivers/usb/phy/phy-samsung-usb2 driver got replaced by
drivers/phy/phy-samsung-usb2 one.  Remove the leftover hook
from Arndale dts file.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>
Reviewed-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Brown <broonie@linaro.org>
Cc: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d0de1f5..dad8f9b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -570,8 +570,4 @@
 			connect-gpios = <&gpd1 7 1>;
 		};
 	};
-
-	usb@12110000 {
-		usb-phy = <&usb2_phy>;
-	};
 };
-- 
1.8.2.3
