Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22937C43457
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 20:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0CA322273
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603051251;
	bh=5sFYrGPp+FZ4rYEQ4JKr06Lgc3xopolgrCPJtFtuYWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mzz7O6m4KQEu7Tf+jpoqowcPDRqHKz2Qm1BXak6FDnB1eQYwwXlwvTPtm0AXqYbaW
	 tV+UzUCxr7ch8q4IlEpsquDnn1TyCVzrXqRiGYxgeUPyOQB1ITkTFQjabOgh1DIWs0
	 kBXLNsioDDShLxvtp0K25TxMNr/9PTnj/zhuF0x4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbgJRTS0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:18:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727477AbgJRTSW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:18:22 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A23142227F;
        Sun, 18 Oct 2020 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048701;
        bh=5sFYrGPp+FZ4rYEQ4JKr06Lgc3xopolgrCPJtFtuYWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WxMU2GaFdZPHX/xpI1PdOcdntbrwJ2FtiZ0YfxQV75Mgz1o4py19BVejDjlB2VBln
         vLrtscjukmDj3qjIqM56ktemKKNbRR8wqwc4Q07gZCUDaX0Ha0M298BrPP6FzW5DDe
         kN5ckP6ZWMH8lEkg29WLEezSoFIo6wRvdqADTWLs=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiushi Wu <wu000273@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 011/111] media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
Date:   Sun, 18 Oct 2020 15:16:27 -0400
Message-Id: <20201018191807.4052726-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
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
index cde0d254ec1c4..a77c49b185115 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -305,8 +305,10 @@ static int fimc_isp_subdev_s_power(struct v4l2_subdev *sd, int on)
 
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
index 9c666f663ab43..fdd0d369b1925 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -471,7 +471,7 @@ static int fimc_lite_open(struct file *file)
 	set_bit(ST_FLITE_IN_USE, &fimc->state);
 	ret = pm_runtime_get_sync(&fimc->pdev->dev);
 	if (ret < 0)
-		goto unlock;
+		goto err_pm;
 
 	ret = v4l2_fh_open(file);
 	if (ret < 0)
-- 
2.25.1

