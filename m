Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF7C33032C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838282; cv=none; b=KRdCBzkk8+PB3FO4fa5e3TADBhhlsTIj8BUEsqQIKxpi02NMt/6sKpY7XeZXWi9PzsRX6WnaoD8bjWkt7JrGzqxVYxtYkumsNUyx5MadvO/gxG3DsxftVZAn0Fuy56UcF4UFhbz/TULA0MtXwZtWysTj2JkyTb1cKk+kXAT4qzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838282; c=relaxed/simple;
	bh=6XxroTSX6ceg285T/QjRgJPmV5ju4e9igmyPsFQygJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXwp1NbA4fJMld+P0gsh9PycKvommQVlCa5nN+jsqwBRkzF/STfgQxcXnoOdXYOxXC9ET0u8Gilv8+dwRPcyq9SZ0m8rPefcInjdGVQu8X4ufX+H2XLHm9Ib6v0OTIm8aYbzbrQG+nEwgbXQ5hT0oCtU3V6rXdqHWuTHvW+cQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKW5uqxf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKW5uqxf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso8881523a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838274; x=1767443074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=WKW5uqxfAOHdjS47fUJahRY6oBRnl6oCH6WDe2Joob5HexBYd8+jzLtVn0dIyVS/LE
         3xjeoeibbEWe4enf8XFK4/bBQuZjL6FRLFkjKlQgXpEH0SkEM/KGzzQsynRi4odLCtxX
         fStYkmCL9fsPGfh2apnelE073KVs1pL0UggD+/7gsTj0oeKcHHX0w4bCfIama1cR1hsi
         jo8JbamkGgILyOlW3lWs8jOzu0IWHxWVVoS03DE91W4uF0s08S8t+0fOp2I81R/tPKLx
         iS7MFhQVZmCRIXbjEy4RQyoVjppKXeZOULYJhdWik5DIX2hErfAS3ThqR4DGxTQ1B0Bj
         CbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838274; x=1767443074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=Rk8dJRYHjKxh9ahf3gEVRyQmUxKbGXWTki87DVcvHRi1AxZ17oLJyMFSwnoeydyq83
         vry0wN3u9xCHl1U5VABFhIEGEG+DfeYoF+OsGAJHumwhUIPWLETvFB6hw/g30DcpFU2I
         D1OijHDyB8/cuUJdrtYSn6IMHPw+owCAG1AeuWRaTAGGgBINhVKhGJfp7KM3x1UH4SyR
         6YU4+g1PDABK25XRAmnV/IskZmQ38ELxz81wPKvo51KK88ajJ6dEJP44n/s4I7lazujv
         e5On2OXtgMrz4W0DSqxfjz+Y/sXRhPjQe4RVO/RM0DqbfKL8fJ0NGK/0GSxsER6tvbPj
         lImQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Cx7m7z8+01nZvXJ+/8ZwrjuF/IQXsy4CXON20PeyXaXLECrUVMMC7RmiDdG2Yrv0Wb03oneywN2s1tf3rfgXOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRRLkBi762eGSm/NQDM0E8/NR2VjLdWuOhwRQlzC4RrFl4I7nL
	O3EyH37zUqj34IQegnLhRS3J2lu11mJRAfw52D+SLFrsLrnEKVAuQlTtYtp8XXvSlWA=
X-Gm-Gg: AY/fxX76IDn0fl52peTzJB0jtOlivVKc3RX0D4yfT3kbr4RVa0ol5HzhrwPaM3SvE3A
	kriudIgXownRVQCRbMNN4RoJvEg/GVzxx1XGreTZnWV+pVybM1dTNmNfN5lDwbz2KtcFZxTvQiU
	Mjiqfmvnl4dNOVBoKiNquBYocOtmiV50fjUNVVAB++NAaz/e+gGSH/pxKQeaBuHCmqkV1Pr5j+a
	0OMPabGToVt9PBWrAyjdQYk0kNcamicDw4XI8qqIlK/nbwmCxSt+ZpnnnPJYOkGxWD9eRu6GiIr
	7JB8uWw8orScHwe2GI9dZRovSdshYwLmsCTK0rN9S1mYyDetG8JxLtP2kEV+6jgiTuuHHMwntn5
	aPlge0OEleISfPkmiwJ32lsenCAdEcC4tQd2yBVXRg/Utw4v4XHFcEtIyWDMs+Z2hcBkMwF4CXS
	6PoZZH7GeDxjC7Djfn8gQF+PtQ0iccFFR9nKQOVQvfSXsgf+X9lg+qFIwtOH6+fwtNLyOBDI54u
	fE8NA==
X-Google-Smtp-Source: AGHT+IG6Z9bYMcuGRg69WSp8yaR92k8YtvKMhYw/xt3cg0I4I04maY0SK1m8WoeJjsZm7hG2dL35Jg==
X-Received: by 2002:a05:6402:27d3:b0:64c:fc09:c972 with SMTP id 4fb4d7f45d1cf-64cfc09cb6cmr23518296a12.17.1766838273894;
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:33 +0000
Subject: [PATCH v5 11/21] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-11-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.52.0.351.gbe84eed79e-goog

