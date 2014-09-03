From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 13/15] drivers: sh: Leave disabling of unused PM domains to genpd
Date: Wed,  3 Sep 2014 12:52:29 +0200
Message-ID: <1409741551-16437-14-git-send-email-ulf.hansson@linaro.org>
References: <1409741551-16437-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1409741551-16437-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Kevin Hilman <khilman@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Since genpd at late init, will try to disable unused PM domains we
don't need to do it from here as well.

Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/sh/pm_runtime.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/sh/pm_runtime.c b/drivers/sh/pm_runtime.c
index 72f6381..fe2c2d5 100644
--- a/drivers/sh/pm_runtime.c
+++ b/drivers/sh/pm_runtime.c
@@ -75,8 +75,6 @@ static struct pm_clk_notifier_block platform_bus_notifier = {
 	.con_ids = { NULL, },
 };
 
-static bool default_pm_on;
-
 static int __init sh_pm_runtime_init(void)
 {
 	if (IS_ENABLED(CONFIG_ARCH_SHMOBILE_MULTI)) {
@@ -96,16 +94,7 @@ static int __init sh_pm_runtime_init(void)
 			return 0;
 	}
 
-	default_pm_on = true;
 	pm_clk_add_notifier(&platform_bus_type, &platform_bus_notifier);
 	return 0;
 }
 core_initcall(sh_pm_runtime_init);
-
-static int __init sh_pm_runtime_late_init(void)
-{
-	if (default_pm_on)
-		pm_genpd_poweroff_unused();
-	return 0;
-}
-late_initcall(sh_pm_runtime_late_init);
-- 
1.9.1

