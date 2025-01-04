Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1C14E2E2;
	Sat,  4 Jan 2025 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983407; cv=none; b=uPARcBWFy5SFvyA1hXRrzhDiWGNoXPZA3rxoKF+90ZlT4KGoNwBWZktYco4vmMdjn8LYoBgarGLwLL3y5ez8e2KERj4GZDs7h8/u0EqdE5ZCVrJxwqyRkH2j7zJrDlVwniWFSIx3thsCe9bVt0kAka6onHjuDuv8AZ5U1AjIvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983407; c=relaxed/simple;
	bh=5IuTrWod+peCxkQOFkUOJxfPZIknHou8h2xUhFFTm7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvnK43DhF40VviY+rNR3LhAMkhVN+TYT2Ib8bYprpfA38kZ6jIQPmBUdu3tD//np0o94fg0NVCS9oQeDnIYkY6lMMjbSVo/4OnYbzhjAEzHOO7s+gnBDengg6qEoSoi3gPWnSnJDXfKQqfl3o2SBLt+K3ujMtN2jBTU8quC+BC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AG1ZKJnA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG1ZKJnA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso34468066b.2;
        Sat, 04 Jan 2025 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735983404; x=1736588204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1yX8O3eI7bLwjZXX+ME9fT09D1iu/rncyeUGujpTEM=;
        b=AG1ZKJnAgHP4e5P++g5pGe4TMEwZhEmJkOae3njtZ2cUL9mCxpLIYdUmE9ihZ7JPhb
         zt7fV/yJzhfA7HKdapeN90ZP+P6RCLZfn9ZbFnKgqJh+dcmNfOKaESPNhdib/K3mJc0z
         bLe9X72u8i0XbwspyMVbBrY3KiI49YQk+n54I8N1TGrtnDCs8Hrg6+haXyn3xLN4Pp+z
         13i1Iany0iFrbh/tFUpxXTHVtdh5MXPLvGDUop6U0qn/rfmL1Fbg1rGgDgliXJeW2/8V
         3PYgZXgXj8PEiBozOUfvfDLSnD56MFQCvz1uhANhLsBpu6OR6NNn/w3N0qh6MOXFLQMR
         70xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983404; x=1736588204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1yX8O3eI7bLwjZXX+ME9fT09D1iu/rncyeUGujpTEM=;
        b=OEqT4AFZBRLcsBX80IjzVGXxUGOs8taAdIHqnYrhWRxX0hfVFlJJNlgBn1kRzCe39j
         gDKKjwQgkilelzj45TQbA486x+9Jcymgno2ufj6gFAnj6PwQo4Dr/TSVLZ6dD/Yqpyo1
         YrzhfKpOrzMvPthyVGTE97z0DRWQplnIcZan5kaJP2OJydpE4PqK+Za8J7fkYU/SKwGO
         Ivg/7gxogM7ye5KQi7K4Wg+t83bMGh0bgY0app9HkFaEf9/1S53TSlW62W3FirWsoYNU
         3IaPV8JK909hThVGvkrj9VNKqqWaw7w6jsL7QiKqPVPI9Kru4VLkHDJLP3GHdOTq33K7
         gpvw==
X-Forwarded-Encrypted: i=1; AJvYcCUcFveXoL6uL7ZmFioC2TJD4eV3D3Z7Dt6WUlMNLYm5H+GhoMaQqHt8rflJb16kuc3yj2DYd063nti9XlC5GffU2RA=@vger.kernel.org, AJvYcCWTYUKZWlP6wc1fhqbdzxIwe/wMD7rfh1uIAXsY4ArjQGahZE/dshaZunHn8CyJ7e/QbBk39kQFB/Xj@vger.kernel.org, AJvYcCWs7muc5BMTSvy7vvy6WYYcS62aAMRrOKbIPcrslLTGjqxou2x9w3tOAWrFzMbwYscwgVP7NlYNZpfvBD0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQTyHB0J2Ty8VK4ecbaeAuSc9LNI/VSWQEu1QOwquz61lp2wd
	FtTG6mEiuTPnp4qtF3Undj7KPk5nxb7fkoo4RLhtEKsrgXhXIG6gdBXCog==
X-Gm-Gg: ASbGncsIAeGRP2FpL2yxnr8AfMjcQGtZRO/Qlm8gES18C4Db2ccWdGYmPht8WvYVZpR
	A0E5O30g4PHx31eircKl7qvNqp4LqN1ySUTN0CKF7TsTAdcj7J0Evkzotp8BoKamvOI4TY2OEKH
	gtvXcTjFW7ytokydX03N3UKuIOnQFZYQoAfoh7LoGR2rc6429xazqjKVcF+GobxcrM6OVUYCI/7
	LYl/mysxjlZF0YgnnZYbfhcNzph9HnyWiyNBTXhMwSNCg+UIKvz2YJFdSzevX1AS67P
X-Google-Smtp-Source: AGHT+IGjJTU2KCxShSpqQzsirXZZgsP5kMOi6w8vAMmqoEpBNdwuvTD8bdgHM7aWk1xHF84c5vbIlg==
X-Received: by 2002:a17:906:9c96:b0:aaf:117c:e929 with SMTP id a640c23a62f3a-aaf117cef2bmr3198160866b.57.1735983403892;
        Sat, 04 Jan 2025 01:36:43 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f2fasm1990107166b.9.2025.01.04.01.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:36:43 -0800 (PST)
Message-ID: <9510ba3c-1879-4c42-ae17-36d8b32fc799@gmail.com>
Date: Sat, 4 Jan 2025 11:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
 <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/3/25 10:29, Krzysztof Kozlowski wrote:
> On Thu, Jan 02, 2025 at 10:40:15PM +0200, Ivaylo Ivanov wrote:
>>  /* USIv2: System Register: SW_CONF register bits */
>>  #define USI_V2_SW_CONF_NONE	0x0
>>  #define USI_V2_SW_CONF_UART	BIT(0)
>> @@ -34,7 +46,8 @@
>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>  
>>  enum exynos_usi_ver {
>> -	USI_VER2 = 2,
>> +	USI_VER1 = 1,
>> +	USI_VER2,
>>  };
>>  
>>  struct exynos_usi_variant {
>> @@ -66,6 +79,16 @@ struct exynos_usi_mode {
>>  	unsigned int val;		/* mode register value */
>>  };
>>  
>> +static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
>> +	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
>> +	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
>> +	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
>> +	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
>> +	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
>> +	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
>> +	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
> Now I see why you duplicated the IDs... With my approach your code here
> is even simpler. Allows to drop USI_VER1 as well.

We can't really drop USI_VER1, as we'll fall into USIV2-specific code, like so:
if (usi->data->ver == USI_VER2) return exynos_usi_enable(usi);

Thanks for the feedback!

Best regards,
Ivaylo

>
>
>> +};
>> +
>>  static const struct exynos_usi_mode exynos_usi_modes[] = {
>>  	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>>  	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> @@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
>>  	.clk_names	= exynos850_usi_clk_names,
>>  };
>>  
>> +static const struct exynos_usi_variant exynos8895_usi_data = {
>> +	.ver		= USI_VER1,
>> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
>> +	.min_mode	= USI_V1_NONE,
>> +	.max_mode	= USI_V1_UART_I2C1,
>> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>> +	.clk_names	= exynos850_usi_clk_names,
>> +};
>> +
>>  static const struct of_device_id exynos_usi_dt_match[] = {
>>  	{
>>  		.compatible = "samsung,exynos850-usi",
>>  		.data = &exynos850_usi_data,
>>  	},
>> +	{
>> +		.compatible = "samsung,exynos8895-usi",
>> +		.data = &exynos8895_usi_data,
>> +	},
>>  	{ } /* sentinel */
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
>> @@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>>  {
>>  	unsigned int val;
>>  	int ret;
>> +	const char *name;
>>  
>> +	usi->mode = mode;
>>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>>  		return -EINVAL;
>>  
>> -	val = exynos_usi_modes[mode].val;
>> +	switch (usi->data->ver) {
>> +	case USI_VER1:
>> +		val = exynos_usi_v1_modes[mode].val;
>> +		name = exynos_usi_v1_modes[usi->mode].name;
>> +		break;
>> +	case USI_VER2:
>> +		val = exynos_usi_modes[mode].val;
>> +		name = exynos_usi_modes[usi->mode].name;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>>  				 usi->data->sw_conf_mask, val);
>> +
> No, why? Drop.
>
> Best regards,
> Krzysztof
>

