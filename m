Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D115319CC0C;
	Sun, 16 Feb 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739730365; cv=none; b=FFyJhGQGz+itneIXl+AL3T4xAoYJwjqwLsLu+Ba8OptN+qDgHCZll9cUozi+rPihKgmQISm1B/pGI1WAt0kcmGSzfLetRr7P2EZFoN1ganlGBr/CeNW48lkpXIFEOhy+odqnkjWSeK++FGfBPL9Qozb6MHXfHpXQmgwzxiqyyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739730365; c=relaxed/simple;
	bh=wr+XCAgPgbGifaV9zuo3NuEbKxQ2q/ycgpn4NRzl2+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Az896elNg31gppilXasUnBEmP8iob0x1lEqLCOQZigm+oUTXp8Gda7g7cAGp0vzeiQ3cpIAFmL39Gu4z/tjLJ1QdfaRKIR4462uSV1O1zCJDLtXQEj5MxrJOD2CfrwWojMJ21m204dUThswS3AGCbRj9YFDV4wNG3IhnZqTHko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6MrxurJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6MrxurJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so1919510f8f.2;
        Sun, 16 Feb 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739730362; x=1740335162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6THbQSx/8fAHe9PzsDdfiskI2J1Cdkq06AblUO8EgA=;
        b=N6MrxurJjN8z8buRiZs72gexX7Um31Ns03LeMVyANjz9u0yCaVste/cQ0ZGuRsae9t
         dD0jVzVSVR+XU10gk6GjDqPIvNaGAK3nybcgfYGJ5trlixnMnfyaAJP8tUM8X6ttI0rE
         bHDDc4cbymx71lXCIzXq7GcpEp6NaY9hkWVCX8CkfbVvtryqCJIoQlNb32zyO/XmMppJ
         jzUy4zaQUeVFqTI4Ek2EOZ23tUdUDwFYGbpr+dvR7mLEfiaiWWGNzSl+Or8j/VfBtDca
         Ub25IXCz8wrgo1JwxfAaeJtsMe6zIonkoIU6F3+n0m0Tkq8CoeCXElFWNwmVtVRSfsw+
         EDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739730362; x=1740335162;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6THbQSx/8fAHe9PzsDdfiskI2J1Cdkq06AblUO8EgA=;
        b=IkoxBRo4PDws3lQYmska8SR/BbUcC/zzv4soIPB6DE6aF7Ygc3hJEy9TsJSxEvoYWc
         ZNA8k2wMVNIXT3yBgZWH5BYpAvqPSaFWCzCSRWasuBGPl/Ispl8aRL33UiSmEdM9S7fX
         wp8psA+IM5iXxzI8CovmKMnQQUHMnJESA+k4jllVaeAZG4kuOznHzP1vuD4gC/xSyUuV
         DSN/mICzDqe1OxvregSr2NWPFaLrTj8j25oCtMUX/Z3glQBIoGhx2nq2hYq1UfnRRNzK
         MiN8oyskz2B5fZB9mc45M1onUoqUKlx/he5Osz30cCuOnRFCCXD1hkDoQ18cTec1No+l
         R76g==
X-Forwarded-Encrypted: i=1; AJvYcCVxr8XcJaIrSYbbHed8qWlP1k+Nudd8K22BRZkskQQeAHOID67aIa0yNQ+Ok9/kw0b9RNL+I7PQXHSZ@vger.kernel.org, AJvYcCWc7OHeyHpHobzwcbJEheGEv0Kykze73FSHXb2cVBeQx+g62ztRH0s96FggqxKJAfopEiHYxwCPZErNKw1nw7Btfes=@vger.kernel.org, AJvYcCWfNG0M7deqsPIv4qN5kEO3ftCi0eEwu2GBXJht6PCaAOoXQhNY9LNuQeE6+cW49M5CWDerGcCt0Kb8FFDI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5KjupfA9/F2iLKnngsdttBcHfWPlGaLGGxJtdfeNhUe7UFMQ
	HGNKZYHp4jtyoBg8n+pOUjSxrPRFPcUA6+GhxuNsV0mpnyIvJsKd
X-Gm-Gg: ASbGncuieaXeU6S+UPmx9kkdTgEvHpdzkWeTpvxIqFsGv+EpWFLE6cqjitHInQ3kyxK
	k538sSBUwk6SgklF6lAW93Ss2mcKV018prtqVvayMNVGcJpJ/Z7Tjv+CPRV1U/u6VSTQpl4VboY
	SEc5PA3tQ1CDF2hn16VSTvE9GCdW2N2mTsZl3WAiBj2OhoByTzq0npBoB0d6pdBZFZnRWkbM3Nv
	kmqASqm3Or206qrDx8g+/tMUECM2BwhOMKz/umtiiiSQjGxQE0jsvbaJ4nVkH3Kgvx/PuTA8n4X
	/bUPgm+r4XWZgLXXJhINUxDh4FVv4vxr20rwq/o2rnSu5UragrNs0n8FXeibz7AK54kfsA==
X-Google-Smtp-Source: AGHT+IGr42oNfHQVVm7EhzTuFuuHWgflwzxpqf7PlmDhyAn8X5YOs8yIU+uV1nWQeu6T0SPpjYT2CA==
X-Received: by 2002:adf:f9cc:0:b0:38f:231a:635e with SMTP id ffacd0b85a97d-38f33f2c2cbmr6494370f8f.25.1739730361813;
        Sun, 16 Feb 2025 10:26:01 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7df2sm10192625f8f.84.2025.02.16.10.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 10:26:01 -0800 (PST)
Message-ID: <aede22df-8930-4854-8269-6cb12b8fb2b8@gmail.com>
Date: Sun, 16 Feb 2025 20:25:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
 <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
 <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
 <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
In-Reply-To: <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 15:57, Ivaylo Ivanov wrote:
> On 2/16/25 15:19, Krzysztof Kozlowski wrote:
>> On 16/02/2025 10:51, Ivaylo Ivanov wrote:
>>>>>>  You need to
>>>>>> integrate the changes, not create duplicated driver.
>>>>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>>>>> if we want to follow the current oem-provided initialization sequence, or
>>>>> try and fully reuse what we have in there.
>>>> I think it duplicates a lot, so it won't be clutter. We have many
>>>> drivers having common code and per-variant ops.
>>> So the approach to take here is to make a common driver?
>> For example: one common module and two modules per each soc, because I
>> assume some per-soc stuff might be needed. But maybe even these two
>> modules are not necessary and everything could be in one driver.
...
>
> So, Exynos2200 has a much simpler eusb initialization sequence than what
> is present in mainline for QCOMs. I still don't really think the drivers
> should be merged, as we aren't really duplicating code per-say.
>
> I've already started working on merging them, and my current idea is to
> not redefine the registers once again for 2200, but rather make an enum
> that defines if the SoC is a QCOM or EXYNOS, and select the register
> offsets dynamically

Never mind. That's a bad idea - after more digging way too much bits differ
not just the register layout. I'll implement the init/exit sequence in the
qcom driver separately. Sadly I can't reuse much code.

Best regards,
Ivaylo

>  - similarly as how I did with USIv1. If a register
> offset is not present, it'd just not do the write. My guess is that this
> will make it work with the qualcomm init sequence as well, so it'd result
> in even less redundant code (apart from the eUSB tuning, which can be
> omitted for now).
>
>>> What about the current modelling scheme, as-in taking the phandle to
>>> the usbcon phy and handling it?
>> What about it? 
> As I said in the commit description, I'm passing the USBCON phy as a
> phandle to the eusb2 node and enabling/disabling it when needed. I'm
> not 100% sure it would be adequate to include that in a common snps EUSB
> driver, as it seems to more of a quirk with the exynoses. But then how
> can I model it so that it's correctly described according to how the
> hardware works (as-in usbcon "muxing" between child phys, in this case
> eUSB and snps USBDP combophy)
>
> Regarding repeaters, I still don't have the TI repeater implemented.
>
> Best regards,
> Ivaylo
>
>> Did you look at the bindings of qcom snps eusb2? Are you
>> saying you do not have here repeater? If so, then this phy phandle might
>> not be correct.
>>
>>
>>
>> Best regards,
>> Krzysztof

