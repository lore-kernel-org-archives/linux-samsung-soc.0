Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6318A2475CE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=r9ZH6VJCRvZbVJ1NC3aSo0O6A6vLPuJkMDXhLkbsqjJdYDcI0+dDcliu/UPO6LZMTQhJnUYgnMGi0qfRkl4RGZ3iE3OLsRNNmcfEy00DO0UKUVAqsrWb8zzWjvdRaSzP3hST8wblA3kYzxox0bK+AQL4+KBre3iAa6Zi0cjIhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kE3jxIySJf4xCjpXhNB5YScxMXIdp6oxioz0N+r0ynsl7uj7p2TicHG2V6hn6XKyYiVyxQHzulfxMnKP7at7gvV/xs7vR2DIPCF01icPxaMo4SjnnwFsbifaydAys7IfME6yqnARxN2auIyyQD5loi45OttTBrm/GUgEJcn9MWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8WdtEU9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8WdtEU9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso1296095a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=f8WdtEU9vO+BsAgldDW/lpOndPTa42kz0y+sHYdaQf5AqJBGzuENzPhiGdb/7TBlNg
         mcqbzmsZtGLzYoH4qkKw/ExxjDY4a5fUn4BV9S9QYinkUtXM8l76t3vncInOVTJVe3sO
         lavU/MyOYretXqAtBUsyfhuHHNjLOSWi5Wo5se+z+aEie9xvjLSjeMIIBSWdAIwwxWRA
         70O7G+LSOdBauY6bI5R/b8Fur/ZZZ9cMJ8jMBOW1hDLNxp3PTG1WzgONdtnr8XCxvgfU
         64tEBAQdjG2T3CVsPYwXzklq0C8S6haeaw7sWLWC9Mgr6BgzoY7V4pKlW3WDuEpdYWC3
         nctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=tIjpivNPX9gqbnazn2J+zgzxaQCXnWFHjfMnJZBT3yO1Iwnr3ZXFniNORB7OJO1P5b
         A/rDO6Dnj0l2ODwo6F6jt3B6TLq1GIrYhqW8ENWV+TmKOAfgfmfSkI2nfihr1tXQk+wo
         gOOyqPI6+s8pNeR+NXy8yiWVz1ZuguP6qhush6Op+v0EcsId5yalIjCEPtdDYoJE3aeV
         umJeuvb9oeJQnjZK416+wFS9W9jTEbVuQaWJ1aUeaWBaeKLjme0xa8FJRWuxPMY25n3z
         i8ElzTNavd3LXrrWxmL5pqJMai3Nr0VSLr7/7U9JnPrOnk5dL8oSQrweEH6s0v6GnNj0
         /c/A==
X-Forwarded-Encrypted: i=1; AJvYcCUto0ofBwsmXB0q3nUU2eNq3M7mpoHCInM7DfN4gq9plFotBP+bxp24WabLCQQNbInlpnstgWBKGNTBQNV+t4M7zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRI6V6sPHeEWVoFEoI0zKRUWqNtV0RTnIGQ2s+hqe5gMlAAr3W
	0wYDyarIoAl006gVLus/8aJ7hTdK71cNNpbLuUDgAuBMEoUf8UBNzeXAlv1ceBE=
X-Gm-Gg: ASbGncuyM0QJyDR5ucix11X2/T0OinT/h0mo/62d/aT/AMRc2mYC/zD3qF5eSbzH9m7
	VKYk54n3AZr4utuTTuiH6UqApiETfVMPNHP/HTffQm4B5y3Y7gpYvo4pDOzlrpISDjpcWX5IA1g
	m8f92WH5MSzmEx9K0p6knFi40nZ7fT7fUx5ik92nYV7p6GYN+F1atTTd7sQqEU6JfH/FEAw1Okf
	KlV+Z0sTP6xnsOFyAFVpuw719QpFpARWhitLxZyzAayo/GUoIjlkGjrmVz/ysoESihRHOjLyqqm
	Z0myZT60LWo901sjG6oq4PIwQne+PcoMjSFmiAV/hblegJAHUb0vF25oi+fhmdbJvjhsC14HnlA
	3znXRW4ExNZZJwL7+vHHv42Axjkut
X-Google-Smtp-Source: AGHT+IHPaEYedqVEDLo93ujbRrtVNCm/mxpEYABRhJlFkwLFXs8WrbrWDofWHLr/5jqHegGOehX8ag==
X-Received: by 2002:a05:6402:5112:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5edfcbe92b8mr15687119a12.6.1743670754243;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:15 +0100
Subject: [PATCH v3 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog

