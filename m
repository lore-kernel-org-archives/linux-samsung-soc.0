From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 3/3] Documentation: update samsung pmu binding information
Date: Sat, 10 May 2014 15:46:25 +0900
Message-ID: <1399704385-12508-4-git-send-email-pankaj.dubey@samsung.com>
References: <1399704385-12508-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43589 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbaEJG2M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 May 2014 02:28:12 -0400
In-reply-to: <1399704385-12508-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Rob Landley <rob@landley.net>

This patch updates samsung pmu (power management unit) binding information.

CC: Leela Krishna Amudala <l.krishna@samsung.com>
CC: Tomasz Figa <t.figa@samsung.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Rob Landley <rob@landley.net>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index f1f1552..b562634 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -2,6 +2,9 @@ SAMSUNG Exynos SoC series PMU Registers
 
 Properties:
  - compatible : should contain two values. First value must be one from following list:
+		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
+		   - "samsung,exynos4212-pmu" - for Exynos4212 SoC,
+		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
 		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
 		second value must be always "syscon".
-- 
1.7.10.4
