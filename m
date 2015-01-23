From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH v6 14/18] dts: Documentation: Update exynos-thermal.txt example
 for Exynos5440
Date: Fri, 23 Jan 2015 13:10:06 +0100
Message-ID: <1422015010-11918-14-git-send-email-l.majewski@samsung.com>
References: <1421666462-7606-1-git-send-email-l.majewski@samsung.com>
 <1422015010-11918-1-git-send-email-l.majewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20079 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbAWMMR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:12:17 -0500
In-reply-to: <1422015010-11918-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Majewski <l.majewski@samsung.com>

Updating exynos-thermal.txt documentation entry for Exynos5440

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
Changes for v4:
- New patch
Changes for v5:
- None
Changes for v6:
- None
---
 Documentation/devicetree/bindings/thermal/exynos-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
index 8497794..0f44932 100644
--- a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
@@ -74,6 +74,7 @@ Example 2):
 		interrupts = <0 58 0>;
 		clocks = <&clock 21>;
 		clock-names = "tmu_apbif";
+		#include "exynos5440-tmu-sensor-conf.dtsi"
 	};
 
 Example 3): (In case of Exynos5420 "with misplaced TRIMINFO register")
-- 
2.0.0.rc2
