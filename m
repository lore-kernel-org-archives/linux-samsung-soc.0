Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22633032D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838288; cv=none; b=E4BMj9HCJNxEwFFMv9xUaBTwzNTZmfphujlD7hBb77/adr9SHRwanXEvcrPZ6CGYVCQJoBzOXa4S1wPiXI6bmiIkpiqKNHxdyKMiqhs1J3YO3U36Gf4zr5wkODQmJDvntu4UcLvdrHDmZicbAD+dK7mFN/GPSqsQ1/y6A/EBQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838288; c=relaxed/simple;
	bh=GmHLRlu6EXu3rlO6sUUFoarZmSsasrc3xFXNGExeInA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BzqTXwTFxvW70PYOWLPtkU8Vu+r5fQUop6JArozAbZ+sIdl+xeqpQp+gUs2cHe5QnqgzbCyPYBaboiW9pcPiYPquq391zMRbJ15HdnvNQVcfFGyVVCCoghaRts6WB2chaHI1y/z4r3BRU6z1WCwmzYgRvwAtilQumptKhwNDPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0YCToUV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0YCToUV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so9427824a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838280; x=1767443080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mh3sOgyslUyQirT0DcDP+95jn+8TlJEJs45se+3aQEY=;
        b=T0YCToUVr5aSfTvL9z9DSQPkqJ/s3b/IMMLGH4Jhrv7tSYxAvhXNPYrfWgdEPOMWQy
         B2CppFhrcxoHrJWhX0HthYSeaaqYsvRzYBuMBcd8kL1RKHpOWOAMfRj07Q7vUZMINid6
         r7Lmz9hO8hlvhtmEwEokfHXHDvCmLGz3JfduNiNxPfYiZvr9YIX23My9FdygfA65D48B
         RqZ6MK5DTMUzikPqfjuZKURJkTgvlk1ZWNjRIJRPV/7bJM88rQeVIEBhMH/kh/otYadS
         jw8OUeJJJwQl6VN3JFkWgUiJkjSDZ0ZygnZCbzwQThqGWh/oFGhTezVxtQgQv7Qtz/V3
         Xftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838280; x=1767443080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mh3sOgyslUyQirT0DcDP+95jn+8TlJEJs45se+3aQEY=;
        b=eDXPQbA+eb2p88DhEUPlnzvPpUhJA8EjOjgAk2iv6xkEiw/ssMUGUAydxmlV4ihTvj
         K/hP72BYnO0GE+c+7gm+EmpUKP/oITUNt6kr5PshZMYuPBniQcvcGidsEaJz7oY7vijT
         /SswzAFzWcNuGSEO7PUGIJNic+h+o5An6WI6Kk5dSy7eD9X5gv9gK5afzUQ5odw23247
         a8zCz4Zs5+0M8YIEbOGXrzJ1HmIT7u7IRudL6exHiG3TRM/qhnW4v7g4upkq9zSng9WT
         l8OHm5U1PDyCRVzDrgvELfrPAUmBQuN40goaKc+tGLpyVby0HuQqfBCEFRn4s4vwAYBk
         kmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEslkW4PDE5h10yIReYYFvrX/4ir3UZ9Vw7fnylh687n6ZsWByuagYZIumTW7G20VveHmNqENnKaeIdOMlyibOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6NDl8FE9YzwbztAdT2nkXbX/vL34J+OJwh2p6P5KkHSA9+JU
	fk1dbDgmAtNApjG87OkWAPGCrBxLc/6XrrOse4y6zh02XdAmb4ISUfRMPMrdh3xRLPo=
X-Gm-Gg: AY/fxX5Gfkkad5gR4iNYEb3XXmdTSaNvte+6VJn3BDWR+HeyUo+wtHlT+VPePQHdzy4
	/0Y70Xk+fntZ43mWsJVamlACeGwntmGvN+B2yNYxovbjTyEtaYZVQyEVdUNnJCa5Qe/5U4PEqbt
	AJsJNFESB85fZ787T6Q8N4bxD+xLZumVPlGD89ibjL2EyKRyQjhz4mpejbqhxDTw1fkb45omgta
	ylQ+wr8rkOdamE8tglhrO4QqbaiunJLOuNBDcrPmOA6+KVN3IlLahD4h6liOudeia8VdfgVDrCi
	h4GZ4K7RiboDGeHnzoEn20Qs+4xb2+iHFyaKv9KUMvtnZpcHeEY+UZQZQytkwkWmJWevm/vJ8OV
	YVCPw7G3xqtbOLnWVBKEBzhmMttNYw1rvnrwXQAeNplB88H0WYkg/pXVQVptlba32TMepBhtom4
	hkS0qRVHlOSs6eAAVtnMw66zGIvZIXZTVqLV6AmwNUto6Tra9k/Zo9upCmxlVnLumnvQsNxFUJm
	YdOTl3Pr7ikc7vx
X-Google-Smtp-Source: AGHT+IGFfpQSFxXNOZag/yIOo6Cnxa4IbO76rSSEb1gcHw8glndKrlYDwAIcv23/8DvUWbbUCEuOuQ==
X-Received: by 2002:a05:6402:2078:b0:643:eae:b1b6 with SMTP id 4fb4d7f45d1cf-64b584d700dmr22012364a12.12.1766838279747;
        Sat, 27 Dec 2025 04:24:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:40 +0000
Subject: [PATCH v5 18/21] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-18-0c04b360b4c9@linaro.org>
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
index beff85c72580efaa0bbfaaefe6b4386edcb00919..34f82762d9549b854d730a1626ed0450c19fbe2e 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -649,31 +649,44 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
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
@@ -737,24 +750,24 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
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
@@ -769,10 +782,12 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
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

