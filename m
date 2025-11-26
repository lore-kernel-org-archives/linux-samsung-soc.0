Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB21CAB3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764115377; cv=none; b=LETQBluNjXvZglUNvT7/DWBCz9d5C83Gt6jZJ2ch4/NvdJ9y3AL4H+vtM3DvMQzRpcFV2jesJtwUgz8TxfX4Dn70ZHRu5R89oZEeDeqeeXPR3eWrEt7ez7IDiVkMGLSyC3SjXPqBkHXnIC+1V2ISx0TEDO5LinXkr7MYX+YwHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764115377; c=relaxed/simple;
	bh=NqlXoSZZihO70FxCdncHZZzKas0CMSSbGdpFS9BtrlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSHRJRThP9PzuAOEwLhI8nAL18sdhtzfa9M61tkvVKXV5j46ifNikefaIB5AleBMVteaLrr8JC1E/segOq62TK7y3o4bTI2sbn9Bg8I16ZDAGT+7u7oEzZ109LQLlUlPAQP1Tbbes9GoqXqXSAO1usHS2Qh12FO/+cXMuWV4FwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKaxL67t; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKaxL67t"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343806688c5so5148638a91.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 16:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764115374; x=1764720174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=FKaxL67t1NTEdfJ2QXhzagkftN3w55W73P0RWMXR18iGN0OvqYbdyQen/60bSfbSmn
         53bi/Gw4U3Xn/gpM1dDQGi/hBnpqNADtCsJsG0eUB51JJlaN8uhlHQYxGBwn9CT/tKYb
         svrhj3atsWksruKrH7hTZPMmzrP1t8dCBQR/BSEg0cATDtr+uG+peiAS4mVrXlDKbZGw
         IliQB7ZeFC9XkGS2kYmG4cFzPIMCVGateypt11lz7K6QGSDJ4lI2eKJmaGsVzwf/VeOL
         zet/tII+th+uGuXvGr8SM5l8mAMkV9c6O+mLv2h/zUAFC10+oCpKhXEi7480YBe4XAgO
         HimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115374; x=1764720174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=BiFsVrCf4HzfvrO9WUY45+OdiKZ3jV/KBSD5E0Uo16NHu7h/pIPQAAeJKC+pC9CqPs
         kLfzVHVQWuAMpO6aBs9M7b6lkCoHEWBWNr7wbaba0Vq8KJQzl9fyDQP1+K0JPKUSAXZI
         wscXsUZIPxIegxZyB2dvQy/RonSx6Oj3e5n3x8d4CXekdBoi+0+eIIwn187qGXGi6nvV
         nyd7ndKHiTiMOqJEBQft4tELjYeYE1+gMMiHI4MXpXbnu7gYFIg49jeWFYN1SiBCWcVb
         wqcXUDBCsDcT58KlcSzIZVnecom4235ukHBYVJZOpSDrAuMt04RGruuZYaFlBJAP2qEd
         UNOg==
X-Forwarded-Encrypted: i=1; AJvYcCVjXs0cu2XMH4NdURVIsPQlXLmTQizp2QelUuJgIDMAZihptcrsVKrXTIRIf3PgW1SIeFscpy65zioLnoEETeStxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8ruzjscSH1mAChg1HCTHNjkpJz7M++FErQukMOPxXlRnSfq1
	axmxt4rqlxr2s2h9y7l8qS3A6g/ho3B+nZW5eDVFz7bw73joZd2A+fwLABTgke9u/w==
X-Gm-Gg: ASbGncv0cs9aIb/IBXxJZXHOWaqhuiRpDza5qO8yLfY6VSVxwh1q22t/rhq/+sqWaA9
	06veHn+R4jeDyIN0wnRL5tyFrejuwA/uoLkq8Ob6VN8Oe3iLApEM+CbrA+7AB7qAeldTorf0WXL
	XWQ6P9k4njmPPqqIdh53eQKcFzif3SNut2ybT1JyInXh2/OBT26wYX78ESr56URVpLwLCWtO8KO
	RdP18NcEJKDvuxFdEWWsJUYPfC2kbVMygQxQbPvj0XDWYcq4BML6wjcoakvQ90u4LFRShk5+eRh
	ghH/JMShGuFXEVB9RaEYiCI0cXASN0ionxnvTJi5bksCg5bjYbyPOCpwJaSoyNHVYRvpYrj+TmS
	a4742Z+2o0X9UPVb/Bw1XczHXQFw8gPp+3F/wYCIPO25Q9a6c31F/Cq8UJRdWOgG6/9T8vOjjC+
	/9/Qh0DtjUqwMngmmDBrxM83V2lLTxaBwaPaP8qYNsvd0tXEs3zO7jbFrK5exAHMvgV1tJ0zMJX
	qnc7XyQLTW2Iw==
X-Google-Smtp-Source: AGHT+IGHFeP0ZRaD8eMJaVnA9S33kn4uRxwfNfGJ0BWnjB5I6ToaBVqHt4IPtOo9tOmXe7tjjGRiww==
X-Received: by 2002:a17:90b:180f:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-3475ebf9b16mr4130129a91.10.1764115373195;
        Tue, 25 Nov 2025 16:02:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a6105sm514375a91.10.2025.11.25.16.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 16:02:52 -0800 (PST)
Message-ID: <4cb88319-6514-4145-8309-01051547b851@google.com>
Date: Tue, 25 Nov 2025 16:02:50 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: mfd: maxim,max77759: add charger child
 node
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
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-2-6b2e4b8f7f54@google.com>
 <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/23/25 1:30 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function, hence add its
>> binding as a property. Also, update the example to include charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/maxim,max77759.yaml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..29132f73f2c8 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,9 @@ properties:
>>     nvmem-0:
>>       $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>   
>> +  charger:
>> +    $ref: /schemas/power/supply/maxim,max77759-charger.yaml
> You need to explain dependencies/merging in the cover letter. This patch
> now cannot be merged alone through MFD.
>
> Or just decouple the dependency and list here only compatible, assuming
> this child node even stays.

Would it be okay if I drop this patch from this series and re-send it 
while mentioning the dependency?


>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -95,5 +98,14 @@ examples:
>>                       };
>>                   };
>>               };
>> +
>> +            charger {
>> +                compatible = "maxim,max77759-charger";
>> +                power-supplies = <&maxtcpc>;
> Feels like you miss here battery.

I have added the example in [1]. We can discuss there in case there are 
further concerns.

[1] 
https://lore.kernel.org/all/7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com/T/#u


BR,

Amit

>
>
> Best regards,
> Krzysztof
