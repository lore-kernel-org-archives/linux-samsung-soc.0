Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D767C43457
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DF8822269
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603050799;
	bh=0w6BHfgMrYO94w2zhJG9aBTMWbnKGy674ULRy3rSaVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=J3DsoULTVk72if/xShVW9hGjluEpA+AeTIfron351XkR9YQNjNZUgVHJMDNwNVUBm
	 UwWNzRqnxqGNxpL2L/FEa4KmKDQTvac4dCurhxEqY0fuNnk3z4dFqvpViCdfBd5Ze3
	 81P6/cFRTts9KLVSx07JAjyokYS+Q+Bsm1cTdVfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgJRTUp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728994AbgJRTUo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:20:44 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC124222B9;
        Sun, 18 Oct 2020 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048843;
        bh=0w6BHfgMrYO94w2zhJG9aBTMWbnKGy674ULRy3rSaVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NmHiooPXeGSCe1jVzI/efD9Cm4+De3JfJW8ogq1q240aTLGnW4G6oUZbPKKQsiZGd
         4K6lDuONwsc4KCIn07St+dRzDmMWslJ/HXochcCKVNIooYUH+X5CpygFh0xlS94S+t
         xBrTw1jAKV01VsMKrudHyiKDf8GUatWBmiN0jqNo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiushi Wu <wu000273@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 013/101] media: exynos4-is: Fix a reference count leak
Date:   Sun, 18 Oct 2020 15:18:58 -0400
Message-Id: <20201018192026.4053674-13-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192026.4053674-1-sashal@kernel.org>
References: <20201018192026.4053674-1-sashal@kernel.org>
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
index 540151bbf58f2..1aac167abb175 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -510,8 +510,10 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
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

