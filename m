Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689062459D7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 01:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764119969; cv=none; b=Ps+Mh1C5jXxK0W9OYR6gsYZ1Wj4PwaD3GGmwy0VloNaYIHeCIV9unfvM8et2WyTa6e05vhECG7/SfhtjAm2LlS+SHf0MxjgpO+gjL/KgsmYaepB7peNEn5vi8BxRAcZ5qY02uIA074RBQtt9Q3KqcpUPVxLcRfnPDF+yWZSGfLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764119969; c=relaxed/simple;
	bh=G7ZNDNiR8Djja/TvyR9CLyYYZM1cA+rALARCuQmH59Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxNZKflTZefbjNw/cpKM8nuJfj9mOknj6Tkpz6wmx4OMRIpFhy2UBAnTItN+qKuPzGBFlprsUA812mRZ6LjYd+zlIhRSq8q+BUDCoStW2RXwBZJWwdwvxlb1FjK8PleGd7cBl8l8fmBfvyEBh6NlhdjO/xvp4ZCPIrf0oGapQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxpSk3bT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxpSk3bT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso3670867a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 17:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764119967; x=1764724767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=pxpSk3bTCdrqI0/hGfTwDSWmA1Ae/c6VVXHVR6i7LxRQ1XjdCPQt5Xw36GS3uFW2Db
         yh9fdw0KUKP8Fy+nZv/8zMkTgEmjk1MARz9zK2UlqXsVF2gQIacY+4JFyK7HhhH4JTDh
         bla1WZUox51rprOi+n0Ma0omV7K49ntby/qKxfXjNo+kLSSthSTbcZYRkDXSJCIng2Ra
         9MdWyGnosmOwR4NGRgipUhaSkcU1noLKZWMkR0/anT/EcjlTlMDZ9IbnolLHmozJqOFP
         pAG26EhmHanwv0eqaSfhTuBi/cou30WvJ/EYMHUKOPMRmI68o6LiJ6i2UcEl0Cmwu8ln
         CkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119967; x=1764724767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=vcjlRqFIVtfu6OglanwMhn24lY6bs5fkVD8jviTzEgWdQxaXMtxRDrdNsPIyBiSzLC
         DOhsrNE2vlktL8u0W4ypNoNmmGzxreYvwI+RptSJIPx+3oXYMh5BuhQmYIIrwOD8z0fw
         9P9OvUMQWnNPLETgneCBzb3249gUSX2wTo4SLsywySism+OSyC1S5KLPODpYAVqL0ssc
         sOpr91+2SuU6OPEuNWfZiWyG5za+3dvPfrwECTnKwqfue1CwTVgSEwfN0ax0OqjLDCDK
         qr8EM4mhdJwePjNj+D+G5bh028OQFWUrNR6uwp4dSnFxtDInK/zBlDJYFAj65Js/DcEk
         nU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbNhRf7eJt+mDZsLBir5gPFbAEG/sGCLVBBqpsZA9L2OvRqKuc5pAKw1wdXyoaCRMC0WiK0YKiQoy1jrLEnD9L0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwqE3ABkCheTe8Q9fy54fiCw1nuu7CM6fUFmKakLb+4lJG5OD
	A9H5XPuywRaUOUmJyhxW2zu+IO+q0Stry9a+PRROd5MbiVmXlJ3x0H55vs7vHThZ8g==
X-Gm-Gg: ASbGncue4PZk4bQz40Vwx1x769eZdUryjPxX6F8reeB7prryJ668yy1jeaIeT5IDywm
	tV2ugAW6nPHfrTLvTFGRRnvKnfrhPO9wAL3WkHs7Ahvuyf8yCeBJGwDYRBdiLLht1Wxk0JSpP6y
	LCOrTKnXRck7j+WeDmcc50QuAPqoTVkxayAqYPjWD9POPTEeLXlnQRvi6TAzOBu8UM338NBJ9ZZ
	HqYuZPVqmRF/N5FrGXYbYMtQasoAk3EXz5AN48qBuOH5xNsYoGjXVavwrBnZgJmcViZsKDKLW9q
	L8uuVUjY1v8fsDXj1M4rkD+r6iqKQlhZOZOI3TcdgMP7DWO+fWWThqmX4PLoCtPQI3l4z+AuQND
	bIvYmyua7Ihm0Zj/Kcz+L6WuvvnQoeHqHve3UGkrEZSvujcu0HuwnIPGNHDFOC9wwK6GgPQ1ePz
	fRJnCCf6bYpqiao5tLfdohnPzYh3xP/zrXgocmE67ZGiH4Pstx2JtcKWc04+OJ0H3YoN2FCyYY+
	ublWtiG/R/PjA==
X-Google-Smtp-Source: AGHT+IG7vAAdnJdBV1xPAxMSocFYLV08aRb8J8ZFA9YU4wW1fgRuVRFaXJs0v7uY7YYTEmsaJSmrhw==
X-Received: by 2002:a05:7301:da82:b0:2a4:4e8f:5861 with SMTP id 5a478bee46e88-2a94188c7d0mr2414680eec.28.1764119967060;
        Tue, 25 Nov 2025 17:19:27 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm95954083eec.2.2025.11.25.17.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:19:26 -0800 (PST)
Message-ID: <bb2ecf99-6153-4623-81ae-0fd41e4d306a@google.com>
Date: Tue, 25 Nov 2025 17:19:25 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
 <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/23/25 11:39 PM, Krzysztof Kozlowski wrote:
> On 24/11/2025 07:21, André Draszik wrote:
>>>   	if (ret)
>>>   		return dev_err_probe(&client->dev, ret,
>>>   				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
>>> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
>>>   		return dev_err_probe(&client->dev, -EINVAL,
>>>   				     "invalid IRQ: %d\n", client->irq);
>>>   
>>> -	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
>> I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-specific.
>> The polarity is meant to be set via DT (and the only current user of this driver
>> does so).
>>
> If this is the main chip interrupt, then you are right and the code is
> obviously wrong. What's more, it is completely unexplained in the commit
> msg, because that vague statement cannot be taken as any reasonable
> explanation.

You are right. As discussed in the thread with André, I will drop this 
particular change in the next rev.

BR,

Amit

>
> Best regards,
> Krzysztof
