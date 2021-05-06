Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F632C43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 15:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31F2E6142F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 15:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbhEFP1z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 11:27:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:40888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235326AbhEFP1m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 11:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC77561943;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=jFh5VbnuBrXc2tgtFwOIhvEafKERvRJMCTg4uhxmLFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gQ+EcUNziXJldC44cpFfwrxjpi3vgg891yyIz1m2ZwRSEjOUjKbObc7e9Btk8f/MR
         DxJ4XFGfBGrkQsXYvtBhnjaxT7DjbiHPJiFmKnmKmWn2WQn/FqKFYOMO3VkLe/a9a8
         KU5xdawuNarZygF7ewP+L6Eddsy2qf17fUBz0WVNduBZLYAh7ZR8X+KVqKZz3xqpho
         Cj32oT3oXqvalfuGHW1YIKkD1ue30rHLHo9CDaDu23KU5wkVnKrIaI5iP/wzGnPbvX
         7dq9aNlSL/jbrmn6RM/8EcCsVUyDHKHQmv7ONcw8WX3nMJAMt1rInW9jy7V0CprGBj
         RRUFayVciaTFg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCB-82; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v5 18/25] media: s3c-camif: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:56 +0200
Message-Id: <40b44b0945e39b7633b31c6c6e27c7d701dc2691.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 2 +-
 drivers/media/platform/s3c-camif/camif-core.c    | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 9ca49af29542..62241ec3b978 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -547,7 +547,7 @@ static int s3c_camif_open(struct file *file)
 	if (ret < 0)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(camif->dev);
+	ret = pm_runtime_resume_and_get(camif->dev);
 	if (ret < 0)
 		goto err_pm;
 
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index 4c3c00d59c92..e1d51fd3e700 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -460,9 +460,9 @@ static int s3c_camif_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto err_pm;
+		goto err_disable;
 
 	ret = camif_media_dev_init(camif);
 	if (ret < 0)
@@ -502,6 +502,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_pm:
 	pm_runtime_put(dev);
+err_disable:
 	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
-- 
2.30.2

