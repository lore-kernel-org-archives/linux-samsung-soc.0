Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C526F464
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751650; cv=none; b=cq/ssVpCzCUN8hlIKGhZqimIOrUxv2YniQ2X8vUod5GEcSRwhC4K2hEZXHGBf65UJOB0Pyur2BLAU+B0kOCuQtg1npVzwKE9ODyWRztkCl0AmjfDpx200fcqXk5hop7NUauaMFxvIhk6zyQ/OByN/1u5fScc2LwxJJeAdUgqr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751650; c=relaxed/simple;
	bh=96lokglM16xoW0bhDeFwQgKQck5a27ZC3KAyN/gWBFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NI71mN82Py7sQo8gEFsjE/tsQZcMLADRIHyi5LjYFCCQxyR1rWr7KSQjHfOSCoGC/49Wit+f+ZEQieF5uZCLama5wdXqgjsbfLkS0+4heUHjppTl2KBfYA3aE5veZB13WIytKxdAUMQ9FRA6J37nNOzdKE5e3cPJt1UaFcZbUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9YMZXnh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9YMZXnh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3820929a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=R9YMZXnh1zrTv4GDjxr8Nv0HMUqufzXC/q+ve+iHUkA5myd441jrUh/4BI26Hv0W65
         dax2EHzr3zeQ70OEhsQZZ1OXaoITlLwDOhwCAW9ZDXYrEnDQRrG/gekRYUtS0asjNF1k
         EkQGOjDWVzlAverug5FQmkK7AuUtKRKdR6U/f/tG7dAbEE8TnXxzWd7gHlKpj8dnp0iS
         Ye+73QhzpOoBa1dE/KzrxJ73E4rcOjnhJdM8QNb0UsHxDiRcAdLrsRa+VuNxlRW9PJBr
         EPKPrB8K2kguil0L1uN1CDbV5N58fp3LFVi8V/Z5Zw391NSOyl0J1pUyADpHqDeKCn3Z
         6gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=XYMMnTDWFumQJ48DJG/4ONEO5jqxEgdgOPqJ754GM1k/LCP6W87on6B+h/QnZ3OusL
         SsHj+eTkeHe7QliI+CRFvE6ggHPs3Do5EuCLfv0rH8woIpwbgjU9V65eRL6k0+gnfV2w
         aYRMTbYJ4d7m813k7lIs14dPkzPTiasbRtEd2MAIS1Tqq1a7t7UfzAQIbYDgMtKtwM88
         d1fWoUowHO5k4Yyt7GanE3zL8t6/SIOEThspwsne2P0T2sFv+4wGiqWD5DnQ9hxUWSJF
         rnJYUi0Pc6dTyjvZLiJsHodvwm3n8eOVuKT9II8TjkUjnr09bx2xSLK6xTfONEHqTXGq
         YatQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjW+LI5OwNFc+AFecVXyo//qqnxzr3Mqav90X+sk9Aot2Nwl776I1wTvNkgPHJDfeQ1yABALTyQkI6U760Jvy9Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyusWUVT1F0wZxoKLLJj9QHStZvYGWgDa/6EvJD3W3rN0RhNyoO
	Pffi8D4CazpyTbmfDLOW1XH/vWi4qlrLb2nebTtndmKQBYP6SGJfmU4b8Iw2Zvc=
X-Gm-Gg: ASbGncvcHh5NtzmMdBh5jd6RrOYugVPlJmtUvqXdch2M9D7svvdvIUNULPGgRV1Q8r2
	o7YLQ7Rqauw2xtRxUPV6Gvh7YjbR7pL0D73bKQ9AvxtvfIVpnN9YWDdEwxwXVASiusEXBM1b1kC
	zlhpPRKds1c76FX1C7e3xBRS9u8WHnCozprEw7DBiAAAgkuVTXP4MIe6j98tJKcdshIwAmNcDED
	uwCCwuTEcGUVtz5Kb/1+58TOVoasqXzXvbR/m2uYekjPtwqSAs+S1YbREWYK6+VRZiJbu/69G/v
	Wm3WV+R47I8Ugrtk2UnFTjCTv3feaoruxj0mlsh3UIcdPyr3300KKRaLIUWrbKzoXC0XEINMFcy
	AY7L40DuUzg==
X-Google-Smtp-Source: AGHT+IGw8/Em8B8f2s0ytjmI+eWh2dyA3vFh7dmQ8lnXofAka3id8ECQEXS4gzzEIESeh9rUlyHc/w==
X-Received: by 2002:a05:6402:270d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5e4d6adec08mr2881207a12.12.1740751646341;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:20 +0000
Subject: [PATCH 07/18] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-7-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-m48t86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c73b1c8c3f50a59fd4fffc0b45105..10cd054fe86f9e6be74eb282222b2751dd91cc7e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -41,7 +41,6 @@
 struct m48t86_rtc_info {
 	void __iomem *index_reg;
 	void __iomem *data_reg;
-	struct rtc_device *rtc;
 };
 
 static unsigned char m48t86_readb(struct device *dev, unsigned long addr)
@@ -219,6 +218,7 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
+	struct rtc_device *rtc;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -250,17 +250,17 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc))
-		return PTR_ERR(info->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	info->rtc->ops = &m48t86_rtc_ops;
+	rtc->ops = &m48t86_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc);
+	err = devm_rtc_register_device(rtc);
 	if (err)
 		return err;
 
-	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);

-- 
2.48.1.711.g2feabab25a-goog

