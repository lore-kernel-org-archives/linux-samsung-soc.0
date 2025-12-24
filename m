Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBA2BF002
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603508; cv=none; b=GoYoBACfmegNHzLzePfFkuCr+DGQbyMxzDTlnAgFOQhrEB6q0K3ODGgmrXtaeVkEP1iQ7Ab8wbH6JOuKNLjZXcs35UHnrPzQIAbIAwNgBrr+PbAsPx3dwTkuZ1ge2m1yDvZZ7XdnYY+lKrhUAM+6S4h9xQotmt1YnIPadPqLXh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603508; c=relaxed/simple;
	bh=k8Byl028CgHsF3DBvdHOc7E8XGBxj49LJk7WEGiE6aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBtG38pl7SbZYT+Ix7lwMoDlymYf9Y4+jZmmjRo+U/NN4Uc30UYIxpmJgrlFJaL8JRXFBoFAF5Jsm9zDCsVrhpk2rspY2z/jp6OUtUYrroClcKpldlLRQ8BbZTDaT2dzrJy+BKxCurwRcF7fPRlTfzCtjvbPQM0JkageT/dE69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GzfI67hK; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GzfI67hK"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6446c924f9eso5642446d50.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 11:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766603505; x=1767208305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXhnYTRKWSBrdTvGbB7qy2q3xu05EvIJIuYEgLdKQ5w=;
        b=GzfI67hKYeYlQLM5vk0CbRE07x/BJr8BLGWiDztt24R5JmN8Sy8ahJ2Fsmp0oS3QvX
         bTvvmZtvmquMg7J9GH1SsZoI9gaff2UIWohHpfzfnTcBCXlRQL3A/eOLV3UZDY5ciGCo
         I5KMc0ZuR9/W13MeLwgCYErKb95DsS/IMCG7fCHyTXfLyIJ5/1MhkaYB6Pb1vJBh2PIK
         1fQHKGquv6CVuE0tzGYn7nXdGzECGonkbuc9Rsy/9epAgCtswCfD1CprXbGMWRCzKVpy
         xm+22BTH3PFgF70Sgwaf78lpb83svr/AJpMWtytRcBWNoSmxwSnc4mL2Be0Hn9Ou6stF
         AZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603505; x=1767208305;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXhnYTRKWSBrdTvGbB7qy2q3xu05EvIJIuYEgLdKQ5w=;
        b=YFd3OTZMpq8NGHmuxA49yKFQKtdmHFJ5o/5EM4nz+m7c7z17bbS1D4VFEHxBeo1sFz
         sRfLTRiqzxploZeDVQT/LAcXx0gc9mwT2YnsPskMU4or77UuIgJhpWmZhFJjGHkcXLe6
         fZnQLyqP5RuL8rQuLF1gz6JHxNEDLnPbq8PP7pxC2df4T666W3MMTzXFL2LOOMb+h/Ft
         taWbW4UEbgHPO7LdvhMBnWPl22kNn5oM9SnoLrNgiSstgq0vi5I8RLp3jrD37hUeiVbh
         9FkRjSLln83s7TakmdR1pSzFJWnI6WcT4z6ICE5WOaFYCHBz5abrht4DMPaDH5UjRQCS
         8Lhg==
X-Forwarded-Encrypted: i=1; AJvYcCXkD+9vdg6HavjNYOrnejZZ7qQ+WdLsznsUlMElxfdA+fvk3j3wdRJ6l13WuEJmEap93d3DET7sNtB1drtjqq0i3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFsp7YEEzDFxyI6OAw9/nDbZYT4qIhivSwBuFGYuia0Jexcw7W
	HxCwOIBc8eiQ4efo+Y3PtsbuOUkp6B0c+rtJV+KtYRwsVZ2czX7S88eWTkBgJmtngA==
X-Gm-Gg: AY/fxX6G0XGCCKllwPh4SVCLc7Hcn8he4EeH4uoIH9QmBUG0Rq5+RnVypx/zk0D2tTn
	AFMN7XV3vES8PaVmdFVKsHx4QhcfG6Tc2OQBs9ZvsWLbbBEGxwXeupoSPRSsgULUXeqlbSa3w0G
	Z8RRG93ahS6n35mXManxXtUrroBUOVkIMLQJ+l8G+NOB7K5WEB9f8jKDH0qTF9C/vvw+6g5pQGF
	9yFHqk7+7NiEiUBariliDCKrxiartb+RUM8OGvlK/aBOHt3PxN+BzzwZyKDJH1SPrczu1NASX+q
	8dMTs0DJg+JyZDtcB2M+RiDyVwAObcpCuAKdUO6ujSuCGN25YJnn4KhYWHQupahTcNSe5aNFJY1
	eq3XdYpgXqM0R7xGL/aosD7hYccS9/DzVaIqjixCCVwGKaDdgqK6zn1jGn/ZfsK3Pd1TfPaU+Oo
	7/GLcKQXp5OOOo6/bvAU+aKDHNiAY1D65bWRdiAs360SDEmfVjXDdel1xwQi4=
X-Google-Smtp-Source: AGHT+IF4+78/ybW8h2aFs9XZbSKza4sj6Czw5R4tW02KVHwiK1CyevWiPabB7l4R0Pz1pzDMvfJfng==
X-Received: by 2002:a05:690e:1486:b0:63f:31f7:b956 with SMTP id 956f58d0204a3-6466a898fbbmr15286144d50.27.1766603505319;
        Wed, 24 Dec 2025 11:11:45 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:6872:f79a:c2ff:4f4f? ([2600:1700:4570:89a0:6872:f79a:c2ff:4f4f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a81d4e4sm8640178d50.0.2025.12.24.11.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 11:11:44 -0800 (PST)
Message-ID: <27d2a9de-487a-409b-8807-d1d3bf9e8ee7@google.com>
Date: Wed, 24 Dec 2025 11:11:42 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: maxim,max77759: add charger
 child node
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
 <20251218-max77759-charger-v2-1-2b259980a686@google.com>
 <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
 <3d156c45-b55d-4ca4-95d6-0d06e067bbdb@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <3d156c45-b55d-4ca4-95d6-0d06e067bbdb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/23/25 5:32 AM, Krzysztof Kozlowski wrote:
> On 19/12/2025 09:17, Krzysztof Kozlowski wrote:
>> On 18/12/2025 23:49, Amit Sunil Dhamne via B4 Relay wrote:
>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>
>>> The Maxim MAX77759 MFD includes a charger function. Extend the max77759
>>> binding to include the charger. Also, update the example to include
>>> charger.
>>>
>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> ---
>>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> index 525de9ab3c2b..1cffdf2e5776 100644
>>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>>> @@ -37,6 +37,30 @@ properties:
>>>    nvmem-0:
>>>      $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>>  
>>> +  charger:
>>> +    type: object
>>> +    description: This is a dual input switch mode battery charger for portable
>>> +      applications. It supports wired and wireless charging and can operate in
>>> +      buck and boost mode.
>>> +
>>
>> I do not see any improvements, so same comment: this should be folded
>> into the parent.
>>
>> Please read DTS 101 slides or writing bindings or any other talks...
>>
> No responses to my emails for a few days,so I assume discussion is done
> and I mark it as changes requested in patchwork.

Yes please. Sorry about the delay.

>
> Best regards,
> Krzysztof
