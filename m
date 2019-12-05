Return-Path: <SRS0=RElU=Z3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576CFC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B85F21835
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEnJa1eg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfLEOiF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Dec 2019 09:38:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32872 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbfLEOiF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 09:38:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id 21so3898201ljr.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2019 06:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yV3GhPFmJytkxtEGQExTIppqC25xkrzPKeo9NSW2jNs=;
        b=rEnJa1egaaC2TNAcUXrNmliNqPwcGsDByFWAWwyIoE8s7yMfeadjXObeaSnewLqqTR
         6K8eNGbAQYDEIdX7O7ksSwrSkmijvlbJpdvWlEDdQzcS4sUppx7yRjcuBRm3Fn34ogiQ
         fiEzd81IK2TeJEHvNgiDrHrOD2Shx4icapMGWypOZMBRO8nWrGie1Q4hcuKb3324rS/P
         sbEn93MkptyWC+hqRKGk75Rh+Nv2qXIiyo+j4fJtEV/x1qkYub2GL6KWK4OOQoDqx4mz
         fjDzulI7WD0qKMZgjuCxwTNev8gs/GQIk4m/SxDB7DGq/ufNtwBTgp/GzIL7hq6wg/lj
         r3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yV3GhPFmJytkxtEGQExTIppqC25xkrzPKeo9NSW2jNs=;
        b=AT/lWSmF/Ro/kw48eR4N77T0tTMVNBcHqBttH42Mn8EYql0tGOy6/uQwx4lNnANqhU
         0vd7Li73b7nI/EGZfmJ5Us7CBIaHV4gRQQF8aPMFd5nPGvTfj5badEosOxGtmqTZ1d25
         Nz34rIi62K6XQStyHRgD9Gjm7dx8kIUYmLWObR+ORmvf28VwLnxZxM4d2270qtp2v4/J
         5RM4kwZiVe0o7Gt3tyKNmZPLc8FRHdCU8I87+3nTDWFtnbLvUDHC9ZA0XAyMAomE2dkk
         QQp5CNdD5ZAbEAh7XXdhS6Vv+e5SUNtMQFp8gPHWnUzbQgWLkJB7YYXd50eNbO1f7oai
         /QBA==
X-Gm-Message-State: APjAAAVETQbjCUWt0OAHEmXN46f1bhtPqsb3FKwpvTUJ3EOtydlOqlNX
        GSbJBtLubf+XkNlxX0aKXdMjyQ==
X-Google-Smtp-Source: APXvYqxpjsbqgz0brAMyxbLOAnsZnvOdw6fvFP4gA9g80ZYWL7pNAQmuXVdBtC8GlmBSytntjAah8w==
X-Received: by 2002:a2e:b4cb:: with SMTP id r11mr2586523ljm.68.1575556683734;
        Thu, 05 Dec 2019 06:38:03 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q10sm5091294ljj.60.2019.12.05.06.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:38:02 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/2] dmaengine: pl330: Convert to the *_late and *_early system sleep callbacks
Date:   Thu,  5 Dec 2019 15:37:46 +0100
Message-Id: <20191205143746.24873-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205143746.24873-1-ulf.hansson@linaro.org>
References: <20191205143746.24873-1-ulf.hansson@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It has turned out that it's in general a good idea for dmaengines to allow
DMA requests during the entire dpm_suspend() phase. Therefore, convert the
pl330 driver into using SET_LATE_SYSTEM_SLEEP_PM_OPS.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/dma/pl330.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 8e01da157518..88b884cbb7c1 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2981,7 +2981,9 @@ static int __maybe_unused pl330_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(pl330_pm, pl330_suspend, pl330_resume);
+static const struct dev_pm_ops pl330_pm = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pl330_suspend, pl330_resume)
+};
 
 static int
 pl330_probe(struct amba_device *adev, const struct amba_id *id)
-- 
2.17.1

