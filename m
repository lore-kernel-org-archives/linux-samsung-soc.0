Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146741B4233
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050754; cv=none; b=njKFoT/kLUyT/wyvOUAxP08FtG9jF2VlWjImORkk+dl2QVrboYzJSlMPOAvUrZVlX35616K63MczJXw3ct8Wtp0pyBfiekWlerGYIB4clpriZZa4goKCC5rfoVoTN7K+4B+3v722KO7IJGailxTUZHYDcVgP6LOlKvNCPOjMsBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050754; c=relaxed/simple;
	bh=ZloWrNFeMmVe3/HDuD1aXKWP+8PNEOlvbHUi95SknjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0PSV3aunznBBKG3T+KJf6Me93my6WIwIvhLq4ilwQQCCkVt00paI+GwzJAy+ibxVsaO6Djs74VTuGa6A9Sj8gR0g6qci8kW89+qAe452xtFSkS2j7VcSPjqLVwrKvmP/WUEZVG4Th6u6YYQGyjvE7qFz9SEDn0AVWAOfQInWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEEDtvhr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEEDtvhr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso12822898a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050750; x=1749655550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=cEEDtvhr+N7PEGXPEhrUeFyCa2qMbNtm/P0Ohq03cvSAEPWkKTQWaWgvMzPAwZ3viP
         zRE3yGsRYKJMYizY12jupVh2sj3akcOfCWdc/140wTbE2OBIDZWodN3ul+idJosE70Wl
         BY/6GrHREpcUeewuFqLXsOvtYOV1JaskxSaHVUbsJyyOHlWHBLbNi0mNS/pfnmupNFSA
         tXt9l0KeJhXI7DAkb0Zl2aQOo6P5IA35b9XKeGqJJURCP+AVdn4so4fa8Ezk3m3TXbqv
         4dhlX32QPgpnBAjxfTJCg3PHnfEAX3Ig3NsyaNCKZKqNb2OwczUasGSt2lB0HXxTLiRm
         QM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050750; x=1749655550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=aP5MYwsw6PqYZZkE0N/QCveK/VayZWBuBAVPQYLqMnUhvxepTroqr5heV7tMiqoAb2
         8rJVxRWQb2RovJiEaG2+aa3J+I1mf0Jog+SaXYGYbpVgRUz1uzSJ5+BP43PfVw8HNwwp
         6x2kefPt560ydpr1tp6e+t2JkCbEFiAxJQAVdv3OH6hoc/B2x/yeBpYwL3rve3aej/qR
         VP1pM5YbelmQcWOcKu2bKZ64W6F/YUMLomzhQlw+5XjUCkcugyZL4TVNxkXnilMMG9Um
         SMFmUcFo3w1AHNrV2kIYXvU+PH/6bLxoxyqY/3liZqZtln58mXGUoN0kUagEOx1CjdkB
         pNWA==
X-Forwarded-Encrypted: i=1; AJvYcCU6/pHZMJ7orVuA9Nlot+bG+jB5myyD8kTqR74i04uqS77htS2VoVD17lPpizbSyREkGisVzbp9pFqmU0DYs5jw6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gpg1KjFDp1QRuIHwqiuqOyf7AM2RydywkpClfD/nO4Gc8oBK
	+AVtvvVODGO7m3e2OE47Z2SkNnHtWJaPBxWzlnFS4g9Jgq9d0PvWA/jOWimqBWQZmZ4=
X-Gm-Gg: ASbGncvPog/nBvN5ezEQgvyyW5o6ZjnOeOVcI98tJjcOCu51PUms1Y4ifOXoFBicEfN
	bDdZ9K4uiS7P0DPvMeYleb6JmuP1zf/uzLIK1EX8W8JLrsURNpC9JHaxAwq1aXlXwB8a3T2rYQk
	LPy1+i7O7tjLdXKYMZPp3fBt8/RTEg65XKETxPhTzDsGZNRjEmSiX9sAT51jJdF9mOqow+rkgvC
	jvoRbE29LXALvdmXKsFFJXfyfdAxiRnpbC52cCvN3jT2wsmpjUVyWtT9XLUV3I+5/KxwstvIGck
	TxNVPnIIHaX41jS4XRLyUzrcjGUxJf2bFsEQpqhU5UF3szaeCadGvR/JvAmeCnfxjIYViWvR60V
	EUnAV3IzEmNjb9S2EAf5HQ8LBzTCg5GkiA4irjiTL6ZI/9w==
X-Google-Smtp-Source: AGHT+IGie5OT/C4dKIZS01jGdu9pcMB4S96GfIIlXrVLkYBNWiD38sd2vviPzRoeqlZOJ6SG51yRIg==
X-Received: by 2002:a05:6402:1d49:b0:601:31e6:698d with SMTP id 4fb4d7f45d1cf-606ea190c59mr3038407a12.23.1749050750307;
        Wed, 04 Jun 2025 08:25:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:48 +0100
Subject: [PATCH 09/17] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-9-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
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
2.49.0.1204.g71687c7c1d-goog

