Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C6C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BD8F20829
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931532;
	bh=0ZjT6w62frwssv+4Ks9l2/OnlDfcFnkYb7WrZ7cRmdw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qy7SpefhwTFB8eqX83Y+kwu6Rdn8phwJbcYcvgeWc3apIG6j7m4h1NlFdP+pXs+BF
	 axO+LAzcK+b2d5ofg1xqUqETnWyRubcCTAzigBf/Y3GNkBLs+fKco44OnIVAysfs/H
	 +ImiLTT+XGpKvUGDH0EetE8RrjIgWbsAeAlBg0vI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387736AbgJ1Wai (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732937AbgJ1Wae (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:34 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 187AF20714;
        Wed, 28 Oct 2020 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924233;
        bh=0ZjT6w62frwssv+4Ks9l2/OnlDfcFnkYb7WrZ7cRmdw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gdXf2TRB2cFgLK3RjJRUXTsicinW2NjNQp8VYMED099C67W/RHpcOER7hNp/CKizU
         C5qhDjS5W8MPibbk14g+qhxWMDKRSjtEKSuA6Ut9c6h8RRHouhmDCyM831A+UXCKGJ
         zpTBYP/asH7yg3E01pl3AOfLF/ckUAJS4noL6KzA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH 04/42] mfd: atmel-hlcdc: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:31 +0100
Message-Id: <20201028223009.369824-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
References: <20201028223009.369824-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/mfd/atmel-hlcdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 3c2414ba4b01..8ba13bc6fcf8 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -129,7 +129,7 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, hlcdc);
 
-	return devm_mfd_add_devices(dev, -1, atmel_hlcdc_cells,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, atmel_hlcdc_cells,
 				    ARRAY_SIZE(atmel_hlcdc_cells),
 				    NULL, 0, NULL);
 }
-- 
2.25.1

