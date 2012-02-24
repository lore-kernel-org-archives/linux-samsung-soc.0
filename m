From: Gusakov Andrey <dron0gus@gmail.com>
Subject: [PATCH v3] S3C24XX DMA resume regression fix
Date: Fri, 24 Feb 2012 16:40:27 +0400
Message-ID: <1330087227-10450-1-git-send-email-dron0gus@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:42034 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158Ab2BXMlE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Feb 2012 07:41:04 -0500
Received: by bkcjm19 with SMTP id jm19so1933090bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Feb 2012 04:41:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de, Gusakov Andrey <dron0gus@gmail.com>

s3c2410_dma_suspend suspends channels from 0 to dma_channels.
s3c2410_dma_resume resumes channels in reverse order. So 
pointer should be decremented insted of being incremented.
---
 arch/arm/plat-s3c24xx/dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index 57abec9..16510d5 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -1249,7 +1249,7 @@ static void s3c2410_dma_resume(void)
 	struct s3c2410_dma_chan *cp = s3c2410_chans + dma_channels - 1;
 	int channel;
 
-	for (channel = dma_channels - 1; channel >= 0; cp++, channel--)
+	for (channel = dma_channels - 1; channel >= 0; cp--, channel--)
 		s3c2410_dma_resume_chan(cp);
 }
 
-- 
1.7.0.4
