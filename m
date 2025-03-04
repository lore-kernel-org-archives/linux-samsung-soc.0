Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6B28F93E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107941; cv=none; b=Q3BpWK+t42sYc9sh27sFTN9s+ve3DOmJcAOW/iP/phPxXSSebp8OJV4ZJfaMnNGgJtW3qloVh2yPZLMSJTyfsD9eiAK9LMYZbNnrtQodQ69Z7iVvR71567/RsP1rIJHPonBMyLOyhUJs4VDcm1u7nMjAYB0TQNcA0oiR6D1cyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107941; c=relaxed/simple;
	bh=96lokglM16xoW0bhDeFwQgKQck5a27ZC3KAyN/gWBFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZ600rSuM5nyoac6rMA8WsCU+6eRy3D9HuW1UsN9nh5t3S8C3p7YycvK/Xyg6iynR2LQ2mp0Lvv6tw6aBPyOhEQKB3FHm2goxAHB3GLgUOkMfLj0aJOjQcpZUna8+/6q9wXj6p82juYfeVPVJrTbjmK64mms3BkW8UhZSIjxyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yzzuqai5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yzzuqai5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so546196966b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107936; x=1741712736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=Yzzuqai5vbcBrELh8YrsFumNOnIb7D0hIK5fEOQVxJZe7mhnE64OqM6RSzRTqBgrFM
         rfbqFtT18mU/GNf6WRXhnYAs6pneEoRn8nNvhb9H3kzZdpRYeI3+bVTV0GYuOIwpjJNz
         RPCdFyDc5w18TadzAqpPImIMYBoxzoKJZvcxXEelBJ7Wjncqwf1heXTwvIITWu5dmI5T
         VRZlrK759CWXe0evHhMOPKlKpZqC+bS8MIPU6+bsC8bJNnFpr0hdB3qflWh2gQj8RwGA
         RGY3nd5LDdqIycbu4vjjKvrelcjBFc049sJpjjb0D69fzvG3ZWdIpGa+o2CavYnGifMP
         v0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107936; x=1741712736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=OKAYYAsFvryi5y4hPobaLAjWpNO/oalPxH3dOeODV5Gjncjd2v95m4LmQ+U5Q+irvV
         UsLcZL7/IXaPnroB1MgeYfAiYUsrr4ZjBOJ9Y3NYC18eMplM82j0ax4dBcQgCYAo/o9H
         r47LPwC+mdv9lRODZih6/JWT39fH7hsxIVNYx8NIOcXq9qLCua+XMZyXwkytgWMcxFtC
         KDzmvXbryLuiPfuHcrBoAcihU/bSCtbs+YnukEoPhcGIZoNFgkRYZXx7bCJdz9eGCSlQ
         eZA2SY7uLZro5OOS8bH5l3DWU+QJiuiSF3HKCovb63KxUZTThfQJ1NVURmIwUsWKvo0m
         vWRA==
X-Forwarded-Encrypted: i=1; AJvYcCUS33TZmhyl7KN1K+W4KDN4tWD3jNgP27wFdfAH8g4N8OyOGG3Arhil/XVkSEUJKY468UZr13xMXOCeAaJ0t/GotA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAKZFZmMj8GNHihJRFCnxajysT1DH8VCkguJxg41of5ZFN2mg
	S3mW+TliKWIqQCE5oOjRTLorWV8ZL006v+ZZLyPJGIdrBGV8+nHxLKGt7P1QyaLzWnrcGmzS/0t
	gtG4=
X-Gm-Gg: ASbGncuAVd6JEIlBdyoR1iGkgT4dvHBghQ8HYYG1Hx4radEWsC9zUz79U1QMURqaV9Y
	Lyt8QU0IaQyEjdolNFKq5JbA9qoHP44P+z93hDMpK3mdT9Tla4Mb2bB4nBwA0aN6S59mGUXjHgX
	aD6jiL4CKtfmKtfnbXLRxF5++leqZlL+QjQQ2/Dcs5Y9dJ+GXHfiUd05a8CMBHFw9YK7PZKDf2i
	tGhn8XbZ6K35rZUN15a0p82B4yPlpHsk6sYE3yR2Za5Ij/5xh6vmBTe9djkM1/yb9ZCB37HYyIj
	ZdPQ7kDuWK8cc1fkBq+g92/ARQjo6deyzVTSE2pQ+chm5P0v2gXO4EMSiCoKk0slokJIRud2yha
	mBy33ql3HdeoWr0B7b990FHdtC0Ji
X-Google-Smtp-Source: AGHT+IEZSM7e60umftuoTA+5yHKxOw5bEfyTXKI9tFiIm+4qyPCIhcf70tbw/wLp28VjnQQVfyBtmQ==
X-Received: by 2002:a17:907:c2a:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-abf6b58f60cmr1276559166b.45.1741107935884;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:35 +0000
Subject: [PATCH v2 07/16] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-7-d4689a71668c@linaro.org>
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

