Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA51F4E5F;
	Wed,  8 Jan 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329514; cv=none; b=FEUT9S3YGSMMRRR36WdGYpuFy1Ost/mGnormbirwBZ/kD8syvEI/CvRBw8Y5qtj2qQ8vcQHGaL35HXIlT/p+ajZ/2xRhdwBaW5efsrMnMQWBiBxdrTUrMhjjUSp9W0d6AiqUtlmj8bj4tK0X+ng9psQffuTcwJ+Re8s7KgnUOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329514; c=relaxed/simple;
	bh=NDgavOw8gmq7yStYWCODAHmKJuSOutCdpJM3iiok/Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwwaN+VfBXZbzB7gsE55OL+GqLntU9Viym61iX745ttBlpVz3SQilMasV2+3tHF+7dVsgBnTfSs5fpZAna0UnV4YujdkYvOKBwW0li+GTll0X7R1bXCGX7dWBrvcqYS27WxB/jSojz778JmN2/NypMBVvPav12V1ep9z0deHXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtWwcKez; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtWwcKez"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361815b96cso110296335e9.1;
        Wed, 08 Jan 2025 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736329510; x=1736934310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJFc6aCEYuELsqOgEP3eTfZoZbcGrNAKeEe94fE4tQQ=;
        b=HtWwcKez0EUkxRpYvgQrhfTfq5ytWEjsTsLZaRutr1cvJ2NbcKzBBOpMTYBnkDDUBu
         6lM0DXXaUlVT9OagkeR5pHTH9Vro14UbkICKUE/HKDf2bJmEsXQqAP2ou70s1y4wJx9j
         bbiVdn+rLBE7ukaDGIM9aQTZJ2OXj8idR5V7tv71p5byLsxfhCsO0E+bw/fw1kmkRy4m
         la1su3Bac4WSurluLCC7QIGmhE8EqDIYilCQenNLda2IfsEVC4Xxxka1OSZFzZwW8Ym2
         42F3cr8OWAK9QUY2JaFLZvygr3wFKyzQWLtqRY9ooSqe9mQir1nD02oAIltXQndePeQT
         wB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329510; x=1736934310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJFc6aCEYuELsqOgEP3eTfZoZbcGrNAKeEe94fE4tQQ=;
        b=tEFUhcxwja2yNhSFqgufsahZ5jS+hy6hWJc7xunxBcNy+mIP4RMaFvp2iKn5xUYPlR
         OO9jokUnanZ0d0swmoIfiUf0yfEKD5r7GmG7jV10XE5LBJf9sGIMJQLvvZyvcijT/1Lc
         8R3S4RPF70RJNqPVGusXMZUUJxqfqe36dWmFNywsk4K96WXOt5+Esuqf3voTuSInnHZA
         0Ys29NH67RUd0yjSG6T1pyGrqMkb803reqZCZV2RxOV4PKU8n316Q9SE9QWibcYk9t98
         mwL5r6sZQsI+UcbiQHRttbwCR6kZR1v3vE5tGouOx77oxqi/+EmVwkvGwgpICqmOu9z4
         haLg==
X-Forwarded-Encrypted: i=1; AJvYcCV4PArK/VMavh2XjLcQPFOUuOSMB9MZIwRyFFnqnKrExPC6OwGhbaql1IU0ZAnbAj6NFvrMU1lvbeKT@vger.kernel.org, AJvYcCWoAemJ4cN4RT9fm4Uh08wtPA6evaNGis+pFBy2JNo41JuAkP5FQBQEP56vlo6c4UGXrOLm1B3sBLX/xL1AZcrBUB8=@vger.kernel.org, AJvYcCX8O7YV+fWJv67fieQYkDkpTMVNM+bhsZrQUS+KCfbzLejGYV8sIQltgrnLw0L+U+JflmusQyDoeAc7AGyG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0J/ax9nN3Bbkv7NYfcN9mKtxhtLw9OfzLaRkhDbc/eVvAlxN
	dA0G9L+DDrtojPbZcHplI5fwZ5/nPboWT7HSoJgnC5jf8B2GKi8J
X-Gm-Gg: ASbGncsDB407VuaXOUQv8OZcRXLDu9dhIuqXpTZq4AKWiprEe8CEfZZNN7B9XrW4Hlm
	qQTykLcDoAtrCqP6hYjuyCG494oC/SEcv84zRsLNoOdowCio69I0SXka+5r3KSxE8DEbaih1ybA
	s9FaPqe7xHk2tpzlP7eGr5VlrJb3AuXkI/sRComCgIb3q0XeWAGvpza6qmnCjVGoPEhdTC6CVWF
	y0UjnMAHsh+c7gv1yqKoEGRq5cjsSYgzKpa5ImL+qypKHSwd+gn/Koi80CJQy9P1W3pDK+vLX+0
	+lrrQyfFlVvlUBD6Fwfy/w==
X-Google-Smtp-Source: AGHT+IGBYhtKcH+43aBsDTk5Gv4pcjmdDTwgBqDi6cgn0y4vI6q88YFJFw98p8iVkmiXs+yHyqRHrg==
X-Received: by 2002:a05:600c:3c9e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436e26a6727mr16110965e9.8.1736329509711;
        Wed, 08 Jan 2025 01:45:09 -0800 (PST)
Received: from [172.16.20.210] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc207csm14729785e9.15.2025.01.08.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:45:09 -0800 (PST)
Message-ID: <c30a6f1b-b1a9-40db-b673-e6fc47bdb224@gmail.com>
Date: Wed, 8 Jan 2025 11:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and
 exynos8895
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
 <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
 <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
 <e28abf31-3d91-4d1b-97e6-202df5ebb3f5@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <e28abf31-3d91-4d1b-97e6-202df5ebb3f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/25 11:26, Krzysztof Kozlowski wrote:
> On 08/01/2025 10:17, Ivaylo Ivanov wrote:
>> On 1/8/25 10:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
>>>> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
>>>> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
>>>> SPI, UART, UART_HSI2C1).
>>>>
>>>> USIv1, unlike USIv2, doesn't have any known register map. Underlying
>>>> protocols that it implements have no offset, like with Exynos850.
>>>> Desired protocol can be chosen via SW_CONF register from System
>>>> Register block of the same domain as USI.
>>>>
>>>> In order to select a particular protocol, the protocol has to be
>>>> selected via the System Register. Unlike USIv2, there's no need for
>>>> any setup before the given protocol becomes accessible apart from
>>>> enabling the APB clock and the protocol operating clock.
>>>>
>>>> Modify the existing driver in order to allow USIv1 instances in
>>>> Exynos8895 to probe and set their protocol. While we're at it,
>>>> make use of the new mode constants in place of the old ones
>>>> and add a removal routine.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>>>>  1 file changed, 95 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
>>>> index 114352695..43c17b100 100644
>>>> --- a/drivers/soc/samsung/exynos-usi.c
>>>> +++ b/drivers/soc/samsung/exynos-usi.c
>>>> @@ -16,6 +16,18 @@
>>>>  
>>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>>  
>>>> +/* USIv1: System Register: SW_CONF register bits */
>>>> +#define USI_V1_SW_CONF_NONE		0x0
>>>> +#define USI_V1_SW_CONF_I2C0		0x1
>>>> +#define USI_V1_SW_CONF_I2C1		0x2
>>>> +#define USI_V1_SW_CONF_I2C0_1		0x3
>>>> +#define USI_V1_SW_CONF_SPI		0x4
>>>> +#define USI_V1_SW_CONF_UART		0x8
>>>> +#define USI_V1_SW_CONF_UART_I2C1	0xa
>>>> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
>>>> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
>>>> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
>>>> +
>>>>  /* USIv2: System Register: SW_CONF register bits */
>>>>  #define USI_V2_SW_CONF_NONE	0x0
>>>>  #define USI_V2_SW_CONF_UART	BIT(0)
>>>> @@ -34,7 +46,8 @@
>>>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>>>  
>>>>  enum exynos_usi_ver {
>>>> -	USI_VER2 = 2,
>>>> +	USI_VER1 = 1,
>>> Is this assignment=1 actually now helping? Isn't it creating empty item
>>> in exynos_usi_modes array? Basically it wastes space in the array for
>>> no benefits.
>> I wanted to keep the USIv2 enum the same.
> Is there any need for keeping it the same?

No, not really.

>
>>>> +	USI_VER2,
>>>>  };
>
> ...
>
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void exynos_usi_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
>>>> +
>>>> +	if (usi->data->ver == USI_VER2)
>>>> +		exynos_usi_disable(usi);
>>> This is not related to the patch and should be separate patch, if at
>>> all.
>> Well I though that since didn't have any removal routine before it'd be good
>> to introduce that and not leave USIv2 with hwacg set.
> Sure, but separate commit, please. Can be preceeding the USIv1 support.

What about right after the USIv1 support? It would be less messy in my
opinion.

>
> Best regards,
> Krzysztof

