Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE7233D88
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603265; cv=none; b=fn9tKcD53bJ29KQCGF/SP2UUP0vjs0Jir4Hzi+wmT8o0c9aW9SjsFplAHGEtohLxafO/k4/F0ijkqMGKb4nY29/sJLZcblzB3eV095yTUIsILGrJ5YYWGW4op/Xjw6VUrjhm49Ee/m4fHAJlS+INonI6F+HZX4JH2mqiTZVK2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603265; c=relaxed/simple;
	bh=xGMey4A7iFVHAmrVZuSavckmgLulJhGs63Zh3metjjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXmXAI5LAGrHC6lSMK1Nz6+Tl/dqw3yDFH8P73/02rO0v89/80zPrFSJFrM6P+iPpbOpn9r554tPa9+R67CpgKFbrZBTMBIvpoF/c+3KEFn1wy18GoQsHYBw4MVg4Y1O/0fb3eh28CBXNr8uP7o9O916pCTp3np7XdbXcwbM+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jt48wwVz; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jt48wwVz"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64472ea7d18so4143615d50.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766603261; x=1767208061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=jt48wwVzAY30EJsCgsBi7TrUZHYIH4B7dENfIKwBOgf+orFGCMZ9TbGni6VSrbHmdI
         LPK3rS9lwcDDXS6PnM9tsNqrFgZ7p2KuWtrjQMcqMm//eCk9BKnUomcvLXovIP2xunU2
         B6SbxvRopOesHK+AkV3hoIJG//jR3l+5+m301qKjGd44VvSJfsthjTX2uhcGj/bSFdIv
         /RNSYyo8UUlEjlTDCeM13EDgRLXa1Am1Xyvy1AR6PHvQqG9BJn9aCjzvQPJrv6iWzFDk
         EGY1aznIp1KannV8iZph+snCe15e2bn28pj/gkm5t81hhSPQDlAsc8A5HMnv1mP/5xq9
         uSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603261; x=1767208061;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=Dv0v9sf+SRg2He+jEkE7k1UBHQeDNUKv7NrlMatO0p4eklF2oRcD/8DYxUol+ArLXw
         pCageGwpAPY09HH4VitodXF3uy1v8l7td4LZiQoHTVHW19f44WzjA4VqMjVb+9otPhLg
         rjFiuG0QLBcQRxhZtF3bG/Q16pbwXti5+OTYcR6+ckUQe/Va746hpSof2V0l0wWBszI0
         yIGb7VasxqtzxCAnjTAtYvl+O1K2Rc0GHHqZd7rQuIm0aPKN6Bxp4u0/SHTKc/ZKCgI/
         75uMz1KCYt09rqEKkUndio9HJTg3H9Xa9r8dwYjp2JgP3fY33noOfOClYEv0jxP4R2JP
         3rzw==
X-Forwarded-Encrypted: i=1; AJvYcCV/nLvhd7GTDuNPZfasf66otBYZbjMy+jFdfBf7672QkfeydHO0/ozSdnti2ChxoOU9kGkarRxXBiBkpDg1GTjfWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xsWC0nHa8PlJNV6L36V8MqnLCu8y59VEXyxAhig53Zm7C/eb
	58L2GnayzA9pcoWWPIJCWInO+tonQiPNZkcOHfbJg/kKi2HrcKLCZppvK9Bcrm4sCg==
X-Gm-Gg: AY/fxX5rY1jOOfp8IzjiUKSQN8ZGfwrEPFfqckFgKk4avoAbtOq0E7jGwXnKRzkeelx
	xzF69sB/UKjt71DjgzIG5LWXCcwB9Gp44d6Wprtd3bNcCF/ugll3+gxY5M200ukHL0XDm2YJvq7
	esJqwAFL+11dma59yzSX/N+UBQI6r5IZ4vLw8WX8vRd50ExvlXjVtWJVGpEKONXGgN9syf/0WV4
	bTnqG0X1bS3bQDeGsL5O3P9NdCEIvON4wPRPGDFl3wEClVZyIr6/Sf+hseQCH/ONpiqt7FRdS1q
	McwjXajPJziPCIQMWFo/qqy7tyKQt52LDExr8zMzjWRcwbHysNcY4tDcfJlFHdZq13C7F6Xb1HO
	13Hpy+ThP3a0YVnsWqOSxWXrulAQNbt6+1Q0T+HcdSjrF/otLUE5CIcokvcxYhOGUvGoytT3K2g
	c5k9yiFOyv2mYYhiQZ5x6N8jw1J8ngHRtQ8Uqm41F+CxwlMaY6CWzf46ZF+tE=
X-Google-Smtp-Source: AGHT+IEY4Bkjt/yYbrhofiHe25t6FYtL51Cgg0/pcmheFBExP5e5Z7qmADlL5vL1uqS/fVBKeLgjpg==
X-Received: by 2002:a53:bdc5:0:b0:63f:2bc7:7074 with SMTP id 956f58d0204a3-6466a8aba62mr11525267d50.60.1766603261316;
        Wed, 24 Dec 2025 11:07:41 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:6872:f79a:c2ff:4f4f? ([2600:1700:4570:89a0:6872:f79a:c2ff:4f4f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a8b16e2sm8621687d50.2.2025.12.24.11.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 11:07:40 -0800 (PST)
Message-ID: <c3599851-6e19-4ed9-9ce7-703746b978e7@google.com>
Date: Wed, 24 Dec 2025 11:07:38 -0800
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
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/19/25 12:17 AM, Krzysztof Kozlowski wrote:
> On 18/12/2025 23:49, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function. Extend the max77759
>> binding to include the charger. Also, update the example to include
>> charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..1cffdf2e5776 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,30 @@ properties:
>>    nvmem-0:
>>      $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>  
>> +  charger:
>> +    type: object
>> +    description: This is a dual input switch mode battery charger for portable
>> +      applications. It supports wired and wireless charging and can operate in
>> +      buck and boost mode.
>> +
>
> I do not see any improvements, so same comment: this should be folded
> into the parent.

I misunderstood the folding comment for merging the charger binding into
mfd.


> Please read DTS 101 slides or writing bindings or any other talks...

This gives a lot more context. Thanks for the pointer. I also reviewed a
few recently merged mfd (with charger being a cell) patches as well.

I realize that you're asking me to remove the charger node and re-anchor
its properties to the pmic mfd device. I will update it in the next
revision.


BR,

Amit

>
> Best regards,
> Krzysztof
