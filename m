Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BCE330336
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838282; cv=none; b=Gi+WR3DngrYzbl7vGGPOmDqSLyBILbsTwxBn09lyIl9ulILJS/1lsGeoYij3cNLDjWfM97FCy1+mD4cIYVb0o8B0gUja0BX6b/I8a4rGHwuVD54uCsZwDBQ8RqMQL4rmATh6M83NOt+DiY+f+N7tQrA6SphWDhTFgKp3cCsdvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838282; c=relaxed/simple;
	bh=e/SiWjAnIf9n3ju1+W9LofDtIoMCJ1iK1OR2/pq7g/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqH7DiV1uK+aJOnzEbbX2xCda2+e0lQrUCbIvzEN7nh6xI0hYPF7TvrrgJNBDeDMDcxm6oeSlBVA8mfERlo7QcLvlHzgwmZAAOyIOA5IBjceJLSRhw5femPj48Lca7Boq+pRBdAzBxkCk+7iuQ9oHNfHaB0fxpzI27RoeLlDtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uaqAa0Ny; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uaqAa0Ny"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so8179884a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838275; x=1767443075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoLuiqrhFtLQqv/1rhd/SpsoL8e5z9S5UPDgQu4V1bM=;
        b=uaqAa0NyAXnC6DivFTOCG5MkBvSoGl9LYeqAKBVBLPAcRjntCGsnx7z4C1TE6sWBi6
         tirNm+L4sMdUNEDZMxD5tcfUpu75iI7CQQLh4lNx+CkJyCJC3EnaAhh837lt3G5bWan1
         M7ReAYSQQ27n8sl2QlvqXbTef1YeE2h4NWU8bifVLskzCPfyxGDCoCTt2e4F/FI5P60R
         LLlgRY2qk6J9dKG/bXyhWlhxGwxyea/ef/Ml2ZUc77gQPdSc6w0cCcz6bKK8JUhLXp+y
         jpUPwzQ2BV3s4BbOSGHfFc9gos32ez/ZY53Q43vglEuYttGXKsL7g+oS5E9JySEQDsU0
         c9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838275; x=1767443075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZoLuiqrhFtLQqv/1rhd/SpsoL8e5z9S5UPDgQu4V1bM=;
        b=cH+0g1lJa+BIgtB98Oin50YyY88h3UMEeLVXRrJrxGZzVPZRShlqrWcbOQzjp/yW9N
         7EA0iwO+PhfUyWFl3cKZ2xjSsigSa0J6sog4hOUWrv5I4GsM1Qq2d8sIFME9qwT850mn
         h3gwUuLHrZ1+tICRE8M1iFnem+TaHQ7pTTQ7W8tudennUaDhLsXUPJIDnehNALxPny1I
         IjVmFCjYmrNTv7v9Bp2PZohefqO7xIFqHD2XBC2Berf3aQLe/4VzZhwDD33xxpAlJ8K9
         o1zn5TjEeSq91qA4cAGinmJeACw7b+AWaKh7Gynu1YOQ0xtA8wPRHut6X87Umloqv0qu
         yDSw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NRpX4m41Bz4ZXV5UsnNGXNXpL9FusZ4ueXdidPXuvmcml9mV7kD+Bu6saxKdEbntXX1UG2ZGCGSxx8fP7QhRHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ZrwsvPG+GsMVheS5FP3MoNZJE5pKrCre0iWdqY1kON83kLzv
	FXqHq2KCvI85OOFs0T/OxwD9/nuWKG2BLJExjzpi4dK4q4f5zSY7JFP/4LivMsf6G1g=
X-Gm-Gg: AY/fxX7MtPexDTR2BgpIN6HsIlqipSMjYKGPpKo1BOYZ2rfrCNTilib8a9me0r0ArdX
	JuPGRRT4Pn6u0tDM8zVDHCXlfCHRlR7LtbEaQ/gvEDP5JBLYFUmAl+t9pHRXS1DyAK8ETMGkJcc
	0tYT5emweGNDxYlwIBOv0ZhA4Z8hQQu8Xxh457TC7tH07CJ7Qr9Pc5HBcT4teIdKYwTVDyT/rFQ
	1wkNHIpjgXRv1gnaXgq6Yle9iOSDbd6WMqDJ9sIsIMtbsKXtQe9qJ2KOlT1V+3daEdGIvQwNpIV
	QfMBCx9eb0OcpaTE24f/axh5yte6C6Zxy4EbaU4y0v2IxOHJEHvxjajodH24Cleq/z8z0YZ1EEY
	uODVc+dZLOOB8zCD0OiPGAJyQoznGYivDuqYhyOXF9ZpSACwJ+KdaL+igSyb/ByHLFm/1ZhAc4K
	kEpIAwA9D2idPMyLKZ0oPFfcFmQnI+azvLNTxeabCM1VxaTYn8Q3fFr/4khHzqtcGtN7/7pz8qf
	7O45Q==
X-Google-Smtp-Source: AGHT+IH7wAJ/P+jJVtNfBeGnpt1N0Pf3Mi2lV6vQQtLZoDkUjgfiXG+M7CBhMUY0mH3GH8enwH+fbQ==
X-Received: by 2002:a05:6402:144a:b0:64b:6e44:2c6c with SMTP id 4fb4d7f45d1cf-64b8ec9b1d3mr26064195a12.16.1766838274892;
        Sat, 27 Dec 2025 04:24:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:35 +0000
Subject: [PATCH v5 13/21] regulator: s2mps11: place constants on right side
 of comparison tests
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-13-0c04b360b4c9@linaro.org>
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

For the lines being changed, checkpatch reports:

    WARNING: Comparisons should place the constant on the right side of the test

Update the code accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- new patch
---
 drivers/regulator/s2mps11.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 30586e9884bfb998ff07e3148813344b307506c0..8a36ab67b73e4151c7f67af0555a6465ee1e7a04 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1221,32 +1221,32 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps11_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS13X:
 		rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps13_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS14X:
 		rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps14_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS15X:
 		rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps15_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU02:
 		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu02_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU05:
 		rdev_num = ARRAY_SIZE(s2mpu05_regulators);
 		regulators = s2mpu05_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu05_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,

-- 
2.52.0.351.gbe84eed79e-goog

