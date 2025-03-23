Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18B1D5CCC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769574; cv=none; b=RdU9Yg6uJTvX8s+c19/mI++OhArdveJA7OIRdcx1q+/08kTSCXbVYJjizSuzNXkLtgbc7jtgBbQbfoI7008UtZ0YFXQIhcpM27fiXTz1iXvlq5w6vQqYnAXwfqlf8WgjJq3WzHFpDl7ms9h5VaSR3XE2eaWV8/Y/0U7OG4QDLYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769574; c=relaxed/simple;
	bh=SOWDFBYDVimh2JZdbpqs93MuJ5ZKdaya15zjUJJgJoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNlH5Fv2FhXamEZdxaXS29AlOmud7PznNCXazlaojfzGGqnAoXaJ1UTYF3r1cVLrFBFSBzvz75aAFf7YzJdP6kQx0JMlk1uBngkObc0LzHm4r279xWYDCZC3uBXBqVYX80Vo1x3zyB5ad44z+kdCux69Kve4/4aXlzyYk+LmX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ro5ATcEw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ro5ATcEw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so677056366b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=Ro5ATcEwOXJoVYOumsx3SzyVEZr0IG0MbaEdO3CqShFnuHHX7IA3m+53Mge+A4z2+K
         Y4gISwjjFDeTGH+A5hP5NV37c3Mfk1ZROF6AeKE66mHgWJ0rbvnyRe2h5SCxyavfrjP/
         xOX05pEBekJgjHGfLO4PmSIYxso5YMdkOI8ZpXp5oiQLCrqMWFfYaQgp8lVJ96JPsfBy
         KsOvSJRRe4uaTIPxXOF03cAA0oqbGCJ6CSP7YEO8x3Ncs1SsxqHmbjvwZR80nzm56bWY
         zroBW25Zsp9DOgHUsb+nRZLCF0rlB+LDEdvogubZegvgBkEOGZO7l1skyOEFAAdhvJr7
         9+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=imknmFteNcpbuMWfk+BlTdrQ6rI9sPfKNqkfxJ/5Ii0K91ntNYzOorXvN7lnJcrPVD
         OnmabVWY8Ko+3ZzgJD8rwjpwW4GGn4mhrufCWPn86EYktAcXLykgNiCgLws3wsARRQpr
         gIp+918V72KTVxRrEzj15pbwX3LIoEFovn1pF1EXj5tmktzoSTTtInCsaURCqaXR1uPW
         nl/xiWI3gON0cMQe4oHD5mOMVdPEXh8YzqjOc4ryXUDmoBb76LXer9GaozVl8Pv8ecnF
         IhNLNlaMiTH8xcPp+E+hMco7aW4U+XBd6CakiI4kTA5+7b8zkgJSMdKtOVLJCUgJstr0
         rrMg==
X-Forwarded-Encrypted: i=1; AJvYcCXkJrpekuI+ANZeohQ50+wTzK1o3zLXBNnQlkytTmzb48mVQI/KZwIt2Eq7UoP5oggX9XMo6woFaQGDccgoshOxxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDF1GpFsB2lk/Yu20tvSQvHn8X0awgmgTjrOPMKdgkZXebL9d
	6nHIN7z96b2I/1F+82ZMEnm2/b5GTGl/5myzn+8phApFFPwhmWFBNN8hmOgT9mI=
X-Gm-Gg: ASbGncsmjq0D9sqHbm4AZzkkAmuOxamGwtj2jmTK100h8EaYcvdo67bBUuutyXuQVxE
	7QnDIrzjdKstC6RAv7EW/y72nA7trM8YZkO4zy5KMfI9RhFV9nP8MuMLV9nO11TxfqdvshnlhCG
	KbedD9AoqnKcW89xBRTjzCSGy41oxG92+0at4BNdBfGuz6nChLwk0hPsVAuhWFK5dQaKQaoS7AZ
	AImCNNCTOWmGvY3G+ziW6ghHNVhj04qFpXDiyZviWVOhnFiK+LyGZEeJ96yTQj4ONYDJ4Cxuqd8
	/7Vk/fma40tUmxx5aqSk7FgGxF4+QP7Rx4GAvJly3kflyjQ/ksvM8OhewtH2U+aWGdzwEfrjx/S
	QZ33l1v3630xkVgTxYvCotIpGjRwi
X-Google-Smtp-Source: AGHT+IGESlPld0TIZcF+ERlnjIFgWzaZCupFw8MycHD7wowlazt/klJI/2hD2dVdJFw5afV/HysuBA==
X-Received: by 2002:a17:907:bd88:b0:ac4:491:1548 with SMTP id a640c23a62f3a-ac404911816mr803996166b.11.1742769568148;
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:24 +0000
Subject: [PATCH 08/34] mfd: sec: fix open parenthesis alignment
 (of_property_read_bool)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-8-d08943702707@linaro.org>
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

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, we're going to split out
(move) all I2C-specific driver code into its own kernel module, and
create a (common) core transport-agnostic kernel module.

That move of code would highlight some unexpected alignment which
checkpatch would complain about. To avoid that, address the error now,
before the split, to keep the amount of unrelated changes to a minimum
when actually doing the split.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 83693686567df61b5e09f7129dc6b01d69156ff3..b931f66f366571d93ce59c301265fe1c9550b37d 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -276,10 +276,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
-	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+	pd->manual_poweroff =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-acokb-ground");
+	pd->disable_wrstbi =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 

-- 
2.49.0.395.g12beb8f557-goog

