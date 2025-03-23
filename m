Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D81DD0D4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769580; cv=none; b=g6p3l4FJj5+UNXF68lq/BM62/260WL6p9E+vgqcRNUhVHbPEnhoV5wEt+YqiGJI0NYXyUp/NJOEut3UxKpDoGpOcovP168QYlJ/OpAWzVFYdKFATUNQdBcbbJWzmbtaSWnwZy7x6yw67y30Kqat5CUyeY4CUOSOQnQu0e88hPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769580; c=relaxed/simple;
	bh=CNr8O5YK2JQvgLnYqrPn1/s+31iKPD62ZA/NdspWTmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvCBzwmRSNLxUTdiHWtLGKha+hzCXytFHOAevR2/82E+KFdn4hQa0YVwZFmUZQ37HVNXfKdIIi7lnrkxfmzShMOBEQgOjySSBfppFcj38dfGARUsdZM8JdM5DV5MWXsnr2kBRqaZlQ81EI2AYnH1uvJZhJJNmj1sY0slrilr5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytCHdf13; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytCHdf13"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso588941266b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=ytCHdf13wQ6wy9w2OC+acXO/7QQuQ964Lje7iCXaJKOv5ibrRpLS397TcfRJR1kq7u
         PbKza7+Uyomr8s+8ztSGfVZw/Nbf0nhi2lv/16WaVGbdKhKdI6ifWqXtKbo0KsseLr1d
         olViCTOQvQenLyUjQzkPyfTmTlk4F7LjSDoThJoTkHYv0hERy8wl8Fj6AiApIK483BTi
         S9TSqX6zG24ms89OZcRG2kK/gtpI82ihdfAFTpk3QCWwRXBkfxp/X0gX71r0l+LLX144
         YzEGBviX+jBTOmnS/oZL/Z+6kAWCvkTDVryEmVCth79Ks/ALcUNRO7qtZJt4gDgzunDP
         p5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=Ja/kgnUtDIM8KMVhdV0+bW29mkvQnpOml0GDxVMOZ1JXfXUu6IKyy/SaJSLZY3y9el
         bi9wPf0MeQ7CAex9Th9OpKcLiE36bTEmUpgQY1l/KvadtoQzq7XT72zbLS/Vjbui8gbL
         xDqc1pavZarDp1Er96vwL0K3gLYvbxObeUV/aE7j7NLGMsYqLuMaU986sTuQ/xoesaoo
         7omrcGHMAjfdThmQ8FYAGF0BhK42eEB4Zt58B5uT/gJXjFIFjUs4XnjPb5frAyz1eBeU
         u/2UFqp6/erPM+GAB3SRI4E0IIlfvv5BcPXXrigOoP2O0hCXvyat1URLVjUhvQzZxsg4
         AqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuDpM6LVfOcBuujUOPuoVc30mQUae+qM1wHZ/ASIIbHnvBhlouyxp4bC/ACn3nE1zYKrkgR4uDSEIOOXWgtg8Myw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3OGQjz6r6m5QgDW5TYM307O2vhdVqg8We3Jzr/RKdet1lfRS
	n8EI00Z9SG4tWl6SJixXaMsh11mo5t2HkUsOLVAcyI3c2gwPCLyBnayT5jmHE7Q=
X-Gm-Gg: ASbGnctWZLYAHi6QdvX3MOUc7i5cP5gKBajswbw+RZpr6h2DVvAntHNXccIsHdt1XhI
	VkdgeGM1hzYqeKyTgLUP1IMIroVxSPPwkiN0KhKYUAvH57R7IRb4C3jfPaLWOAYkGDte2FsXmyb
	L3wpAIPaY/UBoSOZfovmsID4kRNerSS9y7ug/hyRV+Wxj6fQpKptWc9Yazf9FEXFb0kTnbL5nf2
	Z/A00Axd7h9Go4bkF6CguqxI7WQA0atDh9nOeL50+oUjavs8sDEkmX1B+Z1vSNsP3juUzPGTQJZ
	91RZ5cmyCOQpa9F0ZsnOWaUE2Cdj+DjxcRt7zxdNyQjBrdilu8OETBBSw7mCy6514pDnAwjDIoU
	49qIaNBtQKelDAhfI1EYDiOJDbNHD
X-Google-Smtp-Source: AGHT+IEAdjv9xEbMYB+Oz8xJ1E35q2wdeD2HNBvV+6r3g5vXOlzMcwWya0yXpD0Ui6X7vYMMVnjHVw==
X-Received: by 2002:a17:907:d91:b0:ac2:a4c2:604f with SMTP id a640c23a62f3a-ac3f24a7838mr974893166b.46.1742769573704;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:33 +0000
Subject: [PATCH 17/34] mfd: sec: drop generic regmap config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-17-d08943702707@linaro.org>
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

Subsequently, the accidental new users have been updated, so
sec_regmap_config is an orphan again, and can and should be removed
from the code. Doing so will also ensure future additions to support
new devices in this driver don't forget to add a regmap config.

Drop this fallback regmap config.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d..1bdd6ea36fcd9f56ea5ec1159a87723f4c09a0bd 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,11 +61,6 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -196,8 +191,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.395.g12beb8f557-goog

