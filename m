Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC430E0D4
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093228; cv=none; b=Qz/44ZelJ2aBh2od1JZ3DXgh4cnaxDR71Wdkrx964aBxPW9tL1Z0zfWduJCFzzan1IxIqUYB7EatVNcSBQm1dpkzMnMfrRV1NGCGqRFqlASFUdBUSUyPd/trTdy041erKAM8/s1azsg7CSUeuxVsEsiDuYv7gXXmzPAWwWjF0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093228; c=relaxed/simple;
	bh=puR2ZAnhbJTFdaZPK2ZgfUswLeVKzkccy/lRwFKnxWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzlV1uRb/MjiGzSaDJMBN/0reUkfNxfjaf8IV+3xE2A0EVBNObaRatCTH4t3EIXsakyjSGgOf2GnQq3O14GM7pNVAGW70iNaz/4dF07pLtVw7TlM2SUiucvopzqJO/Si02YUXzhB9/nFTAqASMtwej1Qi40HcdU6r6SDt2OW8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AybXx2PI; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AybXx2PI"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c6e2a8db928so786363a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093226; x=1771698026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y1oNWapjfNVh50FsYoZ5SBQ/1IdNgNulUCh0e82XQ4=;
        b=AybXx2PImA03AEMXdTGn4TxSUEVf+ke2PeStwGeDRdPjdUT5FpxiUGVKr+XjTGQrDb
         KMI2xGHi0e5q2BGULKlffkJLAu7QNuyV5FFDW+dwxyYF/nIqWv8FMXhlZV2d8Q16JPxM
         3avsiwT8UHO9FHKqiLNMtPMnF+WsGFMBjItFQWpDwxKdV+9yY7q9CwleWbiDvFoQIoYP
         Uz7KiiI/z5eGftpqrzVLTKWO+kg6QmGv62/wR+vwOag/e3FBaaBcsWdxhkaEqWWm+3YN
         O0RziVcMc2LKUd8WIQCcqFqJkrdo9PGdMew2TNHcXfKnHBEQSbXobELfnYwcOiUq62xk
         5Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093226; x=1771698026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Y1oNWapjfNVh50FsYoZ5SBQ/1IdNgNulUCh0e82XQ4=;
        b=AvbubDsmvce9yeQnKXbmWmkPzJVnBbRBAT8ET/c8UnwQzi5rybgM/P3EcxJMlpYC4v
         ybUdhYMEM77QyfLz/UAf9lz/4RhDNz4ObDHJwGCH7smpCkD+vvOh9R2t1l90HNZYWFeL
         9sddda6MlMi1AmeDqP7Nyw5HC6XOguRSww9aGbhpwOVuS8qC1xdFmiiBsZ5upZiG4xLA
         KBaT9wa1aw+8pASKyNmSIcQFSqVAYEHx7d6F6YbbsV/kditHZKoBegV8GDndzuSWBYnI
         ygU4bQAv906hx5VtZ2Snt++42F0IjjGJJ3eIWq/TRL/eAjjpRDFec/WDcNOYTJVy8bk3
         t1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUC3A1Kas+LwUtLk1UDWRTmRsd1SqvHy0mVUDRsuWtBbcuatMd+qhuk+9hsJALWhjrrCnbhwU1SwXNl2fQ5hciUFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywdSuh3PM1BPO1O5JbrVsBJo9HWqg+RdBjjQ42aoqTcT76J/7r
	KIOeTbLIiNKReytTJUHOncCKKbASzg2tbuMR3sEwRf0/GzyhbjKzx2pvx4BUGmcA
X-Gm-Gg: AZuq6aIA9jdDzXDBFbmn4s8ehEf2LE6m+n0UhPepWo+d0DjZT9WF/vl5El54FI7xQP8
	hkbvgGAzgklfOFYJB9R1PjxGVXKSWl6xUvY5H2SxEKrqb0BPtdcSnZLfit6azE1C7TvSGu3Cf8L
	ilpaWEwNVKxq6onKs4jNEKtc3vlWBMXz6dRWL62QeEo2MxySPPRrKEaX+MOw33inJaNKxLFzb48
	u+WTHFdf1oBCb0nex+pFDXyf6DOLK8soa75aUHA0So4O0QrpfdDpYb+ttdhUKa+aeEDAq0pVNOF
	/ub/hxBkOGWb5aNZ6BP11IcEGJlN2jmUmGZ1dYc5kY+kGvts+AwKNeUCmMaY8zFmydgvvkqXHCM
	JSlq+P+qjOCjmc2vbMKaB69O35J6XJtz7SAg9MCcmc2RuHzck0UFvd860YVZDLze0ZzsmB91nKO
	oGDVdkZvejPKesoK4l4aA=
X-Received: by 2002:a17:903:1107:b0:2aa:e0c4:c076 with SMTP id d9443c01a7336-2ad17596f38mr36024625ad.54.1771093226306;
        Sat, 14 Feb 2026 10:20:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:25 -0800 (PST)
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
Subject: [PATCH v8 7/9] thermal/drivers/exynos: Relocate exynos_sensor_ops for forward declatition
Date: Sat, 14 Feb 2026 23:49:04 +0530
Message-ID: <20260214181930.238981-8-linux.amoon@gmail.com>
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

Relocate exynos_set_trips() and exynos_sensor_ops to a different
position in the file to resolve forward declaration dependencies
for register to pointer to thermal_zone_device structure.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: new patch.
---
 drivers/thermal/samsung/exynos_tmu.c | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index f77abdcdc62b..1d657802a310 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -808,6 +808,34 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
+
+	mutex_lock(&data->lock);
+	clk_enable(data->clk);
+
+	if (low > INT_MIN)
+		data->soc_config->tmu_set_low_temp(data, low / MCELSIUS);
+	else
+		data->soc_config->tmu_disable_low(data);
+	if (high < INT_MAX)
+		data->soc_config->tmu_set_high_temp(data, high / MCELSIUS);
+	else
+		data->soc_config->tmu_disable_high(data);
+
+	clk_disable(data->clk);
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops exynos_sensor_ops = {
+	.get_temp = exynos_get_temp,
+	.set_emul_temp = exynos_tmu_set_emulation,
+	.set_trips = exynos_set_trips,
+};
+
 static const struct exynos_tmu_soc_config exynos3250_data = {
 	.soc = SOC_ARCH_EXYNOS3250,
 	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
@@ -1008,34 +1036,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	return 0;
 }
 
-static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
-{
-	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
-
-	mutex_lock(&data->lock);
-	clk_enable(data->clk);
-
-	if (low > INT_MIN)
-		data->soc_config->tmu_set_low_temp(data, low / MCELSIUS);
-	else
-		data->soc_config->tmu_disable_low(data);
-	if (high < INT_MAX)
-		data->soc_config->tmu_set_high_temp(data, high / MCELSIUS);
-	else
-		data->soc_config->tmu_disable_high(data);
-
-	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
-
-	return 0;
-}
-
-static const struct thermal_zone_device_ops exynos_sensor_ops = {
-	.get_temp = exynos_get_temp,
-	.set_emul_temp = exynos_tmu_set_emulation,
-	.set_trips = exynos_set_trips,
-};
-
 static int exynos_tmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.50.1

