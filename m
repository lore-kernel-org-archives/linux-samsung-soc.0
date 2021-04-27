Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446B1C43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Apr 2021 10:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B58C613D4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Apr 2021 10:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbhD0KOh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:14:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235362AbhD0KOf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6A47613C8;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=f7qp1inQpFhzLXGKfN6L+okBW8R7Adck1d72J+XCiZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LxNL0qj3rr1b2/nH8+UwBD8iLX4yyUe6p0kSfE5DZIeGha3gEC9iDUmCk6Jv/eP4/
         dv2eQ/bK39W03llKAissmZssAou4xejK9aTKW/CBO+w8Tz46lh61VrsJlPy0m4pg83
         ppBF7hmgdGAqv9p7BBkUql34pF3lBxeWxCz6wIkNfJFj9xPbmz6OWKGaDzgzpOhLiV
         KlC8BmTid9T5URTl1j9FG9g82aOlzv5NXKRxi2xCQOSRSzBeg3M3dbi63kwFfc6VdY
         F2omCVA2qbMyN7YtCqcZTW83u6fM31e7u2EKnGrbeQdj4QDjOC8yEnThgLPoHb80xa
         t/z07HtOn9U8Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4s-Es; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 06/79] media: exynos-gsc: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:12:33 +0200
Message-Id: <7f29a390daf93c38c4d52b9ccdfb113df5ebace7.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Calling pm_runtime_get_sync() at driver's removal time is not
needed, as this will resume PM runtime. Also, the PM runtime
code at pm_runtime_disable() already calls it, if it detects
the need.

So, simplify the code by getting rid of that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 9f41c2e7097a..70e86cdc1012 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1210,8 +1210,6 @@ static int gsc_remove(struct platform_device *pdev)
 	struct gsc_dev *gsc = platform_get_drvdata(pdev);
 	int i;
 
-	pm_runtime_get_sync(&pdev->dev);
-
 	gsc_unregister_m2m_device(gsc);
 	v4l2_device_unregister(&gsc->v4l2_dev);
 
@@ -1219,7 +1217,6 @@ static int gsc_remove(struct platform_device *pdev)
 	for (i = 0; i < gsc->num_clocks; i++)
 		clk_disable_unprepare(gsc->clock[i]);
 
-	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-- 
2.30.2

