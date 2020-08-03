Return-Path: <SRS0=j0RG=BN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB45DC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 Aug 2020 09:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAB2120738
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 Aug 2020 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596446387;
	bh=DofFcpUFjE06yqe2NdDV1H4PmyUGdMscl+cYpBWQ+S4=;
	h=From:To:Subject:Date:List-ID:From;
	b=e5fLOX+SpfvF+p0RQJxQSUlMfig0CZ3x5O17pukhP/ffQP/2SnEXDRZViBkUtd5Xw
	 0WDd20HN7iqOkbhqqaM+gzgtDYIws9xH1SsFjjyWZo4l27KZZAFMMiYKBieGo0laC/
	 cLK5Od0ncjDfJYomtUTrxhSCjlaB54sBV/qeQ9Ug=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgHCJTs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 3 Aug 2020 05:19:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgHCJTr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 05:19:47 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DEF220719;
        Mon,  3 Aug 2020 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596446386;
        bh=DofFcpUFjE06yqe2NdDV1H4PmyUGdMscl+cYpBWQ+S4=;
        h=From:To:Subject:Date:From;
        b=p3zepOYA6fnzuYz42SncJwEHhW1Zpoejn+/Pc1Bq67KMvxz0oBcYliVvg9V2qiVXX
         hVuhNW1iYDnOA504vgXTxYKMHV6bFu1FivB3kQeyUzXKVgmqHrg42JGY7cky6gZQnX
         h2wKW1BkoqPDWnZJl+GnQZcDJeQWq3KWZpiGUG8k=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] leds: s3c24xx: Remove unused machine header include
Date:   Mon,  3 Aug 2020 11:19:36 +0200
Message-Id: <20200803091936.24984-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver includes machine header for GPIO registers but actually does
not use them.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-s3c24xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 9b5e67664ba3..3c0c7aa63b8c 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -16,8 +16,6 @@
 #include <linux/module.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 
-#include <mach/regs-gpio.h>
-
 /* our context */
 
 struct s3c24xx_gpio_led {
-- 
2.17.1

