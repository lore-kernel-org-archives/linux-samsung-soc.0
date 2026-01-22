Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F9450910
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096646; cv=none; b=KMFxE7Tl6S5Kf/K6yrwS3mx+axHI0Y4R2BctGKKlp1A1RKg5rdc9UU2XQRwMhnt40rq3CiIyLdUhP1H3IRHK4J9ehOeFRq7wnWTbn/MwQ9/GBBWhS5FnjAvH9T0mRsI6WVa/YnnY+mUd4BNOiwTOTZAPrjy4rbUeGsxHT9bxTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096646; c=relaxed/simple;
	bh=bPq5CAXG3k+LGhtOMfCTP8Cxa/8SkZ6mqWdqddkTLIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgElFY78zLmrzabYvX55sS0jvvBHfNd9nle/w298XoW/kbtCYB3aoriFogQFFjK1J0SqAKQFh26UofiLHYOgZta7OG0FYzt4y4z8xl3sj8VPHmAiQ95x5DTgtiYgJZ9aow+ra9a5sdTa3QLr0cwJHmh/dJvfFC8OfpsjE5o8ZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Az/SXKpw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Az/SXKpw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b88455e6663so127058066b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096629; x=1769701429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQrX9SBsqYabMr0G5mRPqyj81nd2aFVUohMGYXB1PHk=;
        b=Az/SXKpwiX0HpZjljhv9aj+RpGLaFOsOT6LceNP3ZgxjDtfSPPejQQ0fFfNkzWNTU0
         hBxqHSBN9OTmL+hpeFaGf5t7um52LmikdScEJAMzIa7suObfiLnyatX/Ndq5H7XxSBnx
         uaLDKs9Ro4QLPIdh9M/ZadmHsVZ0leRn2LY6+dm8cJPfKXUt1wCWc7YwUe6O7rYjRFWi
         8OjrU5ajSRPWk6ry8+4uvwoj3BA/+OLrqjaB0vQyD5abjrQhblqvnt12zk6lHKbaArMa
         UtRNtOoxtirwOCQSF44CJh5mZSeUHG2Gy+mwnE7l4R1WK5H/buzA/NL7qRq7CVx54AJC
         5MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096629; x=1769701429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQrX9SBsqYabMr0G5mRPqyj81nd2aFVUohMGYXB1PHk=;
        b=wHiwh0fL6TkvuDlEbmBDYeDAldgSibPBzI4PaNIFRlxED2HPu6k1YS2ro/Cw1HcR9d
         pHWUZ/JTH385uBxWxaJCzspQuMGqN2RiwmsyJV/UIznAoF7gZcYbbY1w32gfE+SCLGAM
         FY76P4KpKTNl5SfpU+9YS4A2+AGQGGVYeB5BmzMvIcaH8vfOCS1lnV8a5XtSW703fXLF
         q7wG59xP1KZ8KfHOv9TkLTkB/Qn83UvTWnkCtQB14pxE+h1ELFk8Fe9ik81fRJeffiD+
         WtLcve+O5Cxpd07Eqd7nmk8UotOkcZPzJkVA2vrrgcBhfdWlP7hJ1bRKMIKwZ/0fUHys
         6kiA==
X-Forwarded-Encrypted: i=1; AJvYcCXcLB2CpvaKn+oh1BHadCYueNZc+Fmiymka5JFqQOW7lGQz4l51071i7r+Q2eLPDSKn5THzbE3qS7BpQ4JLZklX2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjBVJb2tKFvCux2dDJueqmcY1hmdQaiQcDJtmqSMyzf9UnY/h
	yChmQzBkkKSc+ghlN1A+dpIgizOf6WthBaHrIyFkNM22OSbhUxHbpcQE+RzOTsWJ0Rc=
X-Gm-Gg: AZuq6aL1HHOfJSg79pjq0iqR4iRwQ3nHpl+8uzZcvuARWd/yz3F9+k7X+2lC1VgDzXs
	ZsWeILQupd1FItQC23c0/jhgE2pd2PBWjPUiQtav0JXuNyScsmYI8FkORLBVBKbPYZ21c2LuvQY
	+1QG7OwreWNrms4poDaR5F1d/KQDnfilaXYC56NI504oASdPW/YDYhqtzDR7GGhbKpvTiSf1+Gg
	knvjR4Vv/rXA8EHm9dHPv1ZLplFc7FhNNSjCPNe9WxM892TLzsUJSxAEJVyJ0o5Ikituw1xI3S9
	gjmHsFExcpOn+HA/vEt/q35P3gd2gc+a8E2a18t4ONeS/x8FZpZ4jVnwI3izEnS1pnVqljG7Ec+
	uRTNlWdieKrPJ2nKMTQYWmCOD57H8uY5Oy7dHH+n1VQ1PyB26fPxDROQFGKwZnnBGYoidKpP9ON
	LV6A0ACoNe2TXjg1SDT3EWqdMKd3mrhxmTNXPzqoe+KpoHfBDux2i0KHQYtRAifzFGZE7I46QcZ
	FjLD9gBoBnx9HQd
X-Received: by 2002:a17:907:6d08:b0:b87:1a92:b621 with SMTP id a640c23a62f3a-b879324e841mr1755715266b.64.1769096628459;
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:46 +0000
Subject: [PATCH v7 19/20] regulator: s2mps11: add S2MPG11 regulator
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-19-3b1f9831fffd@linaro.org>
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

The S2MPG11 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, and additional GPIO
interfaces. It typically complements an S2MPG10 PMIC in a main/sub
configuration as the sub-PMIC.

It has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these can
either be controlled via software (register writes) or via external
signals, in particular by:
    * input pins connected to a main processor's:
        * GPIO pins
        * other pins that are e.g. firmware- or power-domain-controlled
          without explicit driver intervention
    * a combination of input pins and register writes.

Control via input pins allows PMIC rails to be controlled by firmware,
e.g. during standby/suspend or as part of power domain handling where
otherwise that would not be possible. Additionally toggling a pin is
faster than register writes, and it also allows the PMIC to ensure that
any necessary timing requirements between rails are respected
automatically if multiple rails are to be enabled or disabled quasi
simultaneously.

This commit implements support for all these rails and control
combination.

Note1: For an externally controlled rail, the regulator_ops provide an
empty ::enable() and no ::disable() implementations, even though Linux
can not enable the rail and one might think ::enable could be NULL.
Without ops->enable(), the regulator core will assume enabling such a
rail failed, though, and in turn never add a reference to its parent
(supplier) rail. Once a different (Linux-controlled) sibling (consumer)
rail on that same parent rail gets disabled, the parent gets disabled
(cutting power to the externally controlled rail although it should
stay on), and the system will misbehave.

Note2:  While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- typos S2MPG10_LDOxx -> S2MPG11_LDOxx in s2mpg10_of_parse_cb()
- one instance per PMIC, not per rail or rail type (Mark)

v3:
- one instance per actual rail, not per rail type (LDO or buck)
- assign correct ::ops for LDOs with ramp support
- sort s2mpg11 bucks before LDOs throughout (alphabetic ordering)
- add ::enable() to ops for signal-controlled rails and update commit
  message detailing why
- more details around signal controlled rails in commit message

v2:
- fix commit message typo
- mention GPIOs in commit message
---
 drivers/regulator/s2mps11.c | 302 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 301 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index c75ee0bd34377b9888b74e8b561727c51b630127..4a9d70947f17cb7520e0e820d3d1b9eb370ff600 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/s2mpg10.h>
+#include <linux/mfd/samsung/s2mpg11.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -437,9 +438,20 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 		[S2MPG10_EXTCTRL_LDO20M_EN2] = S2MPG10_PCTRLSEL_LDO20M_EN2,
 		[S2MPG10_EXTCTRL_LDO20M_EN] = S2MPG10_PCTRLSEL_LDO20M_EN,
 	};
+	static const u32 ext_control_s2mpg11[] = {
+		[S2MPG11_EXTCTRL_PWREN] = S2MPG10_PCTRLSEL_PWREN,
+		[S2MPG11_EXTCTRL_PWREN_MIF] = S2MPG10_PCTRLSEL_PWREN_MIF,
+		[S2MPG11_EXTCTRL_AP_ACTIVE_N] = S2MPG10_PCTRLSEL_AP_ACTIVE_N,
+		[S2MPG11_EXTCTRL_G3D_EN] = S2MPG10_PCTRLSEL_CPUCL1_EN,
+		[S2MPG11_EXTCTRL_G3D_EN2] = S2MPG10_PCTRLSEL_CPUCL1_EN2,
+		[S2MPG11_EXTCTRL_AOC_VDD] = S2MPG10_PCTRLSEL_CPUCL2_EN,
+		[S2MPG11_EXTCTRL_AOC_RET] = S2MPG10_PCTRLSEL_CPUCL2_EN2,
+		[S2MPG11_EXTCTRL_UFS_EN] = S2MPG10_PCTRLSEL_TPU_EN,
+		[S2MPG11_EXTCTRL_LDO13S_EN] = S2MPG10_PCTRLSEL_TPU_EN2,
+	};
 	u32 ext_control;
 
-	if (s2mps11->dev_type != S2MPG10)
+	if (s2mps11->dev_type != S2MPG10 && s2mps11->dev_type != S2MPG11)
 		return 0;
 
 	if (of_property_read_u32(np, "samsung,ext-control", &ext_control))
@@ -470,6 +482,31 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 		ext_control = ext_control_s2mpg10[ext_control];
 		break;
 
+	case S2MPG11:
+		switch (desc->id) {
+		case S2MPG11_BUCK1 ... S2MPG11_BUCK3:
+		case S2MPG11_BUCK5:
+		case S2MPG11_BUCK8:
+		case S2MPG11_BUCK9:
+		case S2MPG11_BUCKD:
+		case S2MPG11_BUCKA:
+		case S2MPG11_LDO1:
+		case S2MPG11_LDO2:
+		case S2MPG11_LDO8:
+		case S2MPG11_LDO13:
+			if (ext_control > S2MPG11_EXTCTRL_LDO13S_EN)
+				return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (ext_control > ARRAY_SIZE(ext_control_s2mpg11))
+			return -EINVAL;
+		ext_control = ext_control_s2mpg11[ext_control];
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -507,6 +544,7 @@ static int s2mpg10_enable_ext_control(struct s2mps11_info *s2mps11,
 
 	switch (s2mps11->dev_type) {
 	case S2MPG10:
+	case S2MPG11:
 		s2mpg10_desc = to_s2mpg10_regulator_desc(rdev->desc);
 		break;
 
@@ -607,6 +645,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 						       rdev->desc->ramp_mask);
 }
 
+static int s2mpg11_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_mask;
+
+	ramp_mask = rdev->desc->ramp_mask;
+	if (old_uV > new_uV)
+		/* The downwards mask is at a different position. */
+		ramp_mask >>= 2;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       rdev->desc->ramp_reg,
+						       ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during
@@ -967,6 +1020,246 @@ static const struct s2mpg10_regulator_desc s2mpg10_regulators[] = {
 	s2mpg10_regulator_desc_ldo(31, "vinl11m", s2mpg10_ldo_vranges2)
 };
 
+static const struct regulator_ops s2mpg11_reg_buck_ops[] = {
+	[S2MPG10_REGULATOR_OPS_STD] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg11_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	},
+	[S2MPG10_REGULATOR_OPS_EXTCONTROL] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.enable			= s2mpg10_regulator_enable_nop,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg11_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+#define s2mpg11_buck_to_ramp_mask(n) (GENMASK(3, 2) << (((n) % 2) * 4))
+
+#define regulator_desc_s2mpg11_buckx(_name, _id, _supply, _vrange,	\
+		_vsel_reg, _en_reg, _en_mask, _r_reg)			\
+	regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply,		\
+		s2mpg11_reg_buck_ops,  _vrange,				\
+		S2MPG11_PMIC_##_vsel_reg, GENMASK(7, 0),		\
+		S2MPG11_PMIC_##_en_reg, _en_mask,			\
+		S2MPG11_PMIC_##_r_reg,					\
+		s2mpg11_buck_to_ramp_mask(_id - S2MPG11_BUCK1),		\
+		s2mpg10_buck_ramp_table,				\
+		ARRAY_SIZE(s2mpg10_buck_ramp_table), 30)
+
+#define s2mpg11_regulator_desc_buck_xm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg, _en_rrate)	\
+	.desc = regulator_desc_s2mpg11_buckx(#_num"s",			\
+				S2MPG11_BUCK##_num, "vinb"#_num"s",	\
+				_vrange,				\
+				B##_num##S_##_vsel_reg_sfx,		\
+				B##_num##S_CTRL, _en_mask,		\
+				_r_reg),				\
+	.enable_ramp_rate = _en_rrate
+
+#define s2mpg11_regulator_desc_buck_cm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg)		\
+	[S2MPG11_BUCK##_num] = {					\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 12500),	\
+	}
+
+#define s2mpg11_regulator_desc_buckn_cm_gpio(_num, _vrange,		\
+		_vsel_reg_sfx, _en_mask, _r_reg, _pc_reg, _pc_mask)	\
+	[S2MPG11_BUCK##_num] = {					\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 12500),	\
+		.pctrlsel_reg = S2MPG11_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg11_regulator_desc_buck_vm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg)		\
+	[S2MPG11_BUCK##_num] = {					\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 25000),	\
+	}
+
+#define s2mpg11_regulator_desc_bucka(_num, _num_lower, _r_reg,		\
+				     _pc_reg, _pc_mask)			\
+	[S2MPG11_BUCK##_num] = {					\
+		.desc = regulator_desc_s2mpg11_buckx(#_num_lower,	\
+				S2MPG11_BUCK##_num, "vinb"#_num_lower,	\
+				s2mpg11_buck_vranges##_num_lower,	\
+				BUCK##_num##_OUT,			\
+				BUCK##_num##_CTRL, GENMASK(7, 6),	\
+				_r_reg),				\
+		.enable_ramp_rate = 25000,				\
+		.pctrlsel_reg = S2MPG11_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg11_regulator_desc_buckboost()				\
+	[S2MPG11_BUCKBOOST] = {						\
+		.desc = regulator_desc_s2mpg1x_buck_cmn("boost",	\
+				S2MPG11_BUCKBOOST, "vinbb",		\
+				s2mpg10_reg_ldo_ops,			\
+				s2mpg11_buck_vrangesboost,		\
+				S2MPG11_PMIC_BB_OUT1, GENMASK(6, 0),	\
+				S2MPG11_PMIC_BB_CTRL, BIT(7),		\
+				0, 0, NULL, 0, 35),			\
+		.enable_ramp_rate = 17500,				\
+	}
+
+#define s2mpg11_regulator_desc_ldo_cmn(_num, _supply, _ops,		\
+		_vrange, _vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,	\
+		_ramp_delay, _r_reg, _r_mask, _r_table, _r_table_sz,	\
+		_pc_reg, _pc_mask)					\
+	[S2MPG11_LDO##_num] = {						\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num "s",	\
+				S2MPG11_LDO##_num, _supply, _ops,	\
+				_vrange,				\
+				S2MPG11_PMIC_L##_num##S_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG11_PMIC_##_en_reg, _en_mask,	\
+				_ramp_delay, _r_reg, _r_mask, _r_table,	\
+				_r_table_sz),				\
+		.pctrlsel_reg = _pc_reg,				\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+/* standard LDO via LxM_CTRL */
+#define s2mpg11_regulator_desc_ldo(_num, _supply, _vrange)		\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ops, _vrange, CTRL, GENMASK(5, 0),	\
+		L##_num##S_CTRL, BIT(7),				\
+		0, 0, 0, NULL, 0,					\
+		0, 0)
+
+/* standard LDO but possibly GPIO controlled */
+#define s2mpg11_regulator_desc_ldo_gpio(_num, _supply, _vrange,		\
+					_pc_reg, _pc_mask)		\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ops, _vrange, CTRL, GENMASK(5, 0),	\
+		L##_num##S_CTRL, GENMASK(7, 6),				\
+		0, 0, 0, NULL, 0,					\
+		S2MPG11_PMIC_##_pc_reg, _pc_mask)
+
+/* LDO with ramp support and possibly GPIO controlled */
+#define s2mpg11_regulator_desc_ldo_ramp(_num, _supply, _vrange,		\
+		_en_mask, _r_reg, _pc_reg, _pc_mask)			\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ramp_ops, _vrange, CTRL1, GENMASK(6, 0), \
+		LDO_CTRL1, _en_mask,					\
+		6250, S2MPG11_PMIC_##_r_reg, GENMASK(1, 0),		\
+		s2mpg10_ldo_ramp_table,					\
+		ARRAY_SIZE(s2mpg10_ldo_ramp_table),			\
+		S2MPG11_PMIC_##_pc_reg, _pc_mask)
+
+/* voltage range for s2mpg11 BUCK 1, 2, 3, 4, 8, 9, 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 1, 200000, 450000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 5 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 5, 200000, 400000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 6, 200000, 1000000, 1500000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 7 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 7, 600000, 1500000, 2200000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK D */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, d, 600000, 2400000, 3300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK A */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, a, 600000, 1700000, 2100000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK BOOST */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, boost,
+		      2600000, 3000000, 3600000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 1, 2 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 1, 300000, 450000, 950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 3, 7, 10, 11, 12, 14, 15 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 3, 700000, 1600000, 1950000, STEP_25_MV);
+
+/* voltage range for s2mpg11 LDO 4, 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 4, 1800000, 2500000, 3300000, STEP_25_MV);
+
+/* voltage range for s2mpg11 LDO 5 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 5, 1600000, 1600000, 1950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 8 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 8, 979600, 1130400, 1281200, 5800);
+
+/* voltage range for s2mpg11 LDO 9 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 9, 725000, 725000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 13 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 13, 1800000, 1800000, 3350000, STEP_25_MV);
+
+static const struct s2mpg10_regulator_desc s2mpg11_regulators[] = {
+	s2mpg11_regulator_desc_buckboost(),
+	s2mpg11_regulator_desc_buckn_cm_gpio(1, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP1,
+					     PCTRLSEL1, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(2, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP1,
+					     PCTRLSEL1, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(3, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP2,
+					     PCTRLSEL2, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buck_cm(4, s2mpg11_buck_vranges1,
+				       OUT, BIT(7), DVS_RAMP2),
+	s2mpg11_regulator_desc_buckn_cm_gpio(5, s2mpg11_buck_vranges5,
+					     OUT, GENMASK(7, 6), DVS_RAMP3,
+					     PCTRLSEL2, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buck_cm(6, s2mpg11_buck_vranges6,
+				       OUT1, BIT(7), DVS_RAMP3),
+	s2mpg11_regulator_desc_buck_vm(7, s2mpg11_buck_vranges7,
+				       OUT1, BIT(7), DVS_RAMP4),
+	s2mpg11_regulator_desc_buckn_cm_gpio(8, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP4,
+					     PCTRLSEL3, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(9, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP5,
+					     PCTRLSEL3, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buck_cm(10, s2mpg11_buck_vranges1,
+				       OUT, BIT(7), DVS_RAMP5),
+	s2mpg11_regulator_desc_bucka(D, d, DVS_RAMP6, PCTRLSEL4, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_bucka(A, a, DVS_RAMP6, PCTRLSEL4, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_ldo_ramp(1, "vinl1s", s2mpg11_ldo_vranges1,
+					GENMASK(5, 4), DVS_SYNC_CTRL1,
+					PCTRLSEL5, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_ldo_ramp(2, "vinl1s", s2mpg11_ldo_vranges1,
+					GENMASK(7, 6), DVS_SYNC_CTRL2,
+					PCTRLSEL5, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_ldo(3, "vinl3s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(4, "vinl5s", s2mpg11_ldo_vranges4),
+	s2mpg11_regulator_desc_ldo(5, "vinl3s", s2mpg11_ldo_vranges5),
+	s2mpg11_regulator_desc_ldo(6, "vinl5s", s2mpg11_ldo_vranges4),
+	s2mpg11_regulator_desc_ldo(7, "vinl3s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo_gpio(8, "vinl2s", s2mpg11_ldo_vranges8,
+					PCTRLSEL6, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_ldo(9, "vinl2s", s2mpg11_ldo_vranges9),
+	s2mpg11_regulator_desc_ldo(10, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(11, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(12, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo_gpio(13, "vinl6s", s2mpg11_ldo_vranges13,
+					PCTRLSEL6, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_ldo(14, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(15, "vinl3s", s2mpg11_ldo_vranges3)
+};
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -1851,6 +2144,7 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
 		break;
 
 	case S2MPG10:
+	case S2MPG11:
 		/*
 		 * If desc.enable_val is != 0, then external control was
 		 * requested. We can not test s2mpg10_desc::ext_control,
@@ -1891,6 +2185,11 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		s2mpg1x_regulators = s2mpg10_regulators;
 		BUILD_BUG_ON(ARRAY_SIZE(s2mpg10_regulators) > S2MPS_REGULATOR_MAX);
 		break;
+	case S2MPG11:
+		rdev_num = ARRAY_SIZE(s2mpg11_regulators);
+		s2mpg1x_regulators = s2mpg11_regulators;
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpg11_regulators) > S2MPS_REGULATOR_MAX);
+		break;
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
@@ -1971,6 +2270,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mpg10-regulator", S2MPG10},
+	{ "s2mpg11-regulator", S2MPG11},
 	{ "s2mps11-regulator", S2MPS11X},
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},

-- 
2.52.0.457.g6b5491de43-goog

