Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F73EFD27
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831788; cv=none; b=bi4ceHCLFydjAvmszClrBqzVz9bD+CreBdy6PyilHzXNo16WQCVLRUuUs8tn8tYzZQLrDzFkBveyqZ4ErfxfIpfPa8HZgmnvYC5y54KLjV4iJ3KKyiUshCXx6U6fk3ofHLh+P/RSYqCyonV3Bva5BFAgsiX6NLma5hJpUghQ9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831788; c=relaxed/simple;
	bh=Jqx/gqWShhJ+18Tlq/ec/Xd+/qJ5jHenCuDTIMvA44s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGzZk7DB0XN3XB9XH+43zeL3qe2CulImaFgOsspP2bsYlqR4PhB/1OSG7us70dlLqNknk0IqG14zR5r5gOqJszABnl/9Yym12HMyAYyyssqOLh/Dp6S3AlwgQNUbJmI+vUq1Gf9gRvd90q+jcwElv7LOTlAw/beg9VLgHLGWNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UdM2fl5t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdM2fl5t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so146149435e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778831785; x=1779436585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nE9mrH0UhzecibkTC58SxCDMEGe2+PqMAu5GxokQyLA=;
        b=UdM2fl5tMOQO5s8H+YEBNJ6CaY15odFcoiWqlbbE1QJI3gIfRVt9NZ9T7H2YCuiuNE
         bWFV9tC8lGTNhw2N4LZ41GY4dvvy8K0+KDq/wQVb6yWdvLpvjPvx4AenUwRxRKXnLanQ
         kYi+jiV9g2R+LxXZWv77QLeNc9tze8esjwdbMwvz8SrvgN89X8jxZX4TzFzviSPLOror
         Pr6LFfSWUeagmN67NbwTnNpbi2GPORZh7W2rb2nhgwBAtW8ppDOHlJ7Cvd5ZLWDAERI8
         sFbg2nkEb1eR8PuKd27RYjMf7pbhVcguMYPQKSo0bCzR+rdRqW7gDIUYfMe9I4qzXemz
         LBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831785; x=1779436585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE9mrH0UhzecibkTC58SxCDMEGe2+PqMAu5GxokQyLA=;
        b=VG6JM1L2lwttttUlTQFLKHoxUevm2TfMNsZJrg77RRPxD+ED2jEZ470m6NtkK6DtTT
         C8XcyyAbmWCQ43cMJM/Y50iI+luZVf5KLrzH/F04wG6H67LYvCnBUSWRDZXAKJac7GgH
         9ZclKjwL7Ja8Nvz5F5M058yeQlqila8WjbDVmzJ/sNhbjtYCBKb9kyUJN6QUGFu+FXR1
         SCHhLN6Px/UUsiiVOeEI7a6MJ+edKanVszcqhmqLzFAtzVvxZyRL0smztXGQKjBtw93p
         5cns7oQ3Unlcow2l0zecdwM9amLDw7U+P/DZfZEezRPdtAxpj98ZrziL39X5zrMKOSPn
         Ohbg==
X-Forwarded-Encrypted: i=1; AFNElJ8p8TPNlWEkzYFK26e/ljoHrky5I9UgdXdvZzHlpog5OD+9hNXrdoNhZz1REssPo28GX/5Uw4pLg9+ab3UV4T9t3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxalU4EasP7UjQLYSbyDHhFiDAzs0Jlc7wcICeiM6mcHm+HPJLq
	snwoPsoT6CaBapDyguNnG3Qdi/MAr3PJwydMCKngdhVETFNpBsub4E5GEpiMlZv5TyA=
X-Gm-Gg: Acq92OF1UwYs0D7zZsja8b6gnkFHLbyUBNOVbzexboSjx0ZOgo6xeyt3N3vFZ3xxPI+
	dfbpSduE0VWNre2ItKN3YO0V3hkYYotlmxfO3+z4vB9HUdC0GMLp+9SyKtVqw3l9okE/2C+LIog
	onMbYUmIbFwTDpmdweLP4HMyYbeDC1qP1hVQUIzTtrSBtN3ARq2GApanmD+TMzIE7pA79I9zony
	DXhQzkNikvJo1G/tzTB1qb6E/WazXNg9/w03f9DthVK51HLL9LbwImRB4WxOzXYQbXEOLD1Mwhn
	Yg+0IjEukzbTYaXZ5y8JmUHApUvbkvYpSgiAGPDbaM+a4LlUGUcFnb0YYcM5sgRroyMqzKHJj0S
	SYaVH/533B4NUTXZ5KU+XZohsGsO1DTgMNkxkRAISKYeiBaVLLsVUy0a7NYduR4VuqKni8EjKnz
	BqLN3K4wNdDhC1blKQbU0gFqsPJDIn61Bs
X-Received: by 2002:a05:600c:6992:b0:48f:e230:2a20 with SMTP id 5b1f17b1804b1-48fe662a1b2mr36300395e9.31.1778831785070;
        Fri, 15 May 2026 00:56:25 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm43645835e9.6.2026.05.15.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:56:24 -0700 (PDT)
Message-ID: <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
Date: Fri, 15 May 2026 10:56:20 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/11/26 4:17 PM, Alexey Klimov wrote:
> On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
>> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
> 
> [..]
> 
>>>> new file mode 100644
>>>> index 000000000000..c68d60b4c0b3
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>>
>>> [..]
>>>
>>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>>> +{
>>>> +	/*
>>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>>> +	 * capabilities. Treat zero and all positive values as success.
>>>
>>> ACPM_TMU_INIT returns capabilities inside designated error field?
>>
>> yes
> 
> Heh. Okay.
> 
>>> What about other messages/commands? They just return error code there?
>>
>> all the other commands either return -1 for errors, regardless of the error
>> type, or 0 for success.
>>>
>>>> +	 */
>>>> +	if (fw_err >= 0)
>>>> +		return 0;
>>>> +
>>>> +	if (fw_err == -1)
>>>> +		return -EACCES;
>>>> +
>>>> +	return -EIO;
>>>> +}
>>>
>>> Could we map these return values with better granularity instead of
>>> returning -EIO for everything else that is not minus one?
>>
>> I think we're good as we are now. The firmware returns either -1 for errors,
>> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabilities.
>> I can't tell if there are other commands that return capabilities as well,
>> or if there are other capabilities for TMU_INIT, I don't have access to the
>> firmware code.
> 
> On Exynos850 I see more than just one returned error codes. I definitely
> see 0xfe and 0xfd at least. I don't have any data to confirm that ff
> maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my

for these error codes we will return -EIO which is alright. We can have
a more granular approach depending on the SoC if you want.

For GS101 above is alright, it matches the info I got from the firmware guys.

> experiments I suspect that 0xfe means that call/msg type is not
> implemented or not accessible and 0xfd means that passed parameter is
> wrong or incorrect or not found.
> 
> I am also not sure that I saw 0xff-s but, well, maybe that needs more
> experimenting.
> 

fe and ff will be covered as well by -EIO.

Let's keep this as it is for now, and if you need a more granular approach
we can differentiate that for e850.

Thanks,
ta
