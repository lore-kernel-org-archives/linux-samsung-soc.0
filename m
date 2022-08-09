Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7066BC25B0D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 22:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiHIWFq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 18:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiHIWFX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 18:05:23 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A2C1117A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 15:05:21 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q30so15718886wra.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sBYa4Rhtbyvq+yIdiazGYXFIbq9Mwdu4iyysvjHUIN4=;
        b=mEX3xTvfFlN0NV1z/xNRux4lUTX5w7XjFn0/jm7NWAOE6isEbikoTlNpysc7AdceU8
         EcGs71KybDrzC7iHrsMpao2m8tNXmSE2GivlJJ3jAmblj9CpFyB26pkbdu6O3nG1qAV/
         YhlUlsG2MgRgHACjx3ZySwVBY2d4Kwky1mpbfU5l/86F0X/a+/uEMPg+GXL4Tcavyavn
         fZElqmE8FCRhbNrZap5z7e//BH0fj3kzuQ7ymUvK1DrwLV7CGaEogg1X7TwT0F3l3BrI
         UZQl1xVISD+dmfEnIdw9lajBsCvfKALErTBjvNzXHUW2I7HGRqS/012czxq/BHP/95Wy
         L0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sBYa4Rhtbyvq+yIdiazGYXFIbq9Mwdu4iyysvjHUIN4=;
        b=jOIkZxSomcmWpfvPtJo2KKsDtQY5RJ++jx3T71nmYxHGDwpMw9Ig6BcnycBmoSk+a6
         KT/w/apzfSobSBhXRfVO1jC3kqrrplw6OEhkY3XcID4vIynNzxgFf9cMJfBMWB85OYzb
         b/VgdqZdxTCgE/K3KXuzfSMH7I8iTnYbW5m+e7V1jb5I+RvBEpdQL5ZFL5Iy7WYL3N4S
         yLorYhPy5LNKY86WyaIbExexyGkwsdFNK4EYLvMuPZAt6UzfU9qcrOUeu2fjeZTC4z0S
         vFXX8NfU5pY/3xRC9xt79zY1kX1GMjTECz9K/qdWOOZmDtmkaiDDGAck2j62/GOZWtwg
         kSJA==
X-Gm-Message-State: ACgBeo1aO0OD4/4OiGZK2r+ejsHwrWYhPyCoelkmpiy2kFQF0bTNmdQo
        BpzaZUr70lr9ajXUILtT8YZ1wQ==
X-Google-Smtp-Source: AA6agR7xH6WppoqE1kaWBqcxMOWRBv4HmMyJqcF+ejWZ5KwQd7WWsQhSatAYRK+3Q08IiH3qghHtSg==
X-Received: by 2002:a05:6000:188a:b0:21f:c4c:8368 with SMTP id a10-20020a056000188a00b0021f0c4c8368mr15842851wri.299.1660082720826;
        Tue, 09 Aug 2022 15:05:20 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003a317ee3036sm293583wms.2.2022.08.09.15.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:05:20 -0700 (PDT)
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
Subject: [PATCH v2 18/26] thermal/drivers/exynos: Replace of_thermal_is_trip_valid() by thermal_zone_get_trip()
Date:   Wed, 10 Aug 2022 00:04:28 +0200
Message-Id: <20220809220436.711020-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809220436.711020-1-daniel.lezcano@linaro.org>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index ac47c716c1f0..9def8c76ef9a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -552,13 +552,15 @@ static void exynos4210_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
@@ -582,13 +584,15 @@ static void exynos5433_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, pd_det_en, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
@@ -613,13 +617,15 @@ static void exynos7_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
-- 
2.34.1

