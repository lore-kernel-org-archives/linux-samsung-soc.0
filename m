Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB01231CA0;
	Tue, 10 Dec 2024 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733866111; cv=none; b=rouv832/Ea6EV6A/jN3yd55KE84KDc+UL2rTbXZNGH3A7nSotIowNgsrOk9aDfe2B3CK5j16e4ugm0jkSrDZBkRHfiuUMkpwELVCF3y38DENky9BqYpfbOxirSvKCfwptt3CL3zVoZUoyYvse3tFn18WXsMoUTdDc/18fq51YRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733866111; c=relaxed/simple;
	bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1bX1McvWUwZ8cN2M1JA0hU1xce6foW2JvDZzkDt2Ye9IL1DzH1qDuKNBaLubEx9i/a+HRu77C/EzX3x7RVWerXlW4C3xv+DBcUH2V9Oa2NjcjUpS9yga9ECcR32HZ/jUbCG4ofMjRKBWxofPnlTjQLnwI182q2bBJ/9r29qlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEKO/6K9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEKO/6K9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa69251292dso437328166b.2;
        Tue, 10 Dec 2024 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733866108; x=1734470908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=;
        b=QEKO/6K92mFRsAJhcQ8dyp+YU9qdyfElOEmEvMJdpoazvQpJgm9+pM9Q0RwuXb7CrZ
         YuQmEHd5hQTqp+fw5toGaLMDhDNIVSWoJkgG3BkS7b8U18f0XC3i3NWpRWk0MFNoxzVu
         9dRaDBjx6zYLozjCaYvFpzi6+cLKsQAwH6PWbK3n6kujDLcfZoYUFfT1BPRyn5B9shwH
         hExjteg7q7G21VIpEpapJGoLhI4Nqd4r4WhYoTFntGqA4RFCiBZtSX/F87XWf9P432sz
         L15sB3lnYLS086AIAlY3AjCoqHK/5K1XfAlIZJWDmsOq5ZTeZtil5UG5NGX01N00X7br
         FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733866108; x=1734470908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dunritcu8FRR02cLFv+TRvvRJA8uIyOXP1LEWF38uI=;
        b=so2fu7tum8TlX8mIULlykuoCVxcQ2HSEPBzrVJL2GS5RWV26rmsmx6AUWH/6mABRAk
         xGTjENLiAMxResI0LzIHes02ay38+I0bHhknr7x8iMQxq59zo2chuLWbTj2Ib3/zNvLz
         WeO621ZRp8sAklXU6mrYmE6d5rNa7o1zEkoFAW5dA191w+V1TLLm9+XmkhmW6kGq+XsL
         kWUHuo4myNQ+XJWxRGJX8ke0O+Yegxe7sBVFI0N6fCDliE+aKr+LM3sERV2FeRVIsrwe
         YqJoOOuMDoDerY3jMRblH7HPyUNYqTDLLf7oiBPGaRYCpXQTne30DrXjhhYjfce+iysN
         58GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkqMdDUaz1WkWMvRGc2XfXzJ5+6bk7wFACrRar5vUtQzeI+ii2sfw9MkPnSjjmLx+bN2fWrzEwa+4U@vger.kernel.org, AJvYcCV840Ahcsyey8nIskQHz+1wSczJevrEDGKqBOOmIAhe0ZaETYNfo2qqYcr2j5JAD1+8TcUGtjmOMF+gP9v/@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7TI3idJ83BAvOIGm3S9DR6igulLkEY8KVZRyewTH3Qp4aOi2
	Kfi/Oj+Q9lRPrPbeli8sqVvDsyO5CY2qa8PdjFgW9e1mDggpbO9+
X-Gm-Gg: ASbGncuzJw9bLi2BtVB9Fb77a81DWXwEV0JWg94cYQFGPiycTpHT6UmnEAiTJ63q9FJ
	gxaxIUksJ6CHn9mSe08lQfZF7VfMbN3tRlLj8PskIu9Ris4PW/BR8lAH3qFzEwe5pu99ElSEyMI
	ZU1lOedxTh3Nuvrl2SlvUS+4vJs1z6wPJLpTDyICwnytQ6Fmd7G0DTIriTDLO7qZ1GCocjKA8yU
	VcY6r2hHBvRfmdtVuCoooCXYM8yG8ibEnEN3jUKA+U7RFHUs2lSZLck/s0pc5pctjI6wil33a3t
	sUhBWs7IiBHAUwXzB9NbC0rpMngECh0q
X-Google-Smtp-Source: AGHT+IF2lPlG/TM42607y3WI0CId/jCN4zyRMixPec0/CK3oZtt3mBHJ2MfDv98RJm/SF+OlckHE/g==
X-Received: by 2002:a17:906:1ba2:b0:aa6:63e2:535c with SMTP id a640c23a62f3a-aa6b11e7f6emr30829066b.28.1733866107775;
        Tue, 10 Dec 2024 13:28:27 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa695e45fe1sm286058866b.32.2024.12.10.13.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 13:28:27 -0800 (PST)
Message-ID: <e5a847f7-5e63-4860-8b4a-dfa378989c57@gmail.com>
Date: Tue, 10 Dec 2024 23:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and
 syscon-reboot nodes
Content-Language: en-US
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
 <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
 <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/10/24 23:10, Markuss Broks wrote:
> Hi,
>
> On 12/10/24 8:02 PM, Ivaylo Ivanov wrote:
>> For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
>> of SWRESET register(PMU + 0x400) and power-off is handled by setting
>> bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).
>>
>> Tested using "reboot" and "poweroff -p" commands.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> index 90b318b2f..9eb89dd19 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> @@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
>>               compatible = "samsung,exynos8895-pmu",
>>                        "samsung,exynos7-pmu", "syscon";
>>               reg = <0x16480000 0x10000>;
>> +
>> +            poweroff: syscon-poweroff {
>> +                compatible = "syscon-poweroff";
>> +                regmap = <&pmu_system_controller>;
>> +                offset = <0x330c>; /* PS_HOLD_CONTROL */
>> +                mask = <0x100>; /* reset value */
>> +            };
>> +
>> +            reboot: syscon-reboot {
>> +                compatible = "syscon-reboot";
>> +                regmap = <&pmu_system_controller>;
>> +                offset = <0x400>; /* SWRESET */
>> +                mask = <0x1>; /* SWRESET_SYSTEM */
>> +                value = <0x1>; /* reset value */
>> +            };
>>           };
> Aren't those already included with arm/samsung/exynos-syscon-restart.dtsi? I can see that the values for poweroff are different here though, does it not work with the value from exynos-syscon-restart?

Riiight... seems like I've completely omitted that during testing.
Although the poweroff mask should be different, it's meant to set
BIT 8. I'll check it tomorrow and send a v2.

Thanks!
Best regards, Ivo.

>>             pinctrl_alive: pinctrl@164b0000 {
>
>
> - Markuss
>

