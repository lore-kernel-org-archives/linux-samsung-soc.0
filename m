Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815B6C43462
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61EB96101C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236037AbhDSISG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:18:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50432 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbhDSISE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 04:18:04 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP65-0007tv-Sd
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 08:17:34 +0000
Received: by mail-ej1-f71.google.com with SMTP id w2-20020a1709062f82b0290378745f26d5so3332196eji.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBlSlGEgsRYkWadTEY1QTDX93GegaXkwf2V4Jg/WsDg=;
        b=Mr6XcHo0rRN8UK4+wVfYTAfja6jPtM3BLf2n6rBpLl8C+4gg+8cpPukRiuY+ikn8cQ
         DF0lwL/H9NHcnh0WnGYJRMeIwrJOHUrdxI5QRXVM4OXleSTTEV6/Z+FFy8DDB2nfYMjn
         3QByej1d5CRTTcbVm9YOQzwdM14tw5kLyckBvoM7kaaXXCnn4e+SsgL31OBfCG+kbyTH
         KFp83GAE0HBuL2JvoI4xbvG0OlV6BPbTVBAqJJrXpDOQUYOAQvfEqjpGT9aGJ6MWCbYR
         TAhAsJdXKuqkpISZP91m+uQyOVLH+yJYaZQIntfH40PybEkwHdeEblKpqUQAAURa3Y9T
         caNg==
X-Gm-Message-State: AOAM532y+ld+43vyJQJphNblaUj3wBaCwonErOsCx4yd3flUJMetHMkg
        1mTjrSIKfNEUC+8vxjQOiXbNn8pQmCFkU4RgaYl1MUeCpk37GOczxxoHbLF28N3YqTNwwAzbfow
        +pxpNXNqTBESNZmv0KCu0LbVZ2FPvORlS15g6EOoYamtzBtmm
X-Received: by 2002:a17:906:5e15:: with SMTP id n21mr20554432eju.57.1618820253487;
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg+swdgj8EuewfKecTej+k1qH/AS1lZ95oqPWPHenRPBZ4PUCtQ7xGMn+3SRt0O+PhuF3UZw==
X-Received: by 2002:a17:906:5e15:: with SMTP id n21mr20554419eju.57.1618820253361;
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/7] mfd: da9052: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:22 +0200
Message-Id: <20210419081726.67867-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/da9052-i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 47556d2d9abe..5d8ce8dca3fc 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -154,13 +154,8 @@ static int da9052_i2c_probe(struct i2c_client *client,
 		return ret;
 
 #ifdef CONFIG_OF
-	if (!id) {
-		struct device_node *np = client->dev.of_node;
-		const struct of_device_id *deviceid;
-
-		deviceid = of_match_node(dialog_dt_ids, np);
-		id = deviceid->data;
-	}
+	if (!id)
+		id = of_device_get_match_data(&client->dev);
 #endif
 
 	if (!id) {
-- 
2.25.1

