Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016228D04B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107937; cv=none; b=Ecr3sPnZBS8MXoFBgSbM8+hVFKnExVCmmG+QMn2hmA25cgKBqVQ9riZfvzaJ/Z7KTC8KizARDD4oqDGwyjGZofvpNNzimHLUw2SIJv0a5hv8IFdBS+owdBywatAakKzURNEYWcuM+sY/8E9qswnR7oZfiFz1Gt+xhe8Ake54WeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107937; c=relaxed/simple;
	bh=HyCZnj76UJVLp2TFtsvoqPrnKIyS4fiKrwZnWeOiCGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2OKhVTep/tilItM7qDkR3V0lYdxIP83aFAn8pPVlaIaAzTUb65tCPSzsbCqVjwxG27QbPOAM8UB9oHFlo7MY1mAy36wuqZeGIhsnE4E/YyORKeOGZSBIPnxM3LrNuwMk/6w2ayLeMnCfCqUWj/dF36JJ3MsfaDI9VYxa+xA14I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjpaGvfe; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjpaGvfe"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac202264f9cso95906466b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107933; x=1741712733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=JjpaGvfeXND1gsfIdIOi5Nk7vBOmHveBguX5rdh4QUFLQh/gyAB5LEutlmL96XIt9u
         2H8jEpvgTzvhzDBaaHd8+NTKZ8Gw+dpwXAzMGO5jf4c6/vEqqPDi/rsea2Ya4rpaKKly
         YYRodY3e0yyZn0VpGqyWfqZ355MXDsBQU4LrjsEBg2CzLff6NG//KhZOwc2Uc9AtxSFA
         sTLXJRhgPZLcOL+bqUN/usZut+CpNv04Yxx1VhvjOcoKPQ5EC/3+wAXg0Gbn9vw3As04
         EBwD0AOM+JMZIZvL5K6qyH7KqtUJr5sDZPiCkwOTH3/nStZPSmJ5G/iFR3+wLfocgEaF
         7yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107933; x=1741712733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=UWnOTNSFyVISZwk5bQ1Bah0Uksv89YnVG2fAwVhp7+68Kg3kqqLCcqg85Yv4qFSNvv
         9aQ6sJbwsjFGPYt6RlQbGJGFPt5ZDeiJ9cjaQg1kQ5PHOb3gg5VkpmV7ucMaXfAdp+3T
         wYbZvY7MNpQMiV4GUw7bar7O9DX3qQLpE8UqrqMknzugVjbaK1FffFAbofAb++u40Nog
         iExHQ3Wso+aKP7LgrNNF5z14R6wH1MQYaKk0m3ZW4LhSHGOCLWR5LvqcFsLcl4yhIaPp
         cKqSfxe8GfQ7QY/6XzUCkxK+6K/H3OpigD/GMqOZgtFdmZEHX4uc8o7wp4TBPg3Pt6b8
         6irw==
X-Forwarded-Encrypted: i=1; AJvYcCX1dppdGcowuZt1zQ8RvWwFfUOhb+u8JnKpJ11+9oPaC+ZtY3pyjOJgD1tHyi+ekNrQ9vyrKplgDBnfGYl7cxBc8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR+oZdzhnjkzOzMH7ngBF6QAsIlDRt8bVwn2NOw6up378SNB3h
	qlwnAexSWSRRekG+du+KG32L8SJdIEpRmORV59M5bK2JPfYee/04d2L5VRzLyemKUALfSUVtcn2
	SYL4=
X-Gm-Gg: ASbGncvmofWDYa3gvG3eQMblmEknB7A4xcmHn293irB+Hj7ncPGbAGoBgQ/rSNY/iLZ
	BpGTFbqs2byZmAeHQMbED85bRd04YJ7cTyHBqO9ebeSl/JIqbtQUSfNGwSfERtmZWNUtVv+7L8d
	/QI9PsvFdBbUaObyxs3S8/F9x8kCYp86QRFVd081mvziT4X375dqTJUnsOELnBwM0MVbXrDaDf0
	QYa9ZmZxBsspq5xk+58juNbsU7rDdFa9WKubi93bxbvcG+bk5B96HGRcnUnReAPIJMQT+dTKNMR
	HdHperTs8nsq3dllM9E6ko43j8jktyh1Dp1ZdtABMNAykHYu1TBcRMjeEIC8czaCKdi5ISaZop3
	KkHzB5UnnBSDFHi/k9gwNIqSX6+Vi
X-Google-Smtp-Source: AGHT+IHVbcY6l9+JTAHHIw3fmIWanoQo+sapqWdolutCogJsq5sGcHSbYPT4D1lGvFYrwfxZJsMGVg==
X-Received: by 2002:a17:906:f5aa:b0:abf:59a3:df19 with SMTP id a640c23a62f3a-abf59a3fa56mr1580793966b.57.1741107932647;
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:30 +0000
Subject: [PATCH v2 02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-2-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

When this driver was converted to using the devres managed i2c device
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* fix arguments to devm_i2c_new_dummy_device() - too eager sed //, and
  gcc didn't notice, only clang :-(
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..88aed27660348a05886f080a2848fcabbf9666d0 100644
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
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
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

