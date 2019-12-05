Return-Path: <SRS0=RElU=Z3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691CAC47409
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40013224F8
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxN67uP4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbfLEOiE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Dec 2019 09:38:04 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47040 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbfLEOiE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 09:38:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id z17so3791249ljk.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2019 06:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LSrF1PZUXbppNkp6LXsmHrupmqPqLYDRsBF1XZV1SZg=;
        b=sxN67uP4loA2uHVs+iOAju81idbHAz9JP72QF6fKvTGIBFrU1Ua8i01zaU68+uf3r/
         urNNV+Iz+exbXJ5FVf9/xL0wwVLxJjGMy26aTWthtKyBHeJBU5QpIlUOCXNIsTUcs+RI
         jiB7cRjBt+fPB+dm138tcJkjdDnnJQTJjor5aPFh5cLcVvaKvYoGabS5xUxT+xqe+XTR
         CiEWOrrv5UtBchNW0igsiGTTUPyx54CeEfWEr0YP0OE4UKZUp8E4o3mG9k61O8F4hSOG
         z2rSjx62rxmpyyqczRq84KZH7KyFgTOoApJxXSdZnwHiaqZKTxbYqLxQHf+MS3yi9UWl
         126g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LSrF1PZUXbppNkp6LXsmHrupmqPqLYDRsBF1XZV1SZg=;
        b=UKkNObSJr5WqoGCS+XzV6fSmJMnUBgjCV7hXkNfVGuVCdOSsYNJ5krTA+2rlLrnWDj
         zMkennQCiMfxVEGRhxPPYFGCSowVQQAUlKrghk0+OMU7TbcedijSQybbAFnZaniSjVf8
         bcLadYxhcS0vH9SntgMJoyl05e2POR3kojsyiz6E7vypHhAnq3WzCfqXEtOOJbkLM25y
         TVLEZaCAR9CtEGvwSlNOLn5QAyvC3gwP1OykbsV9/Z/oR0NtxH5ENBGVnwYcRd5aTORI
         8+SCZpsmuLm401F9C+q61lajX+SJMxKNAOHKibrJ+tt1icPgDIVwo5zg9sSEOTBuHjta
         JvJg==
X-Gm-Message-State: APjAAAV0tzmXpg+/zXPWb9eStaaVlYOjin1upYarfYbo2ZCbcWl12cHb
        99r1iAEHS9sCh3C7P9++S7CFsw==
X-Google-Smtp-Source: APXvYqwS24lod+spv8JCEF1FwqJCKBEO1ZzNkv2x+NXiSPtPs2deTNm4TBwRmXyfhjEheQuZ3E/lQg==
X-Received: by 2002:a05:651c:112d:: with SMTP id e13mr4993155ljo.99.1575556682219;
        Thu, 05 Dec 2019 06:38:02 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q10sm5091294ljj.60.2019.12.05.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:38:01 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 1/2] dmaengine: pl330: Drop boilerplate code for suspend/resume
Date:   Thu,  5 Dec 2019 15:37:45 +0100
Message-Id: <20191205143746.24873-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205143746.24873-1-ulf.hansson@linaro.org>
References: <20191205143746.24873-1-ulf.hansson@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Let's drop the boilerplate code in the system suspend/resume callbacks and
convert to use pm_runtime_force_suspend|resume(). This change also has a
nice side effect, as pm_runtime_force_resume() may decide to leave the
device in low power state, when that is feasible, thus avoiding to waste
both time and energy during system resume.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/dma/pl330.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 6cce9ef61b29..8e01da157518 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2961,12 +2961,7 @@ static int __maybe_unused pl330_suspend(struct device *dev)
 {
 	struct amba_device *pcdev = to_amba_device(dev);
 
-	pm_runtime_disable(dev);
-
-	if (!pm_runtime_status_suspended(dev)) {
-		/* amba did not disable the clock */
-		amba_pclk_disable(pcdev);
-	}
+	pm_runtime_force_suspend(dev);
 	amba_pclk_unprepare(pcdev);
 
 	return 0;
@@ -2981,10 +2976,7 @@ static int __maybe_unused pl330_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!pm_runtime_status_suspended(dev))
-		ret = amba_pclk_enable(pcdev);
-
-	pm_runtime_enable(dev);
+	pm_runtime_force_resume(dev);
 
 	return ret;
 }
-- 
2.17.1

