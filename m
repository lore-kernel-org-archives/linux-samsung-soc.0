From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 3/9] ARM: S3C64XX: Stop and flush requests on freeing
Date: Fri, 11 Jun 2010 21:48:51 +0200
Message-ID: <4C129323.2030101@gmail.com>
References: <cover.1276284559.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:46761 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760530Ab0FKTsy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jun 2010 15:48:54 -0400
Received: by mail-ww0-f46.google.com with SMTP id 18so1095668wwb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jun 2010 12:48:53 -0700 (PDT)
In-Reply-To: <cover.1276284559.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org

When a DMA channel is freed, its pending requests should be flushed and the
channel should be halted. This patch ensures that happens.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/dma.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
index be043db..48cbfbc 100644
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -560,7 +560,8 @@ int s3c2410_dma_free(unsigned int channel, struct s3c2410_dma_client *client)
 		       channel, chan->client, client);
 	}
 
-	/* sort out stopping and freeing the channel */
+	s3c64xx_dma_flush(chan);
+	s3c64xx_dma_stop(chan);
 
 
 	chan->client = NULL;
-- 
1.7.1
