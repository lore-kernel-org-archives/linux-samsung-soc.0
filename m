From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH V3 2/3] ARM: shmobile: Convert to genpd flags for PM clocks for r8a7779
Date: Fri, 28 Nov 2014 09:30:02 +0100
Message-ID: <1417163403-7070-3-git-send-email-ulf.hansson@linaro.org>
References: <1417163403-7070-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:51275 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035AbaK1IaP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 03:30:15 -0500
Received: by mail-lb0-f177.google.com with SMTP id 10so5253870lbg.36
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Nov 2014 00:30:14 -0800 (PST)
In-Reply-To: <1417163403-7070-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Kevin Hilman <khilman@linaro.org>, Simon Horman <horms@verge.net.au>, linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>

Instead of using the dev_ops ->stop|start() callbacks for genpd, let's
convert to use genpd's flag field and set it to GENPD_PM_CLK.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
        Convert to renamed define.

Changes in v2:
        None.

---
 arch/arm/mach-shmobile/pm-r8a7779.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/pm-r8a7779.c b/arch/arm/mach-shmobile/pm-r8a7779.c
index 82fe3d7..3a09ae7 100644
--- a/arch/arm/mach-shmobile/pm-r8a7779.c
+++ b/arch/arm/mach-shmobile/pm-r8a7779.c
@@ -83,9 +83,8 @@ static void r8a7779_init_pm_domain(struct r8a7779_pm_domain *r8a7779_pd)
 {
 	struct generic_pm_domain *genpd = &r8a7779_pd->genpd;
 
+	genpd->flags = GENPD_PM_CLK;
 	pm_genpd_init(genpd, NULL, false);
-	genpd->dev_ops.stop = pm_clk_suspend;
-	genpd->dev_ops.start = pm_clk_resume;
 	genpd->dev_ops.active_wakeup = pd_active_wakeup;
 	genpd->power_off = pd_power_down;
 	genpd->power_on = pd_power_up;
-- 
1.9.1
