Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1648724A074
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670760; cv=none; b=dSsGMaM6ufYM6knS7pf9xMZ6tVD7c+iXDT15Y5hD/BFv9kgo/15dt6s8CdYnU1NyC79+AU9vrWk7sVMd/jINjqsSllOSZ8eFgxAELCTMqAT5bk3At62LLh4+I/WpJRSYBPcn/yr3BK8go9W9uXOXVg3deF8wm32dNUteJkP9nmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670760; c=relaxed/simple;
	bh=3HQSCKKi1fwFRVm95IbU9t5Hr7ITyiskN+9xAwmrKhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8SMAEqBxI0YF2OZ2QIeUmt89KVk4g1OK/lZuJnFSjL6acc58rfdIZQB8uj97xp8PHNcOdY7kgjlU0f1nkuHBa6woztZv2Yf7NNZGkJqaQSqYOhPHk2J5AofiO2NIRpxDQJFx2i3auwb6970Q1LGQrkZrpYGgJ2M/74NOefye50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inbk4I+r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inbk4I+r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1099668a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670752; x=1744275552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=inbk4I+r/k4ykJ/Nugo2yeQ4wXSJAhl8r0L/UHumax8beFQaeSG7wW4K6eYJdwPJwZ
         Op0as6SlDG2WVK8j7/uNNJJbIaJPNoo2yCKtf/Vfl9PbHDO2KR5MRn1lEqCbQciktX61
         VLwdEtLQjuWnmdTveoWv+1/5eY/w/E8A9MK8knRh7CK7gR7dTvRGlsifjdN1mhQ3Rc/v
         OL66GgE4HbECZJwJDdT48ZKXQcD0Mp21Mn0x+xsLlROFznQ1mT4WX82yuzac997GeFdV
         geLKIEl2t2qixDmGw3o4SSPEM4mZPXUfp24PUpgVGntda4dXhgJ/87dGlGS/vq/xYcFJ
         fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670752; x=1744275552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=dBku7uPAaYFiSJg9sHGB4cj/lDNO+T9KH+T52nVM+zfuMGnUws7CDTno+jIY4GU5jy
         WPSt41TWEA4/O4ayDDfZDS8+sJqeIl7nX/z9IexN03PKBUIIgitHI7LAioEBlmAPeVoJ
         PJoTDa7Avgjm77SSiY6JJnTuSMe6tKl/DApe6oYcKhCvHM1jLZmN3K+jvePab7kQ1fNK
         atKmFS53M2TIlm5pyJcZM5hUZGq1Gopgh8WoEkRmSmbIKyu30d8Sqpew8gaAXkcsNa6Q
         v7sxyBUV2jhBj7C4rASVTWRNf0hUAamYKqYBA3j3CpF5Z8hQom6jlI7LTG1ZqozAP0Uk
         MVkA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Is6SQPzG8LRmoeMF5JglYwQ2CPr+nt0FzqNqeRhYRxol+Mo2LsdQTPE6itUvi7qPxKHbncDNmv4pzM8Wc9QASQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIoKcHxkoJeZO5g0dWUJTWcMJxYJbxbpL1W0eKhlf/dywck7l
	miO1edMpwf00cFFMTLLRrCxpIqfKcUGU5rXN+IotZPBoHgEJi1it+mZTtzmOL7M=
X-Gm-Gg: ASbGnctF0jCTFqtAvJGJ7J1ot/wQ6KZDie5K1/a0nkqEDUQyb1EZOnVGat2DlKKBfRQ
	fi5efja76BJWZKdL3uapilTXszwV8i6DICK3FKKvzHGiMpYnVJ+xz9mdMMxoo4IP5qe/zrIaqzh
	3vQprRM6Qexichd1sR8MvPivhrmO0berKT+nx/1Elb8EnlrrPoC1cG7UvAqTfsnpMkZDS8mXsVe
	n8cKxJW2zmVfGCFhT9HytaGBTG34TRVnoPZN7NOBBy1izeSAh7n0jLu7Q0QSD6Xvz8ynSX9ego6
	PJhdsFSHrU1a/kBYJ2f774Tx0t9bG1QbJyWWqD7xFJ8P/VSVGxk8yyJHkIMTEFkOkeD2fjj9nej
	OFcAGbqqiPpUkvXNL4tN8K1cNrupLHI461HBF/DM=
X-Google-Smtp-Source: AGHT+IHCv1y/iOD6tATf8l6JbAVP7nosxikaub6pMGAtowLVbGuj8LVxbHPFWCZvGPjo74E5dX1Kfg==
X-Received: by 2002:a05:6402:90e:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5f08716b5edmr1415400a12.9.1743670751910;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:11 +0100
Subject: [PATCH v3 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-19-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog

