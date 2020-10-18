Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75969C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A2E4223FD
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603049147;
	bh=ESmYsFwdjMvGzq6UJYwPaDKEGd2RRZovAo1COkQR6ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=j1lSwCPN666nR6LhAyecIq/5jXwtr1ei0ShHcErztNaIQTVTaCEl6Zl4crSIC39l/
	 34gpxn+PDcqBs/BTGzwdaCfstEFab2nMw9NwrwT0X7TxWxdh3aIt4qmXAw+nlMrwiG
	 WOV7G7J+RAD1pX4qiPvwIBgwvEXbMJIK/W0xCT6c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731383AbgJRTZq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:25:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731376AbgJRTZo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:25:44 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1AAE2236F;
        Sun, 18 Oct 2020 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049143;
        bh=ESmYsFwdjMvGzq6UJYwPaDKEGd2RRZovAo1COkQR6ZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xCi4OHWKHvd/k3cMatxh0jCLmivGiwcYEstJ6Sd/Pj0dtR8ebGYH/S1w3S9QoDbXA
         N5PhS69q6Ql7AjU65FeiUx9W3coPfnjFN1+42m5imA/wPZUsr43uaRZwjd3XqSqtZs
         diYoBZQjXjVUJ+pbzk+cuiKdt9/2o7FeSimv/7zU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/52] media: platform: s3c-camif: Fix runtime PM imbalance on error
Date:   Sun, 18 Oct 2020 15:24:47 -0400
Message-Id: <20201018192530.4055730-10-sashal@kernel.org>
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

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit dafa3605fe60d5a61239d670919b2a36e712481e ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
an error code.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/s3c-camif/camif-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c4ab63986c8f0..95b11f69555c3 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -475,7 +475,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 
 	ret = camif_media_dev_init(camif);
 	if (ret < 0)
-		goto err_alloc;
+		goto err_pm;
 
 	ret = camif_register_sensor(camif);
 	if (ret < 0)
@@ -509,10 +509,9 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	media_device_unregister(&camif->media_dev);
 	media_device_cleanup(&camif->media_dev);
 	camif_unregister_media_entities(camif);
-err_alloc:
+err_pm:
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
-err_pm:
 	camif_clk_put(camif);
 err_clk:
 	s3c_camif_unregister_subdev(camif);
-- 
2.25.1

