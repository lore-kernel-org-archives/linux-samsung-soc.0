Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD32C25B0E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 22:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiHIWFs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 18:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiHIWFI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 18:05:08 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645A8AE79
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 15:05:07 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a11so6920344wmq.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TF9d/nemwW4seLDRwY31H3s8bycRRHtQhzma4c2u+BA=;
        b=nPiHnTftf153bX1UvWEkGGxy9RtvfKmFaMLbSUzn4T7fFJy76RV3cljGGmzSgVsFqm
         se5DM7yAGmR9aNVYxSiK/I1Dk8nIPd8eQqjXtA28Mx5DyNhiELphXepURBCY/LNjNWBK
         IXwTvq8RcK2N14Bi7FE6O/GY02EyzTF1Jum/4rSCujvm/f89gv094iiGPH0FAlWnF7Lm
         QsmMBlo79OKm0Pgm7LzyEsJwUTRSZd7Ewre4f0uv1bMAgh73jAs01J0/nDn6SuV2xSEB
         nsVDkadIuPAgioGqvvIylz/CnVJA0g3PRFDq1A5En8DSnUtFHzGxj3VMVA5f4aQ22OD2
         zCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TF9d/nemwW4seLDRwY31H3s8bycRRHtQhzma4c2u+BA=;
        b=5bmBdxKNczTvh6naGDMCP66Gd9jCp4UbhUeK0SArSX2xISYyQ8hI5/B+3J70WNfhoS
         sVDuPkhTReiSdbe1qnUGkFsciopNCmSO8V9VZRloTnHLyQ6kkSS3uin2HZejyxMoiACb
         ld4qiFgYwMQYt+jY7RROmABpV/0Hw0Is/dnGkRptyxvQ2OHUI2/OCm759ovxt86vT08C
         zK3dMnVuIdS6O7pgMkca7WHWC8Uk5s0D+6ZoTk923ybXZGJjTqZkZxcC7VgnYcbAcsTW
         D68RF+EtqIRwVR2FxXdZLYSHCWdwpJnkENvBQtXigr5fQs9TRXz/3jrzJx+lwHf7gLVa
         WSag==
X-Gm-Message-State: ACgBeo3rSrZqxXsLKtzCKaLRNqH7DJR30yVHaqnXfkbabWbBp1uyyIfs
        Yyq7UA8V7Jjb66S9AHVY9so4Aw==
X-Google-Smtp-Source: AA6agR43neCLErly3cXAS2Q2X8N3HubTvn6N39SDVqept2mG8mtwXhWf8Y0r6hqglUkWUW0ehF1f3A==
X-Received: by 2002:a05:600c:4e52:b0:3a3:33b1:7b63 with SMTP id e18-20020a05600c4e5200b003a333b17b63mr277467wmq.51.1660082705795;
        Tue, 09 Aug 2022 15:05:05 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003a317ee3036sm293583wms.2.2022.08.09.15.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:05:05 -0700 (PDT)
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
Subject: [PATCH v2 07/26] thermal/drivers/exynos: Use generic thermal_zone_get_trip() function
Date:   Wed, 10 Aug 2022 00:04:17 +0200
Message-Id: <20220809220436.711020-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809220436.711020-1-daniel.lezcano@linaro.org>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
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
 drivers/thermal/samsung/exynos_tmu.c | 41 ++++++++++------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 51874d0a284c..5204e343d5b0 100644
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
@@ -360,21 +349,21 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
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
-
-	if (trip == 0) {
+	thermal_zone_get_trip(data->tzd, 0, &trip);
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

