Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5F18441F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711350921; cv=none; b=kCuEK+YrqdA3P8gkFDLcgLzKJrKLlpeQk4IOHnAOlHHZ/3mZbtWUZa7z4AjfSeJs8F79W+0/5+ySnx9X0cVrmE1iK3pW1iTTlw9piMowc6ses9H8UadSvOl7idZ9LyaU16wiB8IJS5GEgMjjenMfgkD+lWDT0zjRhdjjbouaoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711350921; c=relaxed/simple;
	bh=+OyKK7IkvwEV/w7UMcTxO7cG4x4rvzI12pOx3LK8JQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8qAYSl7m2Edp3etXwrHLXo1oxsdDNlxGFlMa2DTipuSaWvxDbwc57lNvtzYlfxm+vE0yea6FS5AClY9sWeFoPFE7U+Sj350QmG4wU8OKc13anXIoZZeOwlxW283QvZnWs3SgIeytDML+i6ZPRRyPwBUewhiRbWTChtYtk9iG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ro+EHill; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ro+EHill"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso5371165a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711350918; x=1711955718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxdjCTpMFkU2iy+O7js4KexQH/nrED/NHR9zVi08e94=;
        b=Ro+EHillAS5+CDQHhQK4soZHh7bpfFrTib9LvmTZVs8Ly2G1rUmmcohhmIZlBMvaHK
         c4Kb/5XrxeJf0TW5VTppJN6JhiEW94jA+Gs9A09YpbmJbCkfGZWLDbP8xFZkDFWoqClN
         98Aq2zLtar/buAvu92upr0lEPLhuTrptxcgWMn2YuD62uFrXn/+AcwOI68P921sxAJj8
         1Vlif5PkCVs4x0VxJLtdPzohIorlDlcMCjYAWUzoNlkSI4cl1s7yHyKu6h9Iz8KPhIip
         Gfw1glFi/5TfOHSUu4wk6uLexNLSif9U/yPvcZXE6x8nU/8SrTaN8u73b+YmBnIcrMkR
         /TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711350918; x=1711955718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxdjCTpMFkU2iy+O7js4KexQH/nrED/NHR9zVi08e94=;
        b=Kf6w6n3ss47r1QU8o6bUAKb/cA+OGFZP/m7U4J2Sw+Qt9QkMY8sehJei2qD+6pSd3B
         BEuJ+uPNpHnfTwX6tUm9jy5zMAicAnObMnpeaN+5tLoZkp3kIW2hH0d1rF4/dCfuEIKi
         0/iPgmtM8IWUFB54mm0y9/Ad+iUi1g5bEBnxkQNozoLE92EXMw7851QQnkSD+IOz0BeU
         V3T4hjPKgOThMGZy0KfuarOSZYlMuV2Ub9FBp0CGjIr4Z461QIMDh4ZG9cYhM6E2BzyX
         EaP0RyjBnivOlE6SIAm2snopoG8K2eOHBVKH5QbwgIoyBhp8IUIYAPAX3w0s4Oy+H/Wb
         Br/A==
X-Forwarded-Encrypted: i=1; AJvYcCXl9er8KOkQ5LdERmumNuhwrY2FdTBwjHmr36eo+5zhhSm30utyhIUOVHZXI2XgJtU3nh+rAQs9i7nsLpHeEg02dzn/mAn5nK7BvrnstXC6PJA=
X-Gm-Message-State: AOJu0YxXTRkNYixwYRgNOXojDdLY09BZrVEzjJydTZ5OOukFQ1rBZdx5
	aqIh8UEy8RLvRidfe7YKNs6JnAGrJRgozBE/LiY4dLRQCbioKcqrVUWNSYgiFQI=
X-Google-Smtp-Source: AGHT+IEABScS/uWpH8mLPgka5W2OjNZXv8LwGqs+ViqHFZf7wcLBOPPQPWhOE5l5IRTB8EdwF1y6ig==
X-Received: by 2002:a17:906:1d04:b0:a47:34c8:900b with SMTP id n4-20020a1709061d0400b00a4734c8900bmr3993917ejh.0.1711350917368;
        Mon, 25 Mar 2024 00:15:17 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.252])
        by smtp.gmail.com with ESMTPSA id lv16-20020a170906bc9000b00a464f709687sm2723321ejb.59.2024.03.25.00.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 00:15:16 -0700 (PDT)
Message-ID: <20deadca-48e2-4359-ae6e-82e44651a2e6@linaro.org>
Date: Mon, 25 Mar 2024 07:15:14 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: samsung: exynos850: fix propagation of SPI IPCLK
 rate
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?= <jaewon02.kim@samsung.com>,
 krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
 <20240229122021.1901785-5-tudor.ambarus@linaro.org>
 <CAPLW+4=jSr6ZsB7XekXsiUBm0SmVpVFnqpgjViuF3=HpT4gRAg@mail.gmail.com>
 <867158d7-0d98-4058-9c2e-6b573ec68516@linaro.org>
 <CAPLW+4=nRjRPdu80Y3izifxQDNUaJymU3di0hGErm1dHry3EfQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=nRjRPdu80Y3izifxQDNUaJymU3di0hGErm1dHry3EfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/22/24 18:09, Sam Protsenko wrote:
> Yes, please leave Exynos850 out of it, if possible. 

Sure, Sam, thanks for the feedback!

Cheers,
ta
