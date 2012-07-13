From: Girish K S <girish.shivananjappa@linaro.org>
Subject: [PATCH] mmc: core: skip mmc_power_up call from start host
Date: Fri, 13 Jul 2012 18:27:15 +0530
Message-ID: <1342184235-6912-1-git-send-email-girish.shivananjappa@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:36677 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756252Ab2GMM5k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 08:57:40 -0400
Received: by pbbrp8 with SMTP id rp8so5458408pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jul 2012 05:57:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: cjb@laptop.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Girish K S <girish.shivananjappa@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

The call to the mmc_power_up during the mmc_start_host breaks the card
detection in design-ware host controller. This patch removes the call to
mmc_power_up function during host start.

This fix works fine with sdhci (sdhci compatilble host controller)
and dw_mmc (design-ware host controller). and has no side effect due to
this removal.

Tested on : origen-board and smdk-5250 board.

Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/core/core.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 9503cab..503aefc 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2108,7 +2108,6 @@ void mmc_start_host(struct mmc_host *host)
 {
 	host->f_init = max(freqs[0], host->f_min);
 	host->rescan_disable = 0;
-	mmc_power_up(host);
 	mmc_detect_change(host, 0);
 }
 
-- 
1.7.4.1
