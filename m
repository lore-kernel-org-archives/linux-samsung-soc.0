Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655C1D435F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062134; cv=none; b=QKJ/Fvw34XQ5WQOTUTfJO3JNUpqt3FiEULC+UiXG8QtRa8EcADgSFyRs+CqyrfNptpRaoqGSCfqeosRi231x9sTPfqHXEi0v+8e/qAOXR5S/cBcdhW0EubUVrGI5ZTOCSHWH/cLnmxfdX5itxl1vzIE1OSTtWXQaN/M/q7286J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062134; c=relaxed/simple;
	bh=t9oCQVEIo08rhMPbsSopQWB9zAEXJx200lMqc8/v+L0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EH8NYLpi7+xyIr7R3+ykk857hZvqMt9OCfLCat0EinDJc3rJ6FAIgLkWKCtAET/2gPc9SJPv9cKG9KuSTSjEOELgEe2oebvkbiJ0fUzy/AH7u27QSXTaYJnAevYUHM5zXzrKdQ3ibANTb1e9b3+c/Wzc5c/4LSnybQG9sO/3kbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9/YZBC3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9/YZBC3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so37005255e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764062130; x=1764666930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbnniyQBYsSv8LXOy0SkndmtRMhR+Nd17w4wSUmMqng=;
        b=X9/YZBC3gOF25ZeO7sIyXpXjhDNau2abAxKtWe2X5j+KjAbuRbwttII3M4JWh97f5K
         PU4siMdggdUo/yqGiycOZxsWRr1IQQ0npTfy6b7Rg4Wihih5IkqriQIpFFhSKdaDN5TW
         moLxAHYR5uWfjUTCGKt5SmXBcF+EOXSwUfzWSk5wvOKUgBo1P+OV6wdwjRKUrPe+VHnR
         bLQReARoZNzttRBtuAQSyJdklrrkeKTQw0eomc++O3jvbv62RCJGv9gwUSqfvYUYhy+L
         3f07hvZ5ioaC6nWVdkC4ysu+SA741k4nFBsK0EwiGmGnxD1r8/k5fXXNaIcvulEjN6iw
         B+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062130; x=1764666930;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbnniyQBYsSv8LXOy0SkndmtRMhR+Nd17w4wSUmMqng=;
        b=KwZdmbJalZ6qO7ND8R5itTkLsbgvZLsvPwboG9nyzquxw+o3Etm2cCFLlmyRRVMDfe
         /bpwT2N4ce71dXOOCnTjt87HQfCCxoktYiQIV2rZ6Ws+4RK10EIQTBXYe1WIIxrIT5pS
         6IOhQvGP6Oh0nUqnQAyyNJPq2pYv2L8sl1Iu1Y6ypsU+5tYEbLMQAkV8rWUfB/mPBBK4
         Nn0y/I6K6f0mgxomqfDl68c/LX6oPOu9RPDZvFzUP5+s0KaABFbyjLM+9tgvZwd7kZMJ
         KePYmA3K7W2n+vGs/IH9Qia8nwx+CaC2ue5CAVb5aMGwqzUSz5BRyxy7py3B4IFy7aGG
         9B/w==
X-Forwarded-Encrypted: i=1; AJvYcCVWXN0VTT1X0PWifSDinGO8wpqtzgrU1fuPJxfbu4KvboxSFt5cOGxbmpFGSFJi3DDIXduO63tWGWZxDdk4xz27lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6LuAQdSgEmaMbvzg+6IA4RUOu/nuN7DHpI1URQTDG9Qj08XP
	47R++5gLMFrHnmu4bNGzyxcQNbBKd5lC5zApfz9xyM7ffg5z1eb+nwVWYec6+w56SlI=
X-Gm-Gg: ASbGnctn2TbajWyRwMLTDFJ2qwaOgkLVAczqQw6dY0YzQ0XwdFNOOfCgIf6xeSJbzdB
	e7fhL0shEv9FVPoEWaPNLjp0Zo43dheqrdSeKmzP9LFFXsZx9QUH9zQwmcI466kwWTqKwbz0cdZ
	iMqLqOrKFvXpHDn7y1auX8mEZSLaXV3j+Sm0pNm1Mt+lh/JM08NSaU+7xtYa2LLgRwEnvkDFGSg
	vDdFkYzRvk5/fm3ILj65ogozs789MBe4a+kJUo9t7n9EZtvaGcWCZ9jaZIIw744z1ZiieGBeD8i
	MpcPzX1ZUG6KR5yQJgzOs/MhZ0EQeJXP8SSUoVXOdBtyV/TGNkcOaVZfTTYKbHabPKPS1Y9YzJC
	uwnahYVBv71cT7D1o+0bQkJNerA2jz9Fs0xJI0/qSrL25hm/V5v94SE7yK2ON8XNGpO3lpMaKeL
	eUFaK31QYqXGMi8ihZ
X-Google-Smtp-Source: AGHT+IGWFG0HxUIp9tkL1HpcvIFQSl/Uv/HgoNmqz7nTca4y0bOHNVljGRRpohMOzuAV8p5abC+yhg==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr16226075e9.1.1764062129519;
        Tue, 25 Nov 2025 01:15:29 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040c70c5sm14596605e9.4.2025.11.25.01.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 01:15:28 -0800 (PST)
Message-ID: <5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
Date: Tue, 25 Nov 2025 11:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: Shin Son <shin.son@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Henrik Grimler <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
Content-Language: en-US
In-Reply-To: <20251113064022.2701578-3-shin.son@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Shin Son,

Just trivial notes on registers description for now.

On 11/13/25 8:40 AM, Shin Son wrote:
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/ 
> thermal/ samsung/exynos_tmu.c index 47a99b3c5395..8fa188928b79 
> 100644 --- a/ drivers/thermal/samsung/exynos_tmu.c +++ b/drivers/ 
> thermal/samsung/ exynos_tmu.c @@ -121,8 +121,51 @@
> 
> #define EXYNOS_NOISE_CANCEL_MODE		4
> 
> +/* ExynosAutov920 specific registers */ +#define 
> EXYNOSAUTOV920_SLOPE_COMP		25 +#define 
> EXYNOSAUTOV920_SLOPE_COMP_MASK		0xf

Register fields shall be named
SOC_REG_NAME_FIELD_NAME

If you include <linux/bits.h> you can substitute the above 2 definitions
with just one:
EXYNOSAUTOV920_TRIMINFO_SLOPE_COMP	GENMASK(28, 25)

and later on in the code, instead of doing the shift and the mask, you
can include <linux/bitfield.h> and do:

data->slope_comp = FIELD_GET(EXYNOSAUTOV920_TRIMINFO_SLOPE_COMP, val);

btw, above matches the GS101 definitions.

> +#define EXYNOSAUTOV920_CALIB_SEL_TEMP		30 +#define 
> EXYNOSAUTOV920_CALIB_SEL_TEMP_MASK	0x2 +

is this BIT(31)?
EXYNOSAUTOV920_TRIMINFO2_CALIB_SEL_TEMP		BIT(31)

GS101 differs, it has this field defined at:
GS101_TRIMINFO_CALIB_SEL_TEMP			BIT(0)
where TRIMINFO is at Base Address + 0x0, not at Base Address + 0x4 as in
your case.

> +#define EXYNOSAUTOV920_SENSOR0_TRIM_INFO	0x10

GS101 does not have any SENSOR0 in the reg name, so maybe rename it to:
#define EXYNOSAUTOV920_TRIMINFO0		0x10

> +#define EXYNOSAUTOV920_TRIM_MASK		0x1ff +#define 
> EXYNOSAUTOV920_TRIMINFO_25_SHIFT	0 +#define 
> EXYNOSAUTOV920_TRIMINFO_85_SHIFT	9

#define EXYNOSAUTOV920_TRIMINFO_85_P0		GENMASK(17, 9)
#define EXYNOSAUTOV920_TRIMINFO_25_P0		GENMASK(8, 0)

> + +#define EXYNOSAUTOV920_TMU_REG_TRIMINFO2	0x04

Is this a TRIMINFO_CONFIG2 register? I don't have such thing on GS101.

> + +#define EXYNOSAUTOV920_TMU_REG_THRESHOLD(p)	(((p)) * 0x50 + 
> 0x00d0)

#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6(p)	(((p)) * 0x50 + 0xd0)
and then:
#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6_RISE7 	GENMASK(24, 16)
#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6_RISE6 	GENMASK(8, 0)
you'll stop passing the shift and mask as function arguments :)


> +#define EXYNOSAUTOV920_TMU_REG_INTEN(p)		(((p)) * 0x50 + 0x00f0)

#define EXYNOSAUTOV920_INTEN(p)				(((p)) * 0x50 + 0xf0)

I see you use just BIT(7) from this register. Let's define it and stop passing
the bit offset as function argument:

#define EXYNOSAUTOV920_INTEN_RISE7			BIT(7)

> +#define EXYNOSAUTOV920_TMU_REG_INT_PEND(p)	(((p)) * 0x50 + 0x00f8)

#define EXYNOSAUTOV920_PEND(p)				(((p)) * 0x50 + 0xf8)

Are you using GENMASK(15, 0) for this register?

On GS101 GENMASK(15, 9) is reserved. Here's how the bits are defined for GS101:

#define EXYNOSAUTOV920_PEND_FALL(i)			BIT(16 + (i))
#define EXYNOSAUTOV920_PEND_RISE_MASK			GENMASK(23, 16)
#define EXYNOSAUTOV920_PEND_RISE(i)			BIT(i)
#define EXYNOSAUTOV920_PEND_RISE_MASK			GENMASK(8, 0)

Would you please verify and let me know if EXYNOSAUTOV920 differs or not?

> +#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0	0x084

no leading 0
#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0		0x84
then define the fields:
#define EXYNOSAUTOV920_CURRENT_TEMP_P1			GENMASK(24, 16)
#define EXYNOSAUTOV920_CURRENT_TEMP_P0			GENMASK(8, 0)


> +#define EXYNOSAUTOV920_TMU_REG_EMUL_CON		0x0b0

no TMU_REG in the name, no leading 0, define the fields as GENMASK
#define EXYNOSAUTOV920_EMUL_CON				0xb0
#define EXYNOSAUTOV920_EMUL_CON_EMUL_NEXT_TIME		GENMASK(31, 16)
#define EXYNOSAUTOV920_EMUL_CON_EMUL_NEXT_DATA		GENMASK(15, 7)
#define EXYNOSAUTOV920_EMUL_CON_EMUL_EN			BIT(0)


> +
> +#define EXYNOSAUTOV920_TMU_REG_CONTROL		0x50

no reg in the name, control0
#define EXYNOSAUTOV920_TMU_CONTROL0			0x50

define fields as GENMASK and BIT

> +#define EXYNOSAUTOV920_TMU_REG_CONTROL1		0x54

ditto

> +#define EXYNOSAUTOV920_TMU_REG_AVG_CONTROL	0x58

ditto

> +#define EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL	0x70

no TMU in the name, respect the registers name from the datasheet please.
define the full genmask
#define EXYNOSAUTOV920_SAMPLING_INTERVAL_MASK		GENMASK(31, 0)

> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0	0x74
> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1	0x78

no TMU_REG in the name, define fields> +
> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT		8
> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK		0x1f
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT	3
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT		16
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_MASK		1
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT		10

you won't need these if you define the register fields, isn't it?> +
> +#define EXYNOSAUTOV920_TMU_AVG_CON_UPDATE		0x0008011a

no leading zeros. You better construct the fields dynamically, by using bitfields,
no full register magic number, humans don't understand this.

> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE	0x030003c0
> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE	0x03c0004d

same for both

> +
>  #define MCELSIUS	1000
>  
> +#define EXYNOS_DEFAULT_SENSOR_COUNT			1
> +#define EXYNOS_MAX_SENSOR_COUNT	
would it make sense to have the tzd_array to fit just the sensor count that
we're using so that we don't waste memory? i.e. allocate tzd_array dynamically.

Looking at the exynosautov9 registers that you described and comparing them with
gs101 I see just 2 differences:
1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't
2/ EXYNOSAUTOV920_PEND register fields differ from GS101

Given the similarities, and considering the EXYNOS9_ registers rename from:
https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-youngmin.nam@samsung.com/
would it make sense to use the SoC-era name instead of specific SoC, i.e.
s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9 and gs101?

Cheers,
ta

