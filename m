Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446314883F;
	Wed,  8 Jan 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327885; cv=none; b=XyPKXEs5K39tygwQwZXM9Sg2vgV8HuZeoeVoj5cOOJ/9xVUl+VJwfaDpd2teELm2Z2AXJ9YLJca4XZ35sF9gHXJqGJdIy3Jx2z6y3Ji7NzDJUUzZ3XlfsvVvcOwU7fcnS5wPQIxuJ/LNmZj0VZsXTTOGI9E/QuKRXVGpTLD64BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327885; c=relaxed/simple;
	bh=Os4eCbx+49RreVsN2lPFHWZbkUCVULlHECA91K/8hZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCDSW28/VG4DnrxDN/7CTaFt7I+9d/npRsBh1OI7my1uXmhk4Q5p15RFsbFM3vGjoCRTwRLrrdf8Igk4BANCxMEAGQ9UKLvDGLIH82jicuR5PAPWiQJI0k404QwOqAW73x6pz02UxMsgPQmppvvkchQ9dWq+uE/OugaSSRBq2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWNWh8Ie; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWNWh8Ie"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4362f61757fso163463915e9.2;
        Wed, 08 Jan 2025 01:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327882; x=1736932682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vgCrtOmP3fMOm81ZkcP04u4uUigFjMyWEu/8yFPY2c=;
        b=RWNWh8IeWBU3onAi+7xEiSfRdcG/iQ3X07q9+MPbdBsBhy3YvOElTYPx10vVVSHK6y
         fgLvqbrQ+MxjnqqJmK9mqsuKwQkSvCTtJ2Sj+dDIWdcrsfNkOtRqrQW5P4gdCg0xYOuK
         KCoPhWiZlLf4CUi6ToWidQk9ogSgvC9OCtWLauKZVjZpZ9sQ3TCYe0D4fDbgNVPrQspE
         1Cd2ti3O/rTBahZJFCGgzIuc1jF79TPPWqfAwneforS9vDc+XZy2M43P99KCKeFzzINy
         zH1zXbD7y376I5kJsqR4Vhaxefm94CMFkPbZTGECOnw7/y/EF2wXGyLPDAu/NZvehW/M
         HFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327882; x=1736932682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vgCrtOmP3fMOm81ZkcP04u4uUigFjMyWEu/8yFPY2c=;
        b=rpLzFJRICdDn9EXlJMgGz73doSMdMwfSnQT5Nc69/8uVpTBLoIX1nbaJuYMSCIzed7
         w2fHdd596fiSuX5rx0l04cWDsV7Q4tQFcPLk/mQH0n6wsdA5byiStXeTmSPm4BiFqdeL
         z7h8unPZRhBV1+IxIwkmuEOF72F8ZNOmDx1/uV9AxT1FOnhMwR3JJJMsTFOAnBQw1mlX
         cGQD+LlktK1vew34saQFtCOMHy0s8YFEQtbs2+Ib/mdA2F2pCjp9UgpyNzK8diIpI7Z0
         nhrekYWnkpyeAkEFM3RPOXw7Ik6FocDY6ZojF2Uv4wEdGJBlCoV3qVvODL6VjIjq/x8p
         vlYg==
X-Forwarded-Encrypted: i=1; AJvYcCUoaBkCl1MtXz3AAAazgwQiyrDSRrhGlirqz/8yfbzQSn1K124pUQf/ai/qE75rfM/wN8yqfFNQRrKa2keSsqoDs2I=@vger.kernel.org, AJvYcCXp7rgl0dkgeDDu/MFwgXtimgYeWF4tlufAYuJKSrfUJ0J8+e9yfxfwqkxV5JBQcuPnXCHOGNxyQaMA3ZGJ@vger.kernel.org, AJvYcCXwUxSnkt5DLh2l4otr7JKLTgOYD75ydNOnJ4ASGd5U1xyB2N/k66tg3ErDdW8Jpl6ViSepA/MCNxTn@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbvgrGZ2Pt5hzVG0lrEsda1gC1elNAEc0YQLXoookbDak6+Nr
	kyNU7pXGV/a1fSthRIWtqUsPoXAC7BmPpPs9It6JIJaio3JTwL9q
X-Gm-Gg: ASbGnctIe5nqDuaDI7nhLtWFPJ/B9LZ9b7xZm7YvEOpmY4Ic0/yRetiZP3oJhwLqfIg
	VW0VsrfPMLGuzIXsVwbbv7sIn3fz2uv9oaH/GE7b1BCjUp5VViSHPl4lw4eTqNBDg6chAMrhv8j
	p94YmBC/UfjRe0P4AtjGKaf8Y7VsQpn/6W3SxJTreQp8LcK0NefjOg5qdRW/wbmyeQlbSn90t3k
	VyqhLu9Al20hNtJNOMCjJlvF6pJ09QUvLnG0mFCzFEDSwhZSLrbkRvyuaXinB2dTtfuu+kXLASL
	kLumW1kOcJtoP2Pd20cG3g==
X-Google-Smtp-Source: AGHT+IF25RyfmHYR8rxHUwWamhEEYdeAEyyzo+cfrf76RzBh0JsXJhCzQDdi/Yez7lnMabSTGdWjVQ==
X-Received: by 2002:a05:6000:1acb:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-38a87316a81mr1314020f8f.50.1736327881617;
        Wed, 08 Jan 2025 01:18:01 -0800 (PST)
Received: from [172.16.20.210] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm52311147f8f.66.2025.01.08.01.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:18:01 -0800 (PST)
Message-ID: <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
Date: Wed, 8 Jan 2025 11:17:59 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/25 10:30, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
>> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
>> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
>> SPI, UART, UART_HSI2C1).
>>
>> USIv1, unlike USIv2, doesn't have any known register map. Underlying
>> protocols that it implements have no offset, like with Exynos850.
>> Desired protocol can be chosen via SW_CONF register from System
>> Register block of the same domain as USI.
>>
>> In order to select a particular protocol, the protocol has to be
>> selected via the System Register. Unlike USIv2, there's no need for
>> any setup before the given protocol becomes accessible apart from
>> enabling the APB clock and the protocol operating clock.
>>
>> Modify the existing driver in order to allow USIv1 instances in
>> Exynos8895 to probe and set their protocol. While we're at it,
>> make use of the new mode constants in place of the old ones
>> and add a removal routine.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>>  1 file changed, 95 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
>> index 114352695..43c17b100 100644
>> --- a/drivers/soc/samsung/exynos-usi.c
>> +++ b/drivers/soc/samsung/exynos-usi.c
>> @@ -16,6 +16,18 @@
>>  
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>  
>> +/* USIv1: System Register: SW_CONF register bits */
>> +#define USI_V1_SW_CONF_NONE		0x0
>> +#define USI_V1_SW_CONF_I2C0		0x1
>> +#define USI_V1_SW_CONF_I2C1		0x2
>> +#define USI_V1_SW_CONF_I2C0_1		0x3
>> +#define USI_V1_SW_CONF_SPI		0x4
>> +#define USI_V1_SW_CONF_UART		0x8
>> +#define USI_V1_SW_CONF_UART_I2C1	0xa
>> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
>> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
>> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
>> +
>>  /* USIv2: System Register: SW_CONF register bits */
>>  #define USI_V2_SW_CONF_NONE	0x0
>>  #define USI_V2_SW_CONF_UART	BIT(0)
>> @@ -34,7 +46,8 @@
>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>  
>>  enum exynos_usi_ver {
>> -	USI_VER2 = 2,
>> +	USI_VER1 = 1,
> Is this assignment=1 actually now helping? Isn't it creating empty item
> in exynos_usi_modes array? Basically it wastes space in the array for
> no benefits.

I wanted to keep the USIv2 enum the same.

>
>> +	USI_VER2,
>>  };
>>  
>>  struct exynos_usi_variant {
>> @@ -66,19 +79,39 @@ struct exynos_usi_mode {
>>  	unsigned int val;		/* mode register value */
>>  };
>>  
>> -static const struct exynos_usi_mode exynos_usi_modes[] = {
>> -	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>> -	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> -	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
>> -	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
>> +#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
>> +static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
>> +	[USI_VER1] = {
>> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
>> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
>> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
>> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
>> +		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
>> +		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
>> +		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
>> +	}, [USI_VER2] = {
>> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
>> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
>> +	},
>>  };
>>  
>>  static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
>>  static const struct exynos_usi_variant exynos850_usi_data = {
>>  	.ver		= USI_VER2,
>>  	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
>> -	.min_mode	= USI_V2_NONE,
>> -	.max_mode	= USI_V2_I2C,
>> +	.min_mode	= USI_MODE_NONE,
>> +	.max_mode	= USI_MODE_I2C,
>> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>> +	.clk_names	= exynos850_usi_clk_names,
>> +};
>> +
>> +static const struct exynos_usi_variant exynos8895_usi_data = {
>> +	.ver		= USI_VER1,
>> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
>> +	.min_mode	= USI_MODE_NONE,
>> +	.max_mode	= USI_MODE_UART_I2C1,
>>  	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>>  	.clk_names	= exynos850_usi_clk_names,
>>  };
>> @@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
>>  		.compatible = "samsung,exynos850-usi",
>>  		.data = &exynos850_usi_data,
>>  	},
>> +	{
> These two are in oone line.
>
>> +		.compatible = "samsung,exynos8895-usi",
>> +		.data = &exynos8895_usi_data,
>> +	},
>>  	{ } /* sentinel */
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
>> @@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>>  		return -EINVAL;
>>  
>> -	val = exynos_usi_modes[mode].val;
>> +	val = exynos_usi_modes[usi->data->ver][mode].val;
>>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>>  				 usi->data->sw_conf_mask, val);
>>  	if (ret)
>>  		return ret;
>>  
>>  	usi->mode = mode;
>> -	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
>> +	dev_dbg(usi->dev, "protocol: %s\n",
>> +		exynos_usi_modes[usi->data->ver][usi->mode].name);
>>  
>>  	return 0;
>>  }
>> @@ -160,6 +198,30 @@ static int exynos_usi_enable(const struct exynos_usi *usi)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * exynos_usi_disable - Disable USI block
>> + * @usi: USI driver object
>> + *
>> + * USI IP-core needs the reset flag cleared in order to function. This
>> + * routine disables the USI block by setting the reset flag. It also disables
>> + * HWACG behavior. It should be performed on removal of the device.
>> + */
>> +static void exynos_usi_disable(const struct exynos_usi *usi)
>> +{
>> +	u32 val;
>> +
>> +	/* Make sure that we've stopped providing the clock to USI IP */
>> +	val = readl(usi->regs + USI_OPTION);
>> +	val &= ~USI_OPTION_CLKREQ_ON;
>> +	val |= ~USI_OPTION_CLKSTOP_ON;
>> +	writel(val, usi->regs + USI_OPTION);
>> +
>> +	/* Set USI block state to reset */
>> +	val = readl(usi->regs + USI_CON);
>> +	val |= USI_CON_RESET;
>> +	writel(val, usi->regs + USI_CON);
>> +}
>> +
>>  static int exynos_usi_configure(struct exynos_usi *usi)
>>  {
>>  	int ret;
>> @@ -169,9 +231,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
>>  		return ret;
>>  
>>  	if (usi->data->ver == USI_VER2)
>> -		return exynos_usi_enable(usi);
>> +		ret = exynos_usi_enable(usi);
>> +	else
>> +		ret = clk_bulk_prepare_enable(usi->data->num_clks,
>> +					      usi->clks);
>>  
>> -	return 0;
>> +	return ret;
>>  }
>>  
>>  static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
>> @@ -253,10 +318,26 @@ static int exynos_usi_probe(struct platform_device *pdev)
>>  
>>  	ret = exynos_usi_configure(usi);
>>  	if (ret)
>> -		return ret;
>> +		goto fail_probe;
>>  
>>  	/* Make it possible to embed protocol nodes into USI np */
>>  	return of_platform_populate(np, NULL, NULL, dev);
> This also needs error handling.
>
>> +
>> +fail_probe:
> err_unconfigure:
>
>> +	if (usi->data->ver != USI_VER2)
>> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
> Move it to its own callback exynos_usi_unconfigure(), so naming will be
> symmetric. The probe does not prepare clocks directly, so above code is
> not that readable. The most readable is to have symmetrics calls -
> configure+unconfigure (or whatever we name it).

Alright.

>
>> +
>> +	return ret;
>> +}
>> +
>> +static void exynos_usi_remove(struct platform_device *pdev)
>> +{
>> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
>> +
>> +	if (usi->data->ver == USI_VER2)
>> +		exynos_usi_disable(usi);
> This is not related to the patch and should be separate patch, if at
> all.

Well I though that since didn't have any removal routine before it'd be good
to introduce that and not leave USIv2 with hwacg set.

Best regards,
Ivaylo

>> +	else
>> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
> So the easiest would be to add devm reset action and then no need for
> goto-err handling and remove() callback.
>
> Best regards,
> Krzysztof
>

