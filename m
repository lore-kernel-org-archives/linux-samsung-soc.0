Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4021C33B6D0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802958; cv=none; b=VyFdwBD04J4W04aB4kifufrcdjNrqSPVwg7hXfE26vA9Y1XgD7VzsPZaeIbp4N2Yp4R6RlrMJhi2hHnVhJmYWV7L0W+aJzqzrKnUx0fejlhsZwh+pXyJglLXeUh2JihArRtraHMl3YqjJI5ugpIWBUjcLAzPXrMGK+7QO0FMTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802958; c=relaxed/simple;
	bh=Fmx4poAZFZGyLstQYwjHcQxOfV+O6exfaXpWXRFjRjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D92Av89h1QuTma2Me9XJYGQfp5BDrjNxsm0PIl1U83v+jigZU1rIlmPGSgV+9QfC619gCkBX7nt0cFeiFACpue5fhMsQwDlJ97uCLFrVz0T+waJFYfBDrJfr090CF6boLj42hMMW24b2scJJDNbGSuAKAsJoWYPhM4piF4h4lM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LlW1aOYj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlW1aOYj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7272012d30so629520666b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802949; x=1763407749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUFmnn4e1bVW35KbGdGkktcuDsfeg0RhFoIgKMaFEtY=;
        b=LlW1aOYjehsbNPqZfmaJf7+hrPcZOPnRZoocNzNPDUy9WMqZq3Iqszha3F897BAIrz
         7XzLOY/6+vqRNuwb5/clGyI/7BFgfjlrwFi3HNBEdb7z2SSgNNscguYsQ1rXjjs5tGjb
         6hHkFu8dberHfpI5Ad/m+8ETBGBJ2ekMrrByT84lxTg08JYHxmk+fQYfxomtfWQ630jM
         tODK9LNSjLVrwJ8C/Gk8XygCun3ywpg0ALSwnumsuIRzI/Qlri1xcSSkQEXPsYLkX81J
         S/yoQLKCs5/xhDLxe3YldJUfeZjGHQSiAr9LsSulfH5/efrPLOmK5ye/Jgkk0ECRkZS9
         0cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802949; x=1763407749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUFmnn4e1bVW35KbGdGkktcuDsfeg0RhFoIgKMaFEtY=;
        b=D8tUky8KTM8FFwsGq12UTvnhjOfJQxpL75uwUUqbQxm2mamiOkYLBpukCoFfnLcjYD
         L16CaM9JOsrJNfJTFpshdl8Dbe/R9/BOXpgSZctutEpeMIkDjfh5ozixehgIDG4oB2RB
         qv09z/dKkD9auq6XI5hGCgPGAB9d0hXvOHscmtdoY258faOmuIGGMeKETuahPtmeHFdJ
         fp3Q6P9poBON6qR7UC7iLIBgxt4hrfwpaCsYhLT/Q8eIp6BqyReLyQ9BcMxda7Ebhpty
         Q5Ks99iG12hK4u1hsVPM3TcjOscT8Anln4gJjP4eBjZ0GhO/Lr+fWMrXEEDjNJKuxEJC
         +Kyg==
X-Forwarded-Encrypted: i=1; AJvYcCW1yO8NeTy4bIzVI2b0/OPRUUubrXaRFe7DzvGRe4+sGq0JjykU3y9GaYFCOOMKFotB+nBa9P0+vopFtkNZIlbs7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQDz9+dyiiQhdxT3Smue/WrndsIpvR1RqwK57OhpRLzGbG0a8
	GklLLnDirdo/2wMObBo47b6T7s9M1ATWXwFOcZI4mjGwE0pUvKVJB2lgJl1N9SsK+ac=
X-Gm-Gg: ASbGncuT5RE0lTLfWW1LtUFQtrEIAuqBttCNRissJDZS2wRPb30PTeCdlJ1J5RUbl7f
	AkjSiWY66GCkxvS30zJvVbtvttKOuieps1EApcj3qAEhJCPCqLH4UWdF5dnJc2u2JQ1Flwsp50g
	t9Ote3MH4Y6c4sGHHa7Kn4Vs9CzGGk1BKv0WiLZmLoAi5DfLjArapxjDVOR2IjKd30ni5BH12Db
	JWr3KCGw6sP/soevQs/ckVDtw3e2ihnhkaBFMlqFta1Q4EmWOG6thMmWtDTanzSiyiLoQ7crm5l
	kH3h3Qqp5YhBNdrHHdPzjRsbfDDQAdrPB3UZkuRkZ52r8Guho0ads7Iv37tDilTLF7fOjDF7VK4
	qiWVIlL4CB+Y2P00zp6S7hRDjzt6+WS8qXyFfQQ6LjofuQsp5HNSkiqCzIsNTa4EMH88+e7i2G/
	eKfnxZu7mWbQo7x4bCFQueUjouDGIshqD0EZhGIup6YlprMxVe4FihWp6r31sY
X-Google-Smtp-Source: AGHT+IHNQl/iS05xTmRf0E31VhCPdGxfwqJeYNmuqmcrWkHeSWZd3rc8bHHOKIevtAA3KAJ0hcfK0Q==
X-Received: by 2002:a17:906:4fcf:b0:b72:dee9:88df with SMTP id a640c23a62f3a-b72e047b41emr950072166b.46.1762802948548;
        Mon, 10 Nov 2025 11:29:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:29:01 +0000
Subject: [PATCH v4 18/20] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-18-94c9e726d4ba@linaro.org>
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

Rails in the S2MPG11 share a very similar set of properties with
S2MPG10 with slight differences. Update the existing macros to allow
reuse by the upcoming S2MPG11 driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch complains about unused macro arguments _r_mask,
_r_table, and _r_table_sz, but these are false-positives due to patch
context.

v2:
- fix commit message typos: s2mp1 -> s2mpg1
- drop duplicated assignment of ::of_parse_cb in
  regulator_desc_s2mpg1x_buck_cmn() macro
---
 drivers/regulator/s2mps11.c | 69 +++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d840aec236dcbdc8b460f89b4cd04e42e3b3da7d..35cfea6b6d8091ba21f00e1cb82b11a8dc9bc3ec 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -650,31 +650,44 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
  * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
  * into account.
  */
-#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
-	.name		= "buck"#_num "m",				\
-	.supply_name	= "vinb"#_num "m",				\
-	.of_match	= of_match_ptr("buck"#_num "m"),		\
+#define regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
+		_r_reg, _r_mask, _r_table, _r_table_sz,			\
+		_en_time) {						\
+	.name		= "buck" _name,					\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("buck" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_BUCK##_num,				\
-	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.id		= _id,						\
+	.ops		= &(_ops)[0],					\
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
+	regulator_desc_s2mpg1x_buck_cmn(#_num "m", S2MPG10_BUCK##_num,	\
+		"vinb"#_num "m", s2mpg10_reg_buck_ops, _vrange,		\
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
@@ -738,24 +751,24 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
 	}
 };
 
-#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
-		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
-	.name		= "ldo"#_num "m",				\
+	.name		= "ldo" _name,					\
 	.supply_name	= _supply,					\
-	.of_match	= of_match_ptr("ldo"#_num "m"),			\
+	.of_match	= of_match_ptr("ldo" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_LDO##_num,				\
+	.id		= _id,						\
 	.ops		= &(_ops)[0],					\
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
@@ -770,10 +783,12 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
 		_pc_reg, _pc_mask)					\
 	[S2MPG10_LDO##_num] = {						\
-		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
-				_ops,					\
-				_vrange, _vsel_reg_sfx, _vsel_mask,	\
-				_en_reg, _en_mask,			\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num "m",	\
+				S2MPG10_LDO##_num, _supply, _ops,	\
+				_vrange,				\
+				S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG10_PMIC_##_en_reg, _en_mask,	\
 				_ramp_delay, _r_reg, _r_mask, _r_table,	\
 				_r_table_sz),				\
 		.pctrlsel_reg = _pc_reg,				\

-- 
2.51.2.1041.gc1ab5b90ca-goog

