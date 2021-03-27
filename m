Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E236C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Mar 2021 07:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23CD5619A9
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Mar 2021 07:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhC0Hh0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Mar 2021 03:37:26 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:41406 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbhC0Hg6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Mar 2021 03:36:58 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d29 with ME
        id lKcs2400F3g7mfN03Kcs99; Sat, 27 Mar 2021 08:36:56 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Mar 2021 08:36:56 +0100
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        krzysztof.kozlowski@canonical.com, nathan@kernel.org,
        arnd@arndb.de, gustavoars@kernel.org, weiyongjun1@huawei.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 1/2] usb: gadget: s3c: Fix incorrect resources releasing
Date:   Sat, 27 Mar 2021 08:36:50 +0100
Message-Id: <b317638464f188159bd8eea44427dd359e480625.1616830026.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since commit 188db4435ac6 ("usb: gadget: s3c: use platform resources"),
'request_mem_region()' and 'ioremap()' are no more used, so they don't need
to be undone in the error handling path of the probe and in the remove
function.

Remove these calls and the unneeded 'rsrc_start' and 'rsrc_len' global
variables.

Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
the 'err' label is used only to reduce the diff size of this patch. It is
removed in the following patch.

v2: Fix a stupid error in the hash in Fixes:
v3: s/removre/remove/
    Add Reviewed-by:
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index 1d3ebb07ccd4..b81979b3bdb6 100644
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
 	if (IS_ERR(base_addr)) {
 		retval = PTR_ERR(base_addr);
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

