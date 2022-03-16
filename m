Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10169C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Mar 2022 01:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353038AbiCPBzD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Mar 2022 21:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353034AbiCPBzD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 21:55:03 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB2933EAE;
        Tue, 15 Mar 2022 18:53:50 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id mv2-20020a17090b198200b001c65bae5744so85356pjb.5;
        Tue, 15 Mar 2022 18:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Xg15yRMMviMUzCglDMY0HU4537JOOxmewNboEJ+Yvmc=;
        b=GN96DWJnWxNOD0u11hog6ZGPYYlLhk60WwKms/taP8LsrGfAGw3YhwVt3nV7ogpKoM
         wP34cx/jyovqeszzWM/cE/AeDAya+iwKyWi3cQwfq2Dli3nJyuJXQDhHFh2ugfDBnstQ
         oEkYWhO9R4wXixYXLWajaMfzG9WllB/0lkk5Wzf7speXHBkynv6H0zzqjR1OZwyrKtZS
         gWWMyFj1y/LxutvVtIylzZFIFSAh8xrSdyZafU/prn6JSaD81k5Dho4ABiRx3oiI7Z90
         x/xHaMBGGYp2Gf0SOouDNta2vDF2ZlP+imS3RZvMR13naGbkngsCoc72jJcMLQe2LYwR
         Rr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Xg15yRMMviMUzCglDMY0HU4537JOOxmewNboEJ+Yvmc=;
        b=IvvNhXVhu32iAQzb1Os5LAi4qqfiDQQC7nX0d2/foG5KaetvQXQ1h6YQ4ASHw/9amg
         hJ4igbDtNhetokTr2KKqWLD3gqH6dYqRAL8Zkw4yPxFuSJ3DcA9+zD3fPHvkN/dbjFNd
         ymmMByPWQ/DErJ8qgR1jucR7YGnEykf5T2mitkwoigaVrN/KKrqjVJZznrwFC5dbeqou
         exNUSj2j3EEjl6/ew2648W+Q8RmmGQVvo9u612z4l1O+nb5tSF/L7Xj9JdPcPMWnD7Fl
         VFgeSEJtEehYijRARVir0fnUoTO9CWMuWwb5ADcQehJNZ3WePmP2eFQoyDFvmMxe/y9p
         mP0A==
X-Gm-Message-State: AOAM530a4RT7G/rugBWZCt92nIZOg73lqvVr6gYjhJoGX/Oqhx2N4nul
        1SsakFjh0pn7eaSgQVf4TNO0HCEkmbQ1Neuecjo=
X-Google-Smtp-Source: ABdhPJyCqm/iPBayX1NkaXkG7E6Q84g5TtKGOSYe9QvfuFM8fB8UglAAnVh10BeyH4UIhj9wU+vcjQ==
X-Received: by 2002:a17:90b:17ca:b0:1bf:6188:cc00 with SMTP id me10-20020a17090b17ca00b001bf6188cc00mr7920821pjb.2.1647395629762;
        Tue, 15 Mar 2022 18:53:49 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
        by smtp.googlemail.com with ESMTPSA id i15-20020a63b30f000000b003803aee35a2sm533256pgf.31.2022.03.15.18.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 18:53:49 -0700 (PDT)
From:   Miaoqian Lin <linmq006@gmail.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kyunmin Park <kyungmin.park@samsung.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linmq006@gmail.com
Subject: [PATCH] media: exynos4-is: Change clk_disable to clk_disable_unprepare
Date:   Wed, 16 Mar 2022 01:53:44 +0000
Message-Id: <20220316015344.5120-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The corresponding API for clk_prepare_enable is clk_disable_unprepare,
other than clk_disable_unprepare.

Fix this by changing clk_disable to clk_disable_unprepare.

Fixes: b4155d7d5b2c ("[media] exynos4-is: Ensure fimc-is clocks are not enabled until properly configured")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index e55e411038f4..8e88b0f6662d 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -140,7 +140,7 @@ static int fimc_is_enable_clocks(struct fimc_is *is)
 			dev_err(&is->pdev->dev, "clock %s enable failed\n",
 				fimc_is_clocks[i]);
 			for (--i; i >= 0; i--)
-				clk_disable(is->clocks[i]);
+				clk_disable_unprepare(is->clocks[i]);
 			return ret;
 		}
 		pr_debug("enabled clock: %s\n", fimc_is_clocks[i]);
-- 
2.17.1

