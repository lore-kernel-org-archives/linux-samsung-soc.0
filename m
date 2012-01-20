From: Gusakov Andrey <dron0gus@gmail.com>
Subject: [PATCH v2] S3C24XX DMA resume regression fix
Date: Fri, 20 Jan 2012 17:13:04 +0400
Message-ID: <1327065184-9805-1-git-send-email-dron0gus@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:48200 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751808Ab2ATNNX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 08:13:23 -0500
Received: by bkas6 with SMTP id s6so421811bka.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2012 05:13:22 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, Sergey Lapin <slapin@ossfans.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Gusakov Andrey <dron0gus@gmail.com>

In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b
(Use struct syscore_ops for "core" power management)
suspend/resume hooks for each DMA channels were replaced with
hooks that suspend/resume all channels. s3c2410_dma_suspend
suspends channels from 0 to dma_channels. s3c2410_dma_resume
resumes channels in reverse order. So pointer should be
decremented insted of being incremented.

Signed-off-by: Gusakov Andrey <dron0gus@gmail.com>
---
 arch/arm/plat-s3c24xx/dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

v2: updated commit message with original commit summary

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
