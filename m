From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 03/11] clocksource/drivers/exynos_mct: Staticize struct clocksource
Date: Tue,  2 Jun 2015 14:31:48 +0200
Message-ID: <1433248316-26320-3-git-send-email-daniel.lezcano@linaro.org>
References: <556DA1E5.1030601@linaro.org>
 <1433248316-26320-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:34458 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758812AbbFBMcs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:32:48 -0400
Received: by wibut5 with SMTP id ut5so67693384wib.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 05:32:47 -0700 (PDT)
In-Reply-To: <1433248316-26320-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tglx@linutronix.de, mingo@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG
	EXYNO..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The struct clocksource 'mct_frc' is not exported and used outside so
make it static.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 87c2e55..8b2a9fc 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -209,7 +209,7 @@ static void exynos4_frc_resume(struct clocksource *cs)
 	exynos4_mct_frc_start();
 }
 
-struct clocksource mct_frc = {
+static struct clocksource mct_frc = {
 	.name		= "mct-frc",
 	.rating		= 400,
 	.read		= exynos4_frc_read,
-- 
1.9.1
