Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBE153BE1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617309; cv=none; b=P9dMYi3XQNUuHZGwGMJJTucUeAZtZQzfgSltOCnykh3VeDufdYgQMOmT+QgzutVSZNJcjffGt42raYkZtp32fj3T8BodGXfMUPSX0a/yX2HamHocmY/XWy/gfmBE59ftINuiMvgUSfkRXxszbUBJtP7q6nZGR/7KrWhby3bcdGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617309; c=relaxed/simple;
	bh=KUtc8q6CcpBvImGltJZTUBOEuTBoRPVvVKgGQlQcYuk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=q1/LfQHhH4wPm8zZ75MWsHSvdzZpK1lClbJeNkpoRUiE1WPuhC8VFuoQ+2r4oAvTSprQG+uRvqGDX17v+KXbcSXd4b1yIsMnCFBTEzX2h3lZhTEVgQ9C5reXAhis3kXktUL46Q2QYQch5+WXu2JkDmet9E48h55UEc/M+Z37WHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JklXxe5V; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JklXxe5V"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so11654865a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 07:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708617305; x=1709222105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y/3fqyShE16h1P4+I1UlQxe681BbNCFMrZ9zvWuxmnc=;
        b=JklXxe5V2K0ppMtrjQwWB0P1+RB//LhhrWd9tE1tFIOl+CqDDZVsc6znxEE8EPB/XB
         H2saWOAjN+1MHRHyZ7HOuDYmJ6wCIjzsf6Q0e5cWon+1CY4lcx9KpogFrRgyEObcCm3o
         ueS47ZE0mtsQLVpTpUiKl5g5XBbxc5OJeo7su3m6Q39QN6+xXLVBjG6sYfYsKmISS88X
         zTpYGdkkYHaEw4g4GdU+L9RogPmspDRXlA//a6QQe/J0R/yGmie8wHn1LakdNS+N8ZgT
         u5lAvJiyrKQtV4EbMP4WF0Pf/H3TmneS3LCoaLyzfEDvN0n69mtRXYjCtPdnpkIwYH3F
         U0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708617305; x=1709222105;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/3fqyShE16h1P4+I1UlQxe681BbNCFMrZ9zvWuxmnc=;
        b=H3mG2QMDD1KYDB07KAG6zDlcAnVhpxvUJdPSOs3GmlUEVnPvhz75Dxq/9d65e0t/p4
         O0u4Sdfo+qiOZcsNqZFOyDtuMWEYSRTHh7RVII54HYVTKMjjQILa4x4l3pEcF0C6bjGA
         +LOBgAVI/eH4qtbxsD1Bd5qfQHw4k3hfeFFSLJR/IWOtrbLQ+Nv4Xm649ij+lJyYAr/v
         x6OixNX0bNovlEHOiqP+9OtgydF86IqDQM7CQruDxAlTpvZFSo93YXjyKEjLy8ewC2+7
         u2f7MHUGVSjtQoAdsWhtFF3pcBhmepm0LINMSOQ3TUR6jSp+3eJh8mk5rIAezfRK9sU7
         /tHg==
X-Forwarded-Encrypted: i=1; AJvYcCXIoy+6F3gZqdrt0elfH9WcuXepzFhsJtUxg/YXQW4YqDHsJeZS7BbBd1th+Y22mXjDql6eBYOYw+Q5/Wwlp7qiFAQAdtujqozQONnu+36+x9Q=
X-Gm-Message-State: AOJu0YydCkgsbaCKE28TNkyae9Hy2IWNKXWAJvkMR7xM4P7F1gimJEnI
	hxkDbkHbkDIcuitqkMka+itlQSnYkMlgdkw2vRa+2ey8rDCPqBvTuvTm5QqXy+A=
X-Google-Smtp-Source: AGHT+IHUf2LeUhiX0NVKNKGBIjlSW+tITgaRRyIfQrirSgrJFxJP1e/otOZPgCFnq9S5wSt1JKVYlQ==
X-Received: by 2002:a05:6402:5246:b0:565:2183:d296 with SMTP id t6-20020a056402524600b005652183d296mr2863889edd.27.1708617305020;
        Thu, 22 Feb 2024 07:55:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s1-20020a056402164100b00563f918c76asm5623671edx.52.2024.02.22.07.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 07:55:04 -0800 (PST)
Message-ID: <d41b7281-5f44-4de0-9ea6-5dcae26ac295@linaro.org>
Date: Thu, 22 Feb 2024 16:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: exynos4212-tab3: limit usable memory range
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
 <15ab6aa6-fb30-4970-9c50-546afb933e03@linaro.org>
 <c2fde69d-48c2-446f-ac56-876651c06b51@gmail.com>
 <5d67441e-df61-4894-ba52-2bed8a1143d6@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5d67441e-df61-4894-ba52-2bed8a1143d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2024 09:26, Krzysztof Kozlowski wrote:
> On 19/02/2024 20:49, Artur Weber wrote:
>> On 19.02.2024 08:44, Krzysztof Kozlowski wrote:
>>> On 17/02/2024 20:02, Artur Weber wrote:
>>>> The stock bootloader on the Samsung Galaxy Tab 3 8.0 provides an
>>>> incorrect available memory range over ATAG_MEM. Limit the usable
>>>> memory in the DTS to prevent it from doing so, without having to
>>>> disable ATAG support.
>>>>
>>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>>> ---
>>>>   arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
>>>> index e5254e32aa8f..9bc05961577d 100644
>>>> --- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
>>>> +++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
>>>> @@ -45,6 +45,12 @@ chosen {
>>>>   		/* Default S-BOOT bootloader loads initramfs here */
>>>>   		linux,initrd-start = <0x42000000>;
>>>>   		linux,initrd-end = <0x42800000>;
>>>> +
>>>> +		/*
>>>> +		 * Stock bootloader provides incorrect memory size in ATAG_MEM;
>>>> +		 * override it here
>>>> +		 */
>>>> +		linux,usable-memory-range = <0x40000000 0x3fc00000>;
>>>
>>> Applied and dropped:
>>>   chosen: linux,usable-memory-range:0: [4611686019496935424] is too short
>>
>> This seems to be a binding issue; the DT schema expects a 64-bit memory 
>> address and size, and doesn't allow a 32-bit range. I've tested the DTS 
>> on my device and this property seems to be handled fine, so I think this 
>> should allow 32-bit values as well.
> 
> Regardless where is the issue: please test before sending.
> 
>>
>> I've opened a PR[1] against devicetree-org/dt-schema (where the schema 
>> for the chosen node is stored) to try and fix this. If my approach is 
>> incorrect, feel free to comment there as well.
> 
> 
> According to Rob's comments, the DTS is the issue.

With updated dtschema I still see the same warning. Is something else
missing?

Best regards,
Krzysztof

