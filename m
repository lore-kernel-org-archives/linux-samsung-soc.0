Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE3248881
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670758; cv=none; b=m8xNuDAU2OLbqaQ9ifl/R/IdZaAGv+PrUz8fJdxeOiUlFyx47JxwkjmEU/LeeLZk/uwcRgTO/vEhu1UIDHhl+ghb51a7TjJlXEzVvn3S1W3K9o4Wr/CSajR0Rv+s7oin7NjmmW5y2Uf2nBMtyZ7zlJLWWTu9vrMXeGjP6I9NO8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670758; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGh4h9mwNiBGlsYzT416o5IzAepf+BPVpzjP1c62zySYv26ZC+8bcM3Jy5Cny/iS5MoK4YXnd8EvrONlsNgtD/FbbPcfqw//gdzzzEcQe+DyW8N5eRqpEMK1xZGSTebhulrr4FdNXLpZR/qDcQvgWkRRlmBR7XwJ1W8nP03pjF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjHHOqvH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjHHOqvH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso1045197a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=AjHHOqvHENCRlXPk94D5ol/0f3FDlfN75O8DcrWoeUFpHApwRG1syizNhakbRO5fd9
         TDldk5wN9yEWwM91+A/7wrcsgtlYWH7NJclHDGw/YCmoqq34vnKJxKf+kf2XGsUvQ4U0
         xiZXtlcQoLA96MXAestzlj1qh/U/HKvumc3cqkvpe9bbs3UUNrR/qHXiqQKOpZjjtGhU
         tfiljiY5j7J4O5kzHSEbShO0vzTEAuvMqPYHpWM8baPIf/a3LCoYpZp9U/SJhxWlT9yH
         sJbeHa2m7EI+TWTyBHbqcp3TiIR+ZiHXMsrV4zLwEbJ3RMyOlU+POuNiyufq7N57pTrx
         Pz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=p5LIcX5Y+NWmCOdagcTGw2adr6iq4a/2OiEKIami/PulH6hbNDKe0gf/juqC7WHIvb
         pZtTRqCAOG0fd6q50cX5gfkbIadnSWnhU5Np2xmyTnql9E33fABiInjlsFh9c1aLp488
         8DqZ88ekrKDPdQP9N35vDDn9ynH6JyaCSQUPYopP8zsBO2lcKkxXUj1fnACnQDG7OTGY
         Hwo14zJ06Tgtc5SYdy50IXGL0krda+r7i7xrG7dpva0sMI4IzOme28IbRgEB6hSHpTZr
         gwtnlfV7Cx6HV8m4iNbRbq4uQh19YpR5vC8cEy6pmQKzgwVAxQGEmOq2qUKnIcU/yTTY
         cVZw==
X-Forwarded-Encrypted: i=1; AJvYcCXAp4NgDe9HA7GVpPsNjofCS9/mNhFiESb8pF+acxoGP9JVb2rqZMVbTcwMbTOsP0KFHa08SLnRoz1Wx2WMWt+zIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh0gAMskGCc2+Cfmj1Ll8f5aSkT/Ku5yM5KfR8db4nXVAcMt2k
	8oKJEoIm2kHw8mR1n0xL8qCod0wrYCh1WPmmdPSB1KypNJxu7yJ33aF3RNFnKds=
X-Gm-Gg: ASbGncuL6BAX2q2X4LQX/06dPluocmjTY7Xk4Xdl6woouV4k6zkoziBJ+viTE7Giwzq
	rY5uMfOAMF7/73KgwYbjq7p6xy7g/NRqYP28ALzszyyM/ktaED4s07YNKvZMWPZUiKzYXTV3CKN
	xMiIae9CaLIPAOq1ta7QVf5oigq2xqQxYgVc8m7oEyXEIVzOU9YtO6WQ1Ay403gDPTDHIgk9wFK
	MOWjjfpwXrfVlqs5lnDVyjYK35MKqK8jPl2q1uuymhMpouzr7MQPV3KP4idXcxWh9Ltw+QZaZEQ
	lkgr2DNd9JQw/0nfRPFZgPa+1BXLhJo4t3ighxTe3iXmuDYeVB5oCd8/JMCxap8R9L1Zt8KRYbD
	OdN4VfIzu4JDGYV0n0vpYE7mS33kR
X-Google-Smtp-Source: AGHT+IF/mj/FrJ8Kxms7tCENqFVdFFdcidKVA2nEXR0Y75YsHneWseB8Fi5sl71j96aNLNBmEO4yJQ==
X-Received: by 2002:a05:6402:2682:b0:5e7:7262:2b75 with SMTP id 4fb4d7f45d1cf-5f087184cddmr1440611a12.11.1743670750284;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:08 +0100
Subject: [PATCH v3 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-16-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog

