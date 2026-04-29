Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808EE3B8BD1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453656; cv=none; b=DdxqMrH9k6sxF28LE7d2i79mVZAMBh+Rr/fhnYs3LOTyWu0AJcnJpEWqvhTQ/z6nDtouUT03GW5uiW0dvVczJdnSVBYoleiwernKYHGmUSfkktXMkBwTu5/ZQhRuUrodWqcfbpOq+62y+CHrh9lEgXpA2KuTNdBOjQrEmTuA+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453656; c=relaxed/simple;
	bh=AwZuUXPk4/WpmF+r8jDpB7wrDuVU3zFwiYudmOuTakQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSBbup4XWb/2xd9NYVmNu5D2SaX6373qt0rLNXA0Vp0AwecTdGpC3VQVCKpB+MYmf5uNSGuaB30eIigsYoRv9vOcmeznk9KemFWKLiZTLpZ2DkF3orqwYshrQv9S4K85ftX0EhvA6zE0CKJ4ebRm/7HSRAxoGd7E7zsld8E+Mtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzlnfwAr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzlnfwAr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so149819745e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777453653; x=1778058453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Lj5tmUBXJFmzYH2N7Dd27gLNCll+S51FdGFIIdlW1Y=;
        b=WzlnfwAr4DJID5MtMtZ5nD/hIInr+BJPMOmbnxGKYJdc5oZo19tk5YD9fLAkzZx6XQ
         t3oQIb8ONLqCn/clp6+dSaUcXmlYA3KCj10APjyZq7ZodhQmXFSqwnaLOmUGNbyCleTm
         06KP2V5WK1ba+Rto9wLX78pIU7NRQJ04Q0CVYPJrBu62F7rfNGcphlKxmE4TuIEXtKCL
         cvgXoI3me+BsJRE8jRB9xrFiYKz/sWrAL/oJepsxfZK1x95WzrxSfx7SCcR3wacUGxKy
         CrMfpKo5lqE5pUI2WOG5Vws/QVrqM3u92g9nBypyXlW7YbdWoFLZ72kYqIFcDXyRtY+7
         r+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453653; x=1778058453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lj5tmUBXJFmzYH2N7Dd27gLNCll+S51FdGFIIdlW1Y=;
        b=oadn3W7CCop66GZnydkWyVV8q998P91s6+ear1k/u0hgzyftCL6WL3qsm8M5Kp6Cd0
         Mowok1Cpjld2qX4A8YCoE1vMKa61hETW5u7Qxbl2S0cn6ViEjJ/MdwGOSZYSSkdWsuB3
         gj0sSnV3Ox/kb3BO1Ki1ahAVdRKSbjScRvvkWs3AVuzlP0SkA6IzAzKkALxfXmqFdXEw
         n6ONcenTNTpw6F29/wHHkev3V9agaAY1OVb9jmrM1uyDoHcvw/+tHn87IxFz8MBleZ6e
         tGZxKaaOvzYrLmIievb/YVXXYYJG04e85X/Kp9UIEL/mP699FJRdO1h+YwtUU1UfIoOS
         CPfg==
X-Forwarded-Encrypted: i=1; AFNElJ/YMwSt6wLto46Rm2YotZRUPP/5AqWM/b2NuNqzQA7wfxzhHaqxXwg8aF9jOkId8Dni2VRfKfk/PkVxSdptOGZYvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0Y1DSHc+Q4AzDqXC1J4eZ5yzJF9NfI4i2nUFamuvDwu2tjYT
	UXEC5+ISILl4wMABhmxv2rX6hGOU+/zMRgeq/mqwDWMfkZ4zwufcqY+tOtOVAqRnQPE=
X-Gm-Gg: AeBDiesKxf4YfQbuIR7A/AIM1jk7d3fR4MUL0S9jQve6fifA8hYgYHOuBDi6lQKDHwG
	0AeMndjArE4Uo9ovJ38ZI+oUjGgfyvG4lXucuDL/8zReq/Hko2/FeOvfaGxaC1A1GZPokF2BCwQ
	dNdFaYUER/cf5m5RqmHKBw4cluaTA4uue9ficLKiqmkfTkOVJrqUuRxJNOTAy/2m/4P4d6U+x+R
	li3tp0KkbPNsnYftytPVPPAdIF84IST9UDj9dAIn4O9fKrWvkycP7Qq5h2E14OcdXodUfkNb0Gt
	a7lMd8qGYQV+08IxuDpPqvPr5gTWooRln8xEeQYRsbO8fLxgfua/xxVOeh/qRN5RAMAcbpogifH
	55xy/8QA/IaancBITR4DLih2Bt9eFYoAHFgCw9VV4bguYp5feTwx40bWQ7/RdY0sjKUX3gw3FOb
	1qNYcjQG7Bs8gayAhYacqMlpyWxijpPR18B2OXikMUU5k=
X-Received: by 2002:a05:600c:2e55:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a7b55131amr28563845e9.0.1777453652729;
        Wed, 29 Apr 2026 02:07:32 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c5d1a53sm40803645e9.14.2026.04.29.02.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:07:32 -0700 (PDT)
Message-ID: <6dcb5348-e973-494d-adf1-7fa2dc5655f2@linaro.org>
Date: Wed, 29 Apr 2026 12:07:28 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
 <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/28/26 11:26 PM, Alexey Klimov wrote:
> On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:
> 
> [...]
> 
>> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>>  		return -EINVAL;
>>>>  	}
>>>>  
>>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>>
>>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
>>> a shift.
>>>
>>> I would rename irq_doorbell_offset to intgr. It aligns with the register name
>>> from the datasheet. You won't need to prepend _offset to the name, we already
>>> see it's an offset when doing the writel().
>>
>> Sure. Thanks. Let's use FIELD_PREP.
> 
> +       /* Ring the doorbell */
> +       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +              exynos_mbox->regs + exynos_mbox->data->intgr);
> 
> FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to

Indeed, I forgot, sorry.

> add switch/case for different SoCs or I misunderstood something I don't see
> how this is gonna fly.

other option is to have a .ring_doorbell callback defined in the SoC data,
and then you can use FIELD_PREP. But it increases boilerplate code just to
ring a doorbell. I wouldn't go via switch/case. I think we'll have to live
with the mask and shift.

Cheers,
ta
