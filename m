Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A751DDA34
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050760; cv=none; b=c/qvNS33nrdsoIrwMv4jNPiWOCi21bU15VbnMpe8wi6aVW+b1xkeZO0oM6rKYTxFF/LXQJ9Fu2FdsPOWTd1qzQP0wilaHTtxdPeJijj/m9nruWIqTVV5hbJTEMzrok8KlHtSrF60sCK84wtT84pCHuUYZkyqDYbkLmL/zhF+PSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050760; c=relaxed/simple;
	bh=A/GHEuztfmgd1/p5cSNEjJ3+xiiEy5QUpmdgAvLhvKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2oXavDcOvZQfxrUd6t9FreXdmc5KuI4rCstfoPkffMgtGj1+QQz5utiC2+BS6KkMNoaFkCz9e21pHNnzluD+Fa9gStfn35jBUp4Vxk1q23IBPP6i/vtHbPH/E3ROLS0yRMpS4TET8x3OHl7Q/I4Cw3iJk9kU1l871hs2QXE6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNm6Nlnz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNm6Nlnz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604e745b6fbso13679548a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050754; x=1749655554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn2J3nnAxbZSYZ0Pl0MdJxpTvr8+PeUSA3EZa6924LA=;
        b=SNm6NlnzXNYUNidt32Y7GsuhNDSoLhlaTthVWBGNAAJiNY4b+ZLm45lEUGzcoYXv8z
         vBsQKoZ1SB6oJ8mKoYC1vBpEj4DfBcpn62ltdHBvVwk5CAVmcV5RWoA4vDCLUtRz6rtY
         nXT5ZemHlcSsoYl09iU92xrozxJKs2F6EZzASxOhUTOsN4nreyDekTrRTZDzN/w7/bLB
         0v/RY3uzHB4Oira2qJ4AR7bkQbqjhsEjpsPaYq0gKXA/ht80YAhc8LGm1bAI4wev2RRM
         7e6O5ELVT6itTJ2dPubcNb2ShC4fIXzeADTMBp4dZLz9GGmzxX7FuMVJ5DRx0J3yCWPz
         MFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050754; x=1749655554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn2J3nnAxbZSYZ0Pl0MdJxpTvr8+PeUSA3EZa6924LA=;
        b=PtG+7yiJ1hR8PPd2GdK9QRP8tlYe9egdoaI7j6PuA15eualBzYmGBWWgCbJombwqxm
         ARdeyuUOTbDoiK1HpMMApPIDYwUbLz/g09U0dXCKh6OIeHq6td3LCngfiBunwJYHT2tv
         fBxb1VIwQTHuTc3ROICODazZ9ekMJ/AGOR3sIEFrRbmdgbSX6f0Ik996RX8kyXAfmhyq
         j6Ua5tZ2o0v8suVC314NllYwWs71K929joH+tCuKSu5gJxpBlWSN2bnu+cMRR/0XjF3q
         ssbfJSs+y5Y54hKSIXSThzYXD+nE1AkSjd0DUwNBXLjQXsPIroSlWxVf/1OqRWWcsZao
         ovyw==
X-Forwarded-Encrypted: i=1; AJvYcCWVCNfSbSjAGE/WsPE1IzXV7JRST27Zr+76gBYzu50fhloZzN59ZeiClfz4a3MewlW8Fabt80C97nKgq0vpAfx8ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8qVj5jLt0s+UsLHaHtwMEPWZwaB4LexP1cYnN4iqyu66cp5iB
	1Pw3/hzBgIdom867xKf14voG3XwfipBLI3XUvLt6TAC6mqb6QcISMoo3EmcmUwUtles=
X-Gm-Gg: ASbGnctUmIes6W4Mhc0jer6/NiFUSltwbajaS9GcI7mGqfow/Ig54g0lizx7IcsPlpD
	aVgcnsgmLkVmDsKHNIl/rWC3614kigTpW9BM8Hr+/5LBnEPTdB3Xz6dd2+jYLRvyu2ZvRO6ZJnr
	bBNL4k0HYh00x3CVhcOwZl/ncRwqWZvAgJB6EqTBV2CthAIGG7bscUX+1o6ZT4RelcNTOaPMAys
	S1Zf8zwXI/dULsY73lsbKD7h/NTjcybfgYhFtRWmguVrjqeG82ClsvvlqLuhOPvR4RI2vfzxkXS
	S4M+R3sE5F50HjFrXqCI3T09RLMmehyI67SkBxlkFBT5pSeUi5ltfAQTIZKDtsyXbxrkNK8N8bv
	MZEV/L1KAQEeisVtl2fvDcR7lm7+wq8UyuZg=
X-Google-Smtp-Source: AGHT+IGETXau/Hs1twpCO4F6DmcKfpU3VQ25hwN+cddBXzSz725FYngJL1uteD+Puz581oTrnBSHGg==
X-Received: by 2002:a05:6402:5c9:b0:5fc:9979:78f7 with SMTP id 4fb4d7f45d1cf-606f0b66b7bmr2628868a12.14.1749050754080;
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:54 +0100
Subject: [PATCH 15/17] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-15-6038740f49ae@linaro.org>
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

Rails in the S2MPG11 share a very similar set of properties with
S2MP10 with slight differences. Update the existing macros to allow
reuse by the upcoming S2MPG11 driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch complains about unused macro arguments _r_mask,
_r_table, and _r_table_sz, but these are false-positives due to patch
context.
---
 drivers/regulator/s2mps11.c | 70 ++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f427895637a32f26e2960ce7c7879632f0bc2dcb..74f09b949ca7d6f1d61decd086480996fd444dbd 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -638,24 +638,24 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
 	}
 };
 
-#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
-		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
-	.name		= "ldo"#_num"m",				\
+	.name		= "ldo"_name,					\
 	.supply_name	= _supply,					\
-	.of_match	= of_match_ptr("ldo"#_num"m"),			\
+	.of_match	= of_match_ptr("ldo"_name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_LDO##_num,				\
+	.id		= _id,						\
 	.ops		= &_ops[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx,	\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
-	.enable_reg	= S2MPG10_PMIC_##_en_reg,			\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\
@@ -670,10 +670,12 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
 		_pc_reg, _pc_mask)					\
 	{								\
-		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
-				_ops,					\
-				_vrange, _vsel_reg_sfx, _vsel_mask,	\
-				_en_reg, _en_mask,			\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num"m",	\
+				S2MPG10_LDO##_num, _supply, _ops,	\
+				_vrange,				\
+				S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG10_PMIC_##_en_reg, _en_mask,	\
 				_ramp_delay, _r_reg, _r_mask, _r_table,	\
 				_r_table_sz),				\
 		.pctrlsel_reg = _pc_reg,				\
@@ -728,31 +730,45 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
  * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
  * into account.
  */
-#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
-	.name		= "buck"#_num"m",				\
-	.supply_name	= "vinb"#_num"m",				\
-	.of_match	= of_match_ptr("buck"#_num"m"),			\
+#define regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
+		_r_reg, _r_mask, _r_table, _r_table_sz,			\
+		_en_time) {						\
+	.name		= "buck"_name,					\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("buck"_name),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
 	.regulators_node = of_match_ptr("regulators"),			\
-	.id		= S2MPG10_BUCK##_num,				\
-	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= _id,						\
+	.ops		= &_ops[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_B##_num##M_OUT1,			\
-	.vsel_mask	= 0xff,						\
-	.enable_reg	= S2MPG10_PMIC_B##_num##M_CTRL,			\
-	.enable_mask	= GENMASK(7, 6),				\
-	.ramp_reg	= S2MPG10_PMIC_##_r_reg,			\
-	.ramp_mask	= s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num	\
-						    - S2MPG10_BUCK1),	\
-	.ramp_delay_table = s2mpg10_buck_ramp_table,			\
-	.n_ramp_values	= ARRAY_SIZE(s2mpg10_buck_ramp_table),		\
-	.enable_time	= 30, /* + V/enable_ramp_rate */		\
+	.vsel_reg	= _vsel_reg,					\
+	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
+	.enable_mask	= _en_mask,					\
+	.ramp_reg	= _r_reg,					\
+	.ramp_mask	= _r_mask,					\
+	.ramp_delay_table = _r_table,					\
+	.n_ramp_values	= _r_table_sz,					\
+	.enable_time	= _en_time, /* + V/enable_ramp_rate */		\
 }
 
+#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg)		\
+	regulator_desc_s2mpg1x_buck_cmn(#_num"m", S2MPG10_BUCK##_num,	\
+		"vinb"#_num"m", s2mpg10_reg_buck_ops, _vrange,		\
+		S2MPG10_PMIC_B##_num##M_OUT1, GENMASK(7, 0),		\
+		S2MPG10_PMIC_B##_num##M_CTRL, GENMASK(7, 6),		\
+		S2MPG10_PMIC_##_r_reg,					\
+		s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num		\
+					  - S2MPG10_BUCK1),		\
+		s2mpg10_buck_ramp_table,				\
+		ARRAY_SIZE(s2mpg10_buck_ramp_table), 30)
+
 #define s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg)		\
 	.desc = regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg),	\
 	.enable_ramp_rate = 12500

-- 
2.49.0.1204.g71687c7c1d-goog

