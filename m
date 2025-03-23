Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109B1E5B82
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769591; cv=none; b=Q1zkXv2qu3pAcBfBZ48fu6hdXQJ+wcF5sh6/fufWCFaOict+sOzYqMEwVvcOB5DOfkcYdun7+0wi9Vn9T7Be3JtBoM85MJOne8508TwbXbHXt7mgW0fG2KoMJM7K6lrkNO5MDRBqpbvdlYqT9Nz5OkPFAnUCZb3S78qGFdVEzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769591; c=relaxed/simple;
	bh=wFMuIyuQV4OeONZ1CTvvoJlBLS9yPymppIm/9Rg9fR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKH2ZRcXk+OnYDX84N6n+B1UBQEg+iIzqMObr33PaNfxrqi+bVEsXOoHEMPJEqAozalSHPg3sbWANvZuMoNFBZ6/rTQJSqIiReow+kb3WDFAce9eDGQtndZgRwaizGwNoz1bzEOKIrQprzGcfoG93SqMhelgZq7xDEco8KzvZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFuCW/qi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFuCW/qi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so499768566b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=CFuCW/qire8aywCE8R2nF9KA3js6JnqRjYn0LxXqEbLMqqh7gljrc1Op+LWpPpz45+
         nzeHo60ZbYx7hfxaW6PPbDGGL+2YfYb/J0n51c9SPiMhge0z7JKYD+WjSpwdGeJYGTNa
         rNQsoK5zJjgWkTUgINrZyBDXgUIE+XUVFIzMPG011L5tTLUEmtg31J6QxPCn72ykhYec
         p/vqLmTB/ZJP4g1WqtgCc3OzI3MfhfTPQeEj+4UcgigbR5Sz3iOi6pEu96uT6XI8NsV5
         lGZjddAI4UHYxZJYjL3YlbXMiLNNqSdDaE9XH1YU3iE/p/2C2Kl2Qc4SOzEvzMKH5+H9
         LX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=HLG5L0XwCIb79fHUrRucQZ882+3pfA8IjD0h6R7yDaC0rRYYacUe4+jPHnkIFyRdy6
         SfiLB6eaw3H39mCB8/4M2NCH8uJ0n734YqMguyfh1xzZagGzbpCZe78Oa1CEyfwVIxZk
         fxyfeH8Nzt0AAAasM4pMry7XMFl+sdF9QQoVyBg63AXhQJIS0O4koAEKQpWo7+PjQ6Nu
         DLpiLLmvzSZJo34tSK3INXrt1O6z67B9YwAYZ65XmYBNcDZ7JQSEAZCzjk1Bl5t5Ycbm
         mzZLePcGqZWgkXb/Bi3P5y242E5q24DMyrnRGJVHN9hzuJLF32eV7AoXDe7ciQqfOcqF
         bsCw==
X-Forwarded-Encrypted: i=1; AJvYcCW3jX3syTr9ii5RKs0ez7frDwITauBdQGsie3xBoVlhfq6Iv5Sk/1aL364MkMArFR/EuZJ9Q/oqilFKFYSdAH+kOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsRvLuAmrm66XvpIGUirR+ctpaykebSfeTqdSKjfwa3ifgwSH
	XyAMwf+bebusMCwuOXDrmfWJf7fjQSHsbY+kOqFcBRXqiXRCztg9bQm9vlEvp54=
X-Gm-Gg: ASbGncvBaPnHWEcGAGI20YyChykCkfI1T787eU5uE1vxEfWb/Wilb6kBethdot5Ajrf
	0XZZXl5FeWq8rYCag0XCBC8VCrNTKsaS4N2oiFEYiUKCQXA9q/FnM8G43a3fSBNvqh4GjMcIK3m
	2rbBDDTJfBLx/jQ3Ij9I+lRSZXGA/3PfznBVCZgvudHKzUId8MyphrHmYAvDfkoqGZfIMUPKfrT
	VjG3HxZCeQGIN3QO76tE+fK/mw/Bt4Gywk5c5LvsrTX2DMoebCGNM9ogx+oegc9bGorRVHKKQAW
	G8BKn8j/vNbBvMY244lMCugEwY5sgczH5hfO3XXoRHrOwy4t+N+kGV5+zok+49W+NsJpHRcu1Qb
	6kqsaxZUyQSq7KSjSeSKBflz/WEKR
X-Google-Smtp-Source: AGHT+IEqdMFkeJB9L19k5i2T9SHkqV7HBIih5q+Sk1+mGJp+qYtrcbGq+req37UQlXtoOfZvy9bw1w==
X-Received: by 2002:a17:907:da0c:b0:ac3:f683:c842 with SMTP id a640c23a62f3a-ac3f683c845mr1099102666b.42.1742769582647;
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:48 +0000
Subject: [PATCH 32/34] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-32-d08943702707@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.395.g12beb8f557-goog

