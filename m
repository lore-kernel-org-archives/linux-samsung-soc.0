From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V2] mmc: dw_mmc: exynos: Turn SDIO interrupts on
Date: Mon, 24 Mar 2014 09:53:57 +0530
Message-ID: <1395635037-24081-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:42970 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbaCXEYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Mar 2014 00:24:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: grundler@chromium.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jh80.chung@samsung.com, cjb@laptop.org, tgih.jun@samsung.com, linux-mmc@vger.kernel.org, sonnyrao@chromium.org, kgene.kim@samsung.com, joshi@samsung.com
Cc: t.figa@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Doug Anderson <dianders@chromium.org>

The mmc part in exynos supports SDIO interrupts and they work fine, so
turn the capability on.  With this I see download speeds increase
about 10x. 
	
This V1 of this patch is posted to LKML at
https://patchwork.kernel.org/patch/2429661/) by Doug Anderson.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 drivers/mmc/host/dw_mmc.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 0c56faa..240949d 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2417,6 +2417,9 @@ static struct dw_mci_board *dw_mci_parse_dt(struct dw_mci *host)
 	if (of_get_property(np, "cd-inverted", NULL))
 		pdata->caps2 |= MMC_CAP2_CD_ACTIVE_HIGH;
 
+	if (of_find_property(np, "cap-sdio-irq", NULL))
+		pdata->caps |= MMC_CAP_SDIO_IRQ;
+
 	return pdata;
 }
 
-- 
1.7.10.4
