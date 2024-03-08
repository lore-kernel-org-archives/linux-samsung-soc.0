Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B44F1FB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Mar 2024 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883471; cv=none; b=XshUeiIRPM/idS+lbS46qQwPg82ZxsHbk7nbeVmp32CD5pAtZx8FV24HSBnZe+lJXbDjrRfnYPcrnj3qX0vMBiQht5MJeOaT6E4pXcCNiiRjTQPBXSRtkThOcql5yAfyUl8EPA6rH7DD/1Tec/ssnesrJo0xTQU1tRI3HXbxNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883471; c=relaxed/simple;
	bh=wBiR39uzYKc4tZlVThLdr1KErfH2j2DZYVoFRU26Mew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAEL+uq1rSCqOSE7/uKlEIe/YFoci8WZAska+nWA2DivJQ07+GHEa0HqrVBuyyBUZAL7RaJ/+Nfu0xaBxA4xSK2tzxzDuWK30svJVuD6/fhD+IWqpWy5fMaY/Es279/VS/9zSl2lNVsa5wtB/nR4GbyyBIKUDpqo1P6tpoA7J0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVenKu+8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVenKu+8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412e6ba32easo3941485e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2024 23:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709883468; x=1710488268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhiQMXQwl+cGnIcsRqQff0Uowg+nqWN2zmSceUCwYy0=;
        b=hVenKu+8BkDkhrH/FqyvIr5q7QSMi/FaUjCpHbdjRPz79fq7mcnyEu1m9P3YEHImzF
         T+ykQC2GTOUhfnYP/fxwbTUHVYt8+2YJUip/SMnpxtL8bX90o4WcXAepvIKMTpdVPsyp
         8H5E3PqNzAX9l5hXocgp+3LkAxrzJA4bkNIgPU1hoCFMnW0hDXyHOH6jv9Y2t6aVXweX
         EKRd36QNtX0sY9CE6iE/KUBNPMkugopHv+BP3vychi7JhKjkoqFQzOqOypi8urh8vO+I
         Am0LI3bPKxNgRjMmk9an93tt6vvr7RIC+kgahqrK2ZVGze0fcMB/zS3zr4bmnl4owB11
         9fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883468; x=1710488268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhiQMXQwl+cGnIcsRqQff0Uowg+nqWN2zmSceUCwYy0=;
        b=kMvDoZ3hXVj9JgKQXK9NRzR/1dMuFsLaYFhCjlmrBoIy+/DJROLxAMuqkjjy89x41p
         5iMkqnIx2+Y4ezEMypqyCbzBWEJ8gkGz0y0lPkeli9w6UPRjgPw4D75cgyc70s8K/H5U
         Qfh9CzmE7tQ4QCHcamhosXXJTICGwPwJoe1VpT2ZZdHENjyVu6heTySiXGzyNJ6iCVYu
         YZ5DwW9JMKs27NFobL1pVtnxF/rhq04gkuMfBQT3py4+D58WaIq4LeXiuWw0K4sprHP7
         DNOHZPkqOrPJLLMW4OrlOIWo+l68qMRUHyDxLewYVtWWCWB2n+AM1eyRiIlZHSNblFoZ
         lXSg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ4e+jZuxCOziPzm5qhfZRlIDAB9ct4JGJVXYhraKr0SFI/Azw7iNVQMjN82oD5z0QbtPSm9t92jvBFKnp0gXhRRwtxv9EC8c/SccQfCN3yE=
X-Gm-Message-State: AOJu0Ywms+EbOQ6k8r8nUFw9Tl8b2cJe8XsmZwfuqEF+S2r5z9qHZRtM
	bf8vvfNxPS0DlP1aSeSeIBDiDomAIirSKza9ociBxshx71HiBZiZIYm7HjbTe3I=
X-Google-Smtp-Source: AGHT+IHeM3AFJo8jH68+WgOn5Bb5yw3pborl2F1ryp8Z37+rRnPpazNBL9tDmD3xUUjWGzp5w/3qaA==
X-Received: by 2002:a05:600c:4fd3:b0:412:fa5f:7f85 with SMTP id o19-20020a05600c4fd300b00412fa5f7f85mr4665433wmq.19.1709883468522;
        Thu, 07 Mar 2024 23:37:48 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id b6-20020a05600c4e0600b004131b337c82sm375764wmq.31.2024.03.07.23.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 23:37:48 -0800 (PST)
Message-ID: <4124c401-512e-469c-9080-2f2fa5d548b7@linaro.org>
Date: Fri, 8 Mar 2024 07:37:46 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names
 to dtsi
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, willmcvicker@google.com,
 kernel-team@android.com
References: <20240307135248.162752-1-tudor.ambarus@linaro.org>
 <3acffe042bde796dc47d4bdcb339f0081a05193c.camel@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3acffe042bde796dc47d4bdcb339f0081a05193c.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/7/24 14:00, André Draszik wrote:
> On Thu, 2024-03-07 at 13:52 +0000, Tudor Ambarus wrote:
>> The pinctrl nodes are coming from the shared gs101-pinctrl.dtsi,
>> thus the pinctrl-0/names shall stay in dtsi. Move them.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 2 --
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 2 ++
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> index 6ccade2c8cb4..9dc0f47ef646 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> @@ -103,8 +103,6 @@ key_power: key-power-pins {
>>  };
>>  
>>  &serial_0 {
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&uart0_bus>;
>>  	status = "okay";
>>  };
>>  
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 55e6bcb3689e..ee65ed9d2cfc 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -421,6 +421,8 @@ serial_0: serial@10a00000 {
>>  				reg = <0x10a00000 0xc0>;
>>  				interrupts = <GIC_SPI 634
>>  					      IRQ_TYPE_LEVEL_HIGH 0>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&uart0_bus>;
> 
> The preferred order for these is pinctrl-0 pinctrl-names (and I thought
> I had sent a patch for all such issues in gs101, but looks like I
> didn't...)

Okay, I'll send v2 and change the order in the same patch.

> 
> Once addressed:
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> 
> Cheers,
> Andre'
> 
