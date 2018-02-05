From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Add the DT binding files entry to
 MAINTAINERS
Date: Mon, 05 Feb 2018 18:05:00 +0100
Message-ID: <20180205170500.8992-1-s.nawrocki@samsung.com>
References: <CGME20180205170523epcas1p31ebef69e5d5db0a1ef2f1c3b5ac544ae@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43141 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752712AbeBERF1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 12:05:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds missing DT binding files to the Samsung ASoC
drivers entry.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5046003ea162..da2df3194d72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11921,6 +11921,7 @@ M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/samsung/
+F:	Documentation/devicetree/bindings/sound/samsung*
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-- 
2.14.2
