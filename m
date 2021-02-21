Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916AEC433E9
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Feb 2021 07:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60C1964F06
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Feb 2021 07:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhBUHnD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Feb 2021 02:43:03 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:50189 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhBUHnC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Feb 2021 02:43:02 -0500
Received: from localhost.localdomain ([90.126.17.6])
        by mwinf5d65 with ME
        id XjhJ2400507rLVE03jhJqX; Sun, 21 Feb 2021 08:41:19 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Feb 2021 08:41:19 +0100
X-ME-IP: 90.126.17.6
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, arnd@arndb.de,
        gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] usb: gadget: s3c: Fix incorrect resources releasing
Date:   Sun, 21 Feb 2021 08:41:17 +0100
Message-Id: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since commit fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources"),
'request_mem_region()' and 'ioremap()' are no more used, so they don't need
to be undone in the error handling path of the probe and in the removre
function.

Remove these calls and the unneeded 'rsrc_start' and 'rsrc_len' global
variables.

Fixes: fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
the 'err' label is used only to reduce the diff size of this patch. It is
removed in the following patch.

checkpatch reports:
WARNING: Unknown commit id 'fe0f8e5c9ba8', maybe rebased or not pulled?
According to https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/usb/gadget/udc/s3c2410_udc.c?id=188db4435ac64f0918def7ba0593d408700ecc4b
the commit ID looks correct to me. Maybe something should be tweaked somewhere
before applying, but I don't know what!
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index f1ea51476add..3fc436286bad 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -54,8 +54,6 @@ static struct clk		*udc_clock;
 static struct clk		*usb_bus_clock;
 static void __iomem		*base_addr;
 static int			irq_usbd;
-static u64			rsrc_start;
-static u64			rsrc_len;
 static struct dentry		*s3c2410_udc_debugfs_root;
 
 static inline u32 udc_read(u32 reg)
@@ -1775,7 +1773,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (!base_addr) {
 		retval = -ENOMEM;
-		goto err_mem;
+		goto err;
 	}
 
 	the_controller = udc;
@@ -1793,7 +1791,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (retval != 0) {
 		dev_err(dev, "cannot get irq %i, err %d\n", irq_usbd, retval);
 		retval = -EBUSY;
-		goto err_map;
+		goto err;
 	}
 
 	dev_dbg(dev, "got irq %i\n", irq_usbd);
@@ -1864,10 +1862,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		gpio_free(udc_info->vbus_pin);
 err_int:
 	free_irq(irq_usbd, udc);
-err_map:
-	iounmap(base_addr);
-err_mem:
-	release_mem_region(rsrc_start, rsrc_len);
+err:
 
 	return retval;
 }
@@ -1899,9 +1894,6 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 
 	free_irq(irq_usbd, udc);
 
-	iounmap(base_addr);
-	release_mem_region(rsrc_start, rsrc_len);
-
 	if (!IS_ERR(udc_clock) && udc_clock != NULL) {
 		clk_disable_unprepare(udc_clock);
 		clk_put(udc_clock);
-- 
2.27.0

