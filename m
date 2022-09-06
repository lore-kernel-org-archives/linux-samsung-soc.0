Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0F2ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Sep 2022 17:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239290AbiIFRBX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Sep 2022 13:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239061AbiIFRAE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 13:00:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07195140FF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Sep 2022 09:47:48 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so9979447wmk.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2022 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ffj/+IgRhlrRkOtYFWbfnlVsquqreXwCxJyvoKvBP5M=;
        b=W6OowTe7nX5Tu83zZ06/DlToCVod/nz1UmaXYt1n0TdoeHsLqBI4Dtsi4GhqPZP8GV
         f7AMVFRH25AMn8/j+KocZjyvK/QWuUsQQMlpFm2r7askDFLpphuYA2MskzfvLWHcmwTR
         IsLEE67H0SnejCnIXovCYTRmda0ZNSkek5LMMWHnR4+EOhGU6St7o15zAVWSNySEtu/k
         rSc3myDJaPxa5xJjmcADoTci5TJWlsqxdmHrRtd0Q2XX5hie1ZJkoZ4FcnjjcKrTGjxl
         qslGA5EYksVxR9ugcFenjaEkwCriSe2bNHkfoMo0tCftIlZ3Osk9uq3GuMuikmwF6hLf
         EasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ffj/+IgRhlrRkOtYFWbfnlVsquqreXwCxJyvoKvBP5M=;
        b=DYzU6/nLETTSUs2u+wVIKBqUa5jU5R5b8s3+UFoFgzLJoAlhxeJ6tTqn35MXCvisHk
         2CXSY04HSSZihqMhLOQQBoui5AdR3ysnHticzd/EOhBmTLizOlykHi1BU6NGme84Jg00
         HCCniYkNsnnpE5nRtOhHy1Aar655qoLvCSePupApipP6LmXfIIOeKud80bE/wSjdCWOZ
         HGphsaApZZrz1eXr5YXVPcMF0XuiJYfydEhwPz27oaGzqucz9dDjRj5fOKhJy0HEb7uo
         3zFkMyew6nfSpyxnsldVa7TMz8F2casU4RGifTYbT62QSM7ZZX+mF4PbpI2A6w7ezjli
         Zi1w==
X-Gm-Message-State: ACgBeo0hHodfiPFqc1+FtskxNpuJ3N+ILGPyCi1SyLmm4bZWbuLesY0E
        3/Qh+x09NPRno0g77LYFeuJcZg==
X-Google-Smtp-Source: AA6agR6qJr5AYVHcV76y6t8qEWii+bNh4lhZPz7VLjl4bBuOCz5W0Lg7wxRDpy26vsY+GTX5K7BuGw==
X-Received: by 2002:a05:600c:35d0:b0:3a5:f7ee:82be with SMTP id r16-20020a05600c35d000b003a5f7ee82bemr14267865wmq.206.1662482867071;
        Tue, 06 Sep 2022 09:47:47 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b0021f0ff1bc6csm7426600wrc.41.2022.09.06.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:47:46 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v3 08/30] thermal/drivers/exynos: Use generic thermal_zone_get_trip() function
Date:   Tue,  6 Sep 2022 18:46:58 +0200
Message-Id: <20220906164720.330701-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906164720.330701-1-daniel.lezcano@linaro.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal framework gives the possibility to register the trip
points with the thermal zone. When that is done, no get_trip_* ops are
needed and they can be removed.

Convert ops content logic into generic trip points and register them with the
thermal zone.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 41 +++++++++++-----------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 51874d0a284c..0e33d32a9d2e 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -260,16 +260,8 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tzd = data->tzd;
-	const struct thermal_trip * const trips =
-		of_thermal_get_trip_points(tzd);
 	unsigned int status;
-	int ret = 0, temp, hyst;
-
-	if (!trips) {
-		dev_err(&pdev->dev,
-			"Cannot get trip points from device tree!\n");
-		return -ENODEV;
-	}
+	int ret = 0, temp;
 
 	if (data->soc != SOC_ARCH_EXYNOS5433) /* FIXME */
 		ret = tzd->ops->get_crit_temp(tzd, &temp);
@@ -303,19 +295,16 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 		/* Write temperature code for rising and falling threshold */
 		for (i = 0; i < ntrips; i++) {
-			/* Write temperature code for rising threshold */
-			ret = tzd->ops->get_trip_temp(tzd, i, &temp);
-			if (ret)
-				goto err;
-			temp /= MCELSIUS;
-			data->tmu_set_trip_temp(data, i, temp);
 
-			/* Write temperature code for falling threshold */
-			ret = tzd->ops->get_trip_hyst(tzd, i, &hyst);
+			struct thermal_trip trip;
+			
+			ret = thermal_zone_get_trip(tzd, i, &trip);
 			if (ret)
 				goto err;
-			hyst /= MCELSIUS;
-			data->tmu_set_trip_hyst(data, i, temp, hyst);
+
+			data->tmu_set_trip_temp(data, i, trip.temperature / MCELSIUS);
+			data->tmu_set_trip_hyst(data, i, trip.temperature / MCELSIUS,
+						trip.hysteresis / MCELSIUS);
 		}
 
 		data->tmu_clear_irqs(data);
@@ -360,21 +349,23 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
 }
 
 static void exynos4210_tmu_set_trip_temp(struct exynos_tmu_data *data,
-					 int trip, u8 temp)
+					 int trip_id, u8 temp)
 {
-	const struct thermal_trip * const trips =
-		of_thermal_get_trip_points(data->tzd);
+	struct thermal_trip trip;
 	u8 ref, th_code;
 
-	ref = trips[0].temperature / MCELSIUS;
+	if (thermal_zone_get_trip(data->tzd, 0, &trip))
+		return;
 
-	if (trip == 0) {
+	ref = trip.temperature / MCELSIUS;
+	
+	if (trip_id == 0) {
 		th_code = temp_to_code(data, ref);
 		writeb(th_code, data->base + EXYNOS4210_TMU_REG_THRESHOLD_TEMP);
 	}
 
 	temp -= ref;
-	writeb(temp, data->base + EXYNOS4210_TMU_REG_TRIG_LEVEL0 + trip * 4);
+	writeb(temp, data->base + EXYNOS4210_TMU_REG_TRIG_LEVEL0 + trip_id * 4);
 }
 
 /* failing thresholds are not supported on Exynos4210 */
-- 
2.34.1

