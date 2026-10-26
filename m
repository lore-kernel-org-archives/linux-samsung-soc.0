Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=OA4EVcVd+cSKjRgF8yXNo3WxeeYKNKB0nhvTiRPAXY56r7hd+fYKP41ocBHm9aTXjwk8
	 S6zgFKiZJDpJc6iVVHK2AQzSIvFeqA0e35vUa00T9jB4lYpp2PAIWJSaH0iLWOGwV/Mnz
	 xRGZaRZWOZv/3jGBSAhv+S2rmboPUrrGU7bUIRbjHxl9CBHydqt346vr4pwvA5UdmoQDw
	 a5K9DGXAHdSZOZBXh9WPcSPOkvwXrjRbwVjY65KYok84GyioQPuhDjVaJeiFjyGeNg3/A
	 L95vRHsf1rmFP0iEMKsfNaCJzKAwfldK7E+8qqRJi7kqVGY1GGtsl+XXI2+kF+e/K0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
	b=Fg8X1ePMoyZqn2NFEEgqwtb4EQILRE135Y0uI//R4Sr+/xa9bq35l1TrsT6krRTqR1O7
	 S9u5IS/LL9tPIEWv1Nqy94QziJB0ct68XsQzB8lSZzVfFmjaKSWpx3U0hp5FMCoR8npY4
	 m1sA98nBFvxhLrxIeVa0WnfbIwCITN/KgoeW+FLhFL4ELjqj2k0HX78LNia9Ks0p1tD84
	 QrkYhjkl92UtZpBbCF3L2WwG23yoIFuxQvICXNTKc4ofyFwbY3sFXv3V7TDK3SS6lexj1
	 2Gdl08Q1a/ti6ugHvEVBbY44LXdJ/py8DryErYZMxszmiYWksa/9HH7uWgCDOiQxcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDpLUcaz;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229860A2608
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1229860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDpLUcaz
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso487758766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030489; x=1793635289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=eDpLUcazRiDZjBah+BQ+235CtKqivKy8dizImoSIltUcxBLs9P8eFG6BcUeCLcoEp2
         zHHosODwLt+i8Opy8qQpkEOIeI5lmN5CwO2SzdIszSeyUlPLkm/h3AzYL0dTaEkqSz/i
         I1ECbT4WkAbvaP5QHxK7gw9MiFoNfCdslNnlz8uGBRErtMCuqKXL9R2nqoPDWUXR2WsJ
         ScqpjU3oGwDKvWyu/KXBLqWS1KlnkPSDQeiHuxs6Eaa/56c3ZNDBboaumElUAZ8hQTma
         6EU6bJp4MMwS0p5dxPfcYA/zaLjJ+NK5n2Qk2VjRCYJfcVxP3mobukyeWZQZNV1XQRT8
         EVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030489; x=1793635289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=WUaAUM+MU4vvKXxrkIbnyGg3MCBDBkpfV9+jyTfRnqbtXblSjZyUFns+vrv7+xmV09
         96AiVvaZktwGTevJYudvTRhW2Q4a7dzvjFWJBVDoJsj7VikZ5lXVVx4KLWWFH+XhYzdj
         pl+oqGNVsyVX5OSiCXtXrPgXswu5pIMXH7OWxBSh0zaisS/JqjHjeb1K735lqqmBH4FL
         1MdAnGKCJillAhXLXhyPvDAWmNlL2KW3cf9wF/0x0q0wj0u7YTtkfVNTBJboba2s7hyP
         0qgDjRzdopEFtgR8oHxXSUGsPwWJHO9cZuI1I1E2MdL5GcOF2UOnlnytpE/ilwdqcCec
         c/tg==
X-Forwarded-Encrypted: i=1; AKwUvBxEUDOg7w/I/WiWoPyP0N0uHod1wlqDkQHy1Bj9L/PBLIZMoD5MqCbntbMtsN1WXrwTUimWEp10SS6CT7WIBeTIfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoylOyH2RiJMhVgmng5XZs690iz7j3SH5sLOzivWPF03nnf5T0
	a6xGDaIFldqZazUTEkfxz1Du3c3LUqSPUWlVJCaey8cWOM7/F+6J3C4SHa0ouiHo1Gw=
X-Gm-Gg: AYBFou2sgD9KaNV1AD7Iy4BBDvcIG/OwscKYXgK9vcLUBAzCkv9WreQBbeKM8X1xI5E
	uwtQhDHoTT+El1WaeiLGJDF16MQQaP3ersF7UZhrg2GsD0RdMdEF/EH4fNR6uK2Y5r4XKCoGHSC
	UZvFRSAZKIPmNDjO51aTguLDRBYTbyI39vEKYEot2T3Em/2oSLjRyJsKS+85xTkx9S4x4+pvc4l
	/HAKdDGhggSnRp15laLP6HLX0AoH3RNNmY2uO89kTqsv/2o8kxPm643DZmBgyVtDmxt1WiF6HSZ
	kSPWjfVSiLjdwLgC8gk7DQ0oKAqeR6rbmqd2KFJF+CNocB/+lR0EvZ5HahDD4a3Dha+DUVJFVpa
	kMKhRdwOlvoi6uHfb1XilechxT+fo0TF17pZETZSaoyPxm9RhNbcdxs+8VhYIOml6U+wWB8axhT
	hvryO52jDlNYAT0D7CMneNnQac9k+0M9O4dmeNLIoK3G24RbBsQzSAEta9WmDnxnR4nAajT6xVj
	9lVdKrQzOKzlTf4o80dZdgnBLTJwTziB/hFqv36ZBusFFggQV+fvIwiEZ2/KEUKOArsnJx5BvQO
	xi01NjpA6n+RKqJ+wiMZcxgA8kn/RQca0Hfyod+ZDIpB7u49y/3XSBAxlBQay/w9B5YhSMANsKI
	O8Z2yHrQhTg==
X-Received: by 2002:a17:907:724f:b0:c3f:cf2a:76a8 with SMTP id a640c23a62f3a-c46bde8b95fmr863838566b.28.1793030489246;
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:24 +0000
Subject: [PATCH 07/15] thermal/drivers/samsung: acpm-tmu: Return -ENODATA
 when sensor is disabled
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-7-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1760;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7lM3qIErXOkLrWCUvTMJgQuGSIk/cFpH48BW97n5ryc=;
 b=GQSw8sx0872mm/sZpXZuyYhnHTCUuT+ksnT5U3IgLXaQ+PhbVK6oVjYCsZsjB6Z5+rZvYxMqS
 7YQOm8auVUsDmEyQYgUOUVjIg/WNDpL9zUhK4lgRBg+nrXwLcA1OoQY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

In the thermal core, returning -EAGAIN from .get_temp() instructs
__thermal_zone_device_update() -> thermal_zone_recheck() to schedule a
250 ms (4 Hz) retry loop with no backoff. If re-enabling a sensor fails
(for example on resume, or after an acpm_tmu_update_thresholds() failure
when polling is active), sensor->enabled remains false while tz->mode is
still THERMAL_DEVICE_ENABLED, causing an infinite 4 Hz retry loop
instead of backing off and disabling the broken zone via
thermal_zone_broken_disable(). In addition, hwmon's temp_input_show()
forwards -EAGAIN directly to userspace rather than -ENODATA.

Return -ENODATA instead of -EAGAIN when !sensor->enabled in
acpm_tmu_get_temp().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 4257bec802c1..1f56c69af76f 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -200,7 +200,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * after PM resume.
 	 */
 	if (!sensor->enabled)
-		return -EAGAIN;
+		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
@@ -208,7 +208,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	scoped_guard(mutex, &sensor->lock) {
 		if (!sensor->enabled) {
-			ret = -EAGAIN;
+			ret = -ENODATA;
 		} else {
 			ret = ops->read_temp(handle, priv->mbox_chan_id,
 					     sensor->group->id, &acpm_temp);

-- 
2.56.0.257.gf7497c7d27-goog

