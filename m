Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECFCC00140
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Aug 2022 14:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241087AbiHEO7O (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Aug 2022 10:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241083AbiHEO6W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Aug 2022 10:58:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A89967CAA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Aug 2022 07:58:10 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l22so3540338wrz.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Aug 2022 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pufgKF3VxRi8wygChmKG06xXNb5GKVSbBUzBy2xU3rk=;
        b=rk4/mZt6JIIWJJRoHWgLE+9YmpqkQCr3//i4YTPgi7CTv2ZgDWBl1Ab55ad1K9Nfkh
         RYB28HPaa5AJ/YK7ZnANZmDdbobBtjpLXKzRNk0ZMokTboOJ0AlMJ8C86ccUOyuS7d2n
         AWYCCpNuYhrGsdjgZlDXJuNlfniApswMo7/XDNL7Lmu1k17iIIR1J+P2FfVsAUgfknyb
         8BOLNgQ7A5Dng4CzwnovR2f8uuJLublHMkVcL+K7sSZUTXo7+p0I7B7QOowIqYvI6QnA
         ZvzPgxLg/OhQkvdCu+t2HIMXkZF9xlLalftcqqUqzvFisas3t2G1ef1EwxpmNBrUhNoK
         SAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pufgKF3VxRi8wygChmKG06xXNb5GKVSbBUzBy2xU3rk=;
        b=u7/MSnnKydybVyk81nkqhEA0K6PCWnDI173he4h2gxNl/o2ZSLsJyfbaZvyXpobUSd
         uzisxPxNP8XVKxlJxqNEm21R03G+ZG1xzL8lylhyGusjNSQle8/RenSFNgw+SCFbRJqZ
         G4uxNC3IPokvPNgRTkZG3h6xeE5tLspfNlBSiOC4DTiVaNGcg9G60eIoLpwv2MMJAsWx
         tZWlno3X+NdFE0w37Nix4siPeNCOc4ycFQQ8QrxB2p3LCCHzrBq5bUQGD2vofbf9Ir0F
         TPK3Pw5zp+HSDjj+lpfmPRT5Spd7KXi6rtK8uHE4ddv/l+iOGYy+VOHiSJruW1mHz/1y
         yCpw==
X-Gm-Message-State: ACgBeo0Og0AZWWo5Hx90qgmBZxvbHWe89V55HMWGR0TEUVFHS0ufOrX2
        1mBwsB/K7WAabkU5sttwWLjgqg==
X-Google-Smtp-Source: AA6agR5MNl3NOE3s0YlBPls/rjs3dizeJCLaAt9k4OVi2vQc/5lbF93PxwLWMqiY5girE3GjkwHnVg==
X-Received: by 2002:a5d:6609:0:b0:21f:ff6:9090 with SMTP id n9-20020a5d6609000000b0021f0ff69090mr4877151wru.30.1659711489440;
        Fri, 05 Aug 2022 07:58:09 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:aef0:8606:da6b:79ef])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b0022159d92004sm3102448wrh.82.2022.08.05.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:58:08 -0700 (PDT)
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
Subject: [PATCH v1 18/26] thermal/drivers/exynos: Replace of_thermal_is_trip_valid() by thermal_zone_get_trip()
Date:   Fri,  5 Aug 2022 16:57:21 +0200
Message-Id: <20220805145729.2491611-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
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
2.25.1

