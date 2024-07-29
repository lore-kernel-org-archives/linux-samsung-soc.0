Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2A84039
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722234484; cv=none; b=Zkjqt7XSycRJ8C9l986XEE38dNZ368EG7xDsyLkB7skEd6kIlmI+fOUTIbR0kmqEeDIzerK5K55firFP3AW727NidzGUthjOxOIfqb3PaSYOJxR4te84AeKDuQW0pFQfZWrftD1tJfwhsuPqld+d5wBu4DjLj1VKkSCh3lYfBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722234484; c=relaxed/simple;
	bh=SlPClcvSxD8dEu4YYpKAROwYW0VOai9ZZyu6Q/EXhCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVtn8zpkwyy1jv2PM5XGSYgprGo8Q/v74fl2+zhyMTon182oV7BBvf0HKZzfc8uaFMiFY9a96n5Rh6AG18kdK6xwqeTZVdkQm8xrV0PvbrDyh9K/bfpLs6KbL0H5j6JSDhmhQnDzL+ZsEjh4GRJ9/vQoiJYBfOJ/Xz6wz5bEdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hK+OpFEZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK+OpFEZ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ed741fe46so3166501e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jul 2024 23:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722234481; x=1722839281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1FDzoIgoiHz+tvGx2iimoq71D/g/PcvhBiYOgBxhdks=;
        b=hK+OpFEZH/62Ps1YbSz8JM0AopIRzDFm22w7BtmKTtxCKhlKTubZH7YVJw1bJc8DoG
         6thcwkOiccsG0ZEC9sDkExTKYzHRI0jnfnUCL8Vt6o9MCPb7bX6o6IJh9q57izWhXIR3
         /h7xO/2s/LsAugjEE3KtNfirph0RTU72KKiYt7sFH+V99BL8LsDeeIaSNNvr+ejwXS9C
         AIa9fotkfxdd6QyGWP+d+caSApPtw613Tyv9fJTGbSnid9dDKZbydrJTcLXhPmOA61WI
         1ZybxT1vG4HQXKT7RJIdiynYarHOhPF2bYAxLXVE3o34GtItpgrhxTmJjWK76Ix/2M3V
         UN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722234481; x=1722839281;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FDzoIgoiHz+tvGx2iimoq71D/g/PcvhBiYOgBxhdks=;
        b=FfirVO91euWZ12ggTNAuObLxv5puYxYrdwc1mak2NGJ8wOY3QqEoPHRLFsBaPLtF30
         R4yslzyhjhyTkwuF2xwUF+1CSt92CkhPFFivwoLtRYUm+G7YKb5WMW1HWV6owMM2lTwL
         QvXp1+x0t0R+8/E7uy8aluEGx4e8291i+qU/3udrG4TrkutQ06gmby3Ir14mKGtuV8fC
         //sEyXrcMf2izdsGdjZul9Uk/BCsoOrdsGh5PkdRI/b1gprlh5CJ0RsKamkZEiTCCXka
         SciC2CYba/tInlvTb3x6+fa6BmbFWDPoEnVHHSjC+/vhA8aEWAjVWFIiuxLRDY/6jQD/
         5I3A==
X-Forwarded-Encrypted: i=1; AJvYcCWg+PxrYq9bvnCXfffsRnmiVDdzX9UGPtmijNInrZfyWin+jF13TeRplabmL2FA4XRBoaFYEjGFa5Z4RxtustHSGeijP96Dg2loBBionJhPdcg=
X-Gm-Message-State: AOJu0Yz7ksu7+jwIz8Byv6jB+30ZuupmYMnyo+TqTBGlPwREFCwIL0ez
	3urmP4MEoxQyuHYbsy1thY17U7sf3DDlOYY5gDvrP/+vegXORGl74lUYECf0Av0=
X-Google-Smtp-Source: AGHT+IEq2KI+IBO7LN/0LlKaHqVEx4UZik3u3BxC8IVLkNFW+3qKSj+DQDWQUreAWM4AJFeoEc0ZoA==
X-Received: by 2002:a05:6512:e94:b0:52e:9c0a:3514 with SMTP id 2adb3069b0e04-5309b2c3627mr5567976e87.44.1722234480690;
        Sun, 28 Jul 2024 23:28:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41961sm467118866b.131.2024.07.28.23.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 23:28:00 -0700 (PDT)
Message-ID: <d66e2153-d07d-40a9-98d5-742bc04ee2d8@linaro.org>
Date: Mon, 29 Jul 2024 08:27:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Sam Protsenko' <semen.protsenko@linaro.org>
Cc: 'Peter Griffin' <peter.griffin@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Marek Szyprowski' <m.szyprowski@samsung.com>,
 'Jaewon Kim' <jaewon02.kim@samsung.com>,
 'Mateusz Majewski' <m.majewski2@samsung.com>,
 'Henrik Grimler' <henrik@grimler.se>,
 'David Virag' <virag.david003@gmail.com>,
 'Artur Weber' <aweber.kernel@gmail.com>,
 'Raymond Hackley' <raymondhackley@protonmail.com>
References: <20240129204717.9091-1-semen.protsenko@linaro.org>
 <8659d79a-e18e-4591-be9e-817d0ab63b75@linaro.org>
 <CGME20240726151721epcas5p10d25ffeae074e4be35471a4799cfbd65@epcas5p1.samsung.com>
 <ae202942-fdc0-4913-bd37-c167440807af@linaro.org>
 <00de01dadf76$0d25ffa0$2771fee0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <00de01dadf76$0d25ffa0$2771fee0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2024 18:08, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, July 26, 2024 8:47 PM
>> To: Sam Protsenko <semen.protsenko@linaro.org>
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Peter Griffin
>> <peter.griffin@linaro.org>; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Chanwoo Choi
>> <cw00.choi@samsung.com>; Marek Szyprowski
>> <m.szyprowski@samsung.com>; Peter Griffin <peter.griffin@linaro.org>;
>> Jaewon Kim <jaewon02.kim@samsung.com>; Mateusz Majewski
>> <m.majewski2@samsung.com>; Henrik Grimler <henrik@grimler.se>; David
>> Virag <virag.david003@gmail.com>; Artur Weber <aweber.kernel@gmail.com>;
>> Raymond Hackley <raymondhackley@protonmail.com>
>> Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
>>
>> On 30/01/2024 08:29, Krzysztof Kozlowski wrote:
>>> On 29/01/2024 21:47, Sam Protsenko wrote:
>>>> Add maintainers entry for the Samsung Exynos850 SoC based platforms.
>>>>
>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>> ---
>>>>  MAINTAINERS | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS index
>>>> 939f6dd0ef6a..77c10cc669f8 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19281,6 +19281,16 @@ B:	mailto:linux-samsung-
>> soc@vger.kernel.org
>>>>  F:	Documentation/devicetree/bindings/sound/samsung*
>>>>  F:	sound/soc/samsung/
>>>>
>>>> +SAMSUNG EXYNOS850 SoC SUPPORT
>>>> +M:	Sam Protsenko <semen.protsenko@linaro.org>
>>>> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>>> +L:	linux-samsung-soc@vger.kernel.org
>>>
>>> Sorry, but I am still against individual SoC entries in maintainers,
>>> like I replied multiple times and pointed to the updated
>>> get_maintainers.pl script to fetch emails from boards.
>>
>> I retract my earlier statement.
>>
>> Some background: I was really hoping that scripts/get_maintainers.pl patch,
>> which adds fetching emails from files (e.g. DTS), will be picked up, but it has
>> been few years, few resends and there is no conclusion. I don't think it will be
>> ever merged, thus this email.
>>
>> Since C files do not have in-file "maintainer" entry and particular drivers have
>> MAINTAINERS-file entries, then why DTS should be different?
>>
> Not sure what was the discussion in past, do you think this need some discussion in LPC? 
> 
>> I'll take the patch after merge window.
>>
>> +Cc few other folks,
>>
>> I understand that with lei/lore filters one can easily track patches sent for
>> particular boards or SoCs, but being listed in MAINTAINERS have a bit bigger
>> meaning. Therefore if any of you consider / want to add themself to
>> MAINTAINERS for particular DTS, then go ahead. By DTS I
>> mean: particular boards (e.g. Galaxy Tab 3 family) or particular SoC (e.g.
>> Exynos850 like here).
>>
> Actually it is being confusing. Completely agreed that  "MAINTAINERS have a bit bigger".
> By adding each DTS/SoC/Board MAINTAINERS entry, are those members expected to send pull requests?
> If so, that leads to more confusion and overhead. 

No, just like maintainers of drivers do not send them. The way of
handling patches won't change.

Best regards,
Krzysztof

