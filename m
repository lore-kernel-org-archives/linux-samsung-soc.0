From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH v2 RESEND 2/2] mmc: core: Add claiming a host during
 mmc_cache_ctrl
Date: Mon, 26 Dec 2011 18:03:05 +0900
Message-ID: <000901ccc3ad$2deff1c0$89cfd540$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22392 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955Ab1LZJDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 04:03:06 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: 'Chris Ball' <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org

While calling mmc_cache_ctrl() a host is not claimed. This patch
adds the mmc_try_claim_host() for quick response in suspend.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
 drivers/mmc/core/core.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 83ac6e6..efdbf9d 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2359,7 +2359,13 @@ int mmc_suspend_host(struct mmc_host *host)
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
