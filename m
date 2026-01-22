Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3544CF25
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096642; cv=none; b=cJW58YfB9fFpvTDtyxg86g4t5CfHG9ySXWFKMzlRiK8wrcdpi2vQz9WjlgGDEt415Z4kTzCgKFU8CD266S2iUKM6ZSkwwFLFezObFnfmPchWIjOliWFFPj/achEnH3MtXJt3xPyPaviKX89gwJ75sJyjBms36vS7Mfo4iguwXYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096642; c=relaxed/simple;
	bh=wZmkgKDnx+gLs+hVAjzPq8Ts28TSMZhJDdmeEe4ghKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLx0Lo0Po1Z11qVQr8L1VI+lWYeBClqnbQv9wWrWW6Jecko5XYEnEXuEAmQE8zwhxCp6EmGpF6ZqBRpHqlfpTYoJoTlPngeFrU2eJwCgzbfhqKPVBk451O9tfukCfA+o3eFuyorKz9oFWyE7rmyYXH3HwumnoASo2np+jRAY+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbQTwfBd; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbQTwfBd"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso2315401a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096624; x=1769701424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFHwW2bdepIoOkuLol6lBUlgXwxd7Z9UOUy1vWjRyW8=;
        b=UbQTwfBdZb9doROzA8I17uUkU+CXostUYYsbS9z50MVXeJYl8CsD43wk04GlqAyoSh
         9MpxhLSxXaEiRkRLKh2zV2nuQOOBFYUhmBg02hhRcLJD4XW9gO0pRLeUC3S/dk1stWtA
         WG0oIOuR+yNPGRTKn0bEGKpzzlEfEeHHuqpnzH3Lpg0MRx+ySE542AFXSr22Th5wDzoo
         upTzLC2rpTaZamVS694rIFqJiW0OwqbOjaKjnh/IT4nQqvRwz0LEvcmiaXbGafphHmI0
         d7D18Jxhlju6VgrD3PXx4agWXHoZjNPiO+L6vsVn0iVBuBxeHZbBNO2olNhE38qg0lt0
         l9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096624; x=1769701424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFHwW2bdepIoOkuLol6lBUlgXwxd7Z9UOUy1vWjRyW8=;
        b=YkMOyPhXE/vB3/PVQ6jV3rAgAPW68LDmuKBTaCySzExNSK3FQH4FdYGpboGy2tZCo7
         Ymrx0dNC+YkadA+sD4Ns2l/iwyuGqJDaIwZQgehRrgISn6KTloO2d8bNO9jy6D+TQoY7
         H5hNg9VH6CLxvkKuqpH0HZudWf3SeIctQZi12eJ44hDSd4IlW/htIbbic2aPqDSvWY1r
         5VUl/BVIwZAb2O8EE4u5sLhZjNKNxhituBWs42HrUxuXFtqHXwau2wv3RZ3/NeJpkS3X
         TgHT4wsofRWWzGaZeHMLtg+xK9qmG119GNqHnBs064d9EPrAIyGq3oywggHHdUMp3Qh0
         rOmA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPYV6AsfRcSaLu5QFDh0L505jGGArxOviEs0RX2fwyS0v4x3LJc74Hu0S8daNsGbN5w3oUECIFMeGVFrXgRaLtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rUEgqg21+Lnp/NjNSHqK7BSB+6+FitmDJ/kBNmsMtxuvVvfT
	mVYo+FlxeNLly4Nc+HPHwJmzW7tFAM9avxmsQb1iZnrAS4HHFAmrr/rRyGn6LDNOdDo=
X-Gm-Gg: AZuq6aK5QSSZNcU8UYzX01x4ILdCkr54LAfQqIfcGE9oplQV7ml3IvOCT3zZTTktTNx
	5cg9BT8vDUXVSjtIeKU+05IQl54DZUKf+q/tKCKV2Snbi4nAzFb8jU5bCoc9cBT4PAdszOyL1lN
	f10OfemTmQqKo2GkMwb/DtRGIbKWff4o3J51nKTPbEs+SD3oH/siSEUu37xLGmzNh+CGwbov/1Y
	GJAOqWaFY6cLP6DD3DYqcN5xuIDw/47l2djxUben8yXWmu4PX3v8ojlvBxITgf4Oi6e/eVomQ3w
	g9J9nDdOpCww25xWHedc33Uao7QKFfnAbVSyBNEsFpcYEwMg6QqWA0SpqwasmZKvpLoZWpZk/yh
	VBaHQzMkov4FeuxMLIOeFiH8WotNh4NBxHy0Os8120LVq3Z3ox+/AMqNSSX3P2ZQO9CjPMRXs+r
	1skOuMvZESU4tTgCO2l0NsMHRY7s8JNe9rvTGCtDMQRZ9EeoUDwl4nqDl4nqmwQxeMVY/Ee2B3g
	+0eSA==
X-Received: by 2002:a05:6402:1d50:b0:64b:3225:b771 with SMTP id 4fb4d7f45d1cf-6584874e664mr45457a12.6.1769096624145;
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:38 +0000
Subject: [PATCH v7 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-11-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
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
2.52.0.457.g6b5491de43-goog

