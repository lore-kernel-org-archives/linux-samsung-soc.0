From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH 2/2] mmc: core: Add claiming a host during mmc_cache_ctrl
Date: Thu, 24 Nov 2011 18:23:07 +0900
Message-ID: <1322126587-6326-1-git-send-email-tgih.jun@samsung.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Seungwon Jeon <tgih.jun@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

While calling mmc_cache_ctrl() a host is not claimed. This patch
adds the mmc_try_claim_host() for quick response in suspend.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
 drivers/mmc/core/core.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 481b090..703ff11 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2314,7 +2314,13 @@ int mmc_suspend_host(struct mmc_host *host)
 		cancel_delayed_work(&host->disable);
 	cancel_delayed_work(&host->detect);
 	mmc_flush_scheduled_work();
-	err = mmc_cache_ctrl(host, 0);
+	if (mmc_try_claim_host(host)) {
+		err = mmc_cache_ctrl(host, 0);
+		mmc_do_release_host(host);
+	} else {
+		err = -EBUSY;
+	}
+
 	if (err)
 		goto out;
 
-- 
1.7.0.4

