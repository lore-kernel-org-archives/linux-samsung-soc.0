From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 3/3] ARM: S3C64XX: Stop and flush requests on freeing
Date: Mon, 31 May 2010 13:58:34 +0200
Message-ID: <4C03A46A.2090403@gmail.com>
References: <cover.1275306279.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:49241 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753691Ab0EaL6i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 May 2010 07:58:38 -0400
Received: by mail-ew0-f216.google.com with SMTP id 8so940968ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 May 2010 04:58:37 -0700 (PDT)
In-Reply-To: <cover.1275306279.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

When a DMA channel is freed, its pending requests should be flushed and the
channel should be halted. This patch ensures that happens.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/dma.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
index 8c9946f..193b07f 100644
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -560,7 +560,8 @@ int s3c2410_dma_free(unsigned int channel, struct s3c2410_dma_client *client)
 		       channel, chan->client, client);
 	}
 
-	/* sort out stopping and freeing the channel */
+	s3c64xx_dma_flush(chan);
+	s3c64xx_dma_stop(chan);
 
 	chan->client = NULL;
 	chan->in_use = 0;
-- 
1.7.1
