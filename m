From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 6/7] [media] exynos-gsc: Fixup clock management at ->remove()
Date: Tue, 14 Oct 2014 09:15:39 +0200
Message-ID: <1413270940-4378-7-git-send-email-ulf.hansson@linaro.org>
References: <1413270940-4378-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:37703 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754438AbaJNHQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Oct 2014 03:16:08 -0400
Received: by mail-la0-f53.google.com with SMTP id gq15so7839094lab.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Oct 2014 00:16:06 -0700 (PDT)
In-Reply-To: <1413270940-4378-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Kevin Hilman <khilman@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>, Ulf Hansson <ulf.hansson@linaro.org>

We want to make sure that the clock is fully gated after ->remove(). To
do this, we need to bring the device into full power and not only
unprepare the clock, but also disable it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 1b9f3d7..e48aefa 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1139,12 +1139,15 @@ static int gsc_remove(struct platform_device *pdev)
 {
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(&pdev->dev);
+
 	gsc_unregister_m2m_device(gsc);
 	v4l2_device_unregister(&gsc->v4l2_dev);
-
 	vb2_dma_contig_cleanup_ctx(gsc->alloc_ctx);
+	clk_disable_unprepare(gsc->clock);
+
 	pm_runtime_disable(&pdev->dev);
-	clk_unprepare(gsc->clock);
+	pm_runtime_put_noidle(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
-- 
1.9.1
