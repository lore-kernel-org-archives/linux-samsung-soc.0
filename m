Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A143290BA6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107945; cv=none; b=a5maVQncllG6ediOcizuIND4HXE3DN9OSYhxVq5kGnjqL7QILt6RMXZtj+1NFoJMS1rNZwxye2JXld4A13u5UXqp7udFbg61N03MN/EE6IY9TVkc+50zQMMrWNv61TJlILui4TD15UfyxApUoTMcafsZ6YiFqAjTX4rQOPfrUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107945; c=relaxed/simple;
	bh=cZSNlyCPP2sZ0NzEjW15iAl44WPa7AMx/oJSQqQslPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGuauloifUprCCCeYtykNGHnafzVD9YRszOMsJG+ZzZeRF+sm+MW3Di+h0WJLLGzC3D9Hf4qvyeIFyMDGqPvHAzD8mPA10hTZN2VRSI5flYxFmXD5B5pyROt9lKaTnwdK7fLREgST7LHzIYOKQ8p+RSyS7b+WsZK2PT3nLR/ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vN+tBiVF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vN+tBiVF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so10385606a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaB5zKXHk0fgCsI3Zx6BuQOTGpJ5CFC8NMnIRZG9Bxw=;
        b=vN+tBiVFjj9NWy+sR30STVTJVQOlPMontgXnreD0UEF0FNIK216w43cEBCt6q32RPV
         WtpmUi506tjlDhwpBvjX7hdBdGtjuTWAmUSzQ8vdtcS600TzBFdORn1ImbxFH5Wmfx5O
         3saOW6xogD3aqViv04SG7QnMpEK7NmEgb/Peq8nimajzbXH3EUTLNcJws9TfukGm9+kz
         tsPfySBeawqp2msWq98PcSx+/N/UQQQL0w9DYbcB1VutoWpGkVHJj1FVOxnD5wdLFKHj
         17sknKc3r+K4tPXuoGV8BtP6KZWFAm9uIe4r7Lx85tY8izSqkB15mqyUGmdUMtIvGhyl
         s3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaB5zKXHk0fgCsI3Zx6BuQOTGpJ5CFC8NMnIRZG9Bxw=;
        b=sQOtt5STBz9OS4S+kDifMIpiqdc49tfRWJBeueTc3rDdy/UxtLDetZt18+RlvMXyMt
         /99oVe5/HYuSFEjBGDTGoSoF2uvtkv1hP6xalQh8rq69z657inwuRypgm9zAjicYUgY8
         nHyyBQVu7ZXDvUTbUyIeWEJsz+DLGK9ZeAPxOjh1IJseUE6Nfdi1FXyffVlZpgdIv1zD
         JsGZFUg89HK4N82/HvgtiSu3iarjZIMhCbUErpJLSjt/2fMpFKRdm48yt/jJPXwkSZCX
         mDEK0+JZ+lnonLN4hyzCCf2JGjMNLQhuMYobHA8jpBwb3UinnR9TTC4s2vy3YrSoyeBe
         pvfA==
X-Forwarded-Encrypted: i=1; AJvYcCUzKhRjOjf6d7RDhvAxEcx7ErxrN1SDbJ3AsU9GlHDdfRdMnnVKb1JxY4MeT9H/x2YTGTPnW1ZhrWk4yQut3gUBHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIcIw/f0FPa/odnJf724lInUY+o4Bxz7dN/q4KbRg4wbWPcNHs
	4P9k0I8u6McRSLiJFq9CbLmvCaleeak+IOhRKcC1dwCDIGkofZ/LPlKSbJRc/STQXMOv1pNlj5S
	jexI=
X-Gm-Gg: ASbGncvjbseJvNw3P8QJN+yQqES8fO/BTPCrC0GNNMVUeJE0RqB4cuIJ7d9omZe59mR
	E03OcM+ezyTSezAlRd1DJbYrmdSbepmwFvB7x4sDSzp9QVCR7b3d6O+sUbQTxGXDZkHEcCgra3F
	asZ6t2Ljmyu9/8/kBCQfnHKF5oZH/KayxCw/1vDmaTBmWdof13EcsaNvyeNjpfAuqAxwFwNxER3
	ksxQxGz3YT8NOqgC+X6m3X/xbQ+Mgi0uHs9qDcvWcrcLLD/ojtyuXzKIFxO3wSz/ZLRFJN1gURU
	x6uQWme3kSe/7EoY8DzEBMVh4LJ+KRNaR0CshIwe5LGcAeTRdodoCQw5JLW1pfb5CNLzjo630xN
	C2tzPXc+dx8REhV1eZ1QdUGJ1epcf
X-Google-Smtp-Source: AGHT+IEthaeTae6V+bsrtEeJOclicWZ8u/xfJHzWX8LHXk81mGbjX6FsBTkNnwrP87t1Gku2pvbmyw==
X-Received: by 2002:a17:907:6ea5:b0:ac1:e1a7:44af with SMTP id a640c23a62f3a-ac1e1a747c4mr790541466b.49.1741107938652;
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:39 +0000
Subject: [PATCH v2 11/16] rtc: rx8581: drop needless struct rx8581
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-11-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Since this now means that the structure has just one member only left,
there  is no need anymore to allocate data for it and pass that around
via the various callbacks, just to extract that one member.

Instead, we can just pass that one member and avoid the extra memory
allocation for the containing struct, reducing runtime memory
consumption.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-rx8581.c | 85 ++++++++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index b18c12887bdc3705ea4cee9b8d75086a05b24e71..20c2dff01bae833ae4e100cc38cd5f030017be75 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -52,11 +52,6 @@
 #define RX8571_USER_RAM		0x10
 #define RX8571_NVRAM_SIZE	0x10
 
-struct rx8581 {
-	struct regmap		*regmap;
-	struct rtc_device	*rtc;
-};
-
 struct rx85x1_config {
 	struct regmap_config regmap;
 	unsigned int num_nvram;
@@ -72,14 +67,14 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char date[7];
 	unsigned int data;
 	int err;
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	/* First we ensure that the "update flag" is not set, we read the
 	 * time and date then re-read the "update flag". If the update flag
 	 * has been set, we know that the time has changed during the read so
 	 * we repeat the whole process again.
 	 */
-	err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+	err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 	if (err < 0)
 		return err;
 
@@ -92,20 +87,20 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	do {
 		/* If update flag set, clear it */
 		if (data & RX8581_FLAG_UF) {
-			err = regmap_write(rx8581->regmap, RX8581_REG_FLAG,
-					  data & ~RX8581_FLAG_UF);
+			err = regmap_write(regmap, RX8581_REG_FLAG,
+					   data & ~RX8581_FLAG_UF);
 			if (err < 0)
 				return err;
 		}
 
 		/* Now read time and date */
-		err = regmap_bulk_read(rx8581->regmap, RX8581_REG_SC, date,
+		err = regmap_bulk_read(regmap, RX8581_REG_SC, date,
 				       sizeof(date));
 		if (err < 0)
 			return err;
 
 		/* Check flag register */
-		err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+		err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 		if (err < 0)
 			return err;
 	} while (data & RX8581_FLAG_UF);
@@ -137,7 +132,7 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct i2c_client *client = to_i2c_client(dev);
 	int err;
 	unsigned char buf[7];
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
@@ -160,25 +155,23 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[RX8581_REG_DW] = (0x1 << tm->tm_wday);
 
 	/* Stop the clock */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	err = regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, RX8581_CTRL_STOP);
 	if (err < 0)
 		return err;
 
 	/* write register's data */
-	err = regmap_bulk_write(rx8581->regmap, RX8581_REG_SC,
-				buf, sizeof(buf));
+	err = regmap_bulk_write(regmap, RX8581_REG_SC, buf, sizeof(buf));
 	if (err < 0)
 		return err;
 
 	/* get VLF and clear it */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_FLAG,
-				 RX8581_FLAG_VLF, 0);
+	err = regmap_update_bits(regmap, RX8581_REG_FLAG, RX8581_FLAG_VLF, 0);
 	if (err < 0)
 		return err;
 
 	/* Restart the clock */
-	return regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	return regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, 0);
 }
 
@@ -190,29 +183,27 @@ static const struct rtc_class_ops rx8581_rtc_ops = {
 static int rx8571_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_read(rx8581->regmap, RX8571_USER_RAM + offset,
-				val, bytes);
+	return regmap_bulk_read(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx8571_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_write(rx8581->regmap, RX8571_USER_RAM + offset,
-				 val, bytes);
+	return regmap_bulk_write(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned int tmp_val;
 	int ret;
 
-	ret = regmap_read(rx8581->regmap, RX8581_REG_RAM, &tmp_val);
+	ret = regmap_read(regmap, RX8581_REG_RAM, &tmp_val);
 	(*(unsigned char *)val) = (unsigned char) tmp_val;
 
 	return ret;
@@ -221,12 +212,11 @@ static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 static int rx85x1_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned char tmp_val;
 
 	tmp_val = *((unsigned char *)val);
-	return regmap_write(rx8581->regmap, RX8581_REG_RAM,
-				(unsigned int)tmp_val);
+	return regmap_write(regmap, RX8581_REG_RAM, (unsigned int)tmp_val);
 }
 
 static const struct rx85x1_config rx8581_config = {
@@ -249,9 +239,10 @@ static const struct rx85x1_config rx8571_config = {
 
 static int rx8581_probe(struct i2c_client *client)
 {
-	struct rx8581 *rx8581;
+	struct regmap *regmap;
 	const struct rx85x1_config *config = &rx8581_config;
 	const void *data = of_device_get_match_data(&client->dev);
+	struct rtc_device *rtc;
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "rx85x1-",
@@ -276,31 +267,27 @@ static int rx8581_probe(struct i2c_client *client)
 	if (data)
 		config = data;
 
-	rx8581 = devm_kzalloc(&client->dev, sizeof(struct rx8581), GFP_KERNEL);
-	if (!rx8581)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, rx8581);
+	regmap = devm_regmap_init_i2c(client, &config->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	rx8581->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(rx8581->regmap))
-		return PTR_ERR(rx8581->regmap);
+	i2c_set_clientdata(client, regmap);
 
-	rx8581->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rx8581->rtc))
-		return PTR_ERR(rx8581->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	rx8581->rtc->ops = &rx8581_rtc_ops;
-	rx8581->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	rx8581->rtc->range_max = RTC_TIMESTAMP_END_2099;
-	rx8581->rtc->start_secs = 0;
-	rx8581->rtc->set_start_time = true;
+	rtc->ops = &rx8581_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->start_secs = 0;
+	rtc->set_start_time = true;
 
-	ret = devm_rtc_register_device(rx8581->rtc);
+	ret = devm_rtc_register_device(rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
-		nvmem_cfg[i].priv = rx8581;
-		devm_rtc_nvmem_register(rx8581->rtc, &nvmem_cfg[i]);
+		nvmem_cfg[i].priv = regmap;
+		devm_rtc_nvmem_register(rtc, &nvmem_cfg[i]);
 	}
 
 	return ret;

-- 
2.48.1.711.g2feabab25a-goog

