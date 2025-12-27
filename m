Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A033032F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838289; cv=none; b=IaHFOuM8q4qR3rSRYL9VWDpPyyJqtNyr4R1o93B6EhBzo7LbqmhFBUAwdMB5QQturv8aJ2Utfq09RYaockzVvI39/UgrGIbqA4Lq19a4a/5+qkTydJYj1LJ1E8KaskKnsRYbm+m+nbhOKJ13pTCyVvZv1PQjIj+0PcUBcrW5L34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838289; c=relaxed/simple;
	bh=ZtimU7gm1PrFcEfk0MV7OaApuuKINQ3TVVyW7YAfhJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YV+qOb/GnXTydyFXMO+IUny0EdMTt4Z8dtbNzwX/HGSBP5Hm6q9lOq06Ziwpa0/GFssXHi2wrM4QyTZNmnVizAbRjXawSHSEIk1iFEm9fg6Fj55xe1/RGD6bSwLHOopjoDIfSYX9Z/MNxXv4vtT8K4EcMzwUkwROkUHJ+ThuFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5D2lvHh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5D2lvHh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so9036906a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838279; x=1767443079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqjJPQ+Kki9Vjm0bw/2XeIC3VM9xGuMuLb0QgtHhylQ=;
        b=a5D2lvHht8oyyQOW/Q3Ixnu7h8kTS2EvkzTL3e+uzTSWZl5rcG99yzWmr2RV85MGag
         mOGcmnNIBOYxsP0sb/ElwrPjtazrr8DzV9SxwkxDgGZ9mOYSGc6B1tZ3D48bWlchpYDa
         YCBhOYc+1OLDktZ+PvAXVPqViAORGU/rdkC+za3nOe8HqeGWik9bneFxuHm8rks5oU2u
         9kNjb3yC56rRC+gef1xI3/czxoFFh7hWZwOJqJRGgHSegl6qFiEvJLBBTUTSjszGyeDY
         DyB8Rwtr/IgEa9mWH5xMwfeiQ2xr/NRia1uNx73et+uW8X0ZeDsRT95dQL5zP29hjMwW
         zaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838279; x=1767443079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqjJPQ+Kki9Vjm0bw/2XeIC3VM9xGuMuLb0QgtHhylQ=;
        b=wkDj7G2NEle3gIRagx37J4KVATMjWoFi9ddm7Zg/ueR+G3gUGJwtcul2R5k642SiIL
         YGaQNO6qfpG1fkV01MAV6RTdOBCwdOMtjER9t/D6n+nrl1CtoK8dTdQVEYyUl/usPkXl
         Bvhp2QlYXejytgSz6xiUsKlw9Al1vvbs1sFLbDSy7WopK10mxWu9/a2uczbShiQG3cw+
         AYS/zwxb+elGka9vVNDrDnwHh9eUgkrHbwJMS3w3tTPAqtFOfubiJOZ+V18eUG5kZUL0
         IHT1jGRPmFfqSQ/rbCZ2b1t9NqrQjtpjEmQ0yZJ9C9l/jNpPMqP7H5FvlxcVTDY585U5
         hVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXG613l0zjGOF4057ZkouR1/6ljsfK6x7T9Gt2YS5WmeOnlLzopSy9ufFPIjrbrYqniwj0fhDauUyS6CJb0laUxuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxahmQnBzwVcoxmfFuvFUMFJ9WfKbos70GuWEtIhSBusX8g8CND
	NizXQpum34JaaipOWYQR/LVCq2CSkhVqjeHb6W8xzekPOprlYEKzCj4yq3h9pVtfUuM=
X-Gm-Gg: AY/fxX73NmvSUhe3Bc9/EZFFc4KwkSYkGlgNL5MAjHFsKa59hu5iId6v5n93VKSNguB
	W18c8IyZ4B1haEhaeiBFve8/EaLy1EqpSZooZqSVgo3MA/FMcw7AblKoX+thu75RAadCOk1UMEH
	Tod4Q95ouKb5+tX6JF5QVMd4UhPY1DI+pR599sY9oSNT9e3xG9VHuQ2af7FebH2TosuxWzpCB4/
	JwD0FW2LOnXcGWw5lIJ2wHCi8c0vDcRYokR1kubcWR2MEhws2Hkqljw4CjQRK/p/LVE12ovwBR/
	RPILEhWNmQa2tvSsGDmbjgPBWiQ/VFkZI9ty/fgMBhrANeqSPyMLmH5NYh0t/7vFWJZeaCaTQIq
	I+MiSYQQXFgAFgBkrSd9d60PmwbD3nlFVDrjraOywPLhZkufAH0G1S9OME3BBYc2NAEOIycZx5u
	w9LLL8v08Wx+bhpnvTwNHIaAUyL3bsEeP5/0ifDwZO9txB3qeXFvtH28PBj/lVj2PrgeoLfMT7x
	rV9Rw==
X-Google-Smtp-Source: AGHT+IE+QRrVPaBCy56QCbI4QkrRX7vUwMKYczTApOAlpziFFNN55uPCnxuQ1egJcYibXo+YhY/13A==
X-Received: by 2002:a05:6402:2755:b0:64d:4894:774c with SMTP id 4fb4d7f45d1cf-64d48947a3emr18801609a12.7.1766838279224;
        Sat, 27 Dec 2025 04:24:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:39 +0000
Subject: [PATCH v5 17/21] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-17-0c04b360b4c9@linaro.org>
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
index 4924c48ee7502c63f7a1fc620a2d252b7d8ed828..beff85c72580efaa0bbfaaefe6b4386edcb00919 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -560,26 +560,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
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
@@ -589,6 +586,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
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

