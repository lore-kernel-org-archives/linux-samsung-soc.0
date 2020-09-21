Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C746C4363C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED25F23A02
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721584;
	bh=tV83lbckL3BUbusSp+k2ben0NRWIywBFOecylgZRFzU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=J0c2hPWhXYKP19eiUIVumwy7ppL2svt7Z8tZBBibvpiCvpuDekeGWizC/PIBM1Iyg
	 rurd2f5l849itHuA/uvUGNRs5ymJ0PVMOSAfCqDME/DxR+nkZgZAdf5rOeI72iveUX
	 9VGTHOC0/3KQEkZQ5hAlNX5nKKe9/4SwOcrTdr/U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgIUUxA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgIUUw5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5C27239E7;
        Mon, 21 Sep 2020 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721576;
        bh=tV83lbckL3BUbusSp+k2ben0NRWIywBFOecylgZRFzU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E+RGMGs0y1au3y8G/YoZX5va4ym8jLAJVdPslKDcnTJfrtBC5wofWJASM+BWB9fjC
         fWx2+6ZhiIGkIk+OBLGY5BJYtpQD2Kk7rl9o305hcetDfabvEnDVepx2CcFpZRAcxg
         81O6vo4O9y/gq35y72re5tfX4qW42k1/QiQguzWA=
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 25/42] mfd: retu: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:59 +0200
Message-Id: <20200921205016.20461-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921205016.20461-1-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/retu-mfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index e7d27b7861c1..55e24e8343f3 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -271,9 +271,9 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret < 0)
 		return ret;
 
-	ret = mfd_add_devices(rdev->dev, -1, rdat->children, rdat->nchildren,
-			      NULL, regmap_irq_chip_get_base(rdev->irq_data),
-			      NULL);
+	ret = mfd_add_devices(rdev->dev, PLATFORM_DEVID_NONE, rdat->children,
+			      rdat->nchildren, NULL,
+			      regmap_irq_chip_get_base(rdev->irq_data), NULL);
 	if (ret < 0) {
 		regmap_del_irq_chip(i2c->irq, rdev->irq_data);
 		return ret;
-- 
2.17.1

