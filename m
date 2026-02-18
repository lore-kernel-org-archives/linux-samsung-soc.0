Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD127A461
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 01:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771379146; cv=none; b=fR8hP6pQ6CQ1XSxrJNvYPnaq/hVULp2Qy7lirvJRbsbaokYNOcik/gvbTX4oVRI4o2LvKwvBy+C7Sq4ZpDoZMBWBM1zACLdI/3XTybkA0gTMl3Q7mFrvkzjgfPjCaZfUGIPr823uhyGpC6J6vxsrYFFS8nLDwI03MjZm2qI0BME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771379146; c=relaxed/simple;
	bh=yQeoW4MqfwzTgrBMlSHdUdLyFckPUP27F2W5vrcbNCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1PrNHMHsJ54YmGXr+AM1/uVSDZ5P4erQgj4fh6x3wpd5Iog1BUu2yd3YA8ymhnmRgHs+rYdEqu2YGFWesCDsSOJNgd3JxbyfZZk8TMPtYeBJR/QlMXoEG9kZx++qZrxy9yjWG2ATmhMnZvtL56y9MQZ9LIXIC7hleL2Ew9vxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=deKmsegR; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="deKmsegR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4831601eec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Feb 2026 17:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771379144; x=1771983944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzRez6id0tGCW3l1fRGMuvRJWCHYhvgSDSCiIHHHPic=;
        b=deKmsegRLQHlKTeYYjEyqOZDbPT9lm7vvpbOJK0dKQ3JSLSddLlEw9hR7WNK3PnB+S
         nPQZeipF+m1Tozp8onOYCJC6VqhdPdeNMmwiLNkzK8LiU2sI3D8ZlNySIsJ1Qs3TtxEq
         PTKwqw/RLTdnZHjvUXUJ4YRmH2yyo6gsVnvsniD5M0BFBb4M9KGx6CfSyCIC8Gr6o4Az
         NHipjdp+8+odThpoYB/EEyucN+Pj3E/Tfg/cipnbQoavXiD+0EIgDooLWweQNFImS6R1
         VrhIxRWUtVWGAOYjXala7kefYl82R9MHK2ArB/PowIPHcSI/RubWYLiYj6vj0P8FPrml
         m7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771379144; x=1771983944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzRez6id0tGCW3l1fRGMuvRJWCHYhvgSDSCiIHHHPic=;
        b=FzOh0STY12VOfnqY4RNuC8Pf+IX2XYXbsevjW6iI0IOOxCgO2gddj11g9nO6o5GEHt
         isk7kFb9Ttj6P+V2SZYxgprpAJ9sswADHxwQRk+vT82Q61rWFxGC5Aa+1LLTTg1Ir3Hk
         CVtSv+y6zKDP/woOCrskfXtB9kc3AgCQb+2tjn6wwHWBA7pjY+Vbn0Inp5uYUr7ANPw4
         DNwtEcNzVyYUA8z/HMfbrht3lPKeVEPmUT0bWfBmLHwwmUD1bU1MFU7ontSAN1pI4voE
         jH7Vv1aXDTxhBcKPSO4oMoeWHS1CJut92qfqCUyWeuHJczfULGAMg9gKnspj0I04f9Fz
         AM9w==
X-Forwarded-Encrypted: i=1; AJvYcCWB1xVzrsptoQb487owHbFP46nSuTB67mbUlGblXa87w7nX1SMNH0ukWCAhzIcsvCuUM2sTBCe9RVJySYPs9m2PTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznDs9lH0EjwYA2gCJC3sG8UzfArDkCnxsOf23O0nXCWIr4BRpl
	Jo2OJP/yop3Q8CY8S4IZ2FP9ArR1ACKGd94tONvcFE0ZIR/IQ8ihgNpFO49DtL1+Ug==
X-Gm-Gg: AZuq6aI7Ln9X1+yTeS3+Wr/gQvlChpDhwbnNKReeWGCMf264jXX9TpbPRfDGLVi+5R8
	2D6fLCATkuENomwtptr1gv/gorryopwCNx7n28yGn1IDq45CsaFd6z6S3rW+sVl5N+jgLzUuX1+
	Z2FezZl90KdNRlRaa+Xgg5LIvNqOTQVwsXSqlyaG6umYXTkfzihi25ml/RnODczakbIhvTelHhS
	iix7+9jRGOZlJJek8Rp/Vqj1P7bsfQdXhjbmYTRKihU91cIJpjO5Ekk4mLChJaI0SEQ/PTmsDSw
	8ytGrvcgx/SM+NINm5bt95h8bSsQBD6JoCZrckT4Y8WT/G7eFTyj7w7agGXIu63yLlpMqM1rNZS
	13G3MpBDMNSIjvcIVon2mjiF/yl045IYg9QJSu78k1BVAB6Ml8GdVtqIq6Sli8NsUtQWDm6rpUC
	dRr8U62WSQ2vFCuvrcNkO1MLB9TV+Z3rh8rBv037VQVayXYC8dQqc+J7GJOvElV1zTYLUhzR1+6
	kUQuqhlrzspfCv0rUcIvjQriA==
X-Received: by 2002:a05:7301:2b06:b0:2ba:964f:fa67 with SMTP id 5a478bee46e88-2bac97ad329mr5688952eec.24.1771379143326;
        Tue, 17 Feb 2026 17:45:43 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c8f1:53bf:725c:563b? ([2a00:79e0:2e7c:8:c8f1:53bf:725c:563b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba192sm15951817c88.13.2026.02.17.17.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 17:45:42 -0800 (PST)
Message-ID: <b1df24fd-bbb6-4991-be52-dc1ef694db25@google.com>
Date: Tue, 17 Feb 2026 17:45:40 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/16/26 5:58 AM, Matti Vaittinen wrote:
> On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a helper function to find the selector for a given value in a linear
>> range array. The selector should be such that the value it represents
>> should be higher or equal to the given value.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   include/linux/linear_range.h |  3 +++
>>   lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
>> index 2e4f4c3539c0..0f3037f1a94f 100644
>> --- a/include/linux/linear_range.h
>> +++ b/include/linux/linear_range.h
>> @@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct 
>> linear_range *r,
>>   int linear_range_get_selector_low_array(const struct linear_range *r,
>>                       int ranges, unsigned int val,
>>                       unsigned int *selector, bool *found);
>> +int linear_range_get_selector_high_array(const struct linear_range *r,
>> +                     int ranges, unsigned int val,
>> +                     unsigned int *selector, bool *found);
>>     #endif
>> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
>> index a1a7dfa881de..c85583678f6b 100644
>> --- a/lib/linear_ranges.c
>> +++ b/lib/linear_ranges.c
>> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct 
>> linear_range *r,
>>   }
>>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>>   +/**
>> + * linear_range_get_selector_high_array - return linear range 
>> selector for value
>> + * @r:        pointer to array of linear ranges where selector is 
>> looked from
>> + * @ranges:    amount of ranges to scan from array
>> + * @val:    value for which the selector is searched
>> + * @selector:    address where found selector value is updated
>> + * @found:    flag to indicate that given value was in the range
>> + *
>> + * Scan array of ranges for selector for which range value matches 
>> given
>> + * input value. Value is matching if it is equal or higher than 
>> given value
>> + * If given value is found to be in a range scanning is stopped and 
>> @found is
>> + * set true. If a range with values greater than given value is found
>> + * but the range min is being greater than given value, then the 
>> range's
>> + * lowest selector is updated to @selector and scanning is stopped.
>
> Is there a reason why the scanning is stopped here? What ensures that 
> the rest of the ranges wouldn't contain a better match?
>
> The logic is now different from the 
> linear_range_get_selector_low_array(), and I would like to understand 
> why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
> Hence, I would like to know rationale behind making them different.


The rationale for this being asymmetric is to find the tightest upper 
bound for `value` < minimum value across the linear range array.

To better illustrate this with an example. I have 2 entries in the 
linear range array [ [4, 8], [11, 15] ]. Let's assume I pass a value of "2".

Based on my current approach, the call to get_selector_high() would 
successfully return with `found`=false and a selector value 
corresponding to "4".

However, if I continued to search, I would end up the selector 
corresponding to "11". A selector corresponding to "4" is much 
closer/tighter than "2".

For values higher than the highest value in any range, this would keep 
iterating and end up returning an -EINVAL.

For in range values this would work as expected.

This implementation assumes that the linear ranges are provided in 
sorted order, an assumption that I believe already underlies the 
existing *_low_array() logic.


Regards,

Amit

>
>> + *
>> + * Return: 0 on success, -EINVAL if range array is invalid or does 
>> not contain
>> + * range with a value greater or equal to given value
>> + */
>> +int linear_range_get_selector_high_array(const struct linear_range *r,
>> +                     int ranges, unsigned int val,
>> +                     unsigned int *selector, bool *found)
>> +{
>> +    int i;
>> +    int ret;
>> +
>> +    for (i = 0; i < ranges; i++) {
>> +        ret = linear_range_get_selector_high(&r[i], val, selector,
>> +                             found);
>> +        if (!ret)
>> +            return 0;
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
>> +
>>   /**
>>    * linear_range_get_selector_within - return linear range selector 
>> for value
>>    * @r:        pointer to linear range where selector is looked from
>>
>
>
