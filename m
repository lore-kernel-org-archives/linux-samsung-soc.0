Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41D6C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Feb 2021 07:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9895464F0A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Feb 2021 07:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhBUHnR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Feb 2021 02:43:17 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:51619 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBUHnR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Feb 2021 02:43:17 -0500
Received: from localhost.localdomain ([90.126.17.6])
        by mwinf5d65 with ME
        id Xjhb2400607rLVE03jhbrF; Sun, 21 Feb 2021 08:41:36 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Feb 2021 08:41:36 +0100
X-ME-IP: 90.126.17.6
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, arnd@arndb.de,
        gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] usb: gadget: s3c: Fix the error handling path in 's3c2410_udc_probe()'
Date:   Sun, 21 Feb 2021 08:41:33 +0100
Message-Id: <20210221074133.938017-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some 'clk_prepare_enable()' and 'clk_get()' must be undone in the error
handling path of the probe function, as already done in the remove
function.

Fixes: 1c6d47aa4f4b ("USB Gadget driver for Samsung s3c2410 ARM SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
checkpatch reports:
WARNING: Unknown commit id '1c6d47aa4f4b', maybe rebased or not pulled?
According to https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/usb/gadget/s3c2410_udc.c?id=3fc154b6b8134b98bb94d60cad9a46ec1ffbe372
the commit ID looks correct to me. Maybe something should be tweaked somewhere
before applying, but I don't know what!
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index 3fc436286bad..146250e93412 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -1750,7 +1750,8 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	udc_clock = clk_get(NULL, "usb-device");
 	if (IS_ERR(udc_clock)) {
 		dev_err(dev, "failed to get udc clock source\n");
-		return PTR_ERR(udc_clock);
+		retval = PTR_ERR(udc_clock);
+		goto err_usb_bus_clk;
 	}
 
 	clk_prepare_enable(udc_clock);
@@ -1773,7 +1774,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (!base_addr) {
 		retval = -ENOMEM;
-		goto err;
+		goto err_udc_clk;
 	}
 
 	the_controller = udc;
@@ -1791,7 +1792,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (retval != 0) {
 		dev_err(dev, "cannot get irq %i, err %d\n", irq_usbd, retval);
 		retval = -EBUSY;
-		goto err;
+		goto err_udc_clk;
 	}
 
 	dev_dbg(dev, "got irq %i\n", irq_usbd);
@@ -1862,7 +1863,14 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		gpio_free(udc_info->vbus_pin);
 err_int:
 	free_irq(irq_usbd, udc);
-err:
+err_udc_clk:
+	clk_disable_unprepare(udc_clock);
+	clk_put(udc_clock);
+	udc_clock = NULL;
+err_usb_bus_clk:
+	clk_disable_unprepare(usb_bus_clock);
+	clk_put(usb_bus_clock);
+	usb_bus_clock = NULL;
 
 	return retval;
 }
-- 
2.27.0

