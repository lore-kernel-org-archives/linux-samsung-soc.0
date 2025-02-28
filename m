Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A026E63B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751649; cv=none; b=f8krWYD1tD0ecPaJQjaWhGol5y3wVPWYT+koIh3oMC55BmGqaZeK8OetdQd42ceaIfMIseyCMmX0Tfe+Z5xpj0i108ctRHc1gY2r/R5g/POigbtUxhITucEnMys4qaN+3bnEsK7Bn6pqVyyAeOsT+lL/lMnlnusAhLOOaUxqssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751649; c=relaxed/simple;
	bh=bdvX1BNhSG2fpjHo2VIxHhZrYGN28llP3/MopMlEtfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0+eRyc2/G9w+NfjKnnJf2ciySJfhn+5cSw4S1WYY8Sfl2GC56pp9jQLy6a0LbWWqBWXbhjz+BoQuXA/on03Oz5C42LgxaL3A0wuvkvkcae3wkMz1dnb3bWPjBvs8tnPY/mCWiTLIsW5ry/LAFTo3PQ0d8LTBAgDOYpHs9sPSKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHZl1Ad4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHZl1Ad4"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so3925583a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=aHZl1Ad4ompIcur2hu0an/nxVD3UiTx08uuAx9RxwiUJSD8uNxXGbECXAZKfMIlMsl
         fuca+nN4dNQzmapwQI2U9IskXO9UIKHA+UDiOBXfn0chFNjjStaUEgCJ9r8rJxS3Dv+m
         ivtjvL1oK5v9Jg+h4GQFt0ZB/gBHt3UH7ZS25VsqpDPKwv8QkjMrszryqKZAAZZ5Soxj
         pBqCwMEODoNSRthPKRw1J1F2jTjiGy0V3Oss+LvVfYZnBRfLLLagqml4pnvoApOvIsyL
         gCz3YqCCdN3rIyQ6hoyMUAUMKlBoJdEGZPqWERrOfU0uMRuce5FnJ8U9hesUpA34Os1d
         RHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=bkYMh3xt6UtS0guzwZEUJIEN1DCyr7rzm3O2BMRwyt9z8U0rqlywyI0aHwN+za1tHY
         ISEqaMnCFV3mo5I6jFgtN5QhnFxh0XQicd6i8YhUWEMaKWj/PUjf2cTzILd4DHN12zgi
         fjPoV9pufcdDArx2zgbEAerqW/TTbpQepgUnPpNgyahAPEYR5qssGCtxQMczVg7icPr3
         UtP3o0hiFN6Bij7qdY+Wu1vfhsvIDFBbNqBSM/UCgDmunH+PgVbQJXsZKizqewRWlYFt
         UoWKhtuPmZo5u1B5swGoPsSVEOiSZcERcLkR90E2qdDI9hWbHBiZfwrpAFEp1lcl8Qhk
         I+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWXdCCYYc+5/WN1T6RsQdDK2SjWONwGp/R9QKjMYmMTPy8MBoISNk0vCAnn1XVgAZjbzD1r3cUjuVDntsr1LMn63g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNi/icGjj3aIl9cvx8ljuxUG4C5e5M+1GsqxrOVNcior1wTbE
	9GK9BEQjcpUImcUmsaBaM8McWLPGOUqAHjH/rH/pfih57sB9ZmzblM1zzeUQU2o=
X-Gm-Gg: ASbGncu3W5VccRcpBWOyJhgNSx29gYgWy1FLrDcqxRKvebuzZa+32BWmTH0ZwryUQfK
	l8Rfp9BdW+1Gj9B0EijUk+dcw1NzQMNPmcxWP+0MChtY/4rAHsW+AZyp8U5sPEFxORdDh7MBR8V
	bsjjSnmKH6X8PQPO1hRYHBtWB9H83uRM82RD5l6JVOpYea6j9pOaoNsswUAEYukLiBIZPOtSDYS
	RSniYaSTV6z8dmHJ/vVr0vgHmOyhYD/0KnRdL+DI40/8FoVj0u85xqKn3QPKPG09StlWc2ptFO+
	zjk+xFiNyuhNEfu0L77lVbKp2MnaSAkx1aGyXsee+TXYfhDUA4sBvHirkXRNA8WuxXLhWT/q9lu
	JEVy3sQNlog==
X-Google-Smtp-Source: AGHT+IFjP5A5it0oOhAqjGMiq+zBlLn6/wyStXZ9TEpg3CsfQx18Ux73fzaAw5ZlIGleu7roV3QB1Q==
X-Received: by 2002:a05:6402:84d:b0:5df:5188:11cc with SMTP id 4fb4d7f45d1cf-5e4d6b702a7mr2552045a12.20.1740751645245;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:18 +0000
Subject: [PATCH 05/18] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-5-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog

