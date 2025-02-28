Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124926E17C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751648; cv=none; b=RUhShndxDxdFENO3f/RgLf92Dqsey69vsFGUjWVVrKVx3KeRLoK2V0VSxQl6ZZwE30h5sr62yBMX4M9uhG7T9lBF9w/sOwXbGketJe5ogDjehjokrRhexYo6ZQoR2kwYuPdjS92ycO4p7xs1ufzy8+2rbiYVdRxQzvWCttuOfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751648; c=relaxed/simple;
	bh=ako7uKkoy0pcKOqw3JaomEgmXiZMMPwkguXI68dLj6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUY5LuuFOVUbW3PR/K1fAcIDLh1iYaOFUTISlNWEAshe4Rhcty2MrWcFxHtyQfPIDqTgvuzYaQ4zDdnjhSZ/3weAxghfgZXURNLWV2DeJyIEz7n4rB3MLGId7Wq4iswKtIkIt0IVMcfG6gKhBR9ZTn0ZJCKGVG/7GAjSiSGsKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duu4VZEP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duu4VZEP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so3925558a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=duu4VZEPZ8sGv25ffQJ+1bdz7r6wTagwsUflJFWNZhlu4PyYNBlvdwtqL85JQZ/66C
         pnbLUZCNHKvbwF4bHYLVonu4tX5SPwbXrV3IIKNh+gQOpW+EnMFnxjekQtQY0ww9WTJp
         C6tIMdiC7L9O4aTkd5mgj5wQlb+dVsbMdhS5fYVFma2u7QYSM1+0Kn3DNjRHBA8lA05w
         JH3gd5VC3kH3Vy8wRRS2CXNIPeqL9yBhk7EtAFoxQO/I+uYTKe3wXMsfEyIpCEQpXeEn
         Mqf+frzpnRT3kQBZ5+LEdVv+MeqIquLzOd4fT5q6LHiZKaReub3O2fC7RrV8a4M8Z+D3
         P/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=htkVJ1njd0hQG7+nQG5UL6Ko8TCSUL1kGui9GE1NI2mXpkFz0ny36a/3Xm3r/hwLpr
         h/wL+RGDFuq7HWjpisdQHNDli7swTG5DwpKxnbD5HKDXv0CLhuN2QLWL873tUFwe280l
         Tr8w03JzT8wcFwC6d71i3/Z1d4acPQ4eUXIifG0d/HRiNUsS7PPIruB81WU9n0U3FMPl
         XWjFhqPog8xAS9DXKWMVoe2jHFBiprIiOaKiFsxb+L4FUUBVeTVxIrQpJDfefWxOtXgZ
         +fpQbx9N9onnPsPFZf8ehY3ByHT40gn4WhZ8QKUI2cSzh7TMTMhf+gLDKDpzVb89Pema
         NkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1CyE1r0EM5JEVR4I0xCrLWtWPy09Jp25tlUzVD8q2uNVcV5LFP0/Ha9SPx3rURrkCeO0+ji8JXvL62iQjQ1rnfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMDNWuGIqMMCZ7y5DqLjKWw/FDFr1pojFctxWBwbqlYhqssqb
	ODENLoO/4G+tk55MRgZuRoleYlMeDLd3NCY5LSDvHfi8fskO7nNZywz3erkRkzY=
X-Gm-Gg: ASbGncvsf5PJhZtPkD8DNksq7wLhhBvmPd+p6QD/VruwmXO6XnwJt4IGqqe8XFvTpei
	8D1DcxZwgdo5WgPrU3dnWofsK/viQ/zqj5t+7y6owE2m+yUOKDb1XlIa+WqOHVFYdpDj1Qd7nuN
	smyK9CQnkSiTrKj4WL+dghBYeOrEi5R08STgqK3oOVMgJsqPkr24fhr6Bb7wAAKpIC391+mlIfy
	nQjBghvrF8S3qT/IC7/m3yaetfzySHmka6GiSvqEMljvpj9sE+8m7B3IYJmhpt91jntr94Kr+St
	UNvW/yT1g+4UzSq2mvZtUlwbu0aNZv5BR7lLPcinpJz2q0TSGo15UzPs7KMWoBu5DvZo0aafTJ0
	G2l6q7m23QA==
X-Google-Smtp-Source: AGHT+IFpdib5eLXvAKlYp3fUyW87rQ1IfZ8GEMoJsXuLGkDw56XS2aTZMwaUmenZ5apuVJAYF/Nggw==
X-Received: by 2002:a17:907:c018:b0:ab7:fc9a:28e2 with SMTP id a640c23a62f3a-abf2681f8f2mr377695266b.47.1740751644708;
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:17 +0000
Subject: [PATCH 04/18] rtc: ds2404: drop needless struct ds2404::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-4-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ds2404.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 3231fd9f61da49bdaf00e46486fc34836094ee78..217694eca36c3432a8db3b874374e347eeb802d9 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -31,7 +31,6 @@ struct ds2404 {
 	struct gpio_desc *rst_gpiod;
 	struct gpio_desc *clk_gpiod;
 	struct gpio_desc *dq_gpiod;
-	struct rtc_device *rtc;
 };
 
 static int ds2404_gpio_map(struct ds2404 *chip, struct platform_device *pdev)
@@ -182,6 +181,7 @@ static const struct rtc_class_ops ds2404_rtc_ops = {
 static int rtc_probe(struct platform_device *pdev)
 {
 	struct ds2404 *chip;
+	struct rtc_device *rtc;
 	int retval = -EBUSY;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(struct ds2404), GFP_KERNEL);
@@ -190,9 +190,9 @@ static int rtc_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(chip->rtc))
-		return PTR_ERR(chip->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	retval = ds2404_gpio_map(chip, pdev);
 	if (retval)
@@ -200,10 +200,10 @@ static int rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->rtc->ops = &ds2404_rtc_ops;
-	chip->rtc->range_max = U32_MAX;
+	rtc->ops = &ds2404_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	retval = devm_rtc_register_device(chip->rtc);
+	retval = devm_rtc_register_device(rtc);
 	if (retval)
 		return retval;
 

-- 
2.48.1.711.g2feabab25a-goog

