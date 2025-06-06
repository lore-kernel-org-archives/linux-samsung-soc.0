Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD7628A407
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222208; cv=none; b=lAiTSIPzz6Ach+trQMAWbiPxtXtW/20dkiznMR0/XJ4Qg/IrAZojBWL+mDTt/x3nRVNnLca1amF6/VgHHbMwNPBM8lghgiseG+weZYBlFirtnUIJTet4CjtzVKqHBzeJ3wsky78v2wQOEnTjQmXB9DsCQOPkCd4ip33nsecbrrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222208; c=relaxed/simple;
	bh=DtlBkmeFf9pjAxGCgmCN5Tg4/h2onm9CJStRVS1CP9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUZqr9PeaENF/E7mn9SrZDjNPSSmExMsSjESlYV8+m6ABOrtwNmhNp1qhcASPLy4xshEc+39wVWcKXnlN/Nap1IFebVe95n+hf13ctP8pyeoLh+GdL+TtfrrGTC2rEHDfnD/IhfSMScCMDqYeIn5bKGSe/n4TtZJ6BWXeFRhLVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1yAVPmC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1yAVPmC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89333d603so390996666b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222201; x=1749827001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7btE5VBq3UbP0k1jf4CzhHOohoUdya+2IgQP8EiGSvc=;
        b=B1yAVPmCn7q80Q46pfamFbOoJ/Hh3nPHnt3sW6UK+hbaCn70FYvVqGxYPoIcq+Cv/C
         FofI2H87hL+DOeqtIOhYILkDcYNu9icRb09QWVkFjlgeeGHfSbnMBhFBGMsN8D+Qgdmx
         porGVnj66Ijd/CFoFCjag2xQjx8J6s14mcWmXV8X7PzWPdzhzyrK+/jNizM31gpmnDAw
         2ppdkyJbG0rNGnzOh+YRp92rR21n4C6z+/xapj50CPj9CyvaW78DbkEB6C62tgPMJHX6
         KUMAEspgBxTlwCq6e2FlzHtYfk6Njhwt8UrR1uJ4yUzZgcJBwfcZ/KZ7Jbn96nfsNRP9
         Y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222201; x=1749827001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7btE5VBq3UbP0k1jf4CzhHOohoUdya+2IgQP8EiGSvc=;
        b=AgP1aQTJ8nVN/NGjPQHZUlsBtxLgSLbfKD87YymlcJ72OBrjaz3wFyHdgfIHozd/JA
         YBrMY0TiWcLlohJxZdsM7hpSZgEX7VzT6NZ6siJ6f5fqv5a5DNxHqFY16P+S90+o3L68
         gFj9lc37CWSwcrGvmqd67R9wxHXExTpgGZDWrShnwWw6sgmzU/izgsObac/+Z+6yjZgu
         eGjFVro7/MvIJGm9jxpneFZJJhAZeCDAgozHlz/UVf4++T2mr1w3CDy2EgYtqAxrzu2e
         M72RHEpd7WWvVqBm+AAinsnPndSBXMvKI3bm8RXwfdf94crjJZ1c6sSDJ1DRvhhxwtLj
         qbhw==
X-Forwarded-Encrypted: i=1; AJvYcCWtSOA+nIMq/Aw7cifBaUL1Y8jYWFxygVZ/z0LUZmVFtF/+XcSedNZSMIP8zmEJ6XjtLb9JW0pX/WEwlX/NQJ1i7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJg8p4c2MHikewueBQGutG+zAzjymxB7CNSXg7Cl0E4UfMvk7
	eMHiYZs2j8lu0IAURb9y8Khko410u2QOOrfYdtBCVZB9cl91oBmYn2mSh+DQ8DePgaQ=
X-Gm-Gg: ASbGncu4fSn8vkiycLkDy7lq6jjamqU4iRzRfbbK44Zp0BnHDBEXaYcVTu2CIhW/IoD
	5iOx6wE67fITbcyTgMUwilJMwI9MCpwpuvjZUIwocXrZiONtkPWZ5JWWkRgpchArmY48RVjSzKz
	x5elHMWahDy/+dn4ri2s/XR6etmtleUEtff6Pacv50gADUX/+pW0nsZNcc/oqv2hDkagzOLg4Lm
	VhjSvjXG9P11Bft2KfYcm9seQw6jkpe/siohPXdimc3/3npCL2pQ6xCSXMZ2dW3IFSVtzm5Ad63
	/N8UDcs3U5RjS8ROnkhnQijTz5lkikdkWJt1P80BL7jDwBTT7ZAT9OqmB5GKtNnd810fHpXR7fa
	YiG8xxdI9ofZODD4owrEsMGkwuV2zhwrpwi14hcMI/Cnfsw==
X-Google-Smtp-Source: AGHT+IGxnm6pBbHVIYIIe9hkMQ8JxTW7peP3cR4UL9qPSHSxqgc6/znfqj1QohdocTUC3/x18Pe/gQ==
X-Received: by 2002:a17:907:8694:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-ade1aa0e3e8mr353586166b.49.1749222199472;
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:10 +0100
Subject: [PATCH v2 14/17] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-14-b03feffd2621@linaro.org>
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
index 3f2993b96c3e54427f5c0af7bb045e2278daa671..76be81c75c898fddc9570a62a64da787bacad7d7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -562,26 +562,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
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
@@ -591,6 +588,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
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
2.50.0.rc0.604.gd4ff7b7c86-goog

