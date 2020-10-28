Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C0C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A6BB20720
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603924277;
	bh=14PRgQ9ja2vhKOIYad9z8Ly4hH8wA/Mlt1rDuUMOPjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Bqjzb8C2DPNHjy4Lo/HhFGDRLd7z/4KE5OdaU1eS263XwTnsjM1ImnoCCNd9k+K0G
	 jJYEH/8IHqoTKXoov3ugjSQLtbq433q/u4df9ltXFzdJ25KY/Os+Ke7w6jkmom+JCL
	 82rq7t9n3lPHGC9sfZUMOSoEpxMudjbo8ci0L/r0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387854AbgJ1WbN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:31:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387852AbgJ1WbL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:11 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B49220720;
        Wed, 28 Oct 2020 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924271;
        bh=14PRgQ9ja2vhKOIYad9z8Ly4hH8wA/Mlt1rDuUMOPjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j8/npGYSUb0iY//8SVCqzASzEAnBs8i2WfbO9p4J7yAEcKGRLkf5RFlyZQdSNADtc
         VAE5arKxMxraOBA+JIaJ9x2E5q74ArET0IsrXiz64ZxLOKn10Tdlq8/tRe8ixcNEqr
         UEzDIRe7UEMuvoIFpCBCb6o/LjrmymZWKsXgD3G8=
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
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [RESEND PATCH 11/42] mfd: intel_soc_pmic: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:38 +0100
Message-Id: <20201028223009.369824-11-krzk@kernel.org>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/mfd/intel_soc_pmic_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
index ddd64f9e3341..b7bbe58dedcc 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -86,7 +86,7 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
 
-	ret = mfd_add_devices(dev, -1, config->cell_dev,
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, config->cell_dev,
 			      config->n_cell_devs, NULL, 0,
 			      regmap_irq_get_domain(pmic->irq_chip_data));
 	if (ret)
-- 
2.25.1

