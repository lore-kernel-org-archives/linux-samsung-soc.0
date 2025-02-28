Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321927004F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751656; cv=none; b=BqLOa4Pp207y2adiae5x2F6oQiVlWh3j8Y0Y+r4wWphOd4ZrrGT65T5/D/f6h7GHMsiWTFdtaJBLGx10m/hUmsmxHY2yLtnYQFn25DbL1NciieZpXCYooeiJgNSiiCtcCk6fGjyy/q7YmRNnmOLvcu/JVc8B7jWPpgI2jHBsZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751656; c=relaxed/simple;
	bh=K1YnffI9DtkL7cIsY9hYSQnQd4r9QfJylkyPV44F0aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhLhFv5iGQio6ydixTU7Yay67x6aIW5/HcHCe6/qGEVlq9qbKmZBmy+wHTxNjM4Y7l8RuNkHcFdIi+BjfPNFoQOjn+YUSuv69ufcwQGEeyYZ7gGx9NZF0odaZJlYTLSw4dn9ytirW9BdXdH4qXKpZMqb9tk/w4jNKFaz+akxHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fq2IaRUD; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fq2IaRUD"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so3334682a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=Fq2IaRUDGGTVcTdoqKq/uXNxxWjhVn03scZGsguKU9PU6Q0wr0ayInn7XtBuXM8lz4
         yDkx/GrB1E4zpJkmJXPxTgADPUi5N0GR/WdHsCpVJM+GzTJOY/eL2r8fFFvzp4IVCXlS
         ilpuIWd51quE/qXKrptdngdnQPZcI67eQkrlACdOCfLL22RD4zwvcC3rMIG039pnSXSD
         TIPhWmUu87i2MWzhQyi+QSEfxCXj9SKHRV5AEsOQ+ATzphTuDs7TayRYZQvCm5OQ0NcR
         M60dpxpwomQe/KYzOgrQBkAvWFeLd7KhDN2FICurQFrenTeayj9ihCvSdrvfzM7MUSk6
         ABIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=w6gTk8kCpObgGpApqJ7onvlJXumA6Iolz/iLPuflHuJ0RKExI9hePNC7ch9ZNA97HK
         zrw+YPLDVU4fUyrwK5pfsbo+UCZh70EpF8HCWBNiVP/2MCrVvlgtS2yDAn9m0To98yEb
         sxkh+n1PhWVGGFdhfRHVBiiRW+W5nBwHXM1dCxbOFYjsKclJV0xpEm+G9SbsHfXAYBc4
         WyG3ExK0XYMwRpMbQsKRK2dfcoDO2r1pw30mW33FpOdgeotmkMS/zZ2jMmNwZKxi39Ln
         LbFP3VkYrTkqDI9TK8OAUP6CTyvQvP3azWfnllCl9jf7XPNAFEKEJBQYM5yUXxDfGEQU
         bRcA==
X-Forwarded-Encrypted: i=1; AJvYcCW2YZ/neGPb/6P7lg7Jj2GqJrN7VUT0qzysS0CxsBLYOY9Sbyw7famjd/P2aFJ+LWuPxVT1S9klqjEfSYCXHxfXug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30hkiJKZX5g+9QsSCbKANc23mEBKN4XwTjcw3O5Kjm7scTQ8h
	YDNmHktz3fAtBI2fmNVVvRHDtB2GFCynW2KemP15LDv5aZmX8uMBC2IusL08aVM=
X-Gm-Gg: ASbGncuuN/n4o/ssfSShk4mIjku8EAS/MGkpLJCx11yVuIuXvEmdxAbx7TXKcChLAgx
	ZFBjz7aZArC1dwzI1EXbO5RG860lL1PFh7YM33PXvm++0/COx07c9OFmYMRL4c10Q/wY3bXO+nX
	YXpm3DIos8rjHJgkNf8hptyEmkvEJrajBl2iLJd/nWfBHIWt1c5SD4eeM/lg6v1BJJz6HLaaTJZ
	xQtEXXuNjLkcrfXC1Ita2p/r17QVSAWxRBm7Pl2ls0ho7A+m1fiN1ekwhjXZz6lC472f03nhYzT
	hE6g3aG9L4agRo3xWfzQE+8uVeyLvm6oxBbCa7kpaT8oicC2A5TKbOL7jE+2kHhslIZq7x08I/a
	5y6GYuvYSEQ==
X-Google-Smtp-Source: AGHT+IH8oBqlrNujitdioxAVXjdPgLAryRZxpXTnrztyLFYptlh+GD/CB4rbFiDA0RhEFxZK1lBu3A==
X-Received: by 2002:a05:6402:35c6:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5e4d6ad4a6amr2900190a12.3.1740751651952;
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:30 +0000
Subject: [PATCH 17/18] rtc: max77686: use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-17-b44cec078481@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

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

