Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB639C41513
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Oct 2023 14:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343732AbjJQOES (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Oct 2023 10:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjJQOES (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 10:04:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F003FC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Oct 2023 07:04:16 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c16757987fso72426771fa.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Oct 2023 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697551454; x=1698156254; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsrDGDEum/5uA7iQIpJCzRkScaB2QGiVp3IoiHcOdaw=;
        b=TnZB0Wqc0VzP+t6Cuyzy1nn5obwWHM4YDtOYMO5GPpwlADzXEFqaR8rterAPwn6lQr
         Oz1WHrVsUKReOroHp2+1VUKr2CklRjVIXTNQ6//ylL/lLeKVW0JeoGQMOvebd/2R40q7
         sQR9j6I/knjsPPCQqOnZy1m1QIBDJ3K1sOE81JVsDrGNiM29puiYbqKaaXvbLGusJeZx
         d7lbme7HXNkZ1DvKdAAoetqSRg6rjxa85tN0VMdlbNQbw8su2bUzQsemr3D5Di9QTyoy
         pvg54g/lUmyEvXSL7d4cttLwBOHyAsNZuLMdv4CvsZBlEN299GfHkGgvZoup2/QJ+IkS
         TCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551454; x=1698156254;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsrDGDEum/5uA7iQIpJCzRkScaB2QGiVp3IoiHcOdaw=;
        b=j5GWiytKK0Oc/G6xLzvhiY7VZcYTZE7fwLGto46n1173GLqQjJvyK+zESH+ot+M88d
         tw3GU0HAOuSO+sKc11mlms57/B3Y9IyzkDPmok9DzSSDncFl+wHtxPCDBJkreCO4zpXT
         FhhB7AYc3NKOtDHhVXx/FyAmFuli22fTJQrgP0FltQFBPDrilZW9Lp8isLKcj30r2Eu0
         Dnq/gdcAGmBeHpeeCnyPaQmUSuVVk7Gp7tvoHvKWxlu+qSBOtw09Xj1u1+Tm0VCy6cv+
         cFhtxIx/p8VwN0lV4k8e22Z0rGQZe1Jmu4O+hQe8WApTc+faJiKbxNbDL/QwARKmQxTs
         BcsA==
X-Gm-Message-State: AOJu0YxN40sNsuYyA25iCEr6g20fOCXLtJrRMqVfofblMUKGdglQFmE8
        NTNDNsdbHAw23YyZxhCQk3nZLg==
X-Google-Smtp-Source: AGHT+IG3knXmy/5vJWYi5wyeUzPAbczRcRkMPFoeND1u5tpRwFY2sHAcBNusoVs8ClImAyYJzR9CHA==
X-Received: by 2002:a05:651c:1a0f:b0:2c5:16c0:6239 with SMTP id by15-20020a05651c1a0f00b002c516c06239mr2087490ljb.51.1697551454222;
        Tue, 17 Oct 2023 07:04:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b0040813e14b49sm1390701wmq.30.2023.10.17.07.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:04:13 -0700 (PDT)
Date:   Tue, 17 Oct 2023 17:04:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] pwm: samsung: Fix a bit test
Message-ID: <917e3890-7895-4b1c-bcee-4eecb3b7fe09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This code has two problems.  First, it passes the wrong bit parameter to
test_bit().  Second, it mixes using PWMF_REQUESTED in test_bit() and in
open coded bit tests.

The test_bit() function takes a bit number.  In other words,
"if (test_bit(0, &flags))" is the equivalent of "if (flags & (1 << 0))".
Passing (1 << 0) to test_bit() is like writing BIT(BIT(0)).  It's a
double shift bug.

In pwm_samsung_resume() these issues mean that the flag is never set and
the function is essentially a no-op.

Fixes: 4c9548d24c0d ("pwm: samsung: Put per-channel data into driver data")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis and not tested.

 drivers/pwm/pwm-samsung.c | 2 +-
 include/linux/pwm.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 10fe2c13cd80..acf4a0d8d990 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -630,7 +630,7 @@ static int pwm_samsung_resume(struct device *dev)
 		struct pwm_device *pwm = &chip->pwms[i];
 		struct samsung_pwm_channel *chan = &our_chip->channel[i];
 
-		if (!(pwm->flags & PWMF_REQUESTED))
+		if (!test_bit(PWMF_REQUESTED, &pwm->flags))
 			continue;
 
 		if (our_chip->variant.output_mask & BIT(i))
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index e3b437587b32..3eee5bf367fb 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -41,8 +41,8 @@ struct pwm_args {
 };
 
 enum {
-	PWMF_REQUESTED = 1 << 0,
-	PWMF_EXPORTED = 1 << 1,
+	PWMF_REQUESTED = 0,
+	PWMF_EXPORTED  = 1,
 };
 
 /*
-- 
2.39.2

