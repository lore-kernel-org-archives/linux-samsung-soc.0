Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08652139D1
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231071; cv=none; b=R12Gesttyf0Wb2usfD/yPgY6NFmOo460l0D6m5JDxQPQwVrnobyY7eqDpCxI3iFTLa4wUns45xR7l4jSwCX4LXiQqDJidireH0j7D1XJJ+yrAi8XHhKaUhcSVqpPZ0Qr3KrLa3ykK9aSVv+dwQFIfaHnXOR0spCl0LTpdYzq+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231071; c=relaxed/simple;
	bh=O4JPugPn1xYM+7ioH06ufb1b5Ml7ZG8ODWJmVaR2vyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuIKYE1j3yaKuM69/NVRUJS9IG8SuK9Bz3FJMOjqB/ktpyOPWCZB5iThwvWbXf7Utee/nL3OXcfr2atUa6ziFGdGDSkux2AxcMTTxZwgYP3qpQVj2s9r5a9arJvalhJk3gk1Vz+PUUCcHMCDMB7g/S3sMF6Sp9ecpsa6Xzzt4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSKhtznF; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSKhtznF"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so16506566b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=QSKhtznFFXhtw8I666k9RPPov0Jeb0/GuqcYV/i8h7a3uPLBzVCKThrqNLL/NEeEfo
         uPEA5/LZgoo8uqck8Q4CRMAd18ot8lIsLjjZnvbsx8LIkEpgtHjsznDv/AuX7UmEsLSF
         668uPgadesgsOhYTO3xMq/isrXBVOHUmLZn0x+3kmFiO+HOUN1a2IYLhbwft7oqb58T4
         bE9DKX/s98yxzHjQ7tZE4l2O8AC0DnSmvHQ8pr/J4/agaErPC87RwCDOpStEu5TIkQfb
         BJ8HdZodcVoJwf5O92kpTa4iWWsv1XISXpVui0xP9M8cLkHdfFjG3n4SHkNVHiCu8ui6
         DsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=lc5Btme/MSCFAqsom/WVy+KLb47/rLG2XvP9BTCWW+g0yv89fFvlN6JG1J8a/GsQyL
         UZ6MokDSActAEPZpOabYF7j1SR6MQ87vN72YDVCrCANhjN1/aZWXSRu7G+njWIXrmPf8
         m0s00Ziy6aFp7pK3sEUDq5BFWNLxkUgr9RYsDkK+jBHbdngRKWwfEu13CS9RWSNbwyRR
         Ui3drNygzdJBs6XQJBr5mK7uWToCrv2kng/0rm7sQt7BfugAbnuJ0UhqVNqqrvwIsBuA
         +htukfUECbwQ2Ol9/Y1qMwPOjgbBZTAi9/QNl+zJjtF/Py9U5htECcf0ImbiVlOt0VVx
         6x9g==
X-Forwarded-Encrypted: i=1; AJvYcCVGYVktQ5Tc+ehvVNjxMlZONwtSrL0KTLL+bbJlW6dpuTIArvz15Nrh0D+8diM5ST3INM0rjBsibFUZK7Y6El7I5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTsuP8cw0qM6nruNNPFNPqvs/w/GNScgmKNkN4fDoWbcd6J1c
	oB5Irqsp4d0ZZHnYApMrBIOPw2uaJ8EBlodn4mpFutR+UmkYYbHJnN2mEWupH6h49kyVXygVLYX
	X/PmOvA==
X-Gm-Gg: ASbGnctOxB0gAFPbwYmIEuWbaorKCxQNfJT7qfym+/eExAECaiXnN0LfXzsa+/Vb5kZ
	nEHm3mTBWL42+IIoSUF/Q/DSbel94WrWDHs3Rwx3onSCe4tkwmFQnpALDrFAidl9yL5xcOMFiuH
	jxfsgMBXSuPyPyu+XNaUGwQVDtfvq1UU/qa2eeRhqADlgB3fmj0u0N820NE+ZdRclCZ18O8TMiT
	OfjQuuhyCOTnpKPHAbbbLKzsZI+PKz24+KdSwLXL+J3RMa9x5YIzUAZaxBOJIiDb+uk0wpouz55
	/MXONY8GORKAEsyE+JU0ov37fJi6Ori2BqiQUAjPZU3hlvS4tMS0FRhbMkvNr//TznVSJqwnem3
	41F/I4giyWhDUBI1dunnsrBK1vcM=
X-Google-Smtp-Source: AGHT+IGySdKlCUCRqIRdMr1m1a7VVzze8sUjh0tF6sp5LZEti5v72rp0jlKeAu4Y6YWVta765Hb6Iw==
X-Received: by 2002:a17:906:4fd4:b0:ac3:b3a3:f19d with SMTP id a640c23a62f3a-acabd3ba32cmr8605966b.43.1744231058840;
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:39 +0100
Subject: [PATCH v4 18/32] mfd: sec: Change device_type to int
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-18-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Now that sec-i2c doesn't match device type by pointer casting anymore,
we can switch the device type from unsigned long to int easily.

This saves a few bytes in struct sec_pmic_dev due to member alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         | 9 ++++-----
 drivers/mfd/sec-core.h           | 5 ++---
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d..4871492548f5efde4248b5b3db74045ec8c9d676 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -155,9 +155,8 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 	return pd;
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client)
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client)
 {
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
@@ -232,7 +231,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -266,7 +265,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			 "Unsupported device %lu for manual power off\n",
+			 "Unsupported device %d for manual power off\n",
 			 sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index a0a3488924d96f69373e7569079cfefd0544ca26..92c7558ab8b0de44a52e028eeb7998e38358cb4c 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -14,9 +14,8 @@ struct i2c_client;
 
 extern const struct dev_pm_ops sec_pmic_pm_ops;
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client);
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 41b09f5e3c49f410604a5d47e625cbb37d7f5fa2..2ccb494c8c024361c78e92be71ce9c215757dd89 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -27,7 +27,7 @@
 
 struct sec_pmic_i2c_platform_data {
 	const struct regmap_config *regmap_cfg;
-	unsigned long device_type;
+	int device_type;
 };
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 79b4f74b05a24e413a84ff8c0b16156a828310e5..54c674574c701eec979d8c6a94909b78dcc77065 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,10 +449,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
 	int ret = 0;
-	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	switch (type) {
+	switch (sec_pmic->device_type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
@@ -484,7 +483,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index c1102324172a9b6bd6072b5929a4866d6c9653fa..d785e101fe795a5d8f9cccf4ccc4232437e89416 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,7 @@ struct sec_pmic_dev {
 	struct regmap *regmap_pmic;
 	struct i2c_client *i2c;
 
-	unsigned long device_type;
+	int device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 };

-- 
2.49.0.604.gff1f9ca942-goog

