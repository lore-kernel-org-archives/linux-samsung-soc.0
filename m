Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007D849C;
	Sun,  5 Jan 2025 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736079043; cv=none; b=q9QEiyxfkn8jXcB9M3D8lkJOcrb7vVTTC8c0A7WvZbXb7IBOUbDxxePoRwW3bErOjChRcT9XvXNCjPDAf0FQlXvTGuj90FFjd/APO5aXzC+IED3gfN2+cv6vhcYHfnCQB476+2GwhQZmrlE9c6msJhiKXJct/OHfBD4qybedXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736079043; c=relaxed/simple;
	bh=r3L9P0GPLTgljRUAb07LuCTzKmiuIZPgr7n0lswmU/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS1n84ozb+Z5/gPvzzx1VXbeBzZYMNQvKcieeIsZZ0620wiMvJbM2sksS1yI0qRK29LYUCDhPG3fCy8jqIiNGquhmpr08M6HryKwPpOe87LjKZv2dMNgw8/+jumShKlRjZruJsGJYWl39HS6xLu4fD/UCbLxeyxMn09PpJ+igyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6d1xUER; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6d1xUER"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3003c82c95cso114028741fa.3;
        Sun, 05 Jan 2025 04:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736079039; x=1736683839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIR2WUB7iDaUANGVgvlHqJmyWXuaYhgnizl4jAm8L5k=;
        b=B6d1xUERQX4VU5PIDRhcKhse7wY1RoEUS3604+TRr+OdjGF2uZT3phsHAvrT2v2+QF
         k86Zkhhfi4z7cAw80ZjPKlk2Y1n2e9P8KF8Un6t4/FTLnt/V3d1zbtgqCdocktWiAqC8
         cvaxykPhDjm1HWGAMMusVjBjyqqeAwMlWhh+2xaZrnqRP90/XvPnySZe/z+SwDVx/SeD
         VC+/fEll/qTUA/6qSGL51HyGuHdcX0x6ovwg5bznq3J1u8wvN+O23yHwTX595ZuiXPtL
         HqZeybRKKqiKjZ7woDviuD8Jwg7a8SqiERthRESL+leEYNJ0gs0fA2H2qJBv61wt5wcH
         98tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736079039; x=1736683839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIR2WUB7iDaUANGVgvlHqJmyWXuaYhgnizl4jAm8L5k=;
        b=kBPpB8ybdGsweAVCX24/iw+HIib1tciiraOBqbHD96yff3P9kgO52KMtMoP6ZGXq50
         mpzWhoWavSw9nGsslaUroBnPEdZGU36Wpm5hmkl9MhAqKWqDHCYkw2mOX6BNRK0rkiDG
         uw53fTBL6wKQN0hbQeTGF9+kRzhM6lzay4b01gT6WEzPIp0102npLc6qW0uqIZvWVj5s
         v3LJLgIPxvoI8mCvaWD7AyV9gbst+lRAzadXhy/uorCzwj/p4KsLUQ48r6HfCerG0JOd
         LwhJ1vDqATe/mr8M6FmHOWUFfqnaxpnob93d1GrGLA+RvWVSuidxVBZUnjYl0mHmE3bG
         5M7g==
X-Forwarded-Encrypted: i=1; AJvYcCUTBlzcFIFfHZKo46CqlKqf9QJ41g9E37LzVlbw3s6S86S+a+fhTUfxR8blqbGOkpY+CxBZcGeNZrBslh4g+qGSQE4=@vger.kernel.org, AJvYcCUf9HeYXkttSPrY/hc3ASeynzB3LMy5RbgZAlvSIvfBtza5zgGR0EMeGSwX34ZrTBvmFQTAdCiI0nerzhhg@vger.kernel.org, AJvYcCV1r26jddqMSfpGHEl896zxc6V7EeMvq37+L5XQpQQ1JseQfgIB5+j/vFU0DkQA4nBl1go/DpBJLXM2@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLdUu/0L8SoZSYeJp4gHplNNf5uzZTYOfJSf+P5c7QRKW7R7J
	zIwEmCNX8K1Q28JTHZRZJXrhz770hL0PuzHuT2mMbYH1fNKnqV6bo2PbEpcb
X-Gm-Gg: ASbGncu3Qxwdlcnt9SRlGJp5kGqwrqCBYBP3TuH0GZtwB5bfKYha+JV/+coIsnuu0TZ
	84Y3IX0faLZ8mt0i4K721YmYligoGUubtVOcGiBoqGSPXA+wQvznQVLySf0lRKXxbFmJ6feepaN
	pqcIDKMD3G2bzyAlZNH1tLNxFaUjYwKtbtT6ooj4gkhD5wRCNm2mP33DSNxtH4BGe7dWHqiQXWE
	IQWqGEMA0Y9w1c4jY6bOaoIEbWNhFDlFbnJPDYjhC+LfJ2W03jtkL9N8AjHlXwemIc8
X-Google-Smtp-Source: AGHT+IFlc24ByTKQOGlSaCSC9vJUmoKQHw2J7odDp9pVsfiTWElFZ/1BMjPvv295W02VrkuPrX2Row==
X-Received: by 2002:a05:651c:2107:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3046860ed27mr204531111fa.25.1736079039172;
        Sun, 05 Jan 2025 04:10:39 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082d56sm52973331fa.106.2025.01.05.04.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 04:10:38 -0800 (PST)
Message-ID: <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>
Date: Sun, 5 Jan 2025 14:10:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com> <Z3p1IV0rVH9dPQ_C@debian>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <Z3p1IV0rVH9dPQ_C@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Igor,

On 1/5/25 2:03 PM, Igor Belwon wrote:
> On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
>> On 1/5/25 13:16, Igor Belwon wrote:
>>> These nodes were sorted by name, but it's nice to have the same class of
>>> devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
>>> This keeps consistency between other Exynos SoCs too.
>> Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
>> apply this change for all exynos device trees instead of waiting for other
>> people to apply it separately?
>>
>> Best regards,
>> Ivaylo
> Hi Ivaylo,
>
> The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
> merged [1], and there is a current patch to fix it on 8895 [2].
> That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
> sorting). Only 990 is missing this change.
I believe for Cortex PMUs it's also preferred to use the e.g. pmu-a53 
name instead of arm-a53-pmu. This name is at least also used on 
exynosautov9, exynosautov920, exynos7885, exynos5433 and exynos7 (list 
not conclusive). So maybe could fix it on all SoCs at once, instead of 
making individual patches for every one. This is just a suggestion 
though, your patch seems ok.
>
> [1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
> [2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
>
> Thanks and best regards,
> Igor
>

- Markuss

