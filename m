Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AB26E158
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751652; cv=none; b=pRUEQqzAxtQSF4CbUOdIdfOLPx99kBO1DVrbig5LSaqyTD5bXu21OUKFPWGG20oo9pNVfi+U+Yh5ZS5D944nOnyuES/SyPPuK5gKlAqbARrq9Q02ukuuPFz5SSiCKzVa1fmhy+6uoBWdmwDXEV5088M5rH/uQX3nRFvKw27FWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751652; c=relaxed/simple;
	bh=Zg5sH/XIOlpdSTMnWDhKje/CxuIIhLnTjwMNeJlDZ24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMgtgaEEU44nOEFtcfQ6hOfRWLoStSKXl1B72brFfk27o6BwGk23pNEqM9IUe6j/2qtNDKzrIK0R68gCMK8ezTa+AZlSd2E0xqTVE7LSIVHwq6HK5wP/FfqUv3/BsSXattGpkMLJvTfJ2Rn1wZq4tiHqATUvfRDVO39kn77aEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2wT9l5T; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2wT9l5T"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e4f88ea298so1205053a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=E2wT9l5TLY0++O8cIqYxZddJMTa7e3zZNmBSoHYPF+Ul9Pfpp1OBDGx4vd2VXFOAvl
         gdsmAGITGd1eBFTlyW426csG/mpVfd/dGiB1oViFVgdalqv9yQWF9Apv6Vmsr0E4w1yp
         BCgaEiaHNNKTYUsHIcx9W/KnyCKVEOuFb6BjITBWrnKeJfQoFd9PsmQjs6NQtX6XE93c
         xUM5iZfhbXIimHtuqJUTJh8CsCKLm6/xDGQuGF5XMrlYZ4YjKe1ZasZ0Ny1DobnDvaTE
         DZI9IOddMK+Mx5bNdkAcMR7q/dQs8JCic1XI7HjX/1Fy+X4mBfnAHYGu50BxKzKNGS8o
         PdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=JDw0xlCOzeZxITvKenO768jGX3Xi7ibiTB/76a8Ma98K22cD8jRAWsuWHgPRSQNk+c
         1a0rgiqMVWNnXk9Kc1UTBLkB/7VtG/EWcY4KNWOjtq2T7B1tEfv7dNNJRT13hysDXHis
         yx1BXtRZQKsw97STpSJI9MaolOp2GPU/sZjwpDYEu8IK5bXqvi6t3IyLP9vjYLhFYGsw
         Z6COpTjQGyO8OsWgEKyYOaws0w8t3XlDpUuxjTgMG3pL4iHsvo8lONNSYGbYqN6OXDAU
         peQMinCEezzqqtUb4mz4TMVRRVaU9FxxEB2lGTTPbtDZ/HnwcJ8t3LnjRnk0T6qxAD9u
         5wSA==
X-Forwarded-Encrypted: i=1; AJvYcCU+p0vl5IVut8XXe/QMyuLeOsf3nSNT/YuJmxcq5fjEA1T9w/M09HWXFx4bavi2/UvktiHXzJQH5bkC5paXVre8pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZCEyqEBLYYgwB0VKwt4AbzznsgJJaNB9C/S4Z2Q0lDDqK/Hs
	6JEPcC51GaSRnjf64b7eM3CAXK9YaXg09HT/a2ZYJFOqf+u/QGfEsvPdBAxz8Us=
X-Gm-Gg: ASbGnct4f4FvUhfFF5pIR77/votQuBY/YD+zHxd7fLLiZwQEhtGvI5N7ZEBEOI7iTUw
	O/Ryw91s8YBJJ8iLlRsbh4wDZyQYpzwnSQD7Gmx3LLfrUNR14OwZN2E7urlRW3mG64RVNBEjP82
	Wi284C32IvuqLWKwYWOQ/RLDcyW55jLHbJS12BRAHYkNmhBZRwpdouCGyxyVyT2oXFjXkkp1W9z
	XU0S2V0XsZeExlxswoOlgDF+QcQIFDLkAeUj8OV0qtzZAc8Mcr9g3nPOdeUo7Gr0CodXu9v0SE+
	5li4VeBHbyQcnaFRqpDAjCx3abyY11L/avWJHPZhsbGXbcDGIwEoN22tUGulmPbNoVA42WtK5cU
	wxQlqIaQS9A==
X-Google-Smtp-Source: AGHT+IFd5qkPHWKs7u0kGQaxuAKFWYEyb+eqqsQgE6/A1ZcU9oZLI/LHqjeh9PQlI3f0EWIivI7Brw==
X-Received: by 2002:a05:6402:26c2:b0:5db:f423:19c5 with SMTP id 4fb4d7f45d1cf-5e4d6ac4066mr2619097a12.5.1740751647799;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:23 +0000
Subject: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-pl030.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 39038c0754ee55a952e5986afe711cffff35840b..e7c81740061bb60c4d8447d6522819685bea9180 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -21,7 +21,6 @@
 #define RTC_CR_MIE	(1 << 0)
 
 struct pl030_rtc {
-	struct rtc_device	*rtc;
 	void __iomem		*base;
 };
 
@@ -86,6 +85,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 {
 	struct pl030_rtc *rtc;
 	int ret;
+	struct rtc_device *rtc_dev;
 
 	ret = amba_request_regions(dev, NULL);
 	if (ret)
@@ -97,14 +97,14 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 		goto err_rtc;
 	}
 
-	rtc->rtc = devm_rtc_allocate_device(&dev->dev);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(&dev->dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_rtc;
 	}
 
-	rtc->rtc->ops = &pl030_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &pl030_ops;
+	rtc_dev->range_max = U32_MAX;
 	rtc->base = ioremap(dev->res.start, resource_size(&dev->res));
 	if (!rtc->base) {
 		ret = -ENOMEM;
@@ -121,7 +121,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 	if (ret)
 		goto err_irq;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto err_reg;
 

-- 
2.48.1.711.g2feabab25a-goog

