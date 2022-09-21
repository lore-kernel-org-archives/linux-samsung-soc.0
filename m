Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E54C6FA91
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Sep 2022 09:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiIUJnw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 21 Sep 2022 05:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiIUJno (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Sep 2022 05:43:44 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C389A93206
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2022 02:43:34 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so525496wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2022 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=e20xgygl/W7Al3uqyaecsrMJ91Ab42V4qJSgOrn8Idc7eHJxQinjwe/x6WKSe5oxV4
         pvQ6g9h7YLr6xf0iV4G7qRI8F7W/FYWX0wtin2MBV0aW2sJkDBx41zBUhLvG82cGlbH9
         n+6BPSzl9EGrkCparVCrg3XLABbSd/hWhMriZ+9U3Phdqsb6Tttf40xPTB/4Y+dDjWRC
         i4U24vVm6HvhdEy0/iPcIkcb/TKUBMaKJmGF0vSOZrJoqMxFeukfepi8eI/fEKrATb2X
         qlGWwz9EoZoyDchOaAyu+nc1nQZX425oCa9X1Ybo5mSEGQPk+nRxsTpyNtvtgy5CFhRC
         zXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=RfUMJF4OVZUjBuCVddtcieS29a+nXvEfTqXLezHXLjTZ/Fodlj1CAvByZLjNfbhgFg
         gWQ6FGUfRWntGrvEE6Vv/9NOCUuC3kRVOltObqVQOQ3/irMw3xsDihLNEl0ilWeIY1M6
         al5RjRLiKkebPN0CcaXeQ0mHqyQcZFwrwjC8thosNz/DT/wqPlBrp3qofx2JhMx8EZAr
         LVRMy93IB/oZA2LlyU4Cobj+DWPvd8m+sCImSnHC9LQ8Z8Itd2jKMTGO5qpdkI/+rU/q
         oDCPFDl4zKGsceZmY8lPRj9bgSMWb1mIGe4r5jfBJkc0JpdpDhGil9sjES5XY12XRzCx
         uksQ==
X-Gm-Message-State: ACrzQf0G7r2F31iy8Px6ftieCCQHSZF2CShML7zmlx585/JCaeSCBRj4
        wCnitw3g2Nuw2JrPDS9zNiSIqA==
X-Google-Smtp-Source: AMsMyM6rT0cWg1zSdFG4vgNDcbVpnOwWP7a0hP4q6ulsTk1oJ6pe/IvaWqH8AZ6UYJ5Pa6rhxNdigg==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id k4-20020a7bc404000000b003b4facacf50mr1123082wmi.67.1663753413047;
        Wed, 21 Sep 2022 02:43:33 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id r123-20020a1c2b81000000b003a62052053csm2763917wmr.18.2022.09.21.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:43:32 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v4 09/30] thermal/drivers/exynos: of_thermal_get_ntrips()
Date:   Wed, 21 Sep 2022 11:42:22 +0200
Message-Id: <20220921094244.606948-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921094244.606948-1-daniel.lezcano@linaro.org>
References: <20220921094244.606948-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal core framework allows to get the number of thermal trips,
use it instead of visiting the thermal core structure internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e33d32a9d2e..91e6860b5ec4 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -260,6 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tzd = data->tzd;
+	int num_trips = thermal_zone_get_num_trips(tzd);
 	unsigned int status;
 	int ret = 0, temp;
 
@@ -271,12 +272,12 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		goto out;
 	}
 
-	if (of_thermal_get_ntrips(tzd) > data->ntrip) {
+	if (num_trips > data->ntrip) {
 		dev_info(&pdev->dev,
 			 "More trip points than supported by this TMU.\n");
 		dev_info(&pdev->dev,
 			 "%d trip points should be configured in polling mode.\n",
-			 (of_thermal_get_ntrips(tzd) - data->ntrip));
+			 num_trips - data->ntrip);
 	}
 
 	mutex_lock(&data->lock);
@@ -289,7 +290,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		ret = -EBUSY;
 	} else {
 		int i, ntrips =
-			min_t(int, of_thermal_get_ntrips(tzd), data->ntrip);
+			min_t(int, num_trips, data->ntrip);
 
 		data->tmu_initialize(pdev);
 
-- 
2.34.1

