Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BABC43611
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Apr 2021 14:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F19AE61008
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Apr 2021 14:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240680AbhD1OzO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Apr 2021 10:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240476AbhD1OyK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C437B6194D;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=jFh5VbnuBrXc2tgtFwOIhvEafKERvRJMCTg4uhxmLFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rqT4jrxhHzyLDsERiaJS6pfq3zWDtC8jYX0I9hy9y8aGAxbQpcLOlBSCVX4NfJ3Lm
         qzUd0yLlv9e8uuWIUYMBDusv5/tPo8c53NKHeBS0papQf/xM0bqPep8ErRsx6XcWny
         u4hHWVLi3OrV09uSfyGjJIPTJwYGKejFUhENqxAACS9QBctKxzWj5hisUZFr+cYsEK
         GDq6x2beHMpln0uVCVUyeT7iO3IucWs41LF/ZYRQcQx7PZzdCuQ6L2AWtUK1MJEblF
         ZOk/oI8z3FqAAqw2ZY14O+E9FpiF86C6dqDd3Qk8GuBQMDFU5URJuZt0qEIfN7RcBX
         1n0mQfxD2r66Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dt1-L6; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v4 71/79] media: s3c-camif: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:32 +0200
Message-Id: <cbde680be9c9d4d072cbd17e213979315d40eda0.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

