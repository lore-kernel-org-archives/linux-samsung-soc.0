From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/2] s3cmci: minor fixups
Date: Wed, 18 Aug 2010 18:04:26 +0300
Message-ID: <1282143866-8068-3-git-send-email-anarsoul@gmail.com>
References: <1282143866-8068-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:55885 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753692Ab0HRPGg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 11:06:36 -0400
Received: by mail-ey0-f174.google.com with SMTP id 5so402252eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2010 08:06:35 -0700 (PDT)
In-Reply-To: <1282143866-8068-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>, anarsoul@gmail.com

- It's not necessary to start DMA op manually, as we have
autostart feature enabled
- Restore prescaler before DMA operation, otherwise it
takes ages to complete DMA op.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/mmc/host/s3cmci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index 2e16e0a..5d1a8ed 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -1106,6 +1106,8 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
 		    sg_dma_address(&data->sg[i]),
 		    sg_dma_len(&data->sg[i]));
 
+		/* Restore prescaler value */
+		writel(host->prescaler, host->base + S3C2410_SDIPRE);
 		res = s3c2410_dma_enqueue(host->dma, host,
 					  sg_dma_address(&data->sg[i]),
 					  sg_dma_len(&data->sg[i]));
@@ -1116,8 +1118,6 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
 		}
 	}
 
-	s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_START);
-
 	return 0;
 }
 
-- 
1.7.2
