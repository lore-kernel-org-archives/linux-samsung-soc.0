Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71856329E65
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603717; cv=none; b=NvdjUxu/Xg/QTsMa2qjumdWguqOnyrnMmB0JrSRf9zS9ouIUNP6w6SqxQZFDQm/n57vEZL90i1msoSthorZJnR8QCleHRpVdFSHZOGcwVgfdK4kr1ZN8u7/z3zcKvaYnq9Lh1naUV7Qm2fv4cLZtA3m4GnbWrtYwswgnA/zVP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603717; c=relaxed/simple;
	bh=EbkA79tZJb99W8QY1jSkN69mbuMKBY7QYKTImhSxzUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNxF/yghdOqCPMDaJ8lt7Hrp7DVqORww1QX3rV5meixvWEjjMIg4rgD6Bnb+6aTbXyrh6V0jkYtaptVmo4CuBNFpY7J8zHWaSz44Ke3dXd6OZTK67uUBHwSOXRTYq2fL74l+x78xyNOBw7u7jQLRALXheFm7gZZ0kQ0QaXrMNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UjhoWzjG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UjhoWzjG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736d883ac4so2297814566b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603710; x=1768208510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKm6UbDQAJQzpK/ySeYAg6jnja8QC36f4+JR5r/3xCE=;
        b=UjhoWzjGpM8xMCOj7KIBJFZ0SUo76s7NsAYcqLli71Kjrnm+jyixvh01bxQiN1i/g6
         +4EygEmcRWS6ps+q8bAR9ffSOL7Ux1kd76jpqjdCGC6LRjW5wKLq0UCliiBl5mLxmVZJ
         ziwY6cOaVKmTyw4GKJWAuNHfT6gmTZWoolMHnvyW6Ld5cfIvfb7Lad9d0Q1khtP4yLAF
         zzLX3YFStg/OovLu9ZKB1iYNuIsYgPlUivwRz3XdMln+et013FzS2OpNKlKJG9V57pZg
         0VxUmBEebFQoeYrNqpMFJAlcSdUL8xUU/dHUFNl2r1ZitVmsmiU4fW3D3ysK4P3kcntc
         Ui3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603710; x=1768208510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKm6UbDQAJQzpK/ySeYAg6jnja8QC36f4+JR5r/3xCE=;
        b=l9WXh6PVmLmQ3m62XpY0l8OKOPFRgut2e3vQc+mFW1mo+keoW83jOCxV3WSMo1y4b5
         gvmHblwC3NCgwNAcCA/1crnEWkB/AqCS/zM5AdROxyQsvPnrLjBpXN+eirGVP5AR6VpZ
         O3u5KonSY+5sis2gxFQ4MGUdrYibEDbipWlaMJiSKM+TmoQJIsH21xi6hKXyK4+KxBP/
         yQuC1w4l/g+5fAHfXd6oy4AiOXAauQv9l/wy81yDokqKqiVr6qG1lU/NAeV+w5zkukD4
         Brn9Ai4R8YivsFldCEyGQ/yxW73JrohlzrPDyxBw4+3FHMkiT/xlQ9E8JCRMl4izUmaT
         l6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIbvgvOvJOM+xjG0XT5dwSjg9HGvcsiModttqIx7e8FYROWTA3VbHr1GZGQ5kXNKqj+bmr8MaRmlMmizwrsvAL6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrdh0+277dbzRdZzIp4yTHK7OiAj15nYk7o4I93JDyUWxYspO1
	hvNUnhos9KvO1Wu/D+n2OvSoJvN1iIdE2YXN2/Vd3KsTYHhwH3nADj2ZSoWs2K4Qqh4=
X-Gm-Gg: AY/fxX7pgvI48T/0cw3baJuCcogMSORmOqubE3xyQNi67d2bpjOvJGPH1FKPN9atj48
	wuqSCKTa4nb+yteb3aDIOef2HFPAqx1hIgxunJjHVgCgu5g5pAfVglB+5jbi0Gl+7JlGmU3/8Vd
	xUbzwEBaw5pQDgJgyGyCFEhncmnEAuLHYeKfKNgWzTdOHoOVxCsrTS0EpEbjhirvz8s38KqQZdP
	IaS+JWV+Sx/X+nTZL/9tQCvsg+oT7UUNVE9xr+gYg2XKkpkdh0yq2HrWQUENli9czD1uG1ZhnkH
	AeMa78IAu0M5Z7JsqqFMw+pspQOnKhVqAdOIUYDkaDy41HdoeRSGNuPdD1cXcMRh39fbbSA0O2G
	zsl6yuIBVUZ8GoX/G0jCjG9Gw1WeFJnUobxSZhQnis2HI7g4GKZrZUF6hR8BS9OvnzuypC3pghg
	EShVp/Q4Jo7OFa7+Ri2mO+UJD9W1Znq/t3i7dMxVM+jx4XU0n7wE4Ge2RL7Z/x9Akorcw1iJvtp
	aUErQ==
X-Google-Smtp-Source: AGHT+IGjvIAGvupchOOrFftG/YtkeYR3yC8EXM4cSwDm3fV3fNPQfnkzPLc0+5C+INuB5lyzg9eeMQ==
X-Received: by 2002:a17:907:e109:b0:b80:3846:d46 with SMTP id a640c23a62f3a-b80384610eamr3935579266b.20.1767603709843;
        Mon, 05 Jan 2026 01:01:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:53 +0000
Subject: [PATCH v6 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-17-80f4b6d1bf9d@linaro.org>
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
2.52.0.351.gbe84eed79e-goog

