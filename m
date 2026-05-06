Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B332A3C9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070573; cv=none; b=gZmf++1uUSqL2FFit5G5EWdAFGdHgRiquXvRsJoBv0ehplPEuNJ+8S/An2Z1LnvnJABe9a0CfBjTye0H8KAFHtI/gk39pHotz0hP3AMBEhLf63siamkK2NECtX5XGz4DCdtSve6X2CY3C/QU3ROeYNQ0eMzQo2k+qj0UWD7uLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070573; c=relaxed/simple;
	bh=XOZ7v8ltQwZiMyzo5VWS6ZSorJyR6knJEj/bH49Z3ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b4bN/hY/5lQtwTj/vPWhcUic402N17eo7H51RqWZ4D+eMq0GUKdcegH1rWtpGnsnkVhLshi8CGmH98ryDnhQiGSbqFuqm0gJs7oyuAQI4kkJxyfNYeX+fnxdh2ytfYPfIyVGIsHFh/WcQ7kfLFOrQnhEBiMWOxtsr+aphX6sKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeENEyvB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeENEyvB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso45575535e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778070569; x=1778675369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MErtgJ01ux0KftOTULYSL/LrPrLq4iBEMS2wRNoZ6W4=;
        b=KeENEyvBAZnq0XJGFgdQeQn++VcX90Y5oU3H5htUHqXMXRrycmjMZRKpVKSSLUukGr
         toSPjBKpVDOVhkraEUNb8//7l40kEgKpC8rZ9CIY+lDN2mTtMQSWpppmgny/fkDq5Y/V
         3pBpVqKTSvxepQShZO3JA44Ft9SN+ABZpCQqxbh5ibnR8Cf5KbBXap+di50kY5/yY/yI
         dJUm2vZMSOI1X7T7Ih2t+j5UlA2fzQFPg5EzE8SRIh9jKE38J4k+cg2H4z9dcQmBE77z
         QGQhoNh1fPi5XUD6t/NYzFClys2TMAOgaHXBkV/R0NuePExm13r0UvSjG1j1y3B7qsUO
         s8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070569; x=1778675369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MErtgJ01ux0KftOTULYSL/LrPrLq4iBEMS2wRNoZ6W4=;
        b=UeZnEWbSCmZPJtXjnLEzlqsxpQniz5cErkTPBoQSRZyz7cSrxjtn/66shTipRxWTTL
         yqP3QByYIoVWnZFh/LzHyUlPZ9/Eoq/Ml0uov7XtYAg0c4r02fEAxoX+vEgCeqE+9/Gl
         yLkQdY1JQo7IFpreKUZ/6OjT9eDNLC///TRf8zGd/6S2uB6cldWZe0YJnVoRR2nr12xb
         s3gvh6Uj8vP6nzhQXDzRzyhDP7RWTZgAEeeyss4ORNKBrg3w2HkrIyQLMGxyopwiA3Fr
         s2aMHsi0b3S3eCdevQ3DwkOVDOgDjwezvNB007hOXS4RL1agGHY9k3JeI4Ue39OMwtDp
         H9SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NNp7fgDwXKLR3YpvyRMIH9oZeQ2H5xQFkANiZrtAc/xc93RVr4YH5ZYcXAZb4N90XbuxH3Z8igSRl3mNwwu+JRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqC2CIw5s1yHQodUOMAU4fcG+qSUkJBnyByPliPl7cY15smUl
	UbKAvinoWUOjmiLN1YhYvzOmROb3nqi0ZAnyd4HoWnonq/yU3cPrjru62biU80+h6e4=
X-Gm-Gg: AeBDieux3V6zbbTxbkT+5PiTmRBc0PpYPLT6p69dCCtckASxSMqd4OiVILheZ0yYHrF
	DCWTf6r7tclJ0hPMW4xS8/MhF6CHiPTvFkU/UtZfWINKMVAsTa19vKVOWXdOo6H6toF4TGRPlvj
	HnrFeQ90vnzEYo4ldlgAjnNZyN9PjYSaJ+TIhT9PLXO0PGwfszzm5JmorFCrH+SY02gTLKO49KS
	bBqBCeSqj5urYG5/WTg3vevivru2k+sWGNFnLt1qx6YGeUDS+qJO9aoJ3c5MpB33Hx7gSA9Ftry
	g1S18cW1a2xhq5c0yWem0PdWkmI8pzcv9Kdwko//+ORiOVsGIfL02C7UoWbMoKAzPFON+c/Sy62
	+oZZjANp31sjrxUJj8QaSws6yH9FNL4f5HJ9VPeTdNFwH1yt3a1KVi4sfUr/0DEqTJPYlgQgZX/
	MDT7++kJ36Ok36sxRDqek8YeXKQCD7KyOeCJ9h09RYp4ashoG7gT6pYQ==
X-Received: by 2002:a05:600c:c096:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48e51f444ffmr39137505e9.21.1778070568779;
        Wed, 06 May 2026 05:29:28 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f249bbsm10865842f8f.36.2026.05.06.05.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:29:28 -0700 (PDT)
Message-ID: <d5e1e929-e24c-4876-8590-030db9e95b52@linaro.org>
Date: Wed, 6 May 2026 15:29:26 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: s3c64xx: fix all kernel-doc warnings
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260416224056.985233-1-rdunlap@infradead.org>
 <06406c7b-c141-4997-9921-9358cdea7641@linaro.org>
Content-Language: en-US
In-Reply-To: <06406c7b-c141-4997-9921-9358cdea7641@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/26 3:28 PM, Tudor Ambarus wrote:
> Hi!
> 
> You missed adding the SPI maintainer. +Mark.
> 
> Also, there's another kdoc warning in that file. Do you care to fix it?
> 
> scripts/kernel-doc -none include/linux/platform_data/spi-s3c64xx.h
> Warning: include/linux/platform_data/spi-s3c64xx.h:40 struct member 'polling' not described in 's3c64xx_spi_info'
> Warning: include/linux/platform_data/spi-s3c64xx.h:51 expecting prototype for s3c64xx_spi_set_platdata(). Prototype was for s3c64xx_spi0_set_platdata() instead


Ah, I misread, both are fixed.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
