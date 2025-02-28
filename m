Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD426D5B1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751646; cv=none; b=AwPU2Ok5h8FdZqSfoEYL+C8vknC3eG6Y2HuOmTmEa0NjwSsVV+0Tq6vCiB6jl51Uz4G51iyt9z2viAwN97vTfNFZ3jYBf0lYELR5D5YJRgvblYuVwLyoHzwJDrAF53IuVUmn9PL3jrKZOPr1xIxhaT2+qmJaIwULpGnNJ9eRVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751646; c=relaxed/simple;
	bh=YYl9m2BnndcCMYaFzMLWUSCBfr0DlXeXEgFndcdua9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVkO5OmiXqelxVUezxm5HmZ16DGrRyQnzt/vTe8LT+YdGexdZx/tRuHrLNkudMI0Ka0CRXt8GpKj/wGAyXIiviQ5SBMVyFPCZVpmvVo1NeI4FtOvc9ozrHQp4OOqXUKv9gzWuKdYBRf8lWmTvsPb41eIn4e9vIl/OXztCHGtZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWSYZCEa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWSYZCEa"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso2800351a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=FWSYZCEadyU8vj+pOdi9pSaK3qhDb0DI4SvuPVtjfjAN5lOFDiPpEUdNMZ2yKCrCRn
         XCsoPymSJT6/1KXGy7qXM9YpN+9bX0BkcbuJawYWUjvDgdkf1V9mn/OpD8JcQiEX1dzh
         l9BMqalRG+AtTZFpjLKPCs6AmJsJfVZ62z+eyXcgzuSRGmEnRHdPP2eeDVgvOvZr3xMy
         wfdCsQHPpVt3oH6b8rXf6rqiE5YaM61GS3TCBDeDFFySy7l2Fa+mq3GQuEmdIg7vPoMZ
         EZ4sb7BzTtmF4AwmWcoUZ9F3GvQYPMVuhD/QOxy63cMX2iSmfIRnDVy4iHop7gFfmDQC
         E+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=uqb90HaNT23VWBiYRpofHlrA6OL4dyre6AUCLSdTneTbadbCDahd/SRCDzUyzzdrRM
         tswxR7Cxv38KZ2MGGwcQCR63G1Km89IyLRyYt+bCrUqrBby3+2Trgt1O2bpBAm5mOfEW
         yynQZfJIJT96kkMK6YUudjnIRhYXZwGVTCfOtW0524oZci+kwQg//Af8AqeGh00uJL+2
         z7fkoWSR29JPwdFfZYkbfirEG/zc3/mrvGeuUteNbpNYi1ZTXQFrQsWN8Juu7mHdC+4x
         cIkF8m036LvtQX/mke856ZoBTdr/JgVUfW/Dp/p5qv88GTlbhhHR+KdFvM6b1k4v0sGV
         KueA==
X-Forwarded-Encrypted: i=1; AJvYcCWCyZvFIMpA3/nTPJRZ30zj0VJ6h73FafCS7Fjs0ezEFE3zyGzcA0Nf+mnJgIXk//p72J18cVEXM5aAGeh7pabS0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlG/tpXLYiHo1GocHEcHjUB+EEyAfUNNJNM7zqGZ6/kvwazXD
	4wefz9FE7Nx14P+j9z5Ga9/G45/oxegrMKYHXTvl5KJv9s7Mnbpd3EMjjCinNzE=
X-Gm-Gg: ASbGncu81xaMtlI2ehLAFUnPhnxk8Bboy43n04Drn3m4y5/wxEWmhU3Y86peeZvElMX
	Y0p4r8KhXKx1bTc8RH40Ae+nKPP75BR+10JC2MaGvrYzR2c77C9OfjQ6O+R5H87Q0ZMj+b3oMsn
	AkvLnjGnD+d7wNOA0tT2sYys8UGBLxuzlwSaLvSoQDbxEHLGutjQpUlOPqQK49gt+YTAmf8jRRZ
	9tERSxTTJB1+FlAloJi7vnIg9KOsqeQanm1Yg42JNbUjRxjq16EBkxchAUzkaOfbo+Ea+HJtvsX
	XP2NlKypN4n5z13uIi3ZsiTyDK2XcZ/yZsQhk6m2QbL6X8FatCsDBYbqM3p2pYFP/SsecaLq/tB
	LLZSivoWiQw==
X-Google-Smtp-Source: AGHT+IHzPJx5i3RI7O2yaVdHtPJ0az692A2jfkouiK94jhHcaAYqi/2J0zpg5aMdk74cXIZT8BcCug==
X-Received: by 2002:a05:6402:42cb:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5e4d6af0565mr2697422a12.11.1740751643440;
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:15 +0000
Subject: [PATCH 02/18] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-2-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

When this driver was converted to using the devres managed i2c device
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..77dd61c30681b8f0a2f23063ad5f7eb52f5b7158 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -146,7 +146,6 @@ static const struct s5m_rtc_reg_config s2mps15_rtc_regs = {
 
 struct s5m_rtc_info {
 	struct device *dev;
-	struct i2c_client *i2c;
 	struct sec_pmic_dev *s5m87xx;
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
@@ -640,6 +639,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
 	struct s5m_rtc_info *info;
+	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
@@ -675,14 +675,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					      RTC_I2C_ADDR);
-	if (IS_ERR(info->i2c)) {
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, i2c->adapter,
+					RTC_I2C_ADDR);
+	if (IS_ERR(i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(info->i2c);
+		return PTR_ERR(i2c);
 	}
 
-	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
+	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",

-- 
2.48.1.711.g2feabab25a-goog

