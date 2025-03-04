Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC4286298
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107936; cv=none; b=jvUVl+ULayfN5100SxI367ASIg6k0wSyDcyDNRDDEXJqLbl2qE5MJ5qOEr0UNuaurEmrKayOzfgEySvn4tdJSsWLU4U+fElOoTcM3UXAnm0H4BGdbtTGCzBkYaP8HlLUZ/u5G1zWQlQEYkOhsps9SQRpHYR2+sZMOvb91uTFLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107936; c=relaxed/simple;
	bh=uYPyL/IWo3+zxsKwPHXxHCdTPQr36Ok0GjwhGtYCZ8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjiDkfYdCHWDHOZMTUmHG63/Qy2iyJ8FOY5jx1V5Rz2sRjbpwI5S9OFIsf1voVHrUXO47JY5HtY9xmIn93AHWcwzU49/hFhrIKku4g6bhuSRwHJMUprwdsrHON2upsg3/AKHfdS3OPbZ0Dc+3yvsY7Uh+3XqvvmD6N20P7wTx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWwuzUgF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWwuzUgF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390cf7458f5so5518000f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107932; x=1741712732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=LWwuzUgFnhYf5w853jXU4MbTtJG5AKP1cFGZ/rJ82kPJ6qEzUkYAnP7WpAzjw4caml
         CD9bu06MA2LmxelRdj4Wxtn1sFMXfvwP9BtZSMRcQ1pLoeAPQhC2/bo4tNPpci7HrFfw
         Dsy4ab1qeCOIN1l6SSS2f4NgX2ZjLweg2stZA0fvO8Xmwvpc1/jmpkPzVVHYH2yE79ob
         D5biFz0mJCIs5QHsQom5/OR1YrpojGaURub+qHWxfWI64nGNsABh8Fl0g5BpM8nFzf4r
         2/Qx6kTt2bI4scSFCzRpYyGVKRWSx7hmZ9z1A3sRKCSuocug2QrVMj/AcgIBNkkW8A24
         WLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107932; x=1741712732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=c6V+15FKILgMldrfOiM94n9U5tYyWswkhhE/esAOFwhLaiU8w7MHGzURKrkqC1mLNI
         9laFeu5EKGEMdcm0MXxEG8l8L1HchzFVR/d/8Q5gWdcFQmPzar0Zvmh4gW2xa+JXf1KF
         Dae90J0EQKQ9OSxXNjX3+eDqY+hgZwL5VANpvUVQ8L/hsQVTvAHm6zQN7VI0i6A6CnCy
         yT2OXFI8QiDT6o/I751ln1z1x23jYR16/vjblse87UIkYyif/vXl66cExZ7QUiyv36Bp
         xdywN3ugrb9FDp1ALYQygzQR8dna7/CYqS2Smp1DJupgNoqovLDCOCRcoPk1JO/vntYw
         Wg7g==
X-Forwarded-Encrypted: i=1; AJvYcCWm4QVWAMu9sghDjjvBYVuqcBa8I8uM+7ara8QV0SeYk9t1mMp+VVE+WsfIoACuccVgUo38Wcr5KHve7bLTBFcdVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyXeXGRB0n75NWE3eD9mYvjEqIZi3bzWwHktW2jguiRMoPyZ4
	rYzHlX+uVrW7vFTAQB6huop/uEirFdslvB3Nilz3u8YI+GLewYQCNbhw0FaZFWRcrmEZVsxgRls
	MN3E=
X-Gm-Gg: ASbGncvori2ZvEIArVtl2hdm8tNyuYhXh2HFF6uqaaMnkvP4/4DpIPEs6gJSsWChp+Y
	vKcCrr4vsR35nB+v14OvZTxmVZ52VaWfzw74WVJEOe4FHYbWzA5IcZuPEcLTKQ7xBOjPvnjSIZu
	UsFt5ABQCn6g7nBM+ci22u1PMj1r6IOaeGtz8h+FXk3WJcU4IIbqeirTc8n0+6IewT8K6ENipPk
	0jhYzIYzqaymfLFMVFcHF6nsj5LSWeW8TmwMn0sAS6JatDAR/gND7v9NAnXRO9uaoH+jSNPgzVF
	plgC3QqRKW2BLoTvQO2rjyDeumYdG3th/rH2CBVAz2G624Cg/VtJ/0lYArmHChyucSu9AVi+NiG
	ULDPYS/SnHlsaUktJpNFvOKZ89jFe
X-Google-Smtp-Source: AGHT+IHSc8pjwattEBJyeHF3OjOkT41+G9Y/Rh1pozPSubIjG3eC8i5kYIqu87xMZCHZm4ULB7j+yA==
X-Received: by 2002:a05:6000:1faf:b0:391:888:f534 with SMTP id ffacd0b85a97d-3910888f656mr7939190f8f.20.1741107931986;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:29 +0000
Subject: [PATCH v2 01/16] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-1-d4689a71668c@linaro.org>
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
in commit 59a7f24fceb3 ("rtc: max77686: convert to
devm_i2c_new_dummy_device()"), struct max77686_rtc_info::rtc became
essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7bb044d2ac25aeaaf2404b47b7e7bd485ae3d39e..6b0d02b44c8097453f704cbec9f02580fb869ca3 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -85,7 +85,6 @@ struct max77686_rtc_driver_data {
 
 struct max77686_rtc_info {
 	struct device		*dev;
-	struct i2c_client	*rtc;
 	struct rtc_device	*rtc_dev;
 	struct mutex		lock;
 
@@ -691,6 +690,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
 	struct i2c_client *parent_i2c = to_i2c_client(parent);
+	struct i2c_client *client;
 	int ret;
 
 	if (info->drv_data->rtc_irq_from_platform) {
@@ -714,14 +714,14 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	info->rtc = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					      info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(info->rtc)) {
+	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
+					   info->drv_data->rtc_i2c_addr);
+	if (IS_ERR(client)) {
 		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(info->rtc);
+		return PTR_ERR(client);
 	}
 
-	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
+	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);

-- 
2.48.1.711.g2feabab25a-goog

