From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add locking sequence for nomal mode
Date: Sat, 11 Feb 2012 11:53:31 +0900
Message-ID: <018201cce868$5693a060$03bae120$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26666 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752393Ab2BKCxc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 21:53:32 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ700HMSK14IS70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:53:31 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700APBK17HZ30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:53:31 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dsfine.ha@samsung.com

From: Dongsoo Ha <dsfine.ha@samsung.com>

ADC need to lock the data when read the data from register.
It is a complicated timing issue. Lock the data before start ADC and keep it.

Signed-off-by: Dongsoo Ha <dsfine.ha@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/adc.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c index fccc644..c68d56f 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -224,11 +224,16 @@ int s3c_adc_read(struct s3c_adc_client *client, unsigned int ch)  {
 	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wake);
 	int ret;
+	unsigned long flags;
+
+	spin_lock_irqsave(&adc_dev->lock, flags);
 
 	client->convert_cb = s3c_convert_done;
 	client->wait = &wake;
 	client->result = -1;
 
+	spin_unlock_irqrestore(&adc_dev->lock, flags);
+
 	ret = s3c_adc_start(client, ch, 1);
 	if (ret < 0)
 		goto err;
--
1.7.1
