Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D526E94F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751650; cv=none; b=RPOn+hEqMP8x/eaZfaxscB9JDbsYs3fvJEIu0wajZ8RKKEOr1BUxKry1c+OPjH8jptYkj94fP/V2Jg8RnRBvhUGyxhKg9UojocxCPVXYBX8Cqv2CNANxxmxb3BqhkiHnO59M+rzxhrB1sCE1u7lsBDqMUlo/B4dTpB4afDBp92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751650; c=relaxed/simple;
	bh=azImvETECVTYyY5KXb802HXF74Wu6H0CLseigJQDz6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgfkULGkchvEnUmBgSEspvHUKkTzVQ3lqEwm1PcPbgKjAZ9PG16q4FCurouQ29YNOk5ikrVmlMDZH+IvQwXZei+AjsirHdFzupAV45rKOw/LvFEV14k9OAueB1768ila128CfLxmbKIaTLbkXkxqyuFGEQ4Ywp6x35prFWNlDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUm45hBS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUm45hBS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so3606637a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=KUm45hBSiK+cOQntUo+C892Vma7NksHS15MQ/7Rb70GXDkU8AOTDBFW92xIPM1zjxd
         9BDRlhLKYxuLNm9gMy9kaqfIahZz26XjmpSeU7Cr/qwqGB+Kj4Bwmu3pAGiYxcXDRbzW
         PqFHrNvlhbg23xkM1K/zspwuUzFibcGMxBwCjBv5EFDZx+uacAOqUyZx8smqAxTUOEiD
         x9jhOx/apK+D5stAfw0BuwP7rm26iBBsf5sc4ObUf8Se4fzaR67ezcz8tgkonZ0ZefFA
         tBk7gTlICLb3HLF03NmV31iTwfj2VMkaZIBMleecwdpycrlaaNl1HndtpNUeEzYcTpw5
         ugiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=xIAxLtc2FkwgD4VHdE5MvHKVbKK6ZNq/CrovnHZIoDI1OVCHMsOQiuQsuESNDZNDkO
         JIcFSbFkZryeojVnaBDdWhNdFfizMAmjBgLmRFjp9HGjKXkXRXTonPsOlez1MXWFh431
         MOucl3rNYug0RnVBc08KU2hQFjwOekFg8RGadKOtwETaCy8tXjpKpVsMNxtALdO+TAuD
         VEfP76IenB6RYgIvM8Dbu0whdgMw4z45tB/vGt9M+3qBuMa7DRY84Y7K3bmZefGs09Tw
         IMf9tCKYs7xAENzq+ZgQclPh/owQOsAUWBsAJA+iIsnH7z1A1+NCCXXVlSu3F0CjuPWe
         DS+A==
X-Forwarded-Encrypted: i=1; AJvYcCUK2V1c0Xj94G+UXiQkqDWXL+sbU7G0lVtctJnhar1j83ln+2TOeqTN6qClkDPrRiXn9qRTI4gSnwClrOOPDUdr7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDlDvjEe4oskqio9NFPRlK2DF/ZmvELSFXjSZrAhU/RhqoNv2
	w1QtdtKy1EFZivJGz9Av3MqKFTCR6aQ8ffxq5trHZAzif7JRS2On0MgS2nO+xLg=
X-Gm-Gg: ASbGncsFtKucwlStfphaHVP6bhrh5qILAktAroYljvVI1c4ruef0ordZHj7OfN8IgwE
	WYY8+Q4RNtpeHY60F1aHvye2XTmCkkIJWw9WRv9tgTJa3hL3k03Zk+Dg8Af3MuGkqAUfJ3jGsV6
	5gGYiBxw4FQ+txDE8Ellg+QMAU6lRoiL3OxC21CTt1Mkro2ZAvWpVJSP8xkkHCc0X4kcrEtxMKd
	oNHE6IKkb4ixAl7DbcIKVFtWDtHvSIEs5afCCn5P68rRT4JHJyGI6ZtBYiUK9QcbvjgMQl1htA/
	gqPFGuDjTRI+IxCahybcrCL1AwJuNvV4emJtLAh2QT72wCICAdOe0kUz3FwYQ6LYuDXIY2KnIVR
	vShxjDkrVaQ==
X-Google-Smtp-Source: AGHT+IFbzXWayjdSMfWjy9cwjYueSFy4YBp7IQ8OjzR2IKI5f4QLOeDnV9cvNi5W4D61UevFMTrZwA==
X-Received: by 2002:a05:6402:239a:b0:5e5:552:32a8 with SMTP id 4fb4d7f45d1cf-5e5055238efmr931950a12.8.1740751645786;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:19 +0000
Subject: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
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

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

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

