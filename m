Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45E2BF127
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107949; cv=none; b=jnbC6jVXSJdjuxhg1rMj74qjcPXR+ZR+Yv04e1qO57+rGT9vbI4xBQttHZtDNJ626nl2BzqZSBYHC5zHgfN53HxuHhbC5+A6oxAcltsIppCqWpObjJFDq/AxF6uwGXHzKWsaS4k72loSKzDFpNqcZFR/cddlcUzzuFWkK33hqC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107949; c=relaxed/simple;
	bh=9NiX1CWV0hfu5OaTJtAP498kfcNRuxNWGXOfalDiImQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZgfVkBKDEdd/lJby7fhWwZjKSVHgKd11ALdY/LjhltLrVV+z3zpDgfbJKyVkhtxY7f4n4qaoVdVuP4aTcHj0nLnqCem7meDm3oZJKJnsIpojtEjFavcFfANR0fKGZRRbe9lTcyMZOUXmVRxGKqAE4vhwLqWKAhIcyCWCI/9SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWeitVD2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWeitVD2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so28261425e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=HWeitVD2KfHXmID+JZ0Qw97az5c4S5wCuYWb/qh1PoKs3mkNUER/F7p/d2srKVNvrw
         7ZYwQzQlTbXJa+xJ1M+/Ky4NUxfnWNkCM23LmrZ9u/uVq0m3aN1IDMHt/pS5bda4Py+N
         rUogfWzaLnd3LHPLBPTYgoOHncg7K/TdqS9RJMyi2p614MxjDcngJa541Opm1ep/FJTp
         QrU1MWqry/N6+b90kHydMqqzugCEFH84hc/Z+WLTQuQfzDmRsgwULR5jtnHco0A6KQVK
         nceYkki+sOCjkti7fvQUAEumI6GeS7B2g3iAKA08eIGN7Waj8J3W7ZoiZMxZ4nZ8Syy2
         L9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=ZVeiZvtxynZsHrJ5n7eFSLbkcguYRD7WWVXM5ESPKjb7WweMjLlrl63Xd1nvca3uGo
         /Fy0T5aR++N747r6AX3KATZQc4lTJA3wE2Bf13xZgiK/Z6ePPS3tDT2v82TK2J9ng0pK
         jSklqs6JQOoFl5ZHIDBbI74r0kxdOe5G2DLGzlp4425MNyz9k039abMEq1fjhSmh+0s3
         CNm7wYrvy+RM3tpku5ZEYp/zhYYtEI1d8FNIc3etIEPwlvshDKv5/peKtCivL4X9NBF3
         GaRlmSQf3QRxwaIFDsjFaANHx92vxI2bif0sP/QrZPTlSMZShSXqEUbyo84sPvSMtOTT
         qmsw==
X-Forwarded-Encrypted: i=1; AJvYcCW7X/K8WnRJfu7690vZLeH0FiyvthoCwnn02Ms2za66062WsmGA7Ob2AJQ7N15IVjRGDng5ENIHKO74r+AQ+xRQlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvvpREPM/U7xD3HIjAvfEz9Hpb/2ZvmKMQ5hgw2VqD9uSuByE
	QjG+XwuLTFidiyMicrq/K4J4DlN1Lks+AzkSEiSWnTm2Up0G1o7y3XfXJoJG25ejOoAeoUAg4jk
	tlos=
X-Gm-Gg: ASbGnctCByzJexkYkhtrj+Idlx1RpM2TGQn9AC6YBRYOUy/0K3bGYKRTlbR51YWm4A4
	apkDXaIqG6go/vFg9clAWNsNyQxgrNsT55AcDMnSQby6ZcXWdsARtSpmbeGDb/Sc1QXfP+8cFWj
	VSdX0llCkjg1kRF5090cJw0BXkyAW3/S9zeJ3GVU80kTel+fTnzxCFtphm5MGYOrNS3YEjpvyqb
	tvWBkVEgQwLQISBkSF86vcLIYVjsOQWvj7exZG6n7Sfhn2XvqMAZYGpRnJGRyByBvgR8I7e4J9M
	oqhw/ES3m483cQmUoCYVhSojsgXlebagOa5rJ/j3aMPNO47W+yVFI6eiav3+I8Zxo5Rt/9Xnxme
	LVfv/iFNTIq9ay5tNg7UIO2v1kuzY
X-Google-Smtp-Source: AGHT+IFBi6JjsYJDnSEwMCPY80NtpnY/0pWo317IbLvcMp22I1j/lVgkodnN+FQ/p9Zn6V6GISOI9g==
X-Received: by 2002:a05:6000:178c:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-390eca25fbdmr19248281f8f.54.1741107941433;
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:43 +0000
Subject: [PATCH v2 15/16] rtc: max77686: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-15-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6b0d02b44c8097453f704cbec9f02580fb869ca3..69ea3ce75b5a5426d4a56b979773be71c4ee7562 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -704,10 +704,9 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->regmap = dev_get_regmap(parent, NULL);
-	if (!info->regmap) {
-		dev_err(info->dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
+	if (!info->regmap)
+		return dev_err_probe(info->dev, -ENODEV,
+				     "Failed to get rtc regmap\n");
 
 	if (info->drv_data->rtc_i2c_addr == MAX77686_INVALID_I2C_ADDR) {
 		info->rtc_regmap = info->regmap;
@@ -716,28 +715,24 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
 					   info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(client)) {
-		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(client);
-	}
+	if (IS_ERR(client))
+		return dev_err_probe(info->dev, PTR_ERR(client),
+				     "Failed to allocate I2C device for RTC\n");
 
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
-	if (IS_ERR(info->rtc_regmap)) {
-		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(info->rtc_regmap))
+		return dev_err_probe(info->dev, PTR_ERR(info->rtc_regmap),
+				     "Failed to allocate RTC regmap\n");
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
 				  IRQF_ONESHOT | IRQF_SHARED,
 				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
-	if (ret < 0) {
-		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "Failed to add RTC irq chip\n");
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog

