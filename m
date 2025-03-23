Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34C1DB127
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769588; cv=none; b=Q+RcFKVoJcyKwLqeBtqCWl9VVopgnrqHjUaiZEFzHwMYwRSqxF5Z99+RIEpc4w1tWWdJ4g8Y7r86NqVHfhEl5AVT68yNZWAqAtnHJGGYA2oxiF5FXEOHbE+enIdR088nyVhoU5+3003iem/qvSyuDLcElE9H3VeyUro4+dfcQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769588; c=relaxed/simple;
	bh=JzkdkeBjoD27fDThowAsLW8EIMXc8+ZDmGc3PzCcN1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAWmvDZiMnzE/2zHWk45B604YE4ORH21MmRG5PtIYr6V+XlV52elekxHAm3fa+GStODk+aE18yTs/g6k1M/X5YjRFfS80uJGotpFFw5ucIOf21tE1QA8nvLRVkA8umkDZ5S9p6CKsGwP3IkOGOoBjYxsNGTTo23ptIxtedP+7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWooRd0l; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWooRd0l"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838517966b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=cWooRd0loMHH/8nAfMH/P78842SkwtNP2Rw5WfIHBTZf48+RqfYbZ//N3gRauhHM0I
         ITeVKOLt9YV1EJruvPZdpRGmrR79yg8Q7h5TATc7g6RCk7lTYNs/NQnRbds4Vuh8EdxQ
         q3FBoNGeTVyHuN03HTzYHddpPEeIDvoRISuiGCtVROc76p3XYyVyUmoCWMlvjPjZVJm4
         VTQkVnoYJVdg7E6ksa9mxXZM9X1KUm0QQm2Mu5flcs8QylKTU2PpBKbxRZoTXf4W0hLi
         xvw2ieHRVVqTd88zuf24XR+5Z2qnCDgQ+5coOJJnRfU0HBzpgso6R2nfX1QkRQr8qIcZ
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=IZZ8F83NqRkpK3j5xt/VOLXzBfQdJ+bK+MBnwh6mM3q60i+A1zTErQTqeYfNYhPcQ+
         AbxqUV1T7D95QvIUVBfdNPTPfrtHsZ5jZDIGr1rWPfU/1lfzodnLqBzfvuWBpJv75B6E
         Xh3UEVcJuHPAsUPZ6nqDW/iGQ4a8tjqTO4TssiFFM9dOFQKVfW/RmM/LkMJHwuKqSAWD
         ZLkSZ/Q+DasgYWXvp0kLWeTQ66yxiPufVXiBIw1tbWqcVR/FMLyDMMBKJ9WIXAOiN64t
         D9py+UfH9R7umxA2ZZmjq/6Nzz0+TXeUv+7Pa0zsH80I/EtnCBfWSrSIAxfhvcEf0a9e
         kxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVreGTE7kCG6GiKvdV8CcbDi6YOPaZWMO8hNse/woRuI0EkuBhu4XWT8Qx/ANiMMmp2BqbkwDw7SzlOutrS0YxNfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+6e7KqJ6QJUFgE9q5mglrVDiVxt/E9cZW0Ij+jxM6LHZyZMU
	dlaYtt0puIE4RqHarkxr/8CGdZkDWO/pbdb3Xmi2WFnrJhODpg3OkhvKknPgsik=
X-Gm-Gg: ASbGncs2OFLcEFiYXHc1oRMZ7jYX/TgpLKwODbbKI5nt5JDVWorxu3e70uzkohi9Bxz
	EpuPETzn4n85l6IepkZ02/9YSgWvXKvavdEpySVST04wOTdwCcnRtlV8Ee6IwFMGNQeLY7CY1gO
	017UR8xNwErGnUg/ipwHBOb7S4yUkkPPdSk8EaYuIDyQfSgzPizZtyjU6+/u6lff+Ex9M2MTLdy
	OdfpgRDpxjUi78Pu2cbuZy0dv3DEFny1oKm9FQiysjDFdAoodGgkuDIqNQWpM0v/IbCZa3N4Qke
	2fvBy9jv1KAkG7qHePeulwv7JgvnfCBTTrjDjhdSBkti+PNW72M4uYQOkQa6qjvukDMCfKKeASK
	fYdQEaXXzXVN0LawLeAgwWXXJt9Tz
X-Google-Smtp-Source: AGHT+IG1+wcYan4wIw2G87vBZ9kZLmE/4EPPJ6sSCzBbDr/N/WxDb6EjTSy7GHnKX+cpVY7JCrLHPw==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr898500466b.35.1742769576773;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:38 +0000
Subject: [PATCH 22/34] mfd: sec: don't compare against NULL / 0 for errors,
 use !
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-22-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
index 48d5c9a23230d0927b9dc610166ae3f8f1aec924..90225b683fa083d4df7a20dfaa4f47084051e250 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -140,7 +140,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index cf1add30dcd0ff1ad149b483fe40edf82c2b57e1..084a40490979058b48640263ff5cdb38765b9ff1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,8 +449,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -497,7 +497,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.395.g12beb8f557-goog

