Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57ADC43457
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB4E207DE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603049783;
	bh=ZitSMksXbVfPgwkJze5+eHFHGlpfyn+wvp3XZE9BNfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=s8FdoDRwyt29BjOGiQ5KNoGXrrRMyI+HkXVD/QnVvCTjQnZtKGWWnf7xYUssIixsg
	 zybSGEHe9Bkg1sw82GUMVflEK3ftL64+cAkMrm6tV36i4qIWf954JtDhzO2qNQ5AA2
	 x8PmySTdcxo7iARi4uoMH+0/qT9MbIO+gyJ3Z1r4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731369AbgJRTZm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:25:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731358AbgJRTZl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:25:41 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1453207DE;
        Sun, 18 Oct 2020 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049140;
        bh=ZitSMksXbVfPgwkJze5+eHFHGlpfyn+wvp3XZE9BNfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NWZzJuDqJ9BykbXaVT3NicbQyavebRBG66yFh1KLYyOTCS8DHA8ZHrAmbQ7OWLN3F
         OeGfC6fLMQdufQ1eZgoDi52B62b/4g0FXEI1fYqH+qI5qhjwxZx5BR+FoJ/O7QQ9jZ
         IUxonWLyvCi6MUyZQE75ibqwIDL3w60IS+N3ztvY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiushi Wu <wu000273@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 08/52] media: exynos4-is: Fix a reference count leak
Date:   Sun, 18 Oct 2020 15:24:45 -0400
Message-Id: <20201018192530.4055730-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192530.4055730-1-sashal@kernel.org>
References: <20201018192530.4055730-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

[ Upstream commit 64157b2cb1940449e7df2670e85781c690266588 ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/exynos4-is/mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 560aadabcb111..040d10df17c97 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -513,8 +513,10 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
 	if (enable) {
 		s5pcsis_clear_counters(state);
 		ret = pm_runtime_get_sync(&state->pdev->dev);
-		if (ret && ret != 1)
+		if (ret && ret != 1) {
+			pm_runtime_put_noidle(&state->pdev->dev);
 			return ret;
+		}
 	}
 
 	mutex_lock(&state->lock);
-- 
2.25.1

