Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62563254B0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443000; cv=none; b=uGQu9epcbrjYPD18zD/I/44mOaiGQJethBYRh2owoZEz/UhBOFH8t/dEnTTAn+xhiXeqIpve9s2bXVX3x8yjqcoY8jJEJiCfuqySUoyjpWw8CDlm4j1wJS2aNfegOVe4NFQ0A7baz+EMW3WfxEHY1M2+H6cW4nNJuyH0NrrgsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443000; c=relaxed/simple;
	bh=nIBLLWlywvbDHJl1jfJUWtsRmZwWr5mgqYdTBQwVYCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgUiUJCAmzcOKQAAp+lw2sxi7RFcAj2HX+udlAnv2ZnXdiTrqgvqfVkrLzI5t7nDh5TNOztWD36j61jPiAfYVjsgCOs/jY8hqqotNjE8aMU8JdbAL6cnciJIMI+O5bChIj9AgWONkCeFFYU0cKTkv/EiXwXQodlDqZ0EEKo09Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eA3tzMte; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eA3tzMte"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso35128865e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 01:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442997; x=1773047797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ktr/JNOB3fV/EZRd7szBfJ+V3eeHkmzO1vLTnQ/4sY=;
        b=eA3tzMteMsy6Qn5yTXt1XNfp/jsXQuQqtqn8ZHsbkm9xoROdFgvh/uUxZjk7lWWNoF
         6YonUW19js4ImCBLcllImRvplTXbHYw6siG+C7mc8UMU7TeG1Q7prmseBXN7Hb0xlI+p
         xvUcIkJzN7naTb3ooxwsOe0W24aIQuqtOQU8OfIfHNauPzZMxAHvrtZSLabQcy5r+0zN
         1tCvM6QDSN8eGHHIZxL1qOjxUNohORBCh4b7SxGHE4INptectyS4hFALbil9Q3yeAUBq
         geZzV19VyWPjvpVHHn3No2KDd2nsMfBuxOB9PIMUjBRaXceh4KcIY1KOgPjumQJbI/Dl
         Qcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442997; x=1773047797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ktr/JNOB3fV/EZRd7szBfJ+V3eeHkmzO1vLTnQ/4sY=;
        b=IE46O+hfI9sRx/GXyC07qDEjUZT+2qG97RpJ2VmTXh0DIxbABqiyUj/62LkMPsYsOO
         xlqtsItoXknrbKlkCUiYoLYTudvTUf0VmTr6lRx11X57wA5cYqGpCLDLPs6MdVCrWDJs
         v3jNUhBUaVVUBgQYRks6b+zvrbnbBnwnrS5LL9htmfbAX3n9M+tj/YAyKeya6cF9zFAl
         61KXkw7B3mZzNRfStytC7ZpHBHV64ixMWDDFBvl6xG1nfoQF59y9WBDBT+wh6Zu4ghku
         n+OHuk91GohNJ40637Vnm4Wjf9yF4C50sJTgttdHoQFTjpTcDAtfIEyXSiR9TrJHaxJP
         Wgvw==
X-Forwarded-Encrypted: i=1; AJvYcCUSC3YvX3U99K/h2mTF3fpR9IhihzG0gu4MIU+YANWNf85JB/+L/NISsmH8iA4/us0o1YXjo3v+w7dKobSiQAJ94w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5pgGGiSIEsKSeXJplPfeKj6pxvSG0oJ+LoFId71T1clJ8QI2
	WnIqMKRuTYUPAMC1+nAOZgxZg3y3wALksXGF6BoRzHZxIIDC4OVQXVm6Cn/kZITry+E=
X-Gm-Gg: ATEYQzwQ1ITHKrQdDPo3KvKEnmSusUM8BXxRZ0i/4fnqwT2Wy+49FO6+8J7GSvQiddO
	ml/rJvuuY+Mm6qkAfdNeRDduoJukyhp6Ag6Mw5z/NJzyUhAdXhuH42oTTGaW63LU+nl/aDSLVUF
	E+MhxWNArAY0R5OjhAi1ytCcL8/PFq7ZItSqMfj4DG0XAc0CyLGgieMTl1kTMoBeHAtW6UUYvXQ
	mTQan06HX26XLHdy3kfSoZQMGpeTolxQLtezf9j5mCgUx6bpNqOC/qA0P3jdkPawOHbK9fFEz/1
	wo1watQ0jAA9HkZfaZwVMAgpnHbnXCp19jD2tckUBhY3Y1KUiRTpACiZ7yOC3KfsKTlaQ4t7I8c
	BCzctvu0s1g71I0YTRIjDwpwhkeWDec+DTuNYCbqVw9hlfS9oezfgxraaUGFcBL/gP+T6vnhHRt
	b0zStSGAgwUEygYyHYxTpHAoQXpYeb12U=
X-Received: by 2002:a05:600c:4eca:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483c9beac6cmr219764705e9.16.1772442997213;
        Mon, 02 Mar 2026 01:16:37 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfabb84esm389964955e9.0.2026.03.02.01.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:16:35 -0800 (PST)
Message-ID: <488f9257-94fd-4c5f-ba41-c9216bf0f7e5@linaro.org>
Date: Mon, 2 Mar 2026 11:16:32 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] thermal: samsung: Add support for GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-4-e02a834f04c6@linaro.org>
 <DGR4OFNJXOI2.3QACIHMM1V429@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DGR4OFNJXOI2.3QACIHMM1V429@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/1/26 5:33 AM, Alexey Klimov wrote:
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Add the thermal driver for the Google GS101 SoC.
> 
> Is this driver for GS101 platforms only or for all Exynos-based
> platforms where we have deal with thermal unit via ACPM?

The driver can be extended for other Samsung Exynos SoCs.

> 
>> The GS101 TMU utilizes a hybrid management model shared between the
>> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
>> firmware. The driver maintains direct memory-mapped access to the TMU
>> interrupt pending registers to identify thermal events, while delegating
>> functional tasks - such as sensor initialization, threshold configuration,
>> and temperature acquisition - to the ACPM firmware via the ACPM IPC
>> protocol.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/thermal/samsung/Kconfig    |  16 +
>>  drivers/thermal/samsung/Makefile   |   2 +
>>  drivers/thermal/samsung/acpm-tmu.c | 643 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 661 insertions(+)
>>
>> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
>> index f4eff5a41a84ce02b12abb85d6a0f8818031d0dc..5679dfa85f4079c7d40317ac231bd6a1af93c7e7 100644
>> --- a/drivers/thermal/samsung/Kconfig
>> +++ b/drivers/thermal/samsung/Kconfig
>> @@ -9,3 +9,19 @@ config EXYNOS_THERMAL
>>  	  the TMU, reports temperature and handles cooling action if defined.
>>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>>  	  data from the supported SoCs.
>> +
>> +config EXYNOS_ACPM_THERMAL
>> +	tristate "Exynos ACPM thermal management unit driver"
>> +	depends on THERMAL_OF
>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>> +	help
>> +	  Support for the Thermal Management Unit (TMU) on Google GS101 SoC.
>> +
>> +	  The TMU on GS101 is managed through a hybrid architecture. This driver
>> +	  handles direct register access for thermal interrupt status monitoring
>> +	  and communicates with the Alive Clock and Power Manager (ACPM)
>> +	  firmware via the ACPM IPC protocol for functional sensor control and
>> +	  configuration.
>> +
>> +	  Select this if you want to monitor device temperature and enable
>> +	  thermal mitigation on GS101 based devices.
> 
> I don't understand this. What this driver actually supports/implements?
> Dealing with TMU over ACPM firmware is not exclusive to Google GS101 SoC,

right

> some other Exynos-based systems has this as well. However, it names
> the config option EXYNOS_ACPM_THERMAL but a lot of other things say that
> it is only for GS101, isn't it?

right, because I'm currently adding support just for GS101. I wanted to be
accurate and thought that when/if other SoCs will be supported by this
driver, we can generalize the description.

> Does it implement the generic layer dealing with TMU via ACPM (hence the name)
> and adds specific things to support gs101?

Right. I expect the sensor mask may differ from other Samsung Exynos SoCs.
I remembered I compared the register set with e850, minor differences there.

> 
> Should it be something like this (feel free to correct):
> Support for the Thermal Management Unit (TMU) exported via ACPM.
> 
> This driver handles direct register access for thermal interrupt
> status monitoring and communicates with the Alive Clock and Power
> Manager (ACPM) firmware via the ACPM IPC protocol for functional
> sensor control and configuration.
> 
> Select this if you want to monitor device temperature and enable
> thermal mitigation on Exynos-based devices that implement dealing
> with TMU via ACPM, for instance, GS101-based devices.
> 

I can generalize the description in v2.

Thanks,
ta

