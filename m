Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C51D89F2;
	Mon,  7 Oct 2024 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312617; cv=none; b=pwwCNFfo6gsKIVSVO2itbBkMVzxbJQsbOTrTkC0vreFYazs7QdJNCcS4eysEqBCb2rorUQByWzKJFFBbJQYYRQhfWUTuFPGdl37wn7/GjXuQA76GoQgR5uj9SifvyNhESlt8NegFg3mnFw6VV4aqFD6B+wZiLufuS6p1aLFTO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312617; c=relaxed/simple;
	bh=+y5dIaEAV6sUyjaV2E2BF1doVtTB4Tk8i4VgnMDtrGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDRxwFesX3sr7L0bsbTCbVxrkyckNM/1xbiC9XeeyYiQhLS6LxzNUiYCfoWOTPEjfXEGukiIxpqQET2RbdUXklC5gqbfNWZ4dfzxYQN0JKPP1VhWNqe5HdN4YsFtU4wlRQ8zEPF//Us17UW8y1iEUxJNq4b7n4l/2cvIYpBr+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlVIeZZl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlVIeZZl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso48832071fa.1;
        Mon, 07 Oct 2024 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728312613; x=1728917413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDocX/tVZKzpPZS+CkRFcDMxBjoP9yU3G0DgObObyyM=;
        b=LlVIeZZljbUoghUs0xD1VRPwvygB13CA25JOocGS3H1nfhU6k+qEDqYvc//GkU4l/j
         opZ3stnDtzc49kmyg6YsIvnfUKlPYiBhcyappQODGl510mtsG2VAD4V6US5OaID5SFWu
         mBChn1/sFYsHG+sYGyJrcq3EfaK1l97AJY5jYDNw8j8YoOFoGL94vXgfZos8FKKmn2O4
         /EtP4CWF53J6aBwSb0UL1t00OOdlQaeEbJi5qLqM2jxwKjTdGDbHvHVZtzLJ8lbDH1QS
         Etlkc1p44SmzikvGO/I8iGq6quT2ZlbD0nSHE5V8AE83Y5diZ1J+cuhJzu8SyrzYTK6p
         dCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312613; x=1728917413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDocX/tVZKzpPZS+CkRFcDMxBjoP9yU3G0DgObObyyM=;
        b=K4QhQHrMcu/wdkLRvUeMSpj/XnnMkaGudIUqJ8sRAtxqYo31PYm8Kx8nTmO/msYk8i
         XzC7nHlVOVNzMo4Vy/sgZ+8qdHX6ZEtBCXkujfLaMwq5EC0SdRW/6Tl/6vK2paVBKXas
         IhxyRCrKqsl7dUnzWG0Ac9EOjuY+edqNa7IxRzFWqx1RLOz3tvUSBzm7XSrUY+f5mn+U
         xx8INU35VSs4K6X29llaNyr1YB0n+Xy4YLqN5MWUFl14oXt4rb1YzBFG60kM6YuSba43
         CKfGGrIoiWgzTsaYV9RQRUHJJwRZpEExDJDGeCEa54KvIlwJn/H1y8cnrNRK4d8aroYG
         FA+A==
X-Forwarded-Encrypted: i=1; AJvYcCUPMhmUMsr1euKdyTBQ4ruxr9A4REZvo8L/fNxvO5IRR82PJmFsA70/XuPMBloZqGIkGnsWJSY/qsO4@vger.kernel.org, AJvYcCXD37eHKao3qQcL59JaaYz2W/eBx22PcKhImu8XlSY01ydaXaL+9WZQBeBQTq0sHePLSoGcKCzp6eg2uOsLwPRfVKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuv3XXUywFEGknGZm69hj1p0W/n/Eqkb9cnLmck9ltP43XBJup
	TJd8YrY2hv8wC4sx/yRpyeqO7QCwOil4ziAXiWtaYgLbQ8uKRwYx
X-Google-Smtp-Source: AGHT+IE1wTun3BlEhls/HrIoAEc5IykdXHZX8OtwtecW1hVoMo0D7nqzRnC9vqdvyTiSlyGcIikjqw==
X-Received: by 2002:a2e:be8e:0:b0:2fa:bc65:f91a with SMTP id 38308e7fff4ca-2faf3c50826mr56643581fa.8.1728312613337;
        Mon, 07 Oct 2024 07:50:13 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2faf9ac43efsm8253791fa.45.2024.10.07.07.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:50:12 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 07 Oct 2024 17:50:00 +0300
Subject: [PATCH v6 2/3] mfd: sec-core: add s2dos05 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-starqltechn_integration_upstream-v6-2-264309aa66de@gmail.com>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728312606; l=2079;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=+y5dIaEAV6sUyjaV2E2BF1doVtTB4Tk8i4VgnMDtrGQ=;
 b=QW8hGmEnQreU4wFU+ny2CCfPxHvP71oOmBXjZSdciCpqm8c+V4d6Kxk5QwQ4iqIjATiMN4h5n
 nSqI8LsR0tiCVcGSj8MedSMVYjtcUSHKeX5DtR9Jun6FnQX5BAz61Sf
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

S2DOS05 is a panel/touchscreen PMIC, often found in
Samsung phones. We define regulator sub-device for which driver will
be added in subsequent patch. The device also has ADC for power and
current measurements.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- fix commit description: S2DOS05 in capital letters
- fix commit description: only 1 sub device will be
  added in subsequent patches.
---
 drivers/mfd/sec-core.c           | 11 +++++++++++
 include/linux/mfd/samsung/core.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a6b0d7300b2d..cdfe738e1d76 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -34,6 +34,10 @@ static const struct mfd_cell s5m8767_devs[] = {
 	},
 };
 
+static const struct mfd_cell s2dos05_devs[] = {
+	{ .name = "s2dos05-regulator", },
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	{ .name = "s2mps11-regulator", },
 	{ .name = "s2mps14-rtc", },
@@ -83,6 +87,9 @@ static const struct of_device_id sec_dt_match[] = {
 	{
 		.compatible = "samsung,s5m8767-pmic",
 		.data = (void *)S5M8767X,
+	}, {
+		.compatible = "samsung,s2dos05",
+		.data = (void *)S2DOS05,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -339,6 +346,10 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 		sec_devs = s5m8767_devs;
 		num_sec_devs = ARRAY_SIZE(s5m8767_devs);
 		break;
+	case S2DOS05:
+		sec_devs = s2dos05_devs;
+		num_sec_devs = ARRAY_SIZE(s2dos05_devs);
+		break;
 	case S2MPA01:
 		sec_devs = s2mpa01_devs;
 		num_sec_devs = ARRAY_SIZE(s2mpa01_devs);
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index a212b9f72bc9..750274d41fc0 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -37,6 +37,7 @@ struct gpio_desc;
 
 enum sec_device_type {
 	S5M8767X,
+	S2DOS05,
 	S2MPA01,
 	S2MPS11X,
 	S2MPS13X,

-- 
2.39.2

