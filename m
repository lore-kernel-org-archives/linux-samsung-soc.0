Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F6CC55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 10:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36EAB206E9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 10:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jh/BjhJt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgJ2KHh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 06:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgJ2KHh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 06:07:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F41C0613CF;
        Thu, 29 Oct 2020 03:07:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so1940683pfd.3;
        Thu, 29 Oct 2020 03:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gwxFeVVQki1Ulmy+kJJhnnhA+Wk8B176vMB8y1DV654=;
        b=Jh/BjhJt3TZ90ppnUlJyJkk1IQ72kxpYx8aoWKKBjpoPZfq52TCe2M9VWh5nhGs4Hq
         Mc63l3ojiG3yIqF4QF5yeTLcMpw4JKQrkoDcoKpHX7SfFfXtQcbVhNbSRPGvjI5PBt94
         20XlABvYthvXwuaJIATN7l+sK72LZjRJI3Py2EI1Q9VoYG83s5jHy6MOJ3Qgp26bz+z+
         TA0K2E3PxBayV4Ib/OaJ0fL33+e8FzJc9m+XVBlRV1UB+kLrxX/pDGPY8gtOtHKmz8eC
         9GWo+h3L4ZeFKug9kq/j+MUgBd6uxMvQ0yBqVMIjMQtF0o7L2TNh1AOGj5I+Gi98MihV
         3stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwxFeVVQki1Ulmy+kJJhnnhA+Wk8B176vMB8y1DV654=;
        b=T2PzoEDIFCvwOMZTHeO4tyu0ak9KNijZH6I2MlzoN61g7kB8QU9rdjMSDKmJwx7YbO
         kPB3H9Z/8dgouqfpoNdLHplAfl/e6hTvJXDI7Ox7PRfGEVqTR19T1d5nYzVCE4p/BPmU
         8APKP4BgA6hyhyRddXcecagui0+eda7kpP+q42Om7oof+evnTdV+MQ1ioud/m+1bBuud
         b2a1X4VtHKqNmSu8ctPWRiBvJ19x+jePIjYFQ5Nl5m1mIZrokr1vnTnNU6VNejCdd0j2
         kZO3bnMKRgZjXYYns6mnEydWFy/zcWQlr8IK12a8fNJoS/MHXqVVfLdeyebp9ilAAGuM
         CdtQ==
X-Gm-Message-State: AOAM530+F++/+r+8CINiwJ09cj1fsy3Afq27zCjV8W/vBBVe07Ackbmo
        dhPIli4hf411xpxEBUXB7xDoyT9ACNEpTlrW
X-Google-Smtp-Source: ABdhPJwgFfn6wmXydysaL1elxwNV7H7qVAM+Uk5X4+m4N6Rdp4jS3zaOi/fsohNuJlXc04AX5ERtkw==
X-Received: by 2002:a17:90a:1bc3:: with SMTP id r3mr3713084pjr.196.1603966056700;
        Thu, 29 Oct 2020 03:07:36 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id s18sm2049865pgh.60.2020.10.29.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:07:36 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Sangbeom Kim <sbkim73@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org (open list:SAMSUNG MULTIFUNCTION PMIC
        DEVICE DRIVERS),
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG MULTIFUNCTION PMIC
        DEVICE DRIVERS)
Subject: [PATCH 7/9] mfd: sec: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 18:06:45 +0800
Message-Id: <20201029100647.233361-7-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029100647.233361-1-coiby.xu@gmail.com>
References: <20201029100647.233361-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/mfd/sec-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 95473ff9bb4b..a5d19798d671 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -496,7 +496,6 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
 	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sec_pmic_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
@@ -529,7 +528,6 @@ static int sec_pmic_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 
-- 
2.28.0

