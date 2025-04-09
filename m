Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978421CC4F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231078; cv=none; b=VBAfMOCGEq3Oj65208blcvyf9qB+33qBvzvK9PUNJ3YGn3vl005wwDE5CQM6DMFXQ+5VL99ce6wqTcTgsmygPtCwx9tnnMKDB+nz0y4cN1XhHaB998U/Ldmi3LOElUaqVCXmlBPPp+WqVdTpxiHOyEN9NsLE3SxzCRGmRb5AsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231078; c=relaxed/simple;
	bh=J/CBfdIH1PuesSVHF4EK8RNmESPjuValNl5qYw0EebM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SElbA+cgHJBWcEJEwyOn5arAet/hbJ27KbP+mLS+zOz7gaGEcLmz+DvCG41eRFLh3FjcAVWzNtOKTTbth6g0cnqB1ctknOBz3Py+pi61sx2ElRXVrDs2HXt1Fg00Bwv6qGEGn5mmRSACR17R+fH3KTBQj7IUPQS4W50Rt1BbNMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKlxUnXO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKlxUnXO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2151341a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231065; x=1744835865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96SpQhawR8x63CHV+WMoNeJ+9FHffMMf4Oxsm8b8rjw=;
        b=tKlxUnXOib60HRL6ncEWcFiCA6qG/yT9HpQcDGXprUrxjvcPwQ/RNf/jvNzDhivmsR
         UunIxFTJyMLJtg/hit2KUnL8lREe9HoKwd/c+z63+L67Q5H53ZAWMHkfdn90uj3Kz5z6
         3IFGasr/wNmYcVrKgLtZoDLTxy7oi9xFLoPcZg6n+eE6537cKIfgmbmXvK/OBEb3WNJ2
         ye+fGcGiw6A+ByElZzGnzIMncNFMl4cTKOw2UWavLEu40MtMHIp6zsGcSAyOdK+mRTS3
         H2dAc/ZODsLGYmAYilJ2S+K44bCujnmXY6SVrw+EMLLRKCfXO0O9Se1jv92vpcDv0jCj
         R5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231065; x=1744835865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96SpQhawR8x63CHV+WMoNeJ+9FHffMMf4Oxsm8b8rjw=;
        b=VnGMgQpTWySfdakvl/5hgAeq4ri4IOQwmjCjySRSnP2hem/4ZP4V6d2P4Yt+8X//l3
         W2l1neaIANEDIdgJXk0PPcYG60IqGw7+CVQ8Vzs+Y1KkXwaT8hu9ZCP0rvHv77Rj9/R+
         wWRkmjkuJ+aht+pMXd3+tkGjz17jsq1R/0/RDBMDxXoK15TzMub4xAMATKdI5nNp4f9X
         ca8qoLLLFtlgk5rV+Mp5aIPMswCB+jjOP8g0OKLM0bCqGiHt82OC5Yelc5PLEkeGz40c
         nzzEPlXxEV1ctSlqvlC2yv01DctJsrOma0FWxgqfTNdff4Vth612AHhHLqu976TPGRhG
         3OSg==
X-Forwarded-Encrypted: i=1; AJvYcCXmmSEPtfp/u+P/YkJ290HvDVM/f0a3/nbVaF3lzBmY1kCOVSYxBPz4594lw8imMyl/sC/dPKO1mIleJupNio20nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrEUmkH3gc+jrOW2JRExwZzSuXm4wSyGlEbpvFQ1T0rcOZXyZ
	t41lEll4C32CFe29mChZM76o8d+8dCce6xAU3IhtB6gSKN20Ni7NYxxm4GlOtes=
X-Gm-Gg: ASbGncs2+J4xzDdNRHaOLUUpx9O8jJmFTgdF4ZB61E/g4qk0au2S7QGkJHq+X+k8r41
	CTFZtj9Au25NIzjmUqW3KIihBOif+TIKwTfnkdyDbGTtJYXyyq6l3bhJSkWc1MXvMlhlF2zW9Un
	zhbc8v8l5nxIfAvTszdidUpbAI0S9WOayOjMxMU8s/SEJ6q1eRvkbarqcJ3gXdHi4Ml6oAJJyva
	ozadu6f1ZZlpXzY+LDquibX9D0aKkgc1YmTOZCE+GXPQ1uAcO6XYiDnI8QzaBa3GauTXOyNkSRM
	xvcXw5eMk6EqJtaz/vB5+ed2hvsLTu3XhE+xE3wYIO3ArVPXR2tDJdP8TnoyqgK6qTNOzp5dVKx
	dcOreBk+vOHyKXD+de6KhiAxh0kQ=
X-Google-Smtp-Source: AGHT+IEzQMsFiFL/jdSvqMTouRITC/7JunlX1FkfQVGWlY9H5peZ1h9WvmD7A/zfy8HqRCQ5/PLUeg==
X-Received: by 2002:a17:907:7e86:b0:ac7:7d3e:7336 with SMTP id a640c23a62f3a-acabd3a3d95mr6823066b.22.1744231065588;
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:52 +0100
Subject: [PATCH v4 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-31-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra work in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 27115523b8c25794a9f3ac8e734bb1ed998e9518..a7220b4d0e8dd35786b060e2a4106e2a39fe743f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.604.gff1f9ca942-goog

