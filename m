Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1DA2702B8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751654; cv=none; b=LQnm/f4TCkaNJRGBiImRCqL9p4r52sbfXp0z+t5tFCSxjDhQfmMReiS8kBZKi+s0mEXBnqdbleHhYrRJ249IrsiBfc8RihAy3bJsRE2znQILn18HKFkazNEnTXZVr4aCTFAGoulQ37qQCzasjOA7OjoY48t9GPeiK4WD47HiGdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751654; c=relaxed/simple;
	bh=YWsW1Hi2ZTuQ4PTHK3D3g/NShAx4HGeNxSNC1qLA8+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JL+20gcrapKnYWyhbE826E+4O7VP1GRfd+QXvYX8h0W+nRJm9enUpVjJUnOOoVzyLuEJQF3/l6Nbbhi1Njm7lcNKtIrVndYSgATJ2XlTa6Zr9qb6QBiroSq2aoNiTX7EntjkQmWxkfnVd9kkR0lDZBCAV+4pg7BkqQyJ05rKR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7tPzYs5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7tPzYs5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so3184960a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=j7tPzYs5kMi3OXCfBSZ/zp59PZ+0it49nJTyQFkUfV98Nqr5zXXgEjXPo13EQACQwE
         rcl9sDp+2z2BcLQVgAMS5Y3V9JXPp/rQewLRxGFGD1Eh7t+2ZCSpgDIx69ApmNMeuUZH
         c7WRW3zkmtX4PdALnviuis+bbbC4PKjDhzzFyacNWkFMiu7iGgYm139IpWMdssRf6qmS
         SPI3h6UI3BxN7ewQ74RQ+qCWy1QpSRfmH+TiJF6aALk56/+A4njF/T8nMYYAqWRXpMcQ
         KxROVbTWTF0sjLmmkczb05zYo5zeo2Lk5Yam8b/qihY1xZ2X50pW0fxChgbxBzChM91p
         kjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=kN/l6m3fVw1A+79V0onpiBbIYgvWiP96J4FmRvarLLmySLb0cD/JaWNcw05b3ZY0Xc
         ZgvsKBu1rB3Qp2poWgu4wmacFwnx7XAnHm1oyycN47J1KMdzO1RcIeWlk0OIBCdqS1QX
         SoTts3nrMsLtNFT5Vg1fwJQMv4xvEYjZ3+vVA9PR59l98NyOh2d7KqwXJkPbyNeA5g1Q
         WQsuNutFrwnE0MvVJoh4JHf+7MWPRuZRV7DkQ6tRkve5ljfNMQzWADL4CwpM8sDnSiSA
         IkFI9gBcboWKsFfPswUG+ZSd8mffT+vwhx0wf/73bJfKMqFiQRapOvmBxibY7KnPk3T5
         wb/A==
X-Forwarded-Encrypted: i=1; AJvYcCW12t/2avkN/+PJTsW0GGWyEXL0iMC/g//xg/q+pqg7xb9uduUUVi1O3qMj0H0oQCgnqmHlQOJ4+5t3TFA1h7unGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFh73FFr1Xtd+uYMGDsieAm1R8/xM9qcR9Zxi86lT0aebADqx
	4GJP8TQTyLgx7wc3oIPsJZJHgYTJuReoxyp0NHqYIYoZZaL8b/T5ZabKENtXiX8=
X-Gm-Gg: ASbGnctgXKbb25BgEsqKJaOiLsvb5zJBy+M412KqjT/SnNClQWufTsXpzoqt8NVoBKy
	p7NoMCxMp+nOXU6at2DmJBdE2dh6McY+ay7HaN0raZuOwtRhVflfGtBs0OJeil5IBzt34HYraUr
	4iXSDYFFesf5U7qgPwJhZ95b2KfhCFkAi+QE/GNzLIX7TFsvHTjJGiuLi1J+mW7feae9p42ylYq
	qTf0XYvbYX2ohIkZ8ozVr1DB8Dkb+BkVqFEf+0U5RQ2qLxjOMu11seQZvszlKCfWOkL5jfMZe7U
	i+A7zhRJ4NbR2oA6YkiY/ZshOkprv3Fc0Ix5D5J/8i0Qf6HgrLvQ8XPDJnydk4EEtDeu4Jt51+2
	XyuhYj6mEqw==
X-Google-Smtp-Source: AGHT+IHq59q43U3ESaHrkdTJX61FFZSQWYbph+vbGLJu0Eb0VqRkvBLNVX+MfvKgdS008nj52Al/2Q==
X-Received: by 2002:a05:6402:5188:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5e4d6b83d0emr2632501a12.27.1740751649255;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:26 +0000
Subject: [PATCH 13/18] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd2405al.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index d2568c3e387659dfea598cd2ef6bddc5c076cbb9..00c3033e8079b5f10aaabcc7a1d3f19771263a02 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -42,7 +42,6 @@
 
 struct sd2405al {
 	struct device		*dev;
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static const struct regmap_config sd2405al_regmap_conf = {
 static int sd2405al_probe(struct i2c_client *client)
 {
 	struct sd2405al *sd2405al;
+	struct rtc_device *rtc;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -182,17 +182,17 @@ static int sd2405al_probe(struct i2c_client *client)
 	if (IS_ERR(sd2405al->regmap))
 		return PTR_ERR(sd2405al->regmap);
 
-	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd2405al->rtc))
-		return PTR_ERR(sd2405al->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd2405al->rtc->ops = &sd2405al_rtc_ops;
-	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd2405al_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	dev_set_drvdata(&client->dev, sd2405al);
 
-	ret = devm_rtc_register_device(sd2405al->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret < 0)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog

