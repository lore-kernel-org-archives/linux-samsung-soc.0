From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 10/12] soc: samsung: pm_domain: Use the recently added PM
 Domain notifiers
Date: Mon, 03 Nov 2014 09:23:08 +0530
Message-ID: <1414986790-11940-11-git-send-email-amit.daniel@samsung.com>
References: <1414986790-11940-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61443 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852AbaKCEDz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Nov 2014 23:03:55 -0500
In-reply-to: <1414986790-11940-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: kgene.kim@samsung.com, pankaj.dubey@samsung.com, Amit Daniel Kachhap <amit.daniel@samsung.com>

Invoke the GPD_OFF_PRE/GPD_ON_POST power Domain notifiers. This will
allow some clocks to be saved and restored. These notifiers can also
be invoked from the core power domain files but is not done as exynos is
the only user of these notifiers as of now.
In exynos7 SOC's only GPD_OFF_PRE/GPD_ON_POST are required.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/soc/samsung/pm_domains.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index f14f182..11633c2 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -99,11 +99,16 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, true);
+	int ret;
+
+	ret = exynos_pd_power(domain, true);
+	genpd_invoke_transition_notifier(domain, GPD_ON_POST);
+	return ret;
 }
 
 static int exynos_pd_power_off(struct generic_pm_domain *domain)
 {
+	genpd_invoke_transition_notifier(domain, GPD_OFF_PRE);
 	return exynos_pd_power(domain, false);
 }
 
-- 
1.7.9.5
