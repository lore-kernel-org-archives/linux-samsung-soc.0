Return-Path: <SRS0=GfTY=DZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8C3C43457
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7172137B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Oct 2020 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603049605;
	bh=xV8v4HsfW/T/pSVmTp0YC8+BuJdwI81D8/nK9ImUFdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dTliHYVMdcNP7PclWziQguDGaYrOXGfMK+B850/7vS/xU7aBkKXDXguNc1+n8jdK+
	 wmvfg3UVl76oyXd5G7B9QqPsKuQh0c7mjFNU4LQeO9w5EoHsI10ioa5U3GbnHsiMu/
	 e3XjIb33N70oo6g6FklaADE8KAInyfTRykq3jmjU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgJRTdY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:33:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731813AbgJRT0s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Oct 2020 15:26:48 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A03E20791;
        Sun, 18 Oct 2020 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049207;
        bh=xV8v4HsfW/T/pSVmTp0YC8+BuJdwI81D8/nK9ImUFdk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eNE+MArCXnpH+3gWclpCbwMtv5O350iwunm/bx5KOFdjnsCidbaP6M6jd3++96HoE
         p+AhQTugMduA1La43lQWIrIKDDJaSZc1nnj8Yv/i1g40xPos5x9AvH8CMaj/MkWB9Q
         3g+2hc5YgafPxSB0Ic53jbZoMVq1f8gDJHOja5Sc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 08/41] media: platform: s3c-camif: Fix runtime PM imbalance on error
Date:   Sun, 18 Oct 2020 15:26:02 -0400
Message-Id: <20201018192635.4056198-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192635.4056198-1-sashal@kernel.org>
References: <20201018192635.4056198-1-sashal@kernel.org>
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
index ec40019703132..560e1ff236508 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -476,7 +476,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 
 	ret = camif_media_dev_init(camif);
 	if (ret < 0)
-		goto err_alloc;
+		goto err_pm;
 
 	ret = camif_register_sensor(camif);
 	if (ret < 0)
@@ -510,10 +510,9 @@ static int s3c_camif_probe(struct platform_device *pdev)
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

