Return-Path: <SRS0=ZdNY=BO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA959C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 Aug 2020 15:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A86232086A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 Aug 2020 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596554100;
	bh=vQi2H9LP7kTLlb1Ttty0RJJoaFPlzswXaBwsiFtTXe4=;
	h=From:To:Subject:Date:List-ID:From;
	b=bs8Rk+O8qzkO8GqodHj62splV9CYGIeB2QvycJo52WYCILKgEmlTxGTVzTMZhJ83s
	 cCwOcZZhkOrKyMeFAfZ4LsWERNk40TpwdNI8UduXRU1TYLXiCo3OZpdQaDNTdhT8Fm
	 47MOT4w1LI0YmEsErh2oTbmLGHq4DJso7kiglFqg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgHDPOt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 4 Aug 2020 11:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:45376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729524AbgHDPOG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 11:14:06 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CFF922CB2;
        Tue,  4 Aug 2020 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596554046;
        bh=vQi2H9LP7kTLlb1Ttty0RJJoaFPlzswXaBwsiFtTXe4=;
        h=From:To:Subject:Date:From;
        b=VCKLUkXuCWX1csaPwqRUq/N4G0j85112Yi2vmfRlF5ZkPn9LlQ3bDR3ToihpaylfG
         qxbC7KQgWMajSqVMrEqAxWgOQSNc/ZpHPkcnMakP3J9NMQeUgrR1tn0+FWXMdB0kMo
         0i8VKVGOCjLznotzxW1pv+ug1zdW2UVmc7E45Ngw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] spi: s3c24xx: correct kerneldoc comment
Date:   Tue,  4 Aug 2020 17:13:56 +0200
Message-Id: <20200804151356.28057-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct the kerneldoc for structure to fix W=1 compile warning:

    drivers/spi/spi-s3c24xx.c:36: warning: cannot understand function prototype: 'struct s3c24xx_spi_devstate '

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/spi/spi-s3c24xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c24xx.c b/drivers/spi/spi-s3c24xx.c
index 2cb3b611c294..7742170fca91 100644
--- a/drivers/spi/spi-s3c24xx.c
+++ b/drivers/spi/spi-s3c24xx.c
@@ -28,7 +28,7 @@
 #include "spi-s3c24xx-fiq.h"
 
 /**
- * s3c24xx_spi_devstate - per device data
+ * struct s3c24xx_spi_devstate - per device data
  * @hz: Last frequency calculated for @sppre field.
  * @mode: Last mode setting for the @spcon field.
  * @spcon: Value to write to the SPCON register.
-- 
2.17.1

