Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E11A0AEA
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784556; cv=none; b=o0wg1l1abKoS13LVCepiqa6ir/jPAOA3TKuFdRvZ5DyRT3MXh6rq5kU+Q1TwlAwTWRtHxFx+/sicefp7rnq64sV6wz/3u7qiICivsLqD09w5+3VoxnTKMbXnKOaH6PL3bT3mIDjFQ/MRz1UIZnLFxRQq8RUk6lkwtyaCYVwfLrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784556; c=relaxed/simple;
	bh=DLlX6pPcWXc3kUw1HTjUv43JsYwKcOrmjJgYkLNBtvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adsPr6fin2o94PgcDzhWcw9V4MFL5PmYGlfFVffT75/bWIpYeG4RPEkmNkT/Iq77LJ3rUWPyHUu+wPs88u+wLcREYJqRv2YhGCKpQT94Be2aE9bGihusoASgaj6sPY2+JvXuydjgf/r6RkzNlDBQBRrAJ8UG5WUMwUVvIu7rIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvWBVOlN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvWBVOlN"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37cd5501ec1so347065f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Oct 2024 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727784552; x=1728389352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mkohDdijKzRL10Tn/PBLUWMCNCgONQBQoKvFIWJkoX4=;
        b=YvWBVOlNB2bRSovRQlm5XWetHx+At9OBIJCYysJwFLlOvuose0CK9OOsGDt5z0r5fr
         n5PKHHa8w2ESpwZWwo32nPwOZinlPRkOvNAuFK0dywZn26Pcxv91oGK9XKs83guP3U2F
         jHPokQ5Kx+cmwAQB7k5ViTz5aFxmirl0G8akLbDV2iOJ9B/M7ybaDltzF1Y7vsT72xp/
         Zp2xbXwXhdXWJgqZEdnFxG0cJP6An43tRsJBjugdEtZhGI6OvZqmPyexixYRUuedI81+
         85ZEd5+Xn1JEihDEL6kWBa93I7+ayZ/9TaT69eMGCpzLDubtZz6QgNhzFOJYcjecZSQt
         3beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727784552; x=1728389352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkohDdijKzRL10Tn/PBLUWMCNCgONQBQoKvFIWJkoX4=;
        b=GVGjcXUIo6CKwcrghY5rW1QRt9mpZkHXWoCVNeIbHIKxlHTWYmoowak0NrRsz0sCTS
         h5sx5ypEpy7eISaG03ulXf13gLuj237JnDDVZ+VOVJMP2XXis1qW9zxc6+wBz4Ib64Rv
         s8t0YoJFmUEARkFa7tkcB5A08c/DMqC1H3R5QTxMlEPUNGDqtj8Blw0/l5aDGgIB4+VC
         zLZ+CVJJ7gPeXSknJjQIzEUSGiKMhw8AsoblLN7FvlMAO9Xtm5Uh+mHTLQojG4C2Mlk7
         BvvykoQhHIbXke4PW2TUqrxQ4zcxeTgFDHlrIDsIdU3wRZJqVCZqAaICOVJ/jd7HiZvK
         hE/w==
X-Gm-Message-State: AOJu0YyIdNpHkSGAPFk49xN06YTFhNHKvG+iuuv3PqxEjg0WdgBBscU5
	VARsYkkZBE+xpS5kD3+kNqOAr2o2Mpqq6E9M7g04Rog0La01QohiGRRqcMQWtxM=
X-Google-Smtp-Source: AGHT+IGz32kTAkA5ynkybexpbItl9ACZDWDha8XiKazAcgjhM6KAU80mOWXQxxn3FYYc8Ea8eg/eWw==
X-Received: by 2002:a5d:6d89:0:b0:37c:d4d7:ed1c with SMTP id ffacd0b85a97d-37cde3de128mr3488485f8f.4.1727784552367;
        Tue, 01 Oct 2024 05:09:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575de8fsm11549100f8f.116.2024.10.01.05.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 05:09:11 -0700 (PDT)
Message-ID: <822f317e-d4f2-41de-a6be-162ab79b87b3@linaro.org>
Date: Tue, 1 Oct 2024 14:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Exynos 9810 and Galaxy S9 (starlte)
To: Henrik Grimler <henrik@grimler.se>, rbredhat <rbredhat@pm.me>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 alim.akhtar@samsung.com, markuss.broks@gmail.com
References: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me>
 <20241001120130.GA6468@samsung-a5>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241001120130.GA6468@samsung-a5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 14:01, Henrik Grimler wrote:
> Hi rbredhat,
> 
> On Mon, Sep 30, 2024 at 06:24:16PM +0000, rbredhat wrote:
>> Hi,
>>
>> As a Galaxy S9 (G960F, starlte) owner I'm glad to see the progress on adding the Exynos SoC to the mainstream. Is there any chance that the Exynos 9810 will be added as well? There are a huge number of devices based on this SoC:
> 
> To my knowledge no one (individual or company) is actively working on Exynos 9810.
> 
>> I am able to build a kernel from source code, but the 4.9 branch is no longer supported. My attempts to use a fresh version of the kernel failed due to my lack of programming experience. I have created a document listing the components of some of the devices, perhaps it will be useful. I can send the ods file if needed.
>>
>> https://kdrive.infomaniak.com/app/share/1019122/185f83dd-e5f7-4224-bc76-ebc3e7ccb821
>>
>> Some device versions have Qualcomm SDM845 SoC and are already supported in mainstream. It might make it easier to add support for Exynos 9810 based devices. For example,
>> https://lore.kernel.org/all/20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com/
> 
> Indeed, thanks to the great work by Linaro, Google and individuals
> like Dzmitry some of the core SOC support and drivers that your device
> needs are already supported.  I think your best bet of getting starlte
> support in mainline linux would be to find others interested in this
> SOC and work together to add it.  PostmarketOS [1] provides a great
> community for this, and its starlte wiki page [2] lists a few device
> owners, and even links to a WIP mainline tree.
> 
> I have added SOC maintainers and the WIP tree author to CC, as people
> tend to not monitor the list.
> 

Just FYI, the original email was sent to me already in private and I
responded. Although I am still confused what is actually the question here.

Best regards,
Krzysztof

