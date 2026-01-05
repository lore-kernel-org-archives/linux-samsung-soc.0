Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD932BF54
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603714; cv=none; b=KbpZaq7JJ00JHj7uRbv9Fv55J8jIEGVxVICagGVB1EePYgmiDaaw0vTwdh5mSJoD0bRTaBM+wLSOkyz5eerRIOBXc/YGi0DfJE+HjSYwduBhTl73NEci39YkXCw+g1Oi7AArmLCN4WgX5NgyHrazqQNwG4c2udCjq/aPYEExW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603714; c=relaxed/simple;
	bh=6XxroTSX6ceg285T/QjRgJPmV5ju4e9igmyPsFQygJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho5rgTIyiMfpoeww84eT6u9PKYZiO+rWfezw617o4/TXmxnMEDXxsPF3dKXiTl3EngbwKTaR0KKDtH52aEA1kXIyE9DS/ejTa/uZHh3k+KLPc3fioD5lHLBxhEvSMl+Of5yVT2rHPTASQUVSfLN50tWMMWI//At7fyFXurJhGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ScigQ+9p; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ScigQ+9p"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b83b72508f3so539045266b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603706; x=1768208506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=ScigQ+9pMifAw9W8DMfDGBzMdlpwmoLb1+sNTbTkpCOIDVI2GE/S003niyR/BJtQSv
         6p/MhFEhIcR2GLTGwYXtK/9Aalc/nCoTXaEpc4mQtASS1o4gq8ns4wRrmKtJKmEgdPX0
         A6FlWtoqhgv2nuxARWh1yWjAiAHeyyydLA864oLP/GvZCMQwCA9QQGn89enbovn4vO8b
         cCxBIRzZB0e+b7L9a0P5FUeE7j45CMq2/gpVM7Vau6ytS2aynJPyhfhAYlqyHSKlvbRP
         +NTZozWVf8P1Y2ZReRRr/vJPohxI/g1VL/uoKSJCWITKgx5h/gry3w7xchdPUsgvSCLC
         WnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603706; x=1768208506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=laXXr8Ih5WhrJc6tZK2u4B4wFF/ypFpmwukgNuEQm9ybwHOslrxiTAwMbKrwNvP4sd
         LAfFLhLql+xZL3PHFGux2xR0DHp2vxPv0pWe49zeTTqPFzZDG80JK08XBQpUciM1JBF8
         Eanmh4J3cFvz08w17sgAkmISHzly1lOH1W5tEHjNf6oLgQvipxrF0nzuVv34JmIRq+wT
         BOLKGiMyxIKDPW0KibpWMSclM3ULTgL5+vEtWwGwySUYBK52c6PJZRVfhUC2qEUxhwEh
         c9n28pxjYArcBTA662aFDDHgTRR1358DH+aoSXypt/5BMDju/2P7yrEp0X5FOOHgXZjD
         IGEg==
X-Forwarded-Encrypted: i=1; AJvYcCU/snSDrGS1pNmg5OliG2QBHBm/wbvDux0vbYQs0UdlYMRJrfy8/FQVYX1UdXOsALm4tuXNgwlMecBSK7EHg8Ai6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Hxa3xvJxrEvoulDa0Zn/PxC11QGHcfMKUTjWZ8zmEVGXFwh+
	Gei02RsZ+wMEU1388BlYKvHxJTsiEGJDUcfFpERtMHsxxgJRiEHfpYL4dIdiejb0KrI=
X-Gm-Gg: AY/fxX6oIAqi1Flh6LiytOMat7YNQhQRKnyCT6nQPCRcEe4dgYDuqJfCAcKXpUiIfKT
	yVbfFYyXv1CiC6UlDeWacMn+3KgGWysJJgyoduZECUHoe96DACJr1pagoTGcEdck4JuYfTwbpu/
	o0L6tQZ3GyJrLqmHrHEvT8bZ08U4DW6Xw96m4C4YWvkksiCfF6OyALZkx9frjFMKG5NoLQnx1Ig
	pNf1ax5opU8Pe8M2AcYKUjPg6vg6Z4gypB8b/QWCqS1qBGtI5jhIJ6o/um5xVAGuj8+o7LDtzMf
	iNWKNdlsi3btPmgvkDvUK1ZQt1so5BOWPJdh3V85N0Amk0w6meysJCGNACmfGm8yVXT9Wq1wPPw
	dRBYs/qFu06HbFxQTxmLKtU0xzytLiP027eQOscyNGeanpGu340YsXhilkoS+ShEQh5ANHbePWE
	B1ksg80p3W/2pRMNpT2+7DCYWFhNAau+z7enujGZiDRqw7z/pHrS75vMEdbu3knrxWvrzxDbIed
	uUe/g==
X-Google-Smtp-Source: AGHT+IGqO2/A6qUft2Ty36ZkoKJQ250NpUeCgwtCUExj2hkku7DKz2zpfH5WwcKxMWgUdFnRgc8Tpw==
X-Received: by 2002:a17:906:730d:b0:b73:b05c:38fd with SMTP id a640c23a62f3a-b8037183211mr5065467166b.50.1767603706149;
        Mon, 05 Jan 2026 01:01:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:47 +0000
Subject: [PATCH v6 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-11-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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

