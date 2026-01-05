Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C132D43C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603720; cv=none; b=Z2LQ7w+gFLsV1HCY+7deXWsJJ5zrc/nDZAiNXi7d7qiGMLXNZ+Sw1eD6rhiUIsRLI8YBevAuXY7dqOBkc3emagDAYQpGU46PhBgicuqJ9ixqB2P5Lo/H85irX4Jx5DEnnE+PczM5CMkDpkDZ7iH3jtqlr+6dxlzEOqrNMSGUpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603720; c=relaxed/simple;
	bh=pYoKo+digtWVPSZwb9N952iQQptJW29ndQ+/P5fC4eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gF3iB4bIuJn4IbI1JXBGJkxlo0CEY3UDVDKqdZYudX1jcyuKVzLRbiFuOoj3fYEcfJmt6H4bAVwegbpIcvBh4k5fiu+IaJi6hPa/6RgetwvoxPwvQ3BQpOux8r8lNWYeiT4XBr3XxBWBYATx+XNZfOwQXlp+CWTCgubymsFzVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pmCjTJqb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmCjTJqb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7355f6ef12so2651666666b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603711; x=1768208511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHyxC3mJTt3T5SfTPxkXMI8FFVxPvrKadVGkzzCyb1s=;
        b=pmCjTJqbUiaKuYNl5r70vd+4KkuIlwxNDQ50Xp9F+n020HYldC6x3KQ8bkfLuTLCJh
         Pa8fD8seBOmYc8+2nOoPJ7PBP0J1C+wAam28NhqlKqV0l0UKPKmGB1YNe0NSDbOHhG9l
         U7t7jHRjMdCJgskN8xJKsog1WmFM4jUCmQxgxKtCJHb06jqPKgkbUTLF2tO3PenNWTT3
         y9ERfWhLLNROIQReQmlFWsm2xA3n4AJmh6U2jCKu3p2wNHXela+Tqnv6eNHrdzOnxUZW
         IlDLXo2P29fh62NF7ApSkOCl73B8IYaneNh433gFuY33ygcpGloLnsg3+MMyfrK90Ett
         GEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603711; x=1768208511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHyxC3mJTt3T5SfTPxkXMI8FFVxPvrKadVGkzzCyb1s=;
        b=dvLYh3YZ1AoF/K62YMaynLu0QvU+Nbhj/UnpMzhM/yBlQCJrkSZOq+uHe/RwJSD2Q1
         N75yxA82H0mN0gtVOoBSyMSzRhaZGugvMzw6Niy6LzTHHn4Apl7nyzxTr8KyX2OwH9aN
         +BudLSOh0as3EW8MC+Q4YF48vMBtik9vWixOY0twG8vApgbaywlKKxOIUKTVYXFoHumt
         l664aQY34h7dW0JrumBFevy49zLB3Rk5keamod9SOyMPW5FcPs+LjpSunFiNUCOkSJgD
         r/9RE8qgcmlHnfZEshcbMiEOG4tYmH1934z16bY7WpTH7c3uDMlrcJMvPMW+uosuGMTN
         sOnA==
X-Forwarded-Encrypted: i=1; AJvYcCWBmMs5JwSKHQwVlIdb4Mg1Y/UKY+I33kO0Bpvbxrl1bvT8SZNfpHDfmYimfO4Ykig+X+g28N2etIwYt6GjfAn2Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Th8xZUhR0YqranvTysR/h8E78vx5Xvi7cpLXnPr3ecgzTC4b
	QMgh/DUg/Gfzhxgd5Huta00EGLg9vI1cymP16HC3fHyxBEhrJUdFMIsOUtCdESJfJng=
X-Gm-Gg: AY/fxX7O9WvYG3B6nJA8OhyYawUejhOQlWvaPnMJYqiGmk0drzJFGVvQOErxh6nv3ma
	hTvpQqYgusKKN/W40I+RSHhD6NA0T4iF0mVxSL5klC+ds9ZTwUGfH2cc2uL5nFEDWS0MoIaW1tg
	v7pGEd3TYKjzzAW9nr/0DuOuYmheqyvHvhx8DQkC1TLCKjuFGFlTC66V/MnVG+9wecvM5uOJlFS
	Io4dJzq9aBWjMOf/DezBp27HbBIe+sn6R2+qe0UD84i1CVWr+11kvu/14MXsE9HChA9oLbN0bDo
	FF7vnE/UFnBvyMpeUVW/J/ltK8/dTBue8Y8L3gRFHI12D7TVnQMGJlGAX75r5NoRLx3b4RF1lss
	tttQTgESwW0/VJNTF3ODutj+mWHS+p95W37k4tA2Za1ilT65CZtpOlADkPnQjZC9Emtb8w9FeEK
	QabDUOX0EJ5c4LwHIaz1bxdkzfd+zDPTA/EUmLdvrLoFKNoC2j56poAU0W5dbuFl5frH/6IFm+g
	baK+w==
X-Google-Smtp-Source: AGHT+IHE2Bk2ccsf+dZVQINoCVjuNssHJWZ8dARVmDYm9psJbwoyILdGIxup09aHKiJs6mnKKYTX2A==
X-Received: by 2002:a17:907:7288:b0:b80:15f6:6deb with SMTP id a640c23a62f3a-b8036ebd4eamr4997195966b.1.1767603710386;
        Mon, 05 Jan 2026 01:01:50 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:54 +0000
Subject: [PATCH v6 18/20] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-18-80f4b6d1bf9d@linaro.org>
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
index 5e35840605472e20019ef936d283be2c38146854..c75ee0bd34377b9888b74e8b561727c51b630127 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -655,31 +655,44 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
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
@@ -743,24 +756,24 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
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
@@ -775,10 +788,12 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
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
2.52.0.351.gbe84eed79e-goog

