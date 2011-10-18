From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH] mmc: core: Modify the timeout value for writing power class
Date: Tue, 18 Oct 2011 13:20:57 +0900
Message-ID: <000501cc8d4d$55a4e590$00eeb0b0$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12305 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728Ab1JREU7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Oct 2011 00:20:59 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: cjb@laptop.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dh.han@samsung.com

This patch will apply the generic CMD6 timeout to switch command
for power class.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
 drivers/mmc/core/mmc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index f8ea938..d19440d 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -659,7 +659,7 @@ static int mmc_select_powerclass(struct mmc_card *card,
 		err = mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
 				 EXT_CSD_POWER_CLASS,
 				 pwrclass_val,
-				 0);
+				 card->ext_csd.generic_cmd6_time);
 	}

 	return err;
--
1.7.0.4
