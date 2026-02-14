Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469330B51D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093214; cv=none; b=Zb65IeWKNkEmN2WctJVliSHF0spwRvaFRlY9S5qbFlxOThq50UEE+BB13L8b7PcGnP9yiFnlTHCgibO7U4QrURA5eVMvMSwIUC9xXpEMF+8b4+Whnis746YOiSk2fF4Mroi+Lb32Rxt1Cw+JAkuBOoimtfrfbso646e5wGizbPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093214; c=relaxed/simple;
	bh=07Gfn4DPjwR/0sRoWt/L0WS45nxocPzX2R/645HpccE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ8wJPob+PB6U7rl8L0xtvZbwcdZyIECy4PX3Nlpoq6gYH58UDxCt0Xy2t5PqiAyK5y/n+yQz1EZNZzH1NKGGW32+v66CfrZ+g0RXlLFjfCq5+nedVVrVp6IrWiHCNj4H7xRxmpW0K75vq0i/Y6Mmo/F10QYHtK0qiVeANNcfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3tSl6uk; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3tSl6uk"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a7bced39cfso22358895ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093213; x=1771698013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D1hHSd7ku04iGe6HhlRrD0l+nMik2FyODF+cOhPL3M=;
        b=H3tSl6ukgqmGNaV5RI/ZhI49TbQ0ElOwh3fvlA39g+fvLohj3bZkoYOyX+H/pBbuhd
         BIt6DoekBADSbIETpTtaZkurXTe97/YuGegTBvPdu6hh5yQYhXn3OjfAGbmrT25u9Gs0
         2awIb4aF15PJVpYSeYsuQltsTbnAssuuF1tt3AasZYRb3+o8ucvsn71T4IVdAAp0H4SH
         PnJWbb2qy+8JES0Fnz9YuzEogjn9T+743qaJICSSIDiBYxCRiAhlS9a0QctfhPJl6HfL
         sMGDOpVBbqyyFXB/sPG6n52tLIOoEuOZfrzK//11Orato+/gvyTNzv5Kwyh2BYZzrCT9
         7uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093213; x=1771698013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1D1hHSd7ku04iGe6HhlRrD0l+nMik2FyODF+cOhPL3M=;
        b=og8bWMHLrKRjbZrhUiDg9T/aiQW4N2SNLjsrPTs6OcqfuL4XBCPNJI4deG+CR7Ziug
         M5XZnocw6/VdBpxE8wUUk7afccKt5HT4HTV1yvI2fUgdygKaS9/Ko65Qp9xcrBO2X//P
         j/mS3jV65a3FttVPt7BOP6G4X/igSGcv6Gj9K1SEELd4w3u2iDuU+LFulyL4LmP5zuIT
         VoxGudSlnkEZx4Qp7ApaB6a19pWIQL+rThmkVSx4vLMCPVEuwtIqZ4J2No8YwpQRBWji
         89rIGSJAAMPT+n31ntpddH8oByflDDKtElIQ+Jhkn1i1gXvdFtbrKgYmbzf3mBz62LqR
         ysGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe2LsCn0ipk3/FdfS8HYT6652uH3qA5yiaIYnuH/Ro+6ykWd8nqTLG1k19p/WIhq8ywbMpk2te/2exFb4w1zqYLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/uVICCIWPintoV1wlsx6f72vJjxIGe3eR6WhQ0voSzsZuBdL
	3U1Ygx2hmWzF+cfBCLKNzOmEUykhBYgEIGYeli2XqWMUgNalxL/MYH5+
X-Gm-Gg: AZuq6aJNeKUY79tiVxIB3CBMPwRZJjN+NLR5WjYPG8VQqY926ZqxzZT8G0Mwp/p7Ad3
	UrPominc9ucf4QMH/u/COhseatXpYxS30wAMYTAVLGx6MRT8S19ctjVgsuLAVYtHvZ016HdFV2j
	Q4dLN9AJqRMLIxwV5J/evcoxsFoPRI+GUEGwwqVtJ6ZG+IE6ctX8Q6DGmPH/1IMSnT0omFjqtkm
	WsGEvalOYZz0g+Z3YWJgGyjwv6NsMXw78bZQ4324grFDiygrpGLq45D/8C42By91w2gaAIOs33v
	9kLlubbUXJVQBe7Qk9iC179MVFVd7Yq242K1aTJ3FY3+Lrb8GNJb0DxjhC/td54NYd69vUS3zF1
	GF55YCaTdT3hZIYK5Ga3qesQbbOOwJZKXSeZ6PL55S39mJ1L66ACF41NSNvD6/4LYM2SdNqZWs4
	hfvZ9WBqWcOt4M7gHRjMw=
X-Received: by 2002:a17:903:1b28:b0:2aa:d39c:d68 with SMTP id d9443c01a7336-2ab50596948mr60204805ad.29.1771093212674;
        Sat, 14 Feb 2026 10:20:12 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:11 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 5/9] thermal/drivers/exynos: Remove unused base_second mapping and references
Date: Sat, 14 Feb 2026 23:49:02 +0530
Message-ID: <20260214181930.238981-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base_second field has been removed from struct exynos_tmu_data
because it was unused. This cleanup also eliminates its mapping in
exynos_map_dt_data() and ensures that TRIMINFO access in
exynos4412_tmu_initialize() consistently uses the base field across
all SoCs. This streamlines the code and optimizes memory usage.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: None
v7: new patch in this series,
   Improve the commit message
   simplify the logic to TRIMINFO for all SoC.
---
 drivers/thermal/samsung/exynos_tmu.c | 30 +++++++---------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3d12e95703bf..146f29fadea9 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing the gpu clk.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -444,24 +442,17 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	unsigned int trim_info, ctrl;
 
-	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS4412 ||
-	    data->soc == SOC_ARCH_EXYNOS5250) {
-		if (data->soc == SOC_ARCH_EXYNOS3250) {
-			ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
-			ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
-			writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-		}
+	if (data->soc == SOC_ARCH_EXYNOS3250) {
+		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
+		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
+		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
+	} else {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
 	}
 
-	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
-		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
 
 	sanitize_temp_error(data, trim_info);
 }
@@ -974,13 +965,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.50.1

