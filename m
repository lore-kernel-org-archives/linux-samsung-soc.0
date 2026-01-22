Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED244E056
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096650; cv=none; b=dYQzcejM3dtNsKSDM9FlM8EPdEfYE4ivezIa9Zc89eRkCExUn1IA7FIHaGRszA8p1idWw/zOFbRBS+8bw9/uRmn/WjVcPBgkpCq/voLEhCByKxUEID4Tuy6sQe/GuL+b1fuP9FfOnG5pLePIsutxxS+Dpy3t9zQV2uFJzysBYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096650; c=relaxed/simple;
	bh=CV/1AntRv4i6Nx8kbTbv/dJgDCUxidMgMOHRqzlspiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ga7d01WJp5iRyy/pF3x5YDQriJsiVp4reqyd413F7PUD7upLE1kr6JXJDOSi3QwY3uAgw/wMiYnixWObK96NbT1iv+y5eFsOIco6dsOuMbYvkb0N4ISRJ+dwFuHj9Z6yavjtdTXIUQLVGdb9kWjEqwWaUxhH0ijKbQojqIOnbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yreLf6gx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yreLf6gx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6505d3b84bcso1477843a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096627; x=1769701427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0vnLX9gJoSUgj6PsEAnovUE20jhGMuNkb9xOcVBvuw=;
        b=yreLf6gxFTMDiCSuL/QPpteElIX5CalBHW6acpzCNfoYvNCO44mtHTgJR8Kloc3nqJ
         48CBvMOl6pMC3pDasDUaBZt/9wiUmdJUTmUWQ+OwGyWa/uWYST7raiDIlQtjzbf7gDg6
         SQq0I9id8ATFVnwepuAyPOtBa0dmLCmWvexMABxOSrhrX3GLNtDoUfnwa4jkEJWYluZy
         ZGt1E+Iej5mAY/8c1k+jXPpdWPK4eE7sIC00YzsqrBVl5yntXtl/E0nzwuPbJA0rk8UM
         W2CXJPvhvwXhFkoLcBp93vhWmLhtNW/BX+c5knis5MABOM/1yUocE4Vdvd26YlF0ex3+
         oC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096627; x=1769701427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0vnLX9gJoSUgj6PsEAnovUE20jhGMuNkb9xOcVBvuw=;
        b=fzbgD6xRRAPavEGmsHEAZyRFYR2PcwFkOQ9ywuz0OcfGU1EGWKZF23hWRWZjflE+fb
         1flQFOLqs2wfGG80QeUIzpzPKLN6OlR9iV8a/VN2cnB8hdjgf21XGVYrNgVWOd6HVKG1
         hwj7jdyF7utZujVdy1mXx8Ur1GbpE22CEfMNcIVLHIkHmwuMrtHqlOVZ8HGPMdl0INKL
         kuAcEpwg0UCrxahZgGvI6k5pYAGbugkWEmSVKvaF163eEBHAypeDIquwz9Ot4+P1+ANe
         nLxewR6wfAkqY5SORKC5lgs3+Aejf18KYaYbrOXyWxDnXhl09g/BIKWyTEji2mboxfDb
         pMKA==
X-Forwarded-Encrypted: i=1; AJvYcCVsbOL8ZUaeL33xkcJXdddp+ItRmaoety6TH/swnSIfigJz51G+8vl8JOJcenO1c3x6fBp9I1iRXui2MJ5AgddPOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9z5s9/5NCluNIvxdfpKKe33L0NclJSk+pHisIsXcP+wpOxSc6
	1/cOi3EeDZFADolz93KRGn+C81FWlRGlqWlJctClmOBh/f5vBaf2tCLdYwfjrhVtzt8=
X-Gm-Gg: AZuq6aKBL9R5urhN6QDIrUcCdAAfcw8CBRazXTUkRvRnOw4qmn+HXAANeaFoF7quD2g
	FcQJgpTpKeLQ/LkN4LKbUiP8CPl5s4KMMIRpJVEzylKHLpWPqJ2uBUigDzSMd1+acebpzKmSmyl
	73W7Tp7HZ71gTAi51qZU4ZkKXlCqsSG1TFYgUq+/7qHYS1nP/tmJjA+5CD6uSE7zPhkEPQ9Jx5w
	2xKcElK9v5tc3JO2DvAypDVoAwRQSlkzwi6liRgTgwcsKtLS9Dl5ebRDgRoUcIKKgAPdut5p403
	K8I9ycPxuD46stSZka3hsmYs+XtSvk32sbgsSjrxYb6EppmsnMuvLQ0iXG5IJCr9qRQ45B2/x5A
	yOqMGp1Pu6e9OBPY/5gWGphXhyKF+CxxoVwvxO9h/2BPbkNeRa2zhsHafterH4up6Nz25iiFjoR
	WyGgnZaINzujq6syR+IUL+OXxNlbL/aKL6yxgOUU7Cnts7VhqEc4rbFeYdy0Hfqfcv9J4FBdVZh
	T0MzQ==
X-Received: by 2002:a05:6402:2115:b0:649:a63f:bea9 with SMTP id 4fb4d7f45d1cf-6584879fd4fmr26109a12.16.1769096627408;
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:44 +0000
Subject: [PATCH v7 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-17-3b1f9831fffd@linaro.org>
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
index 0b6b28ce6465bdbc98ed72f627dc5565479ec7c0..5e35840605472e20019ef936d283be2c38146854 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -566,26 +566,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
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
@@ -595,6 +592,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
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
2.52.0.457.g6b5491de43-goog

