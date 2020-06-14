Return-Path: <SRS0=9Q6F=73=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3A2C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 14 Jun 2020 03:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BCCC2080D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 14 Jun 2020 03:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="Mr2pHGWc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgFNDSj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 Jun 2020 23:18:39 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:41530 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFNDSh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 23:18:37 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49l06P1g9Sz9vBtD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2020 03:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qhQSivmeh8Ub for <linux-samsung-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 22:18:37 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49l06N6ttsz9vBtG
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 22:18:36 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49l06N6ttsz9vBtG
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49l06N6ttsz9vBtG
Received: by mail-il1-f197.google.com with SMTP id o12so9518878ilf.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HH/45wVNp4vPlnv8y138sW8x+ALttRXOB4XcVO5Zkvs=;
        b=Mr2pHGWcj5Ed4kB6qg+LD4UU7Fdh03ef8xenaEHX4IejelTQRSts1ZUsupl/mg59zB
         XF9CR2+v+hbbLsa1MjbFoPtRr5YYVmZ27DlWKM8xPwZf7yGIv0FbMEznM/ntiMvxZUeG
         i5BHFjA9b7vZXBMhyB/BGgjvsZwwqzLf+OoaQy/+UrP9Kl8BLPEDI2/kbo/YI05R6nGr
         sHBOTRnMNGIaesLVyR5fQUrz5uwTzAf4si+Y7RZ1cpuY/nTd50V/NwKm9C51Cpc69kZQ
         3c/3kaNY/lEordibuKx0qfVo1GwM/l4Loihba7JhTR2rN81SPmcctJMdzUi2yL4uzpdF
         R9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HH/45wVNp4vPlnv8y138sW8x+ALttRXOB4XcVO5Zkvs=;
        b=sjr687W/sk+0IDqoYcRVwRHSP1H5k+E6DqoHhUlVMAc+OlI2urPmyzybZWA2K27el0
         Hriyfv5DrXTOjfz/jmeipATbjm5viY100//ZKVaSBTGg+OyRP5TmmNmiOcAwiF/ZRCAC
         yz7uE+TpzyeGgqcDs05RIL2MbHtEMn4pASedAqWO28F2kTkdH1CKt2ahDBVmZvtoDLEL
         VCyKxncble9CrHwJbGolcZTO5c9tdzWd521YsMcJnQl9LIsVmCQ7qXgvTTzJFYB1JdDU
         cJNUUDbmNoqfQiZT3qNERcOhkICx/uWS55EEZ648iiLPuhNAC9pjDCwR28F+7mUnuxv1
         Yefg==
X-Gm-Message-State: AOAM531zkeCb1ZEeAAgsE8GQrkXx+qExvpuIWH/hsl9SxD3x0Ff33M1+
        6vPSTEC0R07oEnfphHVGr33nopjrpyUxnpbr1ni2Dt/P8/KuTfp3pRIVwzAsp4BWdw2yD9N5axD
        Dk6vUyGynWvUI3irH7/cym0VeBLJZlM97gIk=
X-Received: by 2002:a02:707:: with SMTP id f7mr14751040jaf.119.1592104716478;
        Sat, 13 Jun 2020 20:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvhSbDmYnmF5WV63TX3Cq9IgWRZ8Hr8otgBrXO+ItUH+Xf51d8C1dlXHo+xujD8MZenFDLig==
X-Received: by 2002:a02:707:: with SMTP id f7mr14751022jaf.119.1592104716193;
        Sat, 13 Jun 2020 20:18:36 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id b9sm5559725ils.84.2020.06.13.20.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:18:35 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
Date:   Sat, 13 Jun 2020 22:18:29 -0500
Message-Id: <20200614031829.31570-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/exynos4-is/fimc-isp.c  | 4 +++-
 drivers/media/platform/exynos4-is/fimc-lite.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index cde0d254ec1c..a77c49b18511 100644
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
index 394e0818f2d5..92130d779137 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -470,7 +470,7 @@ static int fimc_lite_open(struct file *file)
 	set_bit(ST_FLITE_IN_USE, &fimc->state);
 	ret = pm_runtime_get_sync(&fimc->pdev->dev);
 	if (ret < 0)
-		goto unlock;
+		goto err_pm;
 
 	ret = v4l2_fh_open(file);
 	if (ret < 0)
-- 
2.17.1

