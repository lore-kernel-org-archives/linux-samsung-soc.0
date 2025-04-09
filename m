Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FE0217654
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=fvb3vKJvlykgd+k4jYqGOvSOGu9Czn6BP7GWicWyICrNOuA8XdCzzsdA229DD3OnxMf9qoHxEQn1cCLA+lJIIIO2ueayy42k0jD5NtzqKC0gM/SDwRKifb1S8L2u1f/PdwQdHJEFs9tO2tfAQ05K+/OsBgoYSfRHJ7ntbdak3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=+hryrykXS9VQjW9x2uaLv9FXNLWJHO9HAediWJbl+4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D87ctGXnmFU6ICD/O0kRuFgJLT7Wbd/CXwITqYMhdPc5Y0YU0Ks93PKR4juCaUjb9amGVHh+AAUpc/sNUgvYCLbmdvozRkX+xn9SkbYYOTn+KTpnKIYWzEYq+MPysb2YLrpFZwzHyIH0sRzQtZ6jSbvOJ/MVYCwzY2fTiY2TJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+6DrJtq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+6DrJtq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac345bd8e13so18113066b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=e+6DrJtqOp556vcssHT+q3B6i4qOa9LWOWl115rrXNQXL/128L8QSZhuhFRvH4nXCc
         IQnYgA3TCRYUSfZsMOTOwaOdsRmojSclYyGBhNIxJk8PqUu0KJ1iY5Y89Bu62ErH+4E/
         8NPnOFTdlLGC10zyRIXXlMCZhGNSbsHwxtgxmpEal9oXXaI034xXvyZg8v+u6c4adCSA
         GQNKoryE4r66GBb3IsIRxHtKOShhVHMUas3f9TRNVBggubcYLjErS4bH09Sy//WmykoW
         kLXlYKgBxgU984k0nLK41F/aFF9rMO9UqI42ESVYIG9kk+3bjaTDvxkAFPHQ8MnalVhh
         8QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=ex6g5OMwYQrxGHyJC710zjm/khrLLdsZC0zIMmknJm/8jEy+etwuOsBE4j0dJGQ3Qs
         aQWk/y8P6Bk47GuwnS07DefR3PXq9Iap7FtKQmbOrNtBDeY30bFBrZmB8VD2xOE3KATy
         mO2/DdZTdYE4aJt9e1Mwir6W6YYIVbWRamashSzEGs3JIfO2ZIozv2+2+yyg8xUWfiyE
         fozHF/FUIiKwFga/lzapFmOKOBJ23fB89Sf9TV0bqmHhu80WvKTPHusFXv6MZrU4v/cS
         7KTeWtbea3W4lnK97iUqP2tGM83RFQ6ouhQNBRfxhbAOotLks8qmyOVtJzrVRAPnkQxk
         wRGg==
X-Forwarded-Encrypted: i=1; AJvYcCUj7Sqa+zIDRcRk9cn7CaWZeayehPhwC3u2NUZrwQIRrEEjqX4BKT2TkItabHnNY3utd1lZDVEYfiVZ2Kvq3RTzqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYz/kxXE3cWqQXyKNQ1k3OOTQwmt/ZeqajqPYW3eabVWs0Fg/
	NCAY2KMMM4S7Yrlg5km8GAr92uCSpMBQ2iKAbYthlbl7SSu2ukdQ+eGph57L3s8=
X-Gm-Gg: ASbGncvAoivuHlsB3N6WKbYRToJiqv6NA4spk1u3Huljw3RueR5K0WOOgqI/k5Y/HnP
	bsJzuyURuGsL/U7GLw97wwEeUc4VNbpEY32dcRwQGlfo2fP4a4XjNH3S7L7s7aa7qoCdmDXvlF7
	T3C5iVex8HA/+jgOHHKStW6FscFMw8484QtUWVzUDXnZyuaSzIziW1mH6krDURyVKHPZeQ9S3uS
	GnZkK59gfQcIZqW6R8wnxPc4oSA9Py4x7v8p3lkcB/ifD+Tx2yyeEstahbKPBOLQCZOf2TOLol4
	6zyC2cAaepyG8Lz+pNov0DOGy9elqwlEbU8Rud3wOmIWGmUKTRl2CDb7r6QElrI1uTK/oOpc86q
	EO1rylstI/tEJghMl+P0lCe9dM6E=
X-Google-Smtp-Source: AGHT+IFaBUkiGU7OFSd2C8+eXihngB2V9lqLexzEyqiPbNYC3ushPCaeGAspEyeXYhQ5fM5m2o3CBA==
X-Received: by 2002:a17:907:c1b:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-acabd1dda12mr11931066b.15.1744231059324;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:40 +0100
Subject: [PATCH v4 19/32] mfd: sec: Don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-19-d66d5f39b6bf@linaro.org>
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
index 54c674574c701eec979d8c6a94909b78dcc77065..4a6585a6acdb71d2fb368ddf38463f001e513c7c 100644
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
2.49.0.604.gff1f9ca942-goog

