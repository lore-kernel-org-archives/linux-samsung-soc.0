Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F255224EF
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714635676; cv=none; b=OGtIsLeNaa1x/Q4Z+KhKsvfKkrCF0UCzlD9FKBDA+cmvZHhVjNplvynIH0ku9O5t+lqqVKwyByTKycNq4DKKCDtbxstBwJIjnKj2IM9woY10hfgaZY9QSj8jOW2+F/4T0H8LRnm4tzpQdrmzMR2HZvJc95Ko3/f8XV7VIh/Dr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714635676; c=relaxed/simple;
	bh=zABtKC+Rtoh7jI4D99cudXvLlTLkH2cSA0Kfdm54lQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7jIqmd93n200ntYqSkvk3zeOZBNbNpgB6Hi9y7+K2blybF9baVZsP82PGd0a3R/a6CGt2fSyHdl4In2QuabyZPimg+OpLXxt9TyqSdgPpf/Esd4J/83scsEOL3+OVK4HA9gGFrixkD3YveL0TedBIyTmTy/1MzKCwO/sKglneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEvfHznr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEvfHznr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a58e787130fso263170666b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 May 2024 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714635672; x=1715240472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Q2C006YjdfPOCf5/2sNCH0MuBR/EBBXkcEnDcvy0KM=;
        b=hEvfHznrQGIHw6Oxw9hqIYbiE0jrtzkUrHvwH/Bs1QQfvC0tpoE7hK5Pp4h6u2jizY
         UGBQKK/ZOlrl898RWELZOVPaQBN/zjzx38781a7nhMKWN3z+dfRvr4DtuAZ6l2phrSvE
         G2hTa/TyNCIlGQKRhjNQ0onh33cjCSmczsv5V88S6RphNblHRL1i0PGASYUQSwcRQJSI
         OLQCERFG6re06EYXcEZRAMqBIYisN0lrKscrgpfqTHi/lE8juzLG37fh9raW2OIhBl2g
         FnWIJue+9lhbAr3hp4IvfVq8SzYCKKzfdThf++a/oHYvrc/lwqDaMUGnV1nlpGgBSwFn
         OVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714635672; x=1715240472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q2C006YjdfPOCf5/2sNCH0MuBR/EBBXkcEnDcvy0KM=;
        b=JkDUzYl6l3vVCkxXCOggqMqHJtiMz5a+0NwovdoD9imvn9hZDl7Vvcip3SK/oP8VW3
         dvi7G4koIIUTcsDqwv+L7AOE6M7CvETJhL++PH4fBMz+c7ZpqQ8KlY0FYYkqBeKoIV3t
         45sx6aA6gsi8iLkkxHUtgUjr1lgEuVZUA8syBcur2AoiK+snlQwT0qadruHULuEMletR
         Ba2diQZSCZOJ2XEdVohPsxy9OLjGv7fX1GH06foQiIzaeEWLxBaAs9vrclxHRhJ7iqlF
         LR9H01KgQ3DRp7yv/MA+h353+Gd9fkNHYxeSPVKc+QOe3ovLvkNGD68itTvwxHCm3ktL
         mVfw==
X-Forwarded-Encrypted: i=1; AJvYcCU0kQGkdZEiHJGjIiOULj+thuaVJDoqPOIHXLdtZ/ac5fxYlSXWlTuM8vJ3Zz/WNQCOrbF/dxdqqlBzGapBqvhXUAoehZoA3hATG1A5O6q7jjc=
X-Gm-Message-State: AOJu0YyOMQn+qhiY7C/STjdNsY93sUGvks5LIOoCCUAgTyjigIR3VK33
	26RHwBf/qtnwSnwX47saYCikTfe9+90+R1kr1a9JDIJElxBPzSX8UiT77m681bQ=
X-Google-Smtp-Source: AGHT+IFP6c4sujTOMTIqEmlCFgQb9BiI3UfyLMTVFf3tUx1jI6Xp+ozJDDd4kk44gM2ZM9XkX8ZcNg==
X-Received: by 2002:a17:907:7d94:b0:a59:5693:d709 with SMTP id oz20-20020a1709077d9400b00a595693d709mr1777751ejc.30.1714635671861;
        Thu, 02 May 2024 00:41:11 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906089a00b00a587868c5d2sm229664eje.195.2024.05.02.00.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 00:41:11 -0700 (PDT)
Message-ID: <ea6f17d7-49bf-4a1e-ba3b-757e29221590@linaro.org>
Date: Thu, 2 May 2024 08:41:06 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: samsung: support a bus clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
 <20240426-samsung-pinctrl-busclock-v3-2-adb8664b8a7e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240426-samsung-pinctrl-busclock-v3-2-adb8664b8a7e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, André!

On 4/26/24 14:25, André Draszik wrote:
> @@ -200,6 +235,14 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
>  	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
>  	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
>  
> +	ret = clk_enable(bank->drvdata->pclk);
> +	if (ret) {
> +		dev_err(bank->gpio_chip.parent,
> +			"unable to enable clock for configuring pin %s-%lu\n",
> +			bank->name, irqd->hwirq);
> +		return ret;

here we return an error
> +	}
> +
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  
>  	con = readl(bank->pctl_base + reg_con);
> @@ -209,6 +252,8 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
>  
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
>  
> +	clk_disable(bank->drvdata->pclk);
> +
>  	return 0;
>  }
>  
> @@ -223,6 +268,13 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
>  	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
>  	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
>  
> +	if (clk_enable(bank->drvdata->pclk)) {
> +		dev_err(bank->gpio_chip.parent,
> +			"unable to enable clock for deconfiguring pin %s-%lu\n",
> +			bank->name, irqd->hwirq);
> +		return;

but here we just print an error. I guess that for consistency reasons it
would be good to follow up with a patch and change the return types of
these methods and return the error too when the clock enable fails.

Cheers,
ta
