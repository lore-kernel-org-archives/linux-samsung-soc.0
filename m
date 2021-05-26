Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707D1C47082
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 554646113D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbhEZMuv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:50:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56871 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhEZMs7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:48:59 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswZ-0000w7-C6
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:27 +0000
Received: by mail-vs1-f72.google.com with SMTP id v15-20020a67c00f0000b029023607a23f3dso192772vsi.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1o/+HiDWaRqbZ2KripZjBdfw0i27jwAjy/6T41yOkhc=;
        b=PBnHEp5WEIS51Q+En8EoOEyOc9nSogWJqoRGN8ctgcU0uBR/UK2jWUiOVk+D+gKgZd
         9+SJMPpDg4nsXk2Jn+DB64fdYrhObft//2jzxHVYwLqG/azEXNtlG84mqctdK9S+u2Ae
         bYvH0AAjcNAl1lQEYyf/u+sQgITjfvuKbaB/MOQvi4Y62Kk+1AoZ0KMc1DjfVHZgIRkq
         PTVSCjscM68w0KL909E55NdWXotQ8wvFnHS7qRPkSBjjETjECjFFqR6d6xCIZhYJCvz6
         svoYw5pp/lkWC+n3xrWTdBqGodKtxX46YSBPc8722C0Ik0UxXRuLFlHpdPHuZPteQa3O
         2hxg==
X-Gm-Message-State: AOAM5313TQvKoMBqP1iwjNw9nC1SKfV7+C3q74llNBbx1BFpWM7hcmx8
        ldn7jFwgqI/TZKZpjhMNaZigcZtHNniO809DrYySq2mXWcww3cjLqWGAiDTIBSlwFHuIPoV7lVk
        jSFqJc55nvamNc2xWuRQeAYtlbbkY1tv/dcDKRrbn5vLj3UTB
X-Received: by 2002:a1f:a802:: with SMTP id r2mr29795054vke.14.1622033246156;
        Wed, 26 May 2021 05:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyflJsx/GTGmueUvxCqoT3eN+/IS1gmrFHEClDPJbgqchaHkmkdQt0f9ZaB2/HCSu4kcXqjEQ==
X-Received: by 2002:a1f:a802:: with SMTP id r2mr29795039vke.14.1622033246028;
        Wed, 26 May 2021 05:47:26 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH v2 03/13] mfd: da9052: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:01 -0400
Message-Id: <20210526124711.33223-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

---

Changes since v1:
1. Add Ack
---
 drivers/mfd/da9052-i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 8ebfc7bbe4e0..8de93db35f3a 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -155,13 +155,8 @@ static int da9052_i2c_probe(struct i2c_client *client,
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
2.27.0

