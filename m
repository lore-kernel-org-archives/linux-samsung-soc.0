Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A000C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44E302137B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603050018;
	bh=AefztVxE247r/15WJhExeyA+8dmtNdisr4SlZ+oRDNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=D+UuOX2qZ6T20WzmPtSiSmqVeBOXbn9SeCpbhBpbXdfQU5VqTRmQM0TwL+Y1eMN2s
	 GlRoCr8u5csuEM3dhV3hyBKBAUJiKISmr0o//CjC4SbwRRbO/+/0LjR0ynZoArj8Ys
	 OOA9rcybBzfuw6lbCbOOw6N9FT9X1Xw1jeFB8kY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbgJRTkR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:40:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730766AbgJRTY1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:24:27 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46F9C20791;
        Sun, 18 Oct 2020 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049067;
        bh=AefztVxE247r/15WJhExeyA+8dmtNdisr4SlZ+oRDNw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nUGPypVioQxiRl1w4H7Wyhw45AIgKa0qGiARNK+TcxgQrE1yL3YwlTxFO3IT4HeP1
         5ZL02CK+Yf9RZn1ID7sb/kL0KdZUHnNkF4rK2fEAWvYTkMQudNlrChRV8ZSfHo0hco
         M4uxYpEZAhehi4u5O0UuFrdnEeZuV2O1HXT7wdqg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiushi Wu <wu000273@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/56] media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
Date:   Sun, 18 Oct 2020 15:23:28 -0400
Message-Id: <20201018192417.4055228-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192417.4055228-1-sashal@kernel.org>
References: <20201018192417.4055228-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

[ Upstream commit 7ef64ceea0008c17e94a8a2c60c5d6d46f481996 ]

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/exynos4-is/fimc-isp.c  | 4 +++-
 drivers/media/platform/exynos4-is/fimc-lite.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index 9a48c0f69320b..1dbebdc1c2f87 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -311,8 +311,10 @@ static int fimc_isp_subdev_s_power(struct v4l2_subdev *sd, int on)
 
 	if (on) {
 		ret = pm_runtime_get_sync(&is->pdev->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put(&is->pdev->dev);
 			return ret;
+		}
 		set_bit(IS_ST_PWR_ON, &is->state);
 
 		ret = fimc_is_start_firmware(is);
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index 70d5f5586a5d5..10fe7d2e8790c 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -480,7 +480,7 @@ static int fimc_lite_open(struct file *file)
 	set_bit(ST_FLITE_IN_USE, &fimc->state);
 	ret = pm_runtime_get_sync(&fimc->pdev->dev);
 	if (ret < 0)
-		goto unlock;
+		goto err_pm;
 
 	ret = v4l2_fh_open(file);
 	if (ret < 0)
-- 
2.25.1

