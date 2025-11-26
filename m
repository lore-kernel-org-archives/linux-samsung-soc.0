Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410292D6619
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148903; cv=none; b=A7PLUJp9y0Mu9XFdHJJuXusoMVdE8oe3nCNMbsd1OoMgvfiErQ+XK3hy82JCMu3gXmNq6zZSwSnxTdEnC+nLgu6EZpjfRMP4fnaBcYCDCrL1zdbyyU2BY9c1SVfoU+uCcL7Ecw+tADbMGjQXdefBtGOYycgOmympy6odHFefc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148903; c=relaxed/simple;
	bh=CF1ETXPe1PugLHsavs1SU5GJc3PtBPy6SGKx8TYf/E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCkIl6dO0C6eUkqFVT25/Oa1UlZzECbGM6/NynlG4cWp55sb235D/Px6iMvk3/TlJC/kgk7fH9fcGkBSFgkvPm2KoZqKit6NN9Gq+aAKk8WmPO8DlKhp2kAO6hdzlISsGWCldVjAM+TOLZJaQC+fBA7L7if9B6jqqwBiEXi98hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pURHCUCD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pURHCUCD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so56625495e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 01:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764148899; x=1764753699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPZr/XNvb8iNxFUbgomB4BCl6EzqteQOa6tv7krwi+o=;
        b=pURHCUCD7dh5yvlceB996fV6H2s/Jtxu3c1EEyE0Vlu5xeZWdAPQygVhTSkH315hOE
         FovsgPHs5yrrSO0Q4P40ZbKcZfO/dkDE8oS+FRytE2m6qba+soWAVet2lzpL2teADnO8
         ioMe4wzEWYuRkSkJhG2Miax2CP6ccsVzIPdhLgWAheV7jwmMKajm34o2atuc4R7Gl+5C
         NrqDwYcfz+5v1xsqzY0w4NeMD2EtJLHr/8tWYpijoDEHPPqs2/+wpz0xPduuwyhK29eR
         iB2Lutu5lPRdRv1bwP7EVf/ayndHvx9YG8qJvqBJYcuJJO8SSI1PiT4V9DtN/ATiGDF2
         zNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148900; x=1764753700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPZr/XNvb8iNxFUbgomB4BCl6EzqteQOa6tv7krwi+o=;
        b=a0OI/Y0ESDe9vO/+HBWiZH15df7T0OAbpLiAZHQSUIgA8EaqpyJGcjmSyj9NvBDhqQ
         BQvFezZEx+29jqkcDd231BBCC+yUU8MGrCKfyp9/QKnGRJDiJQk9sIAUwh0GHhmO4GZy
         tkIXDoaxkilaiAFBeBo6u2/NBePTnCKuchHO3xswybeQB2XWwyxcAdFwlUWySKF073V+
         ir/iI0MFAoKCmwjLyORh+BYGb+X01Up4zL56dBYFciOfhFHNiiJYZNbT+GvylMUe2X1F
         USu6EpsLqWVFC2ovmE7WLhSVtoZal6eXTvcA3AtPEFx1u0xXpa9Lu0jffHZi6I8Siwdh
         JqUA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQWvEXutvADcG5e5nqELSxu2/5dOQMu0zkKizhQQz6u+5cCUWne2iS1rD4DhpfTaNE8x/r5OnzbxVrqwINowP3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94NvRi5Re0Vru/tS3W09K6Oi/o3cEbzLr8rnA5ZZlBvbkYS63
	kZyjP4m2L+ukxDoY7CBMOCfkcBS3qDe6Hu9Te8p0vpO0VvJ+PURPVcPDQBXgsk8XcT4=
X-Gm-Gg: ASbGnctllJFp0ag637/7aPbBLuBY5WKjDcgi4PKK/zuuKhlmnhYC+8EIEk6HpDBv7Gv
	l05cWuuMuqUmhkZRydlAQOhFVMiVH52oxY4McHjwPq11QTwHoEBmzWe/BXCjV6JzewCON5LnpEe
	4xeVG/OTvLHuPiwILrt0FkMQSPD5/+Azr/Vrnj0INQRupvqkqB3Kb0VP79qXkHsEOvmoq36fNK1
	ps30Dq34oowVVgr5Z7tXEDuNbwmPyb+uqvlc+A6qFn1Ueh8wlb1b+y3mVET/bQA7ZJt6BwNunv9
	6AUage0TngjZiC0TGcCl2dksgViLNkGUBX9VYFNjbVGBPL1jAVdwFSZlOWxF3kHJQebOA60A2eA
	mBG6BF5yBT9OZm1i1JdMuS5OXpFe9axYgtJ4+OKo3nw6xnpuaFeftpwW47DyZjCIAorsg8Inb/D
	uj220aXk0oYhTDh4AR
X-Google-Smtp-Source: AGHT+IHu5mjVSJftAmmd8mkUWGgVLFw7C7td0QXt6C37n/EMphfyxyx6zRNAnmmqGIwLaBqQANGUSw==
X-Received: by 2002:a05:600c:6287:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47904acae5fmr50881635e9.6.1764148899568;
        Wed, 26 Nov 2025 01:21:39 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm39152885e9.1.2025.11.26.01.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:21:38 -0800 (PST)
Message-ID: <401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
Date: Wed, 26 Nov 2025 11:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Zhang Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, youngmin.nam@samsung.com
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
 <015501dc5ea5$0c7dd460$25797d20$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <015501dc5ea5$0c7dd460$25797d20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Shin Son,

On 11/26/25 9:19 AM, 손신 wrote:
>> Looking at the exynosautov9 registers that you described and comparing
>> them with
>> gs101 I see just 2 differences:
>> 1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't 2/
>> EXYNOSAUTOV920_PEND register fields differ from GS101
> TRIMINFO_CONFIG2 doesn't exist on eav920 either; I simply misnamed it.
> However, the PEND register indeed differs from GS101.
> 
>> Given the similarities, and considering the EXYNOS9_ registers rename from:
>> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-
>> youngmin.nam@samsung.com/
>> would it make sense to use the SoC-era name instead of specific SoC, i.e.
>> s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9 and
>> gs101?
>>
> First of all, as far as I know, EXYNOS9 is not the same as exynosautov9, and exynosautov920 also differs from exynosautov9.

See also see this patch, or maybe the entire patch set:
https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-2-youngmin.nam@samsung.com/

It's not just autov9 and gs101 that have similar TMU registers (with the two
exceptions AFAICT), it's also exynos850 that seems identical with autov9.

All seem to be part of the same "Exynos9-era" SoCs. Let's think about how
gs101/exynos850 TMU addition will follow. Shall one use the EXYNOSAUTOV920
registers? That seems misleading. Shall one redefine the entire register set?
That won't fly because of the code duplication.

Thus I propose to use the EXYNOS9 prefix for the register definitions, and if
there are SoCs with slight differences, that can be handled with compatible
match data and specific SoC definitions, but only where things differ.

> So while sharing a common prefix is a good suggestion in general, I believe it's not appropriate here
> Because the register definitions are not fully compatible across these SoCs. Using a common name array may introduce confusion later.

Please reconsider this. Maybe Youngmin Nam or others can intervene.

Thanks!
ta
