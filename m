Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7928D06F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107942; cv=none; b=dUn208Uzs78vnhNSegnBCm2EBTY2Zs9vPINZHUzf/g18yS4TDYHGD2oXP1QNKOd/6Zg4Hp1qqEoVsK502deb54hGnuWguP6BhSZKo2/b1zN+pnsEh5vxVz6GEVhHJBNf1eb202zRZMnE5FTP9L8+xWJr8To0qBVJxCsEP2nux6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107942; c=relaxed/simple;
	bh=O7YHK/iXPLW7JvXPCw3QSGcpCg8mcQhvQ7AlODxEgPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAE+a5eeEk1e2rtWy7S9y89pVmo+qOvP+UFd6L6xLjKByL/55Oai3jdP2TTs+RvBrOkhG2AHHLCXHTfcfipnLNojC9TG//18inwO58sgclJ2p7NagbvSpa8CtKvVZvZyLepSz+S2eKqm4vVWzjlRWLtqUKNK/Cx/cgklsOn2Z+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zx4BAc4r; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zx4BAc4r"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf57138cfaso615833266b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=Zx4BAc4rD08UzQOxlyt4V6dca3NMcXY+9B2U2agt8A0yB5Tk9EQZHVQXwJD8wPZOst
         0FWKB/cHLxMjrD1arJ+tY1YT2UsZpDYi99GzoBWiaxNGss8fFAyuU5K1lrz3tGGJ2Ulo
         KQy3WaNsfbEnOBtXwnkAcvj8tr3Hp6sYeUbFLqjGeNnAekFkma6/AxGm0t+prNeRT4RO
         Z/bcWJBKWlwPXCdTrp1jY92L8m9OIfow1PlpJjnQ1FoUMk6lHRnX3EvAFkox6ivocrwK
         kMaKVtYnDZf5s0q45ys7iseZlfAEyABzobEXqH0GUEw8cq3mUjUKwlJ30lSfU7ktOmdP
         Gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=LEeRlOiP8hQTerYRgvGqtdNietTvc4n4NR+6TdgzDE8BiutO1wzTIzONsO9HzBMq8n
         HW6A8aba9DSdabAFWKiqolg/oKRIhhq5G6roxMN9ve3Zt+WutNHT2Mc4gqWpiS9aOnT4
         krGjc4OrzokBayvbjhrxklwxahhfZzkmdKKRKAyfRGkCx+JHZew9P4oyeiaRIvx0a9eo
         JiTYNGaoWNDBHu+yOuNgciJ/P1rnecFgM4wfGSpP2JwbCII8E55K28aynuBUyQmF+V4x
         52opn37lqmlApOtBzuzM8PLxSOsvQ4MrwC1hfCF1EIeBMglzil1pDa1FbFiApvS0NtJz
         MORA==
X-Forwarded-Encrypted: i=1; AJvYcCVQSMqYN2QDpKC3jAPtFGa/oclb2r+EEFwqyugQqr+GqEn5z2sXH1LpGerlXWdzqiVUbkpydrA4e03Gu8NeHBZe3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0AU6hLYYTbTwft5XODN8PpTaCjHxplvLt1MJ2MTTBhq1ywaI
	g1bOgWSGuAJkuQxWMpxmfA2Sdpy+AV74pHpiCs5hpVB/dH83rWi7+MuJnG8SrYbka8WipEP6OdM
	jX88=
X-Gm-Gg: ASbGncuXosWrVYZ7yYXBfkwLGwHhYWCoSbzHiqIf3lRXZg+sNi1AKeS2yDkWdprzBzx
	NrgTcpXoAqMnXn++QTMiAErs3y/SLqwr/ha8miHjyhPgc7javsJrvYrmJTSbrmxQxVQNmwceV95
	50TvJZGUI5McJ4XbKtia/6DgLqjEZUWNNG7DG2LgmOVeYhf7Gc7eMgR0FhGSRqvPN+IlJhYKyhg
	TDU68r9pjK1wPMEbOJiRkYRPjkWeFtbEBrsp8OTGFvW7Ta3+iQaz1oWEXYQ4pDDsTAb5CTFPpmN
	KacHrW+LCrvgaGeip6p0Ixun+txHzwT8kud4NRvOF/kXpUVLrR+ChzIfeIG0kTeXhCzXTvVi0W/
	nngE+Qfwe495dsBZQ3OaG4L0iJgaJ
X-Google-Smtp-Source: AGHT+IH4UfROsxQRuhFhpuKVUGIkJvl9GfdlUj4CrGm+kiSC0tb2f0MQezXBSz1TfcCGXXToQh+ymA==
X-Received: by 2002:a17:907:7210:b0:abf:778c:58c6 with SMTP id a640c23a62f3a-ac20dab329fmr1852966b.16.1741107936481;
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:36 +0000
Subject: [PATCH v2 08/16] rtc: meson: drop needless struct meson_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-8-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-meson.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5fbb590f26c1cdd0774d350244a99..47e9ebf58ffc2f2b6c65932f8ec3773a213a62ef 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -59,7 +59,6 @@
 #define MESON_STATIC_DEFAULT    (MESON_STATIC_BIAS_CUR | MESON_STATIC_VOLTAGE)
 
 struct meson_rtc {
-	struct rtc_device	*rtc;		/* rtc device we created */
 	struct device		*dev;		/* device we bound from */
 	struct reset_control	*reset;		/* reset source */
 	struct regulator	*vdd;		/* voltage input */
@@ -292,6 +291,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
+	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -300,16 +300,16 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc))
-		return PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->dev = dev;
 
-	rtc->rtc->ops = &meson_rtc_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &meson_rtc_ops;
+	rtc_dev->range_max = U32_MAX;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -365,11 +365,11 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc_dev, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto out_disable_vdd;
 

-- 
2.48.1.711.g2feabab25a-goog

