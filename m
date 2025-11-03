Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90229992A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197299; cv=none; b=mS71JpegGZekBZrRo9xWpkg0Y/akcGD4m3SvcCjlPUH15yjdDYj20GTaF2Odg5U6yKZFdUqZ7qh6d0XcsKda7rbjGl3DDj01EQmfXwkAUecYGRuZdFVdS9oGr+0MG4l0hqrlGxUq0aW5L+dCx4Xuhl8EmHDlW/48oOeX+PZrqXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197299; c=relaxed/simple;
	bh=cLBJsaXRCjW8ED7+56uxdLLlUd8ALRghlBAhPAVov44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fs5J1nKFUytm5ebSR0K1EDigT/hXSuGvgNCS96ryIh1Cvp2f8Hilw68N7jEkBHNwLeWNNQ9eisNIH+NHEfAmc20+tueg6OHvlh7yU+jyJdo1JlRoibz+RlMJmornUTwa3X0IClLLyyi3PYRGYIX678yHf7Oa1m1LhlVdAqEfAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRFun7YI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRFun7YI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7200568b13so55956466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197289; x=1762802089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icN5yYkXgcEYignZ+Xa1ClAR+0DBwP6iwKaUoFu4GLY=;
        b=VRFun7YIS2I3ggIfibtlAWO0MT2KlFGqgYEhDHxunMlGdyoxV7oQSeTsWu7qVumpvS
         2QAdSdKwOnGAsrwjvwzy/4LfVt2txV9ixmqRbjSeFB54XQiVEbSvWpg4fwCv2Ru4EAiY
         SgxLTX2OOmDF3nAbH61XIck+kixvQRNOeg4YdCdO4cKfqbaLIqCEiNl4dNdWcjNMRWoP
         yLXlZfbmeDwTVpNw0r7P/aAD8tYssHRUvGFtpZfnuiJwLZXgcuDwp3L4sUMAuAgcikAa
         7St9LvgDBiuv294fEvdkx1by0I10nCEX15MY0tAtbaf6idY20WSfOYkkbTzF2t1fEa6n
         KZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197289; x=1762802089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icN5yYkXgcEYignZ+Xa1ClAR+0DBwP6iwKaUoFu4GLY=;
        b=pn/bjHOZP15Gv0XeJicYuTqGb80y0ZGr2GdY4N4tcYuZ4jwd7j7D6ZZfCMCfWMixkL
         L29qgkJKI6Usdwhwnw+wfuE+8nOGZJdbjXR7uA2Zsp1IeZm6VmfZekcrTTkSAJDDfGq/
         4JvL/5dV9pJ5z/Jk9WqRGhiur97GtdHMWh7gkUoDqEU1eUpBilgzhHnnnMS+GyNEq26s
         MTqt1bQwSp1qeqbj4ANZfg4eCQUE9ocWkNrnRZdYb0AeFjVvTHEHfukV26GNJiB2IqO6
         ED0Miu7dFI6DKYKRqODWoVUane4SKpd96X+FmYxmYz4QLAislH9sLmqi+d3vK7J4rIGI
         aCCg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Yjz4edt5+o+qFtKt8BeVErw4yzRh1raVWXsc+FGVMkfQ1IF7epvNegezV4HQEZ0RXAsRpRyn+qz9Zzg+7qJbvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCl4vaCChkxYraaGobL1fD3NCbt3rAHy7WgkraQ0TLNoC4xWh5
	vZjXRZg2PFGunSfurWTZLaq0kJhtOvzCsvV0tWZAKJHZoykrmH5mShwnof+lrruS7ik=
X-Gm-Gg: ASbGnctVvQNPbSohJeERhmRn1AyWo1aDyovo+Dt97+zVNo5MGHFdMDIjyho9bCtwtqa
	mAsL5P0MwqHlHFfiw9y7VTSvb4J5ht4x5xTg1nSYKlOVupXKjA/O3sPfP97FbMXwtAG85q5l6+L
	sDPnKMXyH71PKCJ23RmwYrdNfnIS8negQl77X1yKnUB1zCAQ1oQX0+MMTsexdZi26gzLiMw/Eb/
	oKauhock1nf2O0Oy+NOTQ7Z8rsS+JKf7+yGjNLwnt4YOvH54paTomykG0Qb7ss4KCvZ6C73Szy1
	zpwOfZd4CsvH3Qy9PhGkGPCFTk1HBEsDmZJ6/v1HnspoYjqi32xFABS/i42qm5TfuYvnoC0sAD+
	H2AhcpMXKmFTl5y9yzvYrQSK92rCSIR0/dYf2vM6+ky3eSnDxUd/R6TuuvNDPCi5efxX9tB7Xji
	cU5LdhSEpBGq69TffG9ZtZ6mq+nCQTHfRG1IV40YEvj6hdUmg1djHN3FF9ratUyytF6To1ri8=
X-Google-Smtp-Source: AGHT+IG5Udj3lRW+AqeTrbpalAuPKgShqrf7tFTaxqWNlY3DqKR8V5lRcyVUxOq5iUJ4O0Pi32zz9A==
X-Received: by 2002:a17:906:6984:b0:b6d:c44a:b698 with SMTP id a640c23a62f3a-b70704c5a0amr981892566b.40.1762197288829;
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:50 +0000
Subject: [PATCH v3 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-11-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.51.2.997.g839fc31de9-goog

