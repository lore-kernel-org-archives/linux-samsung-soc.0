Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99121270044
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751654; cv=none; b=AjyCMm1fgc/jkrKrIElZ8CiprNiJvG0McCu8lHBEOFQ9xA1+/di8BJRh17gwoq3hEZyJSDXGTLtwQp0IQGSnSYX5w2W5fxvU7nJzCSGQtKPNYpIJrzI+tRTbKv35BQCmxlcGbyRCBbFCbdNe6pRbDv1h2z/8VrOut03W9D8OEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751654; c=relaxed/simple;
	bh=wcWeDWs75X61m+m4siXkgCaNrKLjTdrfe/93knsU6io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDyK5AR4Na5odw7yniJj5mmSpT9Tn2eMBW8Qbxjakmbg/1DCYflnys6DeYKfcS4uz9WDhw+GAkiUM+O69l0CTgRoV+VSnufVHwN3A28Sq+z4c1SYRmOhYIGwrbX52y9C1EWtqRqU22JfeYUYkfTzEwL0MOrTjxa2Gg0sEVCW+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIkP3JAb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIkP3JAb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so3923191a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=tIkP3JAbCYhrYFOvnjaeq/dbjJ2fYEWvHO8pFId005Ye5HsqEYCJIwTnArTYJ+nei/
         u4dh0WqEivGHiSn6n0O94Bj43dMAfp/YJPge5ypbvZ5U6O/CRGd0gAZGDSfiAAdp2DBd
         UJwJQi4xBfOAy0LCaFCiCDlhEB5iSD1HDyvkUVwXjXVnp5b7cburdus715rG3UshB7Ei
         IUQq2FhOBS17Bk1MBHasj/xHW1k45r/XWOTkQj0W6eUsDy1Q+jKYht+WmWcxM+t2Ox/M
         qJ851hynlox9VHT4hhNWZeOm7/OMLBi7cBo4CUKiEaz3dYU5yGF7LqfmhKK8N4ITXdR6
         sCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=rtFGaOC4uIYXkjUXnC5rog0UtZadiqd9kDxpJ0Tn0Kl7Py1xYtps+608JcwciwFdao
         Wsg5VKyAVm8XHHjRNP0tmKmvtDBarczjIPtNca4ABdN23OKWCuD3bn1VU9gB1Y/Aup5W
         KcMxtbaB9fjEMSRaokFKUsA1ReMz9NrLaQnxtLpbfY5m9Bmx/CkMrRWosgpv5knw1vmW
         wy5oQSTYGSeraYUDjrutyHpMEi9Mt3O7ggToO0eSfXdWnqdFa8ycrxgDvyy5KIzytp2b
         Yr9bldvJP/jZHTruiV6HqHbcHvaz2u6xZ1Ontt+R/5JazqZTIfiIAjn3Ql1Xf+3rXBcs
         4wiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7oclwBCaj7UianIi+ysnCT3lAIkl/EMd3HY1wvHYkiZo18duxf74GLXzpJwSISaQNsCGb9trHqiiHoNWHxGa+ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRcSXZSnCtPpXodyvPZU1RuUKsA5VrUZqnW3xK6NQepzBz2Ml
	SjNfeDPmbdRIpzS9LO56YUIyHNvvHIQlhLOQl4hoFRBijYDYug47Od6qPAy4AyY=
X-Gm-Gg: ASbGncsBqH+orsjHH7PFQJt5QW3pBhCixm3ZMqBmtrguOzQGK12Indu9sWY57wcyquj
	rgiOGbSngfCq5dvgsed57/qj089AF9syfWCs1BGqEzA7+pDhTwuUo8mnQJHKFQ4//tDzSyqxruP
	wnYdpanrUXEJqArq+tix9yHiYpymlpNp5tFul8nubDhnpt/3nvqYTL6Ub+4fPHLGbtDown+fqoT
	1Ic04VL4pO8AyhXDFHdnXM+dMtN/XkM9+A734ZvJRoHbhntLauqV+9W3rNBOXoEzzA3VXwCMe9X
	wS5TruKCOK5oe93j5PxijD1Qh6CwSRlCuzIbV9WUtrlAOtXVe6MDZYU0YayT2iZ337qwb8ngGGf
	MDkOm1MOsMA==
X-Google-Smtp-Source: AGHT+IF1zdUSX6ZhtbedenD60jZMcHzIIU2NhAe4k+oRQ6Wt3d6uE7nze1qy/Ap2/A6npGSF7Q9PVw==
X-Received: by 2002:a05:6402:348a:b0:5d1:f009:925e with SMTP id 4fb4d7f45d1cf-5e4d6b1869bmr2990380a12.16.1740751648743;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:25 +0000
Subject: [PATCH 12/18] rtc: s35390a: drop needless struct s35390a::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-12-b44cec078481@linaro.org>
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

