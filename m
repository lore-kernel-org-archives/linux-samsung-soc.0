Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8F7C41604
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABC3A23A02
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721591;
	bh=2+06qkbWAVkuhERi8bhEbQjqR1FgtPU6AJIKYJUtzs4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=M6Bdzo4+sb7CTukSbOyKjgatfc9Uh//vW6uv97nYBtltRaJkv35sMmHrf2l0cRAqE
	 y52EhPDUuSvqEUPt59wmeJI7H9Od/CU+XjX/sjKEtAUTtIcSvVFBagKLLbOvUVzM+d
	 ryznFFZWCL9bMCx7I0INstNrDNwXhGS5qk+kuCpY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgIUUxL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgIUUxJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:09 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74E70239EB;
        Mon, 21 Sep 2020 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721588;
        bh=2+06qkbWAVkuhERi8bhEbQjqR1FgtPU6AJIKYJUtzs4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=yQowhQxnH44W+Den+Gm9jvWj8JtK6DNN/YYciYlwqQpU+z7+vAEs9H4lO500Uwzgy
         iPXvXrendlG4E81o18bwZ8I4MLSZuRPMBk+Mb7iKR9/QAGmGAdGrUlGX9aei5RE8yQ
         JIIqa36YxlE88vEaGRtyOAoJsBWWe2WIJSsj57iI=
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
Subject: [PATCH 27/42] mfd: sec: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:01 +0200
Message-Id: <20200921205016.20461-27-krzk@kernel.org>
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
 drivers/mfd/sec-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 8d55992da19e..804f32d0ae22 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -457,8 +457,8 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 			sec_pmic->device_type);
 		return -ENODEV;
 	}
-	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, NULL);
+	ret = devm_mfd_add_devices(sec_pmic->dev, PLATFORM_DEVID_NONE,
+				   sec_devs, num_sec_devs, NULL, 0, NULL);
 	if (ret)
 		return ret;
 
-- 
2.17.1

