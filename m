Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF6322DD1
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197298; cv=none; b=BnC5+aejMTnD2C0oPW4AuBQcXx3SXDM26/5k+haus2s3ENRtV0PoSWN+V5s/4ddFOWzzQeCjr1QAoD6UKO0jmVE1u85rB2HMCLHfFCrAvllpos0iVRqCzA1KMbBmUErITCGjUHpWO8XY5vfoWzt+6LDcdNPehfYHCPfXZAfbueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197298; c=relaxed/simple;
	bh=uixOjz+0SA3kol75tGPJYrKw2nQ7/TJl/7ttl7R4sL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se8XwTIjbmVAdtwKZb+QklABXDHSHBVrHBkALWniJEryfWjDdopRJ4BYuyH6h9Izz0teP8EcxNr7hX7fcyzViExk2aECB8M1Ow55LAHXKZQUeFNmbQscDw6dUk/85bHaYzCuqMS0JqBpYFLgnkHMtNnCwZkkniolY02QCFWpdiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeU0Rh2r; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeU0Rh2r"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so1595440a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197292; x=1762802092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKs9Oj5VQmkz0sdNNGYCgivttboDuokbmkOd/J1Ks54=;
        b=FeU0Rh2rGj8JXLich+y0mnw5ejIH7qM69QDIpPiTZG0u0bab46Iryi5HaOUybkKRcT
         WohJ4bvClqcrpBJEGARjaGc4gjsrMxFfxGFr6vWjCQ0ZQV1+HvAEr+zr1NWEthqjba+A
         THKIyg2+tjJ7uez6s6WTnOKHZvhonzMoi6S2mtH0SzSO/NqBgMsoO2wyunc1E15VuWdH
         zaD0QgLKcgtC5HQoZQHd5M2+5T0rITdUQ3uK0IriVNoMQVFPDTEuAonbGZF2/1FjgDdx
         7vW+yKdwHb6U2T+WrzAFADWyBPM6WB+msZPuppOMXfbsZFA9yjG1azYTRjxh0/n5YGLb
         V5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197292; x=1762802092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKs9Oj5VQmkz0sdNNGYCgivttboDuokbmkOd/J1Ks54=;
        b=k0oX16egKP2fZT0N1G1UOEnj+f1moQ6CBOq5ERG0ppAVU3jNTC8EVG87Mm0t8bZzGJ
         A9WmmySvfJ22n3xE2joq/IJLBA2wgLXOF0qtCmgp8SuFCzQor9AkjZb0Zl9c4UwrE5i4
         6+bBp98319gTZjXc7kiD5VvewSTfcsOEk5D9NZemSNFkeLJF+0Xv1C5/8iwWFqxDmKj9
         ZMEgqug3RtwSozUb9mdroknhz9cVdUEi8C8VZ0nzqfSr+8ed2YAV2631kWe1YI411z48
         P2/PYShXuK5fugtsRUhamv3r6ov6CxhlJ8dZXlSU/+fpZq2IEjBFpamAJyYD0AtEMSGs
         0WUg==
X-Forwarded-Encrypted: i=1; AJvYcCXVV74n9C1aZunXSlM/tGrMd39g9wZy+6pc61PRaHINJ0NvsabpwgBAeOMqy8plYbFnyBMOAVmTMuDpfDQJmjjiLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqYGdvCSY/d/zhl2lm1iF1PpttdCje6LNk4IgmpzFsITZiGJ2
	YT3+qTHU8XtbBsBp9YnNREKH6poosOEI9R2E+uw3Yqm5XvwnXCwJk6dr7sGp1ETxakg=
X-Gm-Gg: ASbGnctfWBfODwO4hL+c5nF8bflCsfDWRjk6DPIdQvGOI4lFHlovEaQp/JO1/+r9/qR
	oTD5a5VD5nPc7QuKyGQlgCLAwdw2QPQDolAVK9YfAPz08fpEcWbdeGO53pc6l/mDJp3uXoWRfxC
	+QhHiJqWeA9GGD6xUBgKKhhKLSGb3Nc24ZbHifC2Txi/ke5FKfdd8N9MZPZi94WCifib5Xy4FNE
	5L5CVuiZJuTYj0BBmQMnKWaO19iQH5XFN4I1d/dHdJzek0NIwPq2qntLCWjNOy6B7AlDJD6VTKT
	uURisUaOSC/Ufjhzrm5oSP6ELgQESRa+B+r9Z2zKvtmyBNpxGwhJ+cOEu8PO2rxkho6Un137azn
	eTIiJX9SqdbQQvlrpzaYSadVA7xf7reV6IGBvUsAeJGKAgPik44R9b0kX6Yq+imHTrs0+XKTP8g
	GqzWQaOr0URrU9dUQN3VOQPz2lksye++CS+9h4v/rWFEOqwdnSnXPgu1Wcpwb6y/hRvogfzug=
X-Google-Smtp-Source: AGHT+IEMpLKo6meLeuMeJSonvGyQzXHsq8uVBF9rWMxpzcbCATS3mtMOj7CfCciTHrODaqgmdS5IMQ==
X-Received: by 2002:a17:907:928d:b0:b6d:7f24:8428 with SMTP id a640c23a62f3a-b707082fba9mr1447423966b.54.1762197291687;
        Mon, 03 Nov 2025 11:14:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:56 +0000
Subject: [PATCH v3 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-17-b8b96b79e058@linaro.org>
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

The upcoming S2MPG11 support needs a similar, but different version of
::set_voltage_time(). For S2MPG10, the downwards and upwards ramps for
a rail are at different offsets at the same bit positions, while for
S2MPG11 the ramps are at the same offset at different bit positions.

Refactor the existing version slightly to allow reuse.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index aff85138fa5da4cff83bdec5cdb3086a58afc7ce..d840aec236dcbdc8b460f89b4cd04e42e3b3da7d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -561,26 +561,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
 		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
-static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
-						   int old_uV, int new_uV)
+static int s2mpg1x_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV,
+						   unsigned int ramp_reg,
+						   unsigned int ramp_mask)
 {
-	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	unsigned int ramp_sel, ramp_rate;
 	int ret;
 
 	if (old_uV == new_uV)
 		return 0;
 
-	ramp_reg = rdev->desc->ramp_reg;
-	if (old_uV > new_uV)
-		/* The downwards ramp is at a different offset. */
-		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
-
 	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
 	if (ret)
 		return ret;
 
-	ramp_sel &= rdev->desc->ramp_mask;
-	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	ramp_sel &= ramp_mask;
+	ramp_sel >>= ffs(ramp_mask) - 1;
 	if (ramp_sel >= rdev->desc->n_ramp_values ||
 	    !rdev->desc->ramp_delay_table)
 		return -EINVAL;
@@ -590,6 +587,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       ramp_reg,
+						       rdev->desc->ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during

-- 
2.51.2.997.g839fc31de9-goog

