Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593121B91D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096645; cv=none; b=jaBZBEL8r2dpyGGGmPm5Puv5vn9VoQCeXOHGWgajWJTtzdhlVCi62YJXfWaPE6pRlVImWCwhUOXutbCyJveP7pB4P2chm/BGz73yUhgVSOxg1I1dQ9F3ZeQz2+sgWZDjxEyHor1MTLAK5hPgSiZCGJ5UzfgBGa59biEGyWfgXEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096645; c=relaxed/simple;
	bh=lqjbDdNWSJrnaJi8miRBh8DUbskE90bI5Ur0NXbCs8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aS47yeoWac5/RmLSIirB+INNFr4pEBKwbXfzakZBYbCmFOz9OFPp/LW1/e7xZ5mLq6XeUmaT7f+FFactvnTcxoOCdZPHll1lT5NAf3qeNzTJceGrQnlh54xledati2HtcR2bWJH53ay6qRlnWvRQ8efOfQUMi23rKEfPpRgjFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZ5QyDOa; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZ5QyDOa"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so2140331a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096628; x=1769701428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZKycJAcIJqnrGSflaAeR7shFcRh4bNAutczw98J1/M=;
        b=PZ5QyDOa8agN8sQQTOkJgqZ/+AKxL5DCadwU2gMNDNnQSW6vEo35ZgJPp+CMe+pQ4Y
         WUmTwC8lJ91vjjY5t8Z9HLnon64tkfLwC0oZRAEWP4jk15BooeQDLMTxNqxuTJeDatBG
         e7u2lr8tGyhGARZMuCoYzEA/GD4HhONgqBzzv5w5fBNT3Lx24CRGXtIlyhojmmMxTqTm
         A/a1/2r5GIBTI+YoGtIlRJppV8KFROBSqORGDD/e5rfSOAYEBtGwjQvhwsAE7i5Kj9Oy
         CcRe6fXMMTwyPtSbXNwSl0wgRppN8sgOEcQosFvqR4UBG7cfgmarGNZnhINOtk52LKZp
         odGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096628; x=1769701428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZKycJAcIJqnrGSflaAeR7shFcRh4bNAutczw98J1/M=;
        b=MKrdV9/og9ZYbc/DzyUWF7o1eaXj2F9/gWZqlHVZBba6Mbj/fcNZ82fMdK036epqUR
         VTzSHPf/C1kwGj77OH9MHAUd1cAJHwNx5QJB5e1h/9lxdpe4sA8bkdF+wOA0W7NF6NX2
         JYjOVVjDPeAOFH7sNZvcYCZVOpuNRsQfnhjxBB6Px5IeNJGGk3dDtJOs3B0uGR3jwTsU
         /vDxbxeIZvTX+NQYBej5kgh3CkPhRfP93DwzbtvnfhxxTHcnqe+4b4MglBMv5W/Ecb8/
         q5ZvmH0g7bwqBKXKJTajyEtn8ZH4IXBFT/e/rVrPlkpSGACRJiDCjdmw8zb41oeg95N3
         1cew==
X-Forwarded-Encrypted: i=1; AJvYcCXh6ZqSZryHt1mR14tdIZV9itog/Wp9abGcfsAVSuzTxeSgJZcRQNDPbuiA74UqM9PGV6QIoHiLXjj/+nfx7xNNeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN52HRo/RiZFBptuuCDnsFH829BsjJ+WwvaZmbJTqRonyXzjTH
	9ORzBYmj5/d/G1n4WQeTBT2Kcp3VgU413UDh3AYWRlBN2P/125/sZzXG7MGcsZxzyus=
X-Gm-Gg: AZuq6aLn8pzAmh/tfChcJyawUBS3iZUgoWGS1bn8Au0/DKo1YRV5maXsOc71aWUoIkI
	DTSH6sknAodTiS1UoyxoMVAh7JkSGzK33bqaMv+UtBjXsY8pfdDDCc9JT9lTs0QuV3o65uRhUaS
	Zy3Z+wIQoFCJ5kB1c3eWYJanss0XnNyTthgWWoQckpIjLfaUbbXBy79wvFsufoZc/zk5hpmfnF2
	LADx0P6oWwTq5mRzEA802EkochlrOXp+FWMbylik2E3B4vpw8TezixLHETena/Du7A0nOxUGGfn
	wP28g/BawYIWYIEqXNEhYv8LXDtA8aGVWc3J7+gox6Fhxt3b39tHWc2YtVzLABv6JhS+453vM30
	DLdgOeOAe3qPLOZX+wYiLXYhvhHQd16VeG60mNflkZhgVlLdl2khO/zwUAZqT45ajpehqTuP+/d
	nX4z/RlBdXgV2dumf6YSd60ElZMB0yefdaIV0noveHxoyoLzLdHM+FtW+jxTw55QB+ht/zb/5us
	Hm1sg==
X-Received: by 2002:a05:6402:4306:b0:64b:a1e6:800e with SMTP id 4fb4d7f45d1cf-658487625fbmr37115a12.8.1769096627899;
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:45 +0000
Subject: [PATCH v7 18/20] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-18-3b1f9831fffd@linaro.org>
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
2.52.0.457.g6b5491de43-goog

