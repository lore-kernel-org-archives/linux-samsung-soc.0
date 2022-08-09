Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD85EC28B2B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 22:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiHIWFt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 18:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiHIWFV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 18:05:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3AAF5A0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 15:05:19 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id i128-20020a1c3b86000000b003a536d58f73so116732wma.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dtsn+qHePIXkfLwiYhYSs7MDeRS5UWjSoQeV0DC4IrQ=;
        b=iwarO3CIexAFy05WuDYuhU+vOtx1AsCy/sZkh+hlYJ/QRSOXp3NLVsIWafaFT79jph
         noaLzAWR4SH+E8koHK8Dql7gkKhgx+yDeBAzAD7uemcTUznbUlIBUyi4MHGVWLZ+N5Ge
         CTVEyjSF8RKK2f0rqSs58y112TxHK+aaUdrRM6jV1MvF0qq3xYzHL0BTudA78O06nERZ
         S1QfesPyK/Bf+PUwAXXzY9XU1lVmBOejuXOkQY6sNG1mwYsc7P7eO2VxzOZBCEyfl0FO
         +pABrjMsEp3PFqzfODLa2xixNDJ+qRl0VIccPJwAAhtCEJACQAOzm9KYk7JrVvrt9urH
         n81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dtsn+qHePIXkfLwiYhYSs7MDeRS5UWjSoQeV0DC4IrQ=;
        b=DYCokxRFmULWv1J2faDeGL9Gh5HimdGCamkhx+iVYR0uXWMYa+pTxukg234CVuQHIW
         ELEHb2p+Rb6yRrCY4ddoZrkbHS0hllq3cecPnfCABqCuSw1u0R8efNhMm4bvxJnvV24q
         4t+dyR2sktEsNlG87reRh86GPfl/khO6vAf6K9gpbD3SDsJZc00SQNcQ6dors2MJdE4A
         iIbtTY9BqD4S/EjOzHCn/QUAMHGhbnwXWOuK8tZuKn92N07HL423KSkxIs8O2O5P5Udf
         nMZ85/Mg8n3CvoJy3gOM8pRZQAPh+CC4MGgR7Z5+BjXA4jaPyNRrU5BIflT5WTwDCNMF
         nNqg==
X-Gm-Message-State: ACgBeo3v0bgOMdJdYoVLqp/Mygtrvr/sMpre0qv/MvmdKOnyGBoTc1kA
        cK3aGTFhqW04ELzxE9L62hQ/2nihhF++Tg==
X-Google-Smtp-Source: AA6agR5BLj4meEP0OErMKJ3xPVCx+0sgrKGHOpVy5tF2q9LI+yGJ3PpYE9yfYQZwow0TMV9p0T1VmA==
X-Received: by 2002:a1c:4c0d:0:b0:3a5:98fa:3a4a with SMTP id z13-20020a1c4c0d000000b003a598fa3a4amr283578wmf.92.1660082718206;
        Tue, 09 Aug 2022 15:05:18 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003a317ee3036sm293583wms.2.2022.08.09.15.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:05:17 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v2 16/26] thermal/drivers/exynos: of_thermal_get_ntrips()
Date:   Wed, 10 Aug 2022 00:04:26 +0200
Message-Id: <20220809220436.711020-17-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809220436.711020-1-daniel.lezcano@linaro.org>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal core framework allows to get the number of thermal trips,
use it instead of visiting the thermal core structure internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5204e343d5b0..ac47c716c1f0 100644
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

