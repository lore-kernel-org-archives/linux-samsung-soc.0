Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7BEC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5561206BE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931550;
	bh=2kWIOEH/KcIuHZlj3LQjGfE/KRmEsQxNgUBxZTqQXR0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=f48lRCqawt1BmbrlSB3P53Ymd9zSXSkx2K3AM5ESfxipCNi+mHZOshbDBjdxa1N3R
	 evKK0VnVYZ8EY4+qE+mZkkPG9hiw1JY7yYmPHDZeADPhA7+GQlZGSLT4vXkpWapuZx
	 Qjn/Ve/nIuxMtGRK/iJmYLNE9TEEp9XyHzo7L5TQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387538AbgJ1W3N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:29:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387529AbgJ1W3M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:29:12 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6461D2070E;
        Wed, 28 Oct 2020 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924152;
        bh=2kWIOEH/KcIuHZlj3LQjGfE/KRmEsQxNgUBxZTqQXR0=;
        h=From:To:Cc:Subject:Date:From;
        b=xAfMd+hX3L/aRRKqFpkAUWCsG/m9w8cTpR9m9a1o/TF2RBimn294+yDG9kUJb7G/S
         VPQ/gvTiOU+OG8nT8jlREUW7t+qQpCCk7yDgQUsjxUgu1si7v3PF5V3VwHjo0mcthz
         UoJvCtnhsG85n1LI9y6VaK6ZQ1/Z/CuSMGDWkxBg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RESEND PATCH] mfd: sec: initialize driver via module_platform_driver
Date:   Wed, 28 Oct 2020 23:28:49 +0100
Message-Id: <20201028222849.365998-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver was using subsys_initcall() because in old times deferred
probe was not supported everywhere and specific ordering was needed.
Since probe deferral works fine and specific ordering is discouraged
(hides dependencies between drivers and couples their boot order), the
driver can be converted to regular module_platform_driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mfd/sec-core.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 7bfab43b455e..804f32d0ae22 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -549,19 +549,7 @@ static struct i2c_driver sec_pmic_driver = {
 	.shutdown = sec_pmic_shutdown,
 	.id_table = sec_pmic_id,
 };
-
-static int __init sec_pmic_init(void)
-{
-	return i2c_add_driver(&sec_pmic_driver);
-}
-
-subsys_initcall(sec_pmic_init);
-
-static void __exit sec_pmic_exit(void)
-{
-	i2c_del_driver(&sec_pmic_driver);
-}
-module_exit(sec_pmic_exit);
+module_i2c_driver(sec_pmic_driver);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core support for the S5M MFD");
-- 
2.25.1

