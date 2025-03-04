Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293B290BB9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107945; cv=none; b=sRjQ6sdWXREm2RCISCXU/rr6apz3u0cfW8ngktz1doypUrTQ6pZB5MORZZh1usy1I3j2VUs0OHCEReiq0VmNNA08ko+wKqbF7IxOE+BI9lQuJIMLAT0LRkYjnLZkyQp61EDJSKp5fIpECyKPHzqyPvHSnP+ZDVqM7Qk2rkb3Nnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107945; c=relaxed/simple;
	bh=wcWeDWs75X61m+m4siXkgCaNrKLjTdrfe/93knsU6io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7dEPAJSjRB1SCO9TKBu4RI3T19eYSowp/xH+UDg1MJe94T/yiTHhz6N2KdCWNVTLGE8VDFfOywYgijXxzzrNqk8/90TbogbzD3b3QhTFZeUiMimlEc/5XL+JPxnLTLCtxv5v04xfujUp6wZ9wITjlAO7bozN3gfPhgP+qisuBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMj5jSd5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMj5jSd5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaecf50578eso1120079366b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=qMj5jSd5vyjtXimunQXFhiA4f7t6jK4K7e7WqiKUpeu5qXdOxYNMaKhmhZ8Xz+3YWl
         Qw7aPsb8vkp35rzAvE4L0a4zMCg16fn24ck8hJX8FT9BBhMBoic2FYVv+gcdMTLNScK7
         qVTIGwPMVOlBwE64r/NG5W+1nF1tPC/TnIWtu0b5ULy2LO7pB64htAs1v+KJlTVjRIzc
         9i/Ht897sOcHhPgFE/17PGSKXpIWj3IHzOyVhSMFe0VhsEI60Vc8lL6XLChkK4dqyidJ
         ryYxfx15svRW6/DFhMoB5AyKA51iY1zj51cfQDXDZk/Vje/ffjJa1bI/46KmgD0gjnEC
         tR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=i60hnErSx52zxsa0N5UlXkDCi+NDNsy7P/ylSDWMID3drNcHZ/k72jxKfq4w8Qmjmq
         MyKiP3v4Ojg4v22Orh1EbeofRFMqFZN12yq3pWcd6pmpE0QCUJs+AQqObrlq+0wSnMYh
         vOSneHJ6v+1eX70VHb2Uhn3GF7vLcqllAIQoMENjwbYPpzjOWWZ6quHCIM10ZVlJnip4
         JPeOLFgu+CxLYJ/aYJBjw+An7qmY5lCKxOVXbZzAX1gbDMPZTxqnGCodjT8EcIMw2QGZ
         0Wxv3RxfAObm0aqfRnqoDNYYmVt0o65ZL90W2RpzTfbdHlAxAAIErwS5TPVFfufNe/oG
         HD1w==
X-Forwarded-Encrypted: i=1; AJvYcCV0bUFOLv9Kb4uIQObdGca5ALhG1B4YMjKVSuYd6IBnlPHkgUajQazeHAYddNeqRM+HnLFfJx2D7wQSboyAsOFdfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SSYt+Wzsk3ORr4PohsAWFr41B9sda96b2VH47d9DNRKg9gYT
	0MoxzaZ4OJDRmpaxmtnw4w2ZkbWke1JwqKHJ3x+ZviiQKc7Gm7Gy4YU2t+SvoL3zX/k44MHfYfu
	eR2Q=
X-Gm-Gg: ASbGncvkTKu7ci7NAi9vbEU6+MHA+rbWzgrRzwex+irK76BQsqgMSrk1plk5DxbzAjY
	8v3k9ptED6V+nDfQRNSDW95ItAemYn7BSA18QibHsHFobEsKp9pIA4bni7yH4scq4G7+cs+dOg7
	9XyckDsGkX2xWSCLRWLdJ/c83DwoTt7QMgxQFI1UP9PrC0TvBVMELZrlcLv582P9T/29sfrny2s
	XRk2UKPFC+xnnBTtWVipE/K3NYQHFzb9jEn8KQqyb/yVIFbo8ECZ0IULLDqrtpOH6X3+v3iBoQO
	Wxp6kIrKsDi59PoR60r4cPsESYmfNpG2pLoA/BPzssvyZAna7K/ThhUtxUEdDuZstnssEUfe4p6
	8XdFWQp7t1ED5CXuu1WIbY3XIB729
X-Google-Smtp-Source: AGHT+IEZqUVJFopMcdCw0Fa6138jis8STGfKBc9DN3g8sZLmJaNDRTq42x6nu+WBoJl/BXVMQfaxGw==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr1810089466b.47.1741107939344;
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:40 +0000
Subject: [PATCH v2 12/16] rtc: s35390a: drop needless struct s35390a::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-12-d4689a71668c@linaro.org>
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s35390a.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index e3dc18882f41445c41fbea56edbd5c869514880c..3408d2ab274194e39cde38a83567d37bd53f6632 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -63,7 +63,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	struct rtc_device *rtc;
 	int twentyfourhour;
 };
 
@@ -422,6 +421,7 @@ static int s35390a_probe(struct i2c_client *client)
 	int err, err_read;
 	unsigned int i;
 	struct s35390a *s35390a;
+	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
 
@@ -447,9 +447,9 @@ static int s35390a_probe(struct i2c_client *client)
 		}
 	}
 
-	s35390a->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
@@ -480,17 +480,17 @@ static int s35390a_probe(struct i2c_client *client)
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc->ops = &s35390a_rtc_ops;
-	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &s35390a_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	if (status1 & S35390A_FLAG_INT2)
-		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
+		rtc_update_irq(rtc, 1, RTC_AF);
 
-	return devm_rtc_register_device(s35390a->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct i2c_driver s35390a_driver = {

-- 
2.48.1.711.g2feabab25a-goog

