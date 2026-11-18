Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010480;
	b=GW9kfOb8+Gt9kfcwt/kbpm3krOqisWOJB8CWl/ub4eypGzBOoG7FTPey71kivrEt4xi8
	 D4z5Lk6+C5moSPu+BuBkMfRlfTpoPNUiNgJLw/iPStENuKV3UaXSUbSVgI95s7wqQyABY
	 U7/KdqpQ+6BywC5AfHFGZlyJxJ42sA3glDIoJzy4DYpPAI5Jou9wiKWlNSH7b+XgAEGO4
	 IGqXueD5oSgr6WkOO56Loef8BLQZK2gvDBu51ESF3g3xTkW8hX54HrYrw1eTBxboWKy0P
	 Xofhb+CiWHx0P/ca/JImCR2Lit+YfFB+3YIknzsXBXxmj5Rzga/TNp6Kc/e74YA1q0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
	b=AsXx5AW/ZC9J+IrjwQxHlQMWKSqoDqNVggWzW3iPDGQs/dewTlKf94T6HFWmt22hJ/pa
	 D0aJBQ4314o7SLchud1cwx56hWNOXDXqnhYiPU91rOnGg0s36f1v8pmUazNwvl/NnPAjV
	 bRMlB4g7bQjdy8j3R+cVzfDn6ovZD6ZXzTZVvFU0+5ie+rDnkiMO3vr1PKEmmGcYE0OX0
	 YL36oGGPIxCkI61lYNESwqz9now7Cdf7xXTLrZeRBB477kucdsyCjxMEi5URAhN5gBMtP
	 jgAWAS8vscZEUY97mUrFaCECzaoFI/IMjf23F7Aycr83wEtTklOOZpDeiIYQ4VbN6PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jS4aIIkB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD51606A33D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 14:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD51606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jS4aIIkB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12054185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795010478; x=1795615278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
        b=jS4aIIkBn1GkKpz/AmCsxNZ8+ib0VEwLgKDAaLBW+jQXaz+OFbxh0AwL5jZSuzrnQA
         6aYFUIXGUAbzIvTFy75MfykZeitXKFTE7m9ztElrn85/vV1Erx21+RSswv8q5dcXcynp
         rLk+AZ4z9EUjWwtwyRDJNrU/qSpXgWn06BvctbmrolhMMz1SuhSM+C2QJe0cAAzWv4w3
         gZqIa4dE2FfkcDAORc/hsit1wKMxpTzz+8OEA8oNNJr7dQwdP3PtyDmOtw1mIOshHSy6
         D5scBVdjX7uXxl1+DRW8CkNvToZ4NnaVwTCKUMJE/r/vVpwIAfnK5c6SUj3/aYPdy7BR
         1WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010478; x=1795615278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
        b=X85DVoLv+b5cv0/o4jj59vjtfWu21h1E0ERi/O+Qt6dEEbx6OCB1jaYQwH7M4CHvt4
         wvVGXdnScCjWanwKSeQrkV5MkeaYHW6CZzwkGHFdCvSvy4VYWVvQC7Xh+Vhorploy+q9
         LSotb68tJxcNYCvjbLFREY+ULfUL/LJMbzs89Zg+VzZVdA4q1uch11oEKls5PAM9tO+j
         o439cuceXDhQqC1etFlQn58wRHOx7vQQlDBLQgmtaQPk9iWbUJv9Y2ySUkUbOVuv8wet
         SOmWMPGnzDmaWrTc84Bs+Gaer1I5lXKoIngEFM+zW9BRcgzodi4nii3RJQtQDbmOvPCJ
         lXbw==
X-Forwarded-Encrypted: i=1; AL+hErHx1dox5Ndj4imh8QN4zz3SVdoWpP/GuqJHo4mfMsU2hIlXsF2sGK3r8UGj/aKFsWSueexzFNanoNrvP4CsqfKu+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zdFnrd/344Zs21o1QaIW1F83RwHfQjYnSK8h0QqCVXIVjWJee
	8wapFno29OapLIkUOrUcgSf3rCs6Ka24tV1p+PIddfFd63WcNi4Ip8u6w1kfMqhVAj8=
X-Gm-Gg: AYBFou2TqjUNmmyakfMvY1wDxQHQlGt1RlE1DinVt1eFqxXsUUeVgMuKhvUULnXXZHY
	tTvMLCg406oZgNjSKgQBo3NjyzuobIHfyOGiiec8IUPJXsEip6NKCzPj7lTiyBFqegncgmHc4lr
	cte2BzR0Uqt45If+oflo4vuR/Zgjxoere4z0ZcsfwNLMF4i/NvO3QvEUy7uzpvjUHaMc/KWvtco
	S95ysQAaVlLedVVC+xOEppF/ho8oIWXjIoaDbTGkpn4iueKBPJ2AcVxb3A1fw+YfBY9LA8beGDP
	K6LHuALN1iwkkOa8PKlawrtbcK6ItxYTjG/dHWw7xInreo5pFMZ94U74xPWoMANxas/1OX4rbnD
	8CJWDvzTm+V6J9HDbKJqXfaEcjZA4i784S/dNQxT3f8CqxU0veJBRAe4/DKFSKFj0nMaaYGyRHe
	9cS6Dg1ibWk7UG9Q12i3nzW3dNo/UrmOaTtxKDT8kdIxXcE1ZveiAQQZCzxNU33vgOUr1/zLbrq
	UN/HjAX9fQvPcm/7vJRTU20yd9g71ChPmraaLuTxAvFl3HIJqsbRtHKLobtCKdeZ4suSt0JFSJp
	7qEAWbolxBA8WKVpc6NB4kfGNhSfNpiWAmj5XUw=
X-Received: by 2002:a05:600c:6746:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb7da19d44mr49686225e9.13.1795010477916;
        Wed, 18 Nov 2026 06:01:17 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm4649341f8f.38.2026.11.18.06.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:01:17 -0800 (PST)
Message-ID: <2cc6efc8-db35-4b40-ab71-815f08ed9dc9@linaro.org>
Date: Wed, 18 Nov 2026 16:01:16 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: krzk@kernel.org, rafael@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
 <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
 <56a7a762-7667-4186-973c-ca0fcb399ecc@arm.com>
 <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
 <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
Content-Language: en-US
In-Reply-To: <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:28 PM, Tudor Ambarus wrote:
> Would something along the lines work?

Thinking more about it, caching the window instead of the raw
thresholds is simpler and closer to your v1, as inten derives from
low/high anyway. Maybe this:

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 7c30401f8fc7..8422a7c970e7 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -39,6 +39,10 @@
 
 #define GS101_REG_INTPEND(i)		((i) * 0x50 + 0xf8)
 
+#define ACPM_TMU_NUM_THRESHOLDS		8
+/* Threshold 7 throttles the CPUs in hardware, regardless of the INTEN mask. */
+#define ACPM_TMU_HW_TRIP_THRESHOLD	7
+
 enum {
 	P0_INTPEND,
 	P1_INTPEND,
@@ -70,6 +74,9 @@ struct acpm_tmu_sensor {
 	struct acpm_tmu_priv *priv;
 	struct mutex lock; /* protects sensor state */
 	enum thermal_device_mode mode;
+	/* Last programmed window, protected by the thermal zone lock */
+	int low;
+	int high;
 	bool enabled;
 };
 
@@ -228,7 +235,8 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 }
 
 static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
-				      u8 thresholds[2], u8 inten)
+				      u8 thresholds[ACPM_TMU_NUM_THRESHOLDS],
+				      u8 inten)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
 	struct acpm_handle *handle = priv->handle;
@@ -249,7 +257,7 @@ static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
 	}
 
 	ret = ops->set_threshold(handle, mbox_chan_id, acpm_sensor_id,
-				 thresholds, 2);
+				 thresholds, ACPM_TMU_NUM_THRESHOLDS);
 	if (!ret) {
 		ret = ops->set_interrupt_enable(handle, mbox_chan_id,
 						acpm_sensor_id, inten);
@@ -267,12 +275,22 @@ static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
 	return ret;
 }
 
-static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
+static int acpm_tmu_get_crit_temp(struct thermal_trip *trip, void *arg)
 {
-	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
-	struct acpm_tmu_priv *priv = sensor->priv;
-	struct device *dev = priv->dev;
-	u8 thresholds[2] = {};
+	int *temp = arg;
+
+	if (trip->type == THERMAL_TRIP_CRITICAL &&
+	    trip->temperature != THERMAL_TEMP_INVALID)
+		*temp = min(*temp, trip->temperature);
+
+	return 0;
+}
+
+static int acpm_tmu_program_thresholds(struct acpm_tmu_sensor *sensor,
+				       int low, int high, int crit)
+{
+	struct device *dev = sensor->priv->dev;
+	u8 thresholds[ACPM_TMU_NUM_THRESHOLDS] = {};
 	u8 inten = 0;
 	int ret;
 
@@ -288,17 +306,61 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 		inten |= BIT(1);
 	}
 
+	/*
+	 * The firmware programs all thresholds at once. Set the hardware trip
+	 * to the critical trip temperature, so that it never fires below the
+	 * point where the thermal core shuts the system down.
+	 */
+	thresholds[ACPM_TMU_HW_TRIP_THRESHOLD] =
+		clamp_val(crit / MILLIDEGREE_PER_DEGREE, 0, 255);
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
 	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+	if (!ret) {
+		sensor->low = low;
+		sensor->high = high;
+	}
 
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
 
+static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	int crit = INT_MAX;
+
+	/*
+	 * Use the lowest critical trip temperature. If the zone has no
+	 * critical trip, crit stays INT_MAX and is clamped to the highest
+	 * threshold value.
+	 */
+	for_each_thermal_trip(tz, acpm_tmu_get_crit_temp, &crit);
+
+	return acpm_tmu_program_thresholds(sensor, low, high, crit);
+}
+
+static int acpm_tmu_set_trip_temp(struct thermal_zone_device *tz,
+				  const struct thermal_trip *trip, int temp)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+
+	if (trip->type != THERMAL_TRIP_CRITICAL)
+		return 0;
+
+	/*
+	 * The thermal core skips .set_trips() when the low/high window does
+	 * not change, so update the hardware trip threshold here, keeping the
+	 * last programmed window.
+	 */
+	return acpm_tmu_program_thresholds(sensor, sensor->low, sensor->high,
+					   temp);
+}
+
 static int acpm_tmu_change_mode(struct thermal_zone_device *tz,
 				enum thermal_device_mode mode)
 {
@@ -329,6 +391,7 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.change_mode = acpm_tmu_change_mode,
 	.get_temp = acpm_tmu_get_temp,
 	.set_trips = acpm_tmu_set_trips,
+	.set_trip_temp = acpm_tmu_set_trip_temp,
 };
 
 static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
@@ -479,6 +542,8 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		mutex_init(&sensor->lock);
 		sensor->group = &data->sensor_groups[i];
 		sensor->priv = priv;
+		sensor->low = -INT_MAX;
+		sensor->high = INT_MAX;
 
 		tzd = devm_thermal_of_zone_register(dev, i, sensor,
 						    &acpm_tmu_sensor_ops);

