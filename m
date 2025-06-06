Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703628A3E1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222206; cv=none; b=DIyjtGgmgeAGSUADGCPu76bXCORpsFnXWoB6ob62KAmQnQj9h8zlIiwQCYRFt0WQ4WnKz+pl5k1mVcFkSxpS/7V6Jn0oNKnvdg6GP4lLpGr/B2fnmdrftv1kr+/0l4Hc/MIcy+e695mekZRTYfbApgnKujf8c9Xupf8hPbqBuSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222206; c=relaxed/simple;
	bh=UkmPjqPD2ja28jTmADLGGV15eCDj30NAA5f5X22ywHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idGZH3qO1QCjjQkpIMA3H5dVvv4tw3FR321ZJ9/ogIlm6WPRge0QwwK/RJGbyGKD44GVcfoiOszCJ4qkcf/2xyFeAzeBI1jIRVM301xN0vdd0hUfVLe/ycxzpcm0z0d1pRzDrXVOY66fwYAWSJBTYiAwcuJqU184MTrlyF+lzw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNELT6dG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNELT6dG"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so4023281a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222200; x=1749827000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys3kqVqTp9K6q45SE1ON1/ZwbM9Akoxhc6x7rkQEUjM=;
        b=ZNELT6dGH4MEKX8Lso9zMyg8/9pHXaehN1jqaSqekZI8HLkWqnhCtVYHwTjHjR1dUC
         lgs3+7hp6x7lvgPx8cIUOUSQ0WckoPjcJb6k+152ukJpIrwfw9P875YBJwUnMRNw1or0
         N8VyEWmyc8V3qi0DctWnvuV9CrDjLb9/ffH4p7kLRJDaIffDpdqaxAXyobh6lU1ySctK
         lb446zEDSFPRo5WvIuYpynwjy2gXkU53FoY+8fnrLNv+bTHFfP1D9Qthb8PQRN5tLs6u
         PHSASXpFZzHZJuqn5vCa/JTi0y7GhkRpzr6ykpBG+jLDeRoFJSfHVtdE0x2KFagXl8xb
         UsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222200; x=1749827000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys3kqVqTp9K6q45SE1ON1/ZwbM9Akoxhc6x7rkQEUjM=;
        b=Lj/RSyHf6sjH62t56TPNSWceVoB/jcVg5SvYfeJYiwdoZ4B57dNoh+XaPYPg3qrfT7
         8OFGd17VJmrCkuLfKOksbxpD26aAGkU+UOnKu+EF3zhhL+ZqPrgIUzUp1XdAr3ImGc+p
         eRMbXi7sWguF/6ewT9oB15ALOUSexfzw+a8BscHV8x8v5OAzTSMU1xnEBoNNC+aN3CSy
         ynjcIwYGMg+v+MJ0bUXfrsB3YMmoQHuNkwFYjO2tYyMZwADl28kO0zOtZKTj5/AXuUme
         aLDMdGuT84TNwFkUMgc1wYRG8P1zSefH21fHYK8nYTdmYoTDbuaYjXA2Z6a+0uDPeUfa
         Y4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWgelrL2JlZGEGdg/2W8E5oeHcKL28MoRkCZ48+9TqbOqEFXUj18aUbodiqheQw1CsaX35zfuZJb8Vj3SxCXgfXLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QMkLrAcDsHUtXg8Sjqpt5T/7LfSjLsgmLiDH6ootEP3Y++G5
	/1p8tKA9obUJNZkNhkRvSFHafRxkvpUuR/9NDc4vpzh5esd+tafWT5Bf2xAyJxEhdwo=
X-Gm-Gg: ASbGnctzcB0E7G9TBkccsN2mdUP46W0jYziX91v6PCtvgcxuszkKIKKSRqRvDlD8UZf
	JdDcQVQudiRcOZ3bkjSE2vESrY5fq9kg4UmfB6pLK9uoQtgDMmY19tH/vkq4G7Mqlr4D1PWJ/dj
	SspP9qkNo6n7nVr0Gjc664wU8NZ+cea8FcPqYQH63beRzRUs5TN4FKBWsBo1dbJVz22v/8lp+Cb
	yqEG8FzqDqiG5zsAZuJQD4uZwnVvowLGvTjzWDbmsWK/zeVU97GDCaztXRsqiu6jOCdOGfMNFjc
	KM6lyP0MZ9RPtN9pHuDbVJXFl4kjRQBN3xBFwIdmkKnUX2yX5PTmfFbSb9uaX31/766sdoquolq
	hVA6dpY87Okk5auSDwc0vhGCOV1L9uDVzHltgsGLz399Byw==
X-Google-Smtp-Source: AGHT+IFB2fXv9eKwQsioE6nBfEWNtn8Pkzr0cPTJwuvdsg2LJK8eHn/pbU2R1NwRJWe6FpnOQNACdg==
X-Received: by 2002:a17:907:fdc1:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ade1ab20872mr314707866b.38.1749222199966;
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:11 +0100
Subject: [PATCH v2 15/17] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-15-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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
index 76be81c75c898fddc9570a62a64da787bacad7d7..2829062c54a49a17911cd091cf0ffb7950393787 100644
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
@@ -728,31 +730,44 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
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
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_BUCK##_num,				\
-	.ops		= &s2mpg10_reg_buck_ops[0],			\
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
2.50.0.rc0.604.gd4ff7b7c86-goog

