From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH v2] ARM: mach-shmobile: Use common always on power domain governor
Date: Sun,  4 Dec 2011 01:24:41 +0000
Message-ID: <1322961881-31945-1-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <20111203110309.GA6043@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43622 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752479Ab1LDBYq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 20:24:46 -0500
In-Reply-To: <20111203110309.GA6043@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Saves a tiny amount of code.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-shmobile/pm-sh7372.c |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-shmobile/pm-sh7372.c b/arch/arm/mach-shmobile/pm-sh7372.c
index adf1765..7d7cdfc 100644
--- a/arch/arm/mach-shmobile/pm-sh7372.c
+++ b/arch/arm/mach-shmobile/pm-sh7372.c
@@ -162,16 +162,6 @@ static bool pd_active_wakeup(struct device *dev)
 	return active_wakeup ? active_wakeup(dev) : true;
 }
 
-static bool sh7372_power_down_forbidden(struct dev_pm_domain *domain)
-{
-	return false;
-}
-
-struct dev_power_governor sh7372_always_on_gov = {
-	.power_down_ok = sh7372_power_down_forbidden,
-	.stop_ok = default_stop_ok,
-};
-
 static int sh7372_stop_dev(struct device *dev)
 {
 	int (*stop)(struct device *dev);
@@ -246,7 +236,7 @@ struct sh7372_pm_domain sh7372_d4 = {
 
 struct sh7372_pm_domain sh7372_a4r = {
 	.bit_shift = 5,
-	.gov = &sh7372_always_on_gov,
+	.gov = &pm_domain_always_on_gov,
 	.suspend = sh7372_a4r_suspend,
 	.resume = sh7372_intcs_resume,
 	.stay_on = true,
@@ -262,7 +252,7 @@ struct sh7372_pm_domain sh7372_a3ri = {
 
 struct sh7372_pm_domain sh7372_a3sp = {
 	.bit_shift = 11,
-	.gov = &sh7372_always_on_gov,
+	.gov = &pm_domain_always_on_gov,
 	.no_debug = true,
 };
 
-- 
1.7.7.3
