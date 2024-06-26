Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D879F0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406886; cv=none; b=O9QzCq63OSJk0JR+Th0yr5qDMcg40qjmCFZul6GufQP3hGT23p7QpPOVgUcepdVFNcZMPhbgRSXQhhiT71s9XBlQjW/3vU8IZBVqfOJFotWatIXIJIj7+dHbMEr/KneFN/SSy9ZWlBhCEy4ftk7nRYWLQ1YbewhWrGuwh7W0njM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406886; c=relaxed/simple;
	bh=I/uNc12OLLg3sMNR9wlPVb1BEcJvfnZ6/FvyL0WVpSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/NX/0nQIQYxhmhmTun84Ff+pNh0lrAjZWKo0MfjcZKXpyymuFjn6knheMF/w43ebfRNSh7X9VhPIBjDfDWxWid+wQ0DqWsrMkTyhaXNgeiKFQBZQ3G6npj/wLoF72PmfF/gyhk0QJBDLm5nmDDLMwPwVOH+SpeBnF5b/5T4Rwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmPy9O41; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmPy9O41"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a72517e6225so470018466b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719406882; x=1720011682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ryLKnkzMXQJySebb8qmcApYN70ZrgnJgQwTJDqpQHkY=;
        b=nmPy9O41KHBrH/RHRI+iG5k1JJoAsx5wyTfoat0SqqpbCJttgTyq/Rh9HzuU1Hd0GK
         whyyAV3h/G2o7zAvcvEuC0AtFOwtO0gZYNZD1KJt9C6tDWUsuXXooMRrDkPXwGyVzs1b
         vUw8qDEiQy9a/bYfwgMAaGY28/nokWbTjXgrk24jlh0DSnkM0px6GkHxlxiQcdP3giKM
         aK1yJE2+vlx775f2H+CTT0H2iVq/+pMlz+0hssBf2//tsoemcGMiQ34pFkFSjURJ7rw2
         J8ePGPIRwTONzAkeLVw89oerVzngW/Zigb14gior5ou8Te0FnQkyeLOIKe6d5xmx9MVw
         47OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719406882; x=1720011682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryLKnkzMXQJySebb8qmcApYN70ZrgnJgQwTJDqpQHkY=;
        b=wCggF79NCL7ih1L2+kunk6Ubvz/mU+D8EVJGkCW0fJKGvQcb2Pg5CZmVaq/0V5mEc4
         aAyq1DGT6uq7LJxnkhAmuRUITBWoY3IjK48SuxbzY7Mjcr8QwvUJ/XQA3OsYKbYHrSaM
         MyF7G7HpNWQBc3wdYxqqrr5vl3IiUx0cg5ppDs57zv1RADCojWLpyPxhQm9nA8gPLw57
         xdWbiXoVvEl2az5v6JTfC3EGfHEYnRfKjbdlkJgExFReDmHMHJEtX32ZNYjJT8A9SZxY
         7lRnS3ahkgwMPCPGYEi/8S73lLriUiYCY0EV73NrIMaHQSDQwEZsc0VHMEpbj44YbFOb
         iEcg==
X-Forwarded-Encrypted: i=1; AJvYcCUPL52FTJN6ADTNJmXhYKAOWNDOoxFgu5yEDpXANd2KbNmzn9IdywZsXoQb9MbIOI1O8NYVoKa1dNkQbDDPjpr9z95i/1u3cl6OmWPoUWAJOyk=
X-Gm-Message-State: AOJu0YythpHktXRtWMATzrPNIarojKi2XUEvRbdnaWYQihC6MNyly+OZ
	uL7tg12E5pqbeuNDWlGFYZDCdQLoOE64JwGByldEhAaUfvBvqe79lHXKfKsYAEo=
X-Google-Smtp-Source: AGHT+IFlLo0JH1gGo+HH1mWhsMDl0o3hYjx83DFQ+FDkMSeL7kdoVNdHaP78qL1EHT4N4rVF0SHhGA==
X-Received: by 2002:a17:907:c249:b0:a72:6b08:ab27 with SMTP id a640c23a62f3a-a726b08acdamr348934666b.36.1719406881782;
        Wed, 26 Jun 2024 06:01:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7250712ca5sm344543266b.100.2024.06.26.06.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:01:21 -0700 (PDT)
Message-ID: <4efb51f3-4600-4d88-a5df-e7be43294d53@linaro.org>
Date: Wed, 26 Jun 2024 15:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
To: Vishnu Reddy <vishnu.reddy@samsung.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>, s.nawrocki@samsung.com,
 alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7@epcas5p1.samsung.com>
 <20240620103410.35786-1-vishnu.reddy@samsung.com>
 <38fae674-f672-46e0-a44e-1278deaaf36a@kernel.org>
 <07f201dac7be$e81317d0$b8394770$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <07f201dac7be$e81317d0$b8394770$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 13:49, Vishnu Reddy wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
>> Sent: 24 June 2024 19:27
>> To: Vishnu Reddy <vishnu.reddy@samsung.com>;
>> krzysztof.kozlowski@linaro.org; s.nawrocki@samsung.com;
>> alim.akhtar@samsung.com; linus.walleij@linaro.org
>> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
>> kernel@vger.kernel.org; pankaj.dubey@samsung.com;
>> ravi.patel@samsung.com; gost.dev@samsung.com
>> Subject: Re: [PATCH v2] pinctrl: samsung: Add support for pull-up and pull-
>> down
>>
>> On 20/06/2024 12:34, Vishnu Reddy wrote:
>>> gpiolib framework has the implementation of setting up the
>>> PUD configuration for GPIO pins but there is no driver support.
>>>
>>> Add support to handle the PUD configuration request from the
>>> userspace in samsung pinctrl driver.
>>>
>>> Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
>>> ---
>>> Verified the offset from the user manual of following Exynos SoC series
>>> and found the current code is taking care of correct offset for pull-up
>>> and pull-down
>>>
>>> Exynos-3250
>>> Exynos-3470
>>> Exynos-4412
>>> Exynos-4415
>>> Exynos-5250
>>> Exynos-5260
>>> Exynos-5410
>>> Exynos-5420
>>> Exynos-5422
>>> Exynos-7420
>>> Exynos-7580
>>> Exynos-7880
>>> Exynos-9820
>>> Exynos-9830
>>> Exynos-4210
>>> Exynos-S5PC210
>>> Exynos-S5PV310
>>>
>>> This patch is tested on FSD platform
>>
>> You verified but...
>>
>>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
>> b/drivers/pinctrl/samsung/pinctrl-samsung.h
>>> index d50ba6f07d5d..758b623a4bea 100644
>>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
>>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
>>> @@ -61,6 +61,13 @@ enum pincfg_type {
>>>  #define PIN_CON_FUNC_INPUT		0x0
>>>  #define PIN_CON_FUNC_OUTPUT		0x1
>>>
>>> +/*
>>> + * Values for the pin PUD register.
>>> + */
>>> +#define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
>>> +#define PIN_PUD_PULL_DOWN_ENABLE	0x1
>>> +#define PIN_PUD_PULL_UP_ENABLE		0x3
>>
>> ... I said it is not correct, so you send the same? If you think I was
>> wrong, then please respond and keep discussion going. Sending the same
>> suggests you just ignored my comment.
>>
>> Look at two headers s5pv210-pinctrl.h and s3c64xx-pinctrl.h. How did you
>> resolve these?
> Thank you for sharing the s5pv210-pinctrl.h and s3c64xx-pinctrl.h  file names for the pin value information.
> I have not ignored your comment. Unfortunately, I don't have the user manuals for the s3c64xx and s5pv210 series.
> I have an idea to handle the PIN_PULL_UP value of the s3c64xx and s5pv210 series by checking the compatibility with the of_device_is_compatible API.
> Will it be okay or do you have any other suggestions?

I don't remember the code used here, but usually such choices are
determined by driver match data (and flags or value customized per variant).

Best regards,
Krzysztof

