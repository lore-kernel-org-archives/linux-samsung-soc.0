Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB320300
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Mar 2024 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292531; cv=none; b=KfQ1BuQqG5EZtdGuU/Px/Gm0RXEECzDJP/fY3YQgpOdZk3ia2jLz46hpAJLhnxNeUWxOg7y+JPiRwdwAD5pwxXuWwSN+fXla9dXDwH4h7FvAma6xrxHRnb+fhaqzT17bXEb405oq0cVGP2YkPBc6bQnq4152HelENAmXKiapB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292531; c=relaxed/simple;
	bh=aYulztljP4NuyowweG9K2SwvWg+mDvCTutG7otENH8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQmknAy/WjCVox55As7c2/npOd5BPmwXbA4NNNGkulooUziRpdSqh7HLQwHAaaKbKfJGzKRPFQE+JUAkpdkebX1DaH+sIZsEpcvM11p9GEebCiFEKRLjrLYhRESBcGwfudDmm8MXVsvhc+aHD+445P/uwp4XY2TduVdP7eDN/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=py7od88W; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="py7od88W"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d27fef509eso26121601fa.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Mar 2024 03:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709292528; x=1709897328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FooY6PWiKNPrfwZqqVcqa07jZtGfRl4IYqI+n4V8Fng=;
        b=py7od88W+msxPCEylSwpyHV5nPyoa3TF+SgBAe5WH7xmiyFEMK2ihz0Rd4JZFGYWcd
         Yw8FvmfCD6Rqfjcye+gBOc/0UiIz6Np2LQtvS1RNR7/I8XP/BNAafC57Rvy1TNISGZ5C
         HGfLhATxz7WBEDtaRj9X/G5rWcnNTQvtdsBJP/kY3HGqQYNMxryIew0bNpR38TTFBPbJ
         GBuDbM9QZ+EFCu1tSqo2tsPgTf3e/9+dqzobXjDnRVyITTwAzoIcnP9D4unbVD1sZbPq
         PwxvLAXsQt76WNAxxG0NuSG/PQD6y0XyYd0wmNwMVgyhpDUF62pbwPZAXBwVm3iU0O1d
         rgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292528; x=1709897328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FooY6PWiKNPrfwZqqVcqa07jZtGfRl4IYqI+n4V8Fng=;
        b=kPyjYiM3i9LLDyEIU04mICNMAIvpcYlwX1uFsWVWMdk6I0zNboWchJZO16TeqpUUZF
         8rwUOuL53rkimpcxccUykvc6hlAl08t3qYdvuSQO1LjWRPp0gHSL+aTghLuqyUEo4sS3
         qDgNklg/AuG/Y7V9YLHhe/5oH9L3bDbHg9y4asCHytMw7/TuHC66nGX9HZad5rlDoW9e
         Xto2HwOcoMBefYZKo2oeJdoddxXOAH+WP1Sa4xGWiUzBO/kcMSuRnsI79QWlFN4hSAC+
         Dt9Zif1nsvCuSa3EUYbvfi6FfQmT7RfAdsMi3FouvY8D550LpTWhY4WD28nFkRFZd1uZ
         Jp7A==
X-Forwarded-Encrypted: i=1; AJvYcCXS6wWDMNhS1C2FRjhLot44UHSZ3SDDP9YZ+9oSHmr5nnarEr+9afgDooQeKDMsxtq7HB5c0AJErT70WuqeBZQal7uMhsAUoZxNQwLQOA5SXgA=
X-Gm-Message-State: AOJu0YxNl3IzYxqrgWJ6wqitgA8SqGb8k3af1fu7yUo6l6IhjKpDzeYG
	9BYtTu2gAwUg1blW2wHijaxuvYksMlYM5gyBZlikEFkisgEle4KF+KtEUcglznE=
X-Google-Smtp-Source: AGHT+IE9FlH05apBu38tdBmkkbQVih/5PnqUb5fFuYj6hez9P+twTADKuukceTB88p7GkHUNnVh6cQ==
X-Received: by 2002:a2e:9085:0:b0:2d1:1de5:3c42 with SMTP id l5-20020a2e9085000000b002d11de53c42mr914211ljg.24.1709292528060;
        Fri, 01 Mar 2024 03:28:48 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id u16-20020a2e9b10000000b002d2d384519dsm540910lji.102.2024.03.01.03.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 03:28:47 -0800 (PST)
Message-ID: <a0786437-25b0-4649-acb7-8827165ff4ac@linaro.org>
Date: Fri, 1 Mar 2024 11:28:44 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: samsung: exynos850: fix propagation of SPI IPCLK
 rate
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzysztof.kozlowski@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
 <20240229122021.1901785-5-tudor.ambarus@linaro.org>
 <CAPLW+4=jSr6ZsB7XekXsiUBm0SmVpVFnqpgjViuF3=HpT4gRAg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=jSr6ZsB7XekXsiUBm0SmVpVFnqpgjViuF3=HpT4gRAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Sam,

On 3/1/24 00:13, Sam Protsenko wrote:
>>     mout_peri_spi_user     -            { oscclk (26 MHz), dout_peri_ip }
> AFAIK, the OSCCLK only purpose is to be used during suspend (PM
> state). When implementing clk-exynos850.c I specifically avoided using
> OSCCLK clock for the regular use-cases, and I believe other existing

Ok.

> Exynos clock drivers don't use OSCCLK during normal operation too.

I saw.

> It's easy to see from the clock diagrams in the TRM: all CMUs have
> top-level MUXes that have two parents (normal clock and OSCCLK). In
> fact, the TRM mentions it:
> 
>     "All CMUs have MUXs to change the OSCCLK during power-down mode"
> 

typo in datasheet, s/the/to, but I get what you're saying.

> Even if OSCCLK can be used in some cases for driving HW blocks, the
> top-level MUXes are not related to those cases.

This is what I'm challenging, yes. Do you know why we can't use oscclk
to drive hw blocks in normal operation mode, i.e. not low power modes?

Since the datasheet does not specify any other usage of oscclk, I think
too that it's safer to not use it to drive HW blocks. So unless someone
else intervenes and clarifies this aspect, please ignore the entire
patch set.

Re-parenting the MUX to oscclk allows the same clock range as before and
with the benefit of not affecting the clock rates of HSI2C/I3C for SPI
clock rates below 500 KHz. This is what I'm trying to fix here, I think
it's not a good idea to allow SPI to modify the clock rate of HSI2C/I3C
at run-time.

How about specifying CLK_SET_RATE_GATE to the common bus divider? It
will prevent SPI from changing the rate while the clock is prepared.
Thus HSI2C/I3C will no longer be affected behind the curtains.

Thanks,
ta
