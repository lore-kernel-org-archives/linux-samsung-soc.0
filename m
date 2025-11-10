Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F56338F26
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802958; cv=none; b=h1I0FD30ra3ilWLGp9VMJbZ1sbQKb5QOyKual23y9Bcm19W+BCCOTDTXSdeu9JqH33NgmFqkhjdY2l+p5hn6Nx1ZwUywCrP9wlYa1tprH2RuBYFboLfJCialUEQ3vFyJ4F6fhoqVWbTbwcqa0eB7iKKjWKhmIM+R5bkpQxz3EZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802958; c=relaxed/simple;
	bh=Rkw9WFZoXp+5InFPPXxrxAJqP9DWE+hJyBAEvtT6sRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zosipgnk0JZ5bsN7C1R1TZLvrJsaxf8sgNKSVMrgZnh0kudetmg3VwQDXZ6QzbcuueaqIJD1P5sPi3pr+/+9uTVPQ2mIej2IRGBSfoSiqidfZ4Abtfgj066B197Hy8D1RgS84nOzoMLZqz++wR6BZ4aW3BuR/MoESjwq5UEuHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDz8IoDU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDz8IoDU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so641565866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802948; x=1763407748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GRGFlvExyifoBhuyafidhUoY1iG6eXyVZefzJBFYOs=;
        b=oDz8IoDUazH9p5kgYCIvBiK1g0HMsJ6aUJpQ3ZpW4XziCtpineqk2MaQAkJzO59x5b
         IyazJNUSQ04oMKvPXIsg/0yIHjGCOZkMF5NJ/avKdMLuf6tW/2A/LrK77BPkvEG+MSC2
         83YyPf3Dsso/suNWZfKgahuwhmQuacIrYKuZqHQ2kiGaWMXhiBcrEfi8pDYWxM0KURrx
         aZz4hk8eK15/JkNWOD1y0goJtYCb1rF2Hn3g9/eZlSYO+W+oegHmu6FyPw9S1GdRtWYA
         p9eRJF8H2BQmSO0igetho3Du5aW2xQ8cNymjioAxW6hGxJYmlYWpUjrvIZTCqmwLo2N9
         VCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802948; x=1763407748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GRGFlvExyifoBhuyafidhUoY1iG6eXyVZefzJBFYOs=;
        b=FWND/Lpe04M1Nw5pqc1TbqVYvVqLzBVQIsYtFYYPW6fOPxz1t9CebbRtFtp4oNXodL
         RJ8dHCjQcgV3LgpnH9lDxOcLG3blIf3UvCXY20gdPVIMuQcYxW7NyP72DNbCNhiLtXn4
         /A+PXlE8ZpxX6SrLDDj5T0ZOFG9F9ufZqlt2OBh1AVk2Eq65Ft7SCpuekgZ6wVDA7iKv
         3xcyc6Uqxzl+CyAtZOYKNypeIX1nuyZN4nZkmnJEkjvuqTRgXSQkAZjrcMrKH8VGH+aS
         XDgqaDGcslNXxvrNLNYTTSlDWS9jFN7g4478ZqdnqQ9ZFjDpiJe2eJ2u7eTMF7TbtemH
         zWbw==
X-Forwarded-Encrypted: i=1; AJvYcCWZnjpw9wVFvQaLZbRRz3rpZXVGvZT4OmqHffGMV8aPNtofQdVZl+ulkz1/23qb383bTI8TRw2CYNoQ3MeQpBW0XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrFxlO4XnNwGlfN+Q6J2hWFKiAw8nEN5rXz8AIuk4A23ssRQ/
	vA0X++82J8rB1FqVyk1o8lhEKh0E8LMXwky1Fi/DmkM3Qq7DjY24rscXfbeK4yrkkjE=
X-Gm-Gg: ASbGncsA3AhMjAffUxDZizwvzUsTbPBMWbQwoxM6CF8bZrTyWLzs7DyGEDT3KLC37CO
	okkoIHZCL2yYIGWfEbKaJStWsThbsU9itEJFJe2mFCNtnR9Jh7qVAEuh2sZWBL209a3/TO7Yvji
	dxkUpGt2HomxDIT3tsl8Sg/WGJYMdJfhAEKzuoCB7Zkef6OCq2AD9kn136s+T6TZHwcyTQfKhgy
	1E5wKjA3IDCkwb2OLtYR1yjRttXWX1nD6w6rNrqwWwx+YqRffKN0D6TxqHYHMFxe8V2mozynnui
	uY5M3Ip0UTbe9xuczLl/8uR7uQp31dFF5CYkanBExifUX2OFD9H2lPJVPGF94psXo/sZwc6dq/i
	vMHNXsSK8PnU4wxEJbBfq/pyUF2o6pRGLEvI9Sy8DrHuPM+BHJ2O3kiOd09rUfDFpHL7bBT6A8Y
	2VAUi1kkxTkzANMdYGdFYpOGRbL91EsYLsUgWNnVa9Mkc1qwyRw8Fnz0Sytj/yLI3WCPgoVZ0=
X-Google-Smtp-Source: AGHT+IECpKLFUmLjNWELv2Vm5UCSytpZeRz/kU6StwzL1uQ1NedMDX8f/lYYWPod5BD9l7i7CF9NzQ==
X-Received: by 2002:a17:907:7fa6:b0:b72:b6ae:266 with SMTP id a640c23a62f3a-b72e036bc01mr885816066b.10.1762802948072;
        Mon, 10 Nov 2025 11:29:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:07 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:29:00 +0000
Subject: [PATCH v4 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-17-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog

