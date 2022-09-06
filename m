Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834CEC6FA86
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Sep 2022 17:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiIFRB0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Sep 2022 13:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238363AbiIFRAT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 13:00:19 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2431827DC9
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Sep 2022 09:47:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso7829377wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2022 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oNc/Egu7W9i4cqdcSij4tEhGV2B445vyRVmU8PhGBRc=;
        b=mKCr01jcJ8zdQI4yFI/IbCAx737nabTno52UgseGmdhxzYjTcDFBfiyx5PNkkSjWBB
         ApkahD/RS0tr7hB4ZgVQirgM10JE9BI49sOocLUdlev6zLNIijtiIiRE8lRphhrD4ip8
         hLTwjfEWzZiO8IU/UMuobm/CsoVnmxL/v3wOadMdFFTvW2ejQpkeQDoCTbsdgckD0BCK
         FqMp0oYyO39cIlOwmEjQrdjZ88fXNV93a7J6Gzomu/ibhG8a4BBKTXMIjXl+ePqwueUW
         WLbTf7iGBvWm/17cIS58fauG7bNUqJ3iFPjqKwF+DkEmXWimq6U7ROaTdY9OcySr8Bws
         ru/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oNc/Egu7W9i4cqdcSij4tEhGV2B445vyRVmU8PhGBRc=;
        b=CDWTLbFyzawixF4ePUs25/C8xvUygoH6l2Beiq22/jPdu64m/Z8dymBibtK6b/8Frp
         bBCN8uCfPLqxK9b+pu960nFDqJYqsr9V6k87bvjh2YdyYhKcxQO/JD94pjUOrN686vty
         EJdBQGHnIgSgWow/3swnTrkN+2S6rurd14CO9x7MJO1rdwo2kY1R/gCfmLAna6lsZr4Z
         BaFalp/zfAdTslohrowr8fb0oQq+yQLClwK3Ocdj2gARCv179vCIV+rlYXZdDz2xud5W
         XLXwW4geE2Zbid8m3P+0gDrXfdNLujFzbF33VkNPGb7+OP07NUchURYsjBz4g8oFniCm
         tfpg==
X-Gm-Message-State: ACgBeo3ZUr0LRSw3j3o+Ut27euGKyVcxCYqh73gU1n8kDReywYh1vTkN
        iEEAamV3Bu9ow08NKQ4OE6hHyd7zSSB20w==
X-Google-Smtp-Source: AA6agR4fPXKttV0xYCvVJFloujzY4AEz8TfxiziTaDMpSDgkWyATYs3LmG0aMLlEeoACyArMRFeQWw==
X-Received: by 2002:a1c:4c0d:0:b0:3a5:98fa:3a4a with SMTP id z13-20020a1c4c0d000000b003a598fa3a4amr14646316wmf.92.1662482869546;
        Tue, 06 Sep 2022 09:47:49 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b0021f0ff1bc6csm7426600wrc.41.2022.09.06.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:47:49 -0700 (PDT)
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
Subject: [PATCH v3 10/30] thermal/drivers/exynos: Replace of_thermal_is_trip_valid() by thermal_zone_get_trip()
Date:   Tue,  6 Sep 2022 18:47:00 +0200
Message-Id: <20220906164720.330701-11-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906164720.330701-1-daniel.lezcano@linaro.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal_zone_get_trip() does the same check as
of_thermal_is_trip_valid(). Replace the call to
of_thermal_is_trip_valid() by thermal_zone_get_trip().

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 91e6860b5ec4..5e6bb74c67f0 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -554,13 +554,15 @@ static void exynos4210_tmu_control(struct platform_device *pdev, bool on)
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
@@ -584,13 +586,15 @@ static void exynos5433_tmu_control(struct platform_device *pdev, bool on)
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
@@ -615,13 +619,15 @@ static void exynos7_tmu_control(struct platform_device *pdev, bool on)
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

