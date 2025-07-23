Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D92798F0;
	Wed, 23 Jul 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258901; cv=none; b=m6NXvzFNthmRbDGAjNkKORgDHe0OdM6ZkrbUon3OGAHn+ei8WsQ5c+E8URc5ZhS2zzuOAebUwe0YfouLrpe7NQ75aQiSsGZYAZIxWlWf6zDBhGBSeC9qsIqS8JOgujzlK3LSguZPBttptN7SV34sYT+bIeYBN9tJqSpiNFsNcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258901; c=relaxed/simple;
	bh=sfpTYtdkBYuppEo28rItFBQKCJtbU8M1w9WDjl8Wm6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjUoP65s0MSqjSV/uJOe966PcmKRgEaLpMxvB5HKYENQxUIXnz5vq43Dtp4IAbGqf0Z8sftkHE23a2cBnE3hc5CoXwvEwX78FPpQ7EKHRKkrUjhVvEBTWRc986ReiJ3yAhgRBTURW/i7fvr3uNMXw4445jsaPi8ifYax2Bcvqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuW1KbkL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuW1KbkL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae36e88a5daso1101235166b.1;
        Wed, 23 Jul 2025 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753258897; x=1753863697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8F3pQMHzn57/+12Z4uNur6aObL1w83B09wCI7//oKZ4=;
        b=WuW1KbkLBChn051QGElkET0TcVsZG1KrIbozB7SON2ISK0NxClv35ZLgamY/Mo8fbQ
         fmVI2DgRE4hVeXe5eG3MuF8/+7WtjlW3OXZhlBYlgE0/MARVdX8h5t20t+y9kOgIg6Sj
         PRH9q33+gFiazeY4eeWmBeUXzE8BbpPbm7DbTdtddSph+2I0UXor3zTVMzW99gC+PvET
         MmI09LmrYFdafys4uaViOh2WUJj46PE3kNEBlCjl+7eYGHtMlOrSiceHLw5Fy4lMgvAn
         WyFXH0aqdcsoHUwoQrh76WG+HDmLGeCAaOY7av9oenC8eM/PSi8pMnT1l+WqbT15+eF+
         tbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258897; x=1753863697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8F3pQMHzn57/+12Z4uNur6aObL1w83B09wCI7//oKZ4=;
        b=cyvrYL/W5eCoAVhz8E/iSPxROBDG6IJEI6JfjpGBKnEpPCEH/apzmktsqeFYW242zZ
         Xq1mxO61TBy4YR2CoxUCuUvLM4K0u1TOCSuyzk+mKnhetRUWtZj+QhQ02fHis+MceGXs
         /XTFeh+72VnITUdhV4Odaelemd+jLl656DaQGbxe2rU1huCmyqJq/hR9ZJaxYQ2z9fFO
         3Q4Xjd7S0I4ggP5hiIbPNd+f/iV76R5VKXU0gwW1O6mZuz+wvCmPFQmvkLTA71Dy0x9i
         OyhjAgILtnEv/Wd9+2rG79EviCD2QuG4qKrr/Q5cJUXnAuLATMMCAylHNFMEMygqEo/o
         cGuw==
X-Forwarded-Encrypted: i=1; AJvYcCU58/lpzJK/woGtsLrZvYe2QKep/4LDPvQx19mdQMniePlF94NNx2t7CTO9QLyfn2lul90DtfQQkr7SlS8Lqbj8DWs=@vger.kernel.org, AJvYcCWsuT3I0Fb87wGQySxUNZTaHdhCKyLPHQovWdXQ19yQNoPajpJsKnhzmszjeb1L0pc8IPrka0Y4UEni5/7j@vger.kernel.org, AJvYcCXhQp/szHrpzuzIr+rOPeATYLx6m1iff0QkWqqYH5PQPBDPCEZ+ONJ+Tqr06lliqGgqYzua7fAuCRgD@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJ6wslf03S6E8d+/lYayhSxOy3dClxYx2XpKSKlu8awcNNhNd
	YsypDRTW2i2pWyFpyEKbmLUq1PiKKgTOBJHL4yBtglotm8rB64b53Ygyj5WpMA==
X-Gm-Gg: ASbGncsoRev5InFAeLLiZFKm1CXUNn/PHhe0sdMFwKtx+2Sn/5bJkkc3WY2KrI9qrgf
	3ms75URYAwhlkqpSmlouC8RcAJy/Y9JSxRCajCQZfopngcl/erX9MfItht8pQogkSK/nN17Vafv
	wK50Ls2tF2AhZe3taomcHGnp+6eTj+0sp3t/ZAITdPOyMRfGG9/OLl9hHVqb7NINJYXCrc/EfJQ
	W7UgaJX6npnNIfkJKMUmt1Dj2SsnTqUBIPp1u566W8DYrfVPJxK6KOkRjIZVAvOmdCClc+vepBU
	l4ZZjTdvMkuGV6mJ8jtZgQx8K+8MxpBMfDlae+9QLauF7LcmDcdOXknFDqULHVE+wJyV4AO3QaR
	FjbScROApAwacTqSTASP+2vz6P0OrqznnPWN3Dbj6ExsxyJVpObzkn4eBFdsqjOqHYql8/OJR0A
	9PuIWGJFeqSZI=
X-Google-Smtp-Source: AGHT+IFkHHbkODiYmV8sFSEk8SQuRIN7oO8/OiWydt0ur7eqjtb3ORcfV4x9u44p8Y75cAtJBRVFpA==
X-Received: by 2002:a17:907:971a:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-af2f865c46bmr173733466b.34.1753258896982;
        Wed, 23 Jul 2025 01:21:36 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7e074sm1002144766b.124.2025.07.23.01.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:21:36 -0700 (PDT)
Message-ID: <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
Date: Wed, 23 Jul 2025 11:21:35 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/25 11:15, Krzysztof Kozlowski wrote:
> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>> Some device trees, like the exynos2200 one, configure the root node
>> with #address-cells and #size-cells set to 2. However, the usi binding
>> expects 32 bit address space only. Allow these determining properties to
> So if USI expects 32 bit, then why do we allow 64?
>
> Switching this to 2 means you use 64-bit addressing for children

I don't, but the main point was to avoid defining ranges for every single usi
node, because they are a lot.

Best regards,
Ivaylo

>  and
> allowing DMA for >32 bit. This should be the true reason - what is the
> address space and DMA range for children?
>
> Best regards,
> Krzysztof
>

