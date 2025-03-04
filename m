Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDE928F925
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107941; cv=none; b=AmABGNJ8jZbNsfTz9m+0IvY6WuIr5+toOAFH5zUyWTyPXl2oRZz+XEXmR2LTPP5XoCZ5ucl4ahANTLZko12p2DP41m617wxAmq8D8ElKOIRDnrV9S/1VTb8jlAjWw8Y9LR6ddGvwc63QEJ0PZYGSlAY9RP/2//TYz7dZbV66M6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107941; c=relaxed/simple;
	bh=5X/V6j0KylZQYS62rYIRbOgl5vZsHZpGMMFoDJktKBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfuirFs4EZqx9SBC3mgtppwuQKZIXEM5o3tp2T3qo9R7HfHi7tMkhlriIcIsdL7/ru3eNhok1cdGljeBjDCQurT1stOarmeZC/yp4r7+dKH6otm8EgwZZkpqD8MH71HI/EP9GyeqrbvunbsgFp6Sd9EN8SVZtwNGXQQ0qDf1cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQzxr+/i; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQzxr+/i"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac0cc83e9adso21366b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=xQzxr+/itgIRLv26IdzqbvN2KzIxpaBes8rvZIGhFUVBPxXQOcBugDgufa9uDOvCgg
         lWAHsyvVwG3IlvCkPdq2k99TqYN8FPvGtHm9y0MUKc1aLAeWgGk4PbLy4LkTg/I7y3rH
         1rkqFG6o+N+XTH1VEL2OSrgeK+hNYLH+yripsc+i49MEYZT91UXSbQD22qfp8uxJwbTX
         372emBqGRsl9yNXwyjzq2LBDYXqcT0ee+o4o3GskDqJaprn13m0JVldN7vrTEZz7f17L
         WaeMVWkaYIbanusqA0l1LddOTAYZ+WAGRQFfouLLVzwrmNcl/hg4ZRc+3dufDhPfhAfh
         BV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=luC+LxDCxme4uiTEWdykodEHB8F/YI/400ijLfDA+EnLTfR6jmc9BdbEzOEjxcw2W+
         TiN6mLlaqHDw8g2K4F/9BP1gORlEJjQhEDhH61KWK8M2ibItKyd9kN/5KBb/tX4OBCFq
         Ebho6C8brmYAfqfmCXajAt/aqUFjQ4kl2uR9Ur3Y3eMw1OU8NJk41Gl12KgVEKrVEnlE
         TdHX84vK0GGvTTgH45vlDmttzrBBaLUQsYE9IU338pjjKS61EYmhfrf7asqcBMZhBJ37
         JfG0JNl5GmNRqoQhyipfS5jQhwErZdWzNiMmI3q/aqSmRwkfAEPU49Oysl4L+wF+2Vh6
         99vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf7ZeXR8PFoSduQ8+oXNEiKQ+FCR8SZZMwjcwz/VWUZsGx+yFM7GAA2YunO2/QfTPoNH0Jg21DEX4giS+cCxSaew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsltMtmjE2kvuhX67dgQc/SU33hox3+5BXP7iuqtwa0g6SwNm
	H/ptlQ37isrx+i/j9vjSZHU3wF0vN5eix0MELBSWxU23VMvQkzNDbmuQqdYpbrIS1vBSzs0zByl
	C5cs=
X-Gm-Gg: ASbGncs3lsaGhcdd4FK3xizsy8QP0rKfZ5sTW/OqawxW/VMrWkMJ17/Ay6b061zYM9J
	Ak04a3C2enAsIa32jZxriiLbLVqwz5yqVH5j2r80yNkkefUWAXgTKIIaZl6ot0A8Ag95/sZTFzE
	PchWqlp0c08css/HSqTByJna7f0Ye8sZ/u5yAx5PRnEIxi4RG5Zl5igvpza17W3tuT4Fcn805fz
	uUWmxx5oK6Cdc8GzfUHKymSL0EyWYnQPL1EUMJPnrMC//aeq1IW/neeoLIytVRVQrPkEFHja8vk
	6an/20XqbWQJK2jfNNembXhXbVdYmCM/Wxxo6QnOnH8XlRTEaFIRNQJLBJHihiI0bEnBdXVXMcs
	g0C+ZEG/7OLjS4N/HSM0tc3Y5cqRH
X-Google-Smtp-Source: AGHT+IEctYzZlVVwQPucj8CUHKEVuZPV8n583Yq6QohmEvkW8JU3S9SRTA4/uuDakASHnMKJ8bAleA==
X-Received: by 2002:a17:906:3814:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac1f11e6c1dmr291303166b.21.1741107935167;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:34 +0000
Subject: [PATCH v2 06/16] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-6-d4689a71668c@linaro.org>
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

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ftrtc010.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index cb4a5d101f537e20a685bb022e6f6516b0df8271..02608d3784958e69ec0ecbdb9fcc8b333b19e7cc 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -28,7 +28,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
 
 struct ftrtc010_rtc {
-	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base;
 	int			rtc_irq;
 	struct clk		*pclk;
@@ -113,6 +112,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct rtc_device *rtc_dev;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -160,29 +160,28 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev->ops = &ftrtc010_rtc_ops;
+	rtc_dev->ops = &ftrtc010_rtc_ops;
 
 	sec  = readl(rtc->rtc_base + FTRTC010_RTC_SECOND);
 	min  = readl(rtc->rtc_base + FTRTC010_RTC_MINUTE);
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	rtc->rtc_dev->range_min = (u64)days * 86400 + hour * 3600 +
-				  min * 60 + sec;
-	rtc->rtc_dev->range_max = U32_MAX + rtc->rtc_dev->range_min;
+	rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
+	rtc_dev->range_max = U32_MAX + rtc_dev->range_min;
 
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);

-- 
2.48.1.711.g2feabab25a-goog

