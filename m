Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47AD548EE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402633; cv=none; b=VmiuQ0j+OobFzk8xJ2UrnWguocQW82mAZkl5t8piRyxRYaqrrMZ6VAQ08UtkVpB4qXZHQOJjs8+oR5NBYeRpvhVaUar15l64+0EX16yJf4xGZ5LoMcRUJ8FLkvCY4o4O9rmZWJuuykSGXmfCefMT++F3xY8HubIdzqY5m+6tgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402633; c=relaxed/simple;
	bh=9moeBSWAnG3dtSIbdW4ZnD0x20PyiAy3DOWv8ETJgx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDIM31MPFEcImUtc70aj5aZLhrucr+k+GWVPNBe/dM3tcKGEBTRHeXP2IBcXN84cpT6eO24a4kCA8EsjRDDfAKXamfyV/nqaPvqz2DnOtaEwgp4buThgagsZQRKostdNXBlf3ZYoKz7msFnr2vl4rKhwyQcnFm4BWc2bHANpZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTx7qOme; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTx7qOme"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso6269353e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402629; x=1772007429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=nTx7qOmeum236BXFrq/lI95npYcbZdRkmrsYpw6z44rQeeD2T//+MtGlF4miv5w2A3
         973XqBQSOtxZaws0YxAmu+XEEJNfeGXkBlZFU5Z+lKYprZhMNfCc/i0gIofqZCTjnUn/
         vVKH4KurYSpHbro3gpWg8JEiIu6tPOrKkEyhgu0fVuyXnNMQTtY8kYWz6F7X002VpCx0
         VI0Gq1zYb0an31wBKti3j8ihdTIBaDKT6QjtbmQjIBr8z4GPRYyxbPS6qdw/kdbxdOWb
         Xmwf48ZWRjNGLbJS23hhX4iX20jPRH8xdAg3+1VlzLeqSvVxnb/78oDeP5vADrvsirma
         BKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402629; x=1772007429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r0xdr1WGpCeGTUqLANRfTri1dCqx5zok5lpbzySRko=;
        b=Xcc6gbFGVWhomBMbyy8zBidM7MFN25H0LIIKMy+hK8yPH5NPA+Rr+1bMV4x1yWxkuC
         R8XumHQ2vbUdzigDDJZYQ7knv7S8QdZFkPRelCAuCgeZjbMSQm2Mtzjeh9wUAgMhSapN
         5EjphhpghJ0LIHHnOvc1PhN6mqyGoswJ+0NfyuisYZ1TROlPx5GH0jGRbC8rQ/rX6ufu
         99ovr6IrvXt6ugDiBI0JOtWsxIdlW32otmUL4y69daL+xa+vtJwtLeN9e4Fvpdq2DJP1
         tm+7GJkeGalB2WPcvmlaTJ1uaBSkIgnyD8KusRQgOiI889YL9zK+0tRMfiV2Hc/ZUw8K
         RlpA==
X-Forwarded-Encrypted: i=1; AJvYcCV63DDP+neYHrRe7U6SWfe0iWZXVfq/3I1ddCxT9VPzsgSgMFyMIak/MTFsBWCN2KYbXeb4mIc3yVesVApe+JPKLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OAwVNYUIzX8hjeAvXLeMMppr9gl28A+30V0bcUuOHuzvzP6/
	VWN/FIifjIxZgQh443M8LJzbOk0KcMFXBe4x+eunCVHAzE1wr2a/I1UZ
X-Gm-Gg: AZuq6aJzkPU8tr07lAGkPTYpcp+4akEuBU7o2h5e73TIdGk6b+2Kx1DvRkIgJswIelh
	LtFWwwCOJNFRbHQ3/Y00t6BSb42ZS/qKflohfRtD8e7OO7H+qABqvqBynxhJcwARjwcWdSCiD1A
	ctV57Ze/mw2FpVoHC27nOLgtNXsR8aeL3Xfcl6F/SSuCxujZvjRyDWwGdh9OKi+q6b9wlAYUuqU
	S/SXOpHET4VrJkcyeovKqA7+sV5g9yBRJ3194eGgoHnLTc/iil3Y7EdxcOaJWln3QRPf4cHd4RN
	M2+DVLXIt2LpzHTYw34UvAjvDkU4tPm5lcBTmxSRbzSzOIsSw9EyRplQi1Jnusktx7LwDQQ7rpf
	qIuFmAx5lwyEZ4wQmJSG9hMZww+0Yyc78SaHrInjefqmTvIQAHW24voKfW/PHbWYGiNMpaLnB/S
	i9SHpFs/ogJTp7bDJVXpF4r0BrAKILI+jFK5RvNDbjuIveLY3r6u5idb5WNs0dxOeXPPD72a9Mu
	2743a94m8OUhX0swgw=
X-Received: by 2002:a05:6512:1150:b0:59e:6c24:3f91 with SMTP id 2adb3069b0e04-59f83bbcd19mr369556e87.34.1771402628519;
        Wed, 18 Feb 2026 00:17:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56867fsm4391846e87.24.2026.02.18.00.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:17:07 -0800 (PST)
Message-ID: <66dab64b-ca3e-4ae0-81d6-0500899757e5@gmail.com>
Date: Wed, 18 Feb 2026 10:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
 <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
 <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/02/2026 03:45, Amit Sunil Dhamne wrote:
> 
> On 2/16/26 5:58 AM, Matti Vaittinen wrote:
>> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>

// snip

>>> --- a/lib/linear_ranges.c
>>> +++ b/lib/linear_ranges.c
>>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct 
>>> linear_range *r,
>>>   }
>>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>>   +/**
>>> + * linear_range_get_selector_high_array - return linear range 
>>> selector for value
>>> + * @r:        pointer to array of linear ranges where selector is 
>>> looked from
>>> + * @ranges:    amount of ranges to scan from array
>>> + * @val:    value for which the selector is searched
>>> + * @selector:    address where found selector value is updated
>>> + * @found:    flag to indicate that given value was in the range
>>> + *
>>> + * Scan array of ranges for selector for which range value matches 
>>> given
>>> + * input value. Value is matching if it is equal or higher than 
>>> given value
>>> + * If given value is found to be in a range scanning is stopped and 
>>> @found is
>>> + * set true. If a range with values greater than given value is found
>>> + * but the range min is being greater than given value, then the 
>>> range's
>>> + * lowest selector is updated to @selector and scanning is stopped.
>>
>> Is there a reason why the scanning is stopped here? What ensures that 
>> the rest of the ranges wouldn't contain a better match?
>>
>> The logic is now different from the 
>> linear_range_get_selector_low_array(), and I would like to understand 
>> why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
>> Hence, I would like to know rationale behind making them different.
> 
> 
> The rationale for this being asymmetric is to find the tightest upper 
> bound for `value` < minimum value across the linear range array.
> 
> To better illustrate this with an example. I have 2 entries in the 
> linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value of 
> "2".
> 
> Based on my current approach, the call to get_selector_high() would 
> successfully return with `found`=false and a selector value 
> corresponding to "4".
> 
> However, if I continued to search, I would end up the selector 
> corresponding to "11". A selector corresponding to "4" is much closer/ 
> tighter than "2".
> 
> For values higher than the highest value in any range, this would keep 
> iterating and end up returning an -EINVAL.
> 
> For in range values this would work as expected.
> 
> This implementation assumes that the linear ranges are provided in 
> sorted order, an assumption that I believe already underlies the 
> existing *_low_array() logic.

Ah. I think ... I didn't think. :)

It definitely makes sense to stop scanning if the range_min already was 
greater than the given target value. Thanks for the patience and for 
adding this missing piece :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
