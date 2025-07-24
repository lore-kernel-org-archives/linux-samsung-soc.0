Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E69239581;
	Thu, 24 Jul 2025 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341855; cv=none; b=TDHDAhYt8OnuFNW95x/G3OLnbNMoreHZYmhvDJQw9y0l+d8uQipQRuHg1/3ry7YN3ZGeMvIBHcn6dAR/PiF80WSMoJQlVFkNeSxiqPPkr4LmVfdOECAIG9Qj0dmnU2aiCijJN3MPk5f7bLrH3kq7l9W3WG7XHEEjFGNQS+SBE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341855; c=relaxed/simple;
	bh=dUyLN2kfotLNLyofConSuTyLmjoZe/xUKspDkME1Jro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iv0/QtW4bPRgBWSwoG7fIUFD8k2rpIIV+/Zbub0p4bp7sNTYI5JwAb5vP1FHii+6nXTgK97ZvqO4Jow+7MRhdDPNxXHPdPoodNt2QdPtzMNx9IZ2Rr1+puTsB25MkyJinGk1WXnYNkmoRLO/Hm/20YKvHb+qmeRSi4YdbHczCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp13qMKX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp13qMKX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so6310015e9.0;
        Thu, 24 Jul 2025 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753341852; x=1753946652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8vH8JfnKijTJB45W87819LYq2SjUU3QszzdXJjSPeo=;
        b=Bp13qMKXrCU+BYsS/+gRMgzyJrbmU9N0qr9a6lyaUMv5bUggUSfb7sqDMIllgxYLVO
         DL1W0EmYAtjuBMPyAVpx/+ntXm/9KSBsoK5qJ2+BiAFgG3g7RM43z/3BbefobbBLmyEU
         AJYSyxd7Tg3elwSSL8pz+bgNVFk2K9YxPPXDLryTW2PtrsMlGb+w52pLmZ2FI8PFm+Xa
         oIb2oTh9cfyvHFaKR6aXLeINYOgbh9WEFQFhZaNojprXBWuTBj4BwfP7MluTMhi5N3Cx
         huKQ4czLjMgUiZb4T5WLVKC9pRFymKCwZ4X1o2BFvOnIowO1CHKoeCG/l27ZbKWYSkht
         P6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341852; x=1753946652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8vH8JfnKijTJB45W87819LYq2SjUU3QszzdXJjSPeo=;
        b=bu6WAWzFBW7nWB9y3yL6n52d8taZRVf2o7T9GUu565767khYDmvcbiyrOPaTYxcC8I
         qxOck3PYXcPB4UJ8yaaqvv5oGuaxWviv2faspph+5bBRs4wHgVj3BXgoDTGi1zVgf2rS
         3kY3Wk0CsGCfjliDc9ToLfHd8QJuu1Y/ARPISZkuI2hRk2ZTOnGPctX70p2EhPczfTV2
         f66hbcTlGySTVxIWTuRGbi6PjpJ9b10XlgwpqFHQSBw1usqSPb4hMXx9bXinYq7sSkbm
         XGYfX0wOEELJNbSfWnyk3AFd3Iyt1EF3HMX66y7kvjtowEhCUkzR3fUeLUJTAob8v7Aj
         mW4w==
X-Forwarded-Encrypted: i=1; AJvYcCVaPgVroIh947akSqShDYWNFsTfEMwOsV7Wt2Ptn2sfXyfurlS9uTJPKWlEvlDH6Hd+dxM9QOK1qrLrEjMg@vger.kernel.org, AJvYcCXK8BGIlFlA3j2q/rrJ4jGjEPQAsC8xxzfZv9T3PnyqjAbqlfhXVia1YWo/RQr46RnKVmxjBA7uEmqc@vger.kernel.org, AJvYcCXN+UJQVm923/eDdJG7HKO6zuwxlUrPJ1fUWwAnvRdPMbGXQ+4vzBSjRJSeo9fOUidoCzriiwUkST4fUFnnjxE/Le0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KbpUy5IuMgusRYWMyXedypqqN/gu5i5gMiv9ngFiZHOTf3XB
	DM6OR8s5aqW7nuIxg/u0Kn9QnmZBoLWnK9ErFrNcuqB0bq4vJsVrkm8hPILO4Q==
X-Gm-Gg: ASbGncsdng7IymGsCKF4ilOPtX/tFKhy+iZmb97okKwK0F6+SbUuqs4plHlpSNyXGGf
	d2RX7OgPq4lNPNiAsIetOxxyN1My1EpBQF70/2jnRjNwkqRqPAHICUZmAIlIXceDghbM7hNcNss
	/HkabYDYdgr3QTs8py8tvv99H9aJb9L/U+M4KRhj2GwFu/bhFl1hntsjNGyjSOBJTCbo/nLd48j
	qxTfoGM/3OBHJJIEjMPoNqCRYA+L+xDTWvdQx2/g9OTbJljUV6FvGaYoflntFAKGMuVslf7AElI
	Rf6upfGBzXCLPPhFbWJxE0x1MDjhDaHvwdMJqnl9THLMAzJZqVOWq/cVOO9lrxMjKqw++jV4YAw
	dUykpAZAsUYxEuf54oQ7lVa4i4wM8jOBHHAe6TqoVR7ZGzOJu5blnCahK9O+/NYG+e/ZXQuMEnw
	NH
X-Google-Smtp-Source: AGHT+IHJ2yzAoWayRGrUS7izFIhkrxGchhvycroHp+KIHa7mpc3HqJKp+E42uRSyubs/rDl8+yH73g==
X-Received: by 2002:a05:600c:8717:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45868d4eaf7mr55550145e9.30.1753341851836;
        Thu, 24 Jul 2025 00:24:11 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458714605c2sm3269475e9.19.2025.07.24.00.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 00:24:11 -0700 (PDT)
Message-ID: <f5022fe7-c3f6-4bea-bb0c-98dfe461d555@gmail.com>
Date: Thu, 24 Jul 2025 10:24:10 +0300
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
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
 <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
 <CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/24/25 06:02, Sam Protsenko wrote:
> On Wed, Jul 23, 2025 at 3:21 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> On 7/23/25 11:15, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>>>> Some device trees, like the exynos2200 one, configure the root node
>>>> with #address-cells and #size-cells set to 2. However, the usi binding
>>>> expects 32 bit address space only. Allow these determining properties to
>>> So if USI expects 32 bit, then why do we allow 64?
>>>
>>> Switching this to 2 means you use 64-bit addressing for children
>> I don't, but the main point was to avoid defining ranges for every single usi
>> node, because they are a lot.
>>
> If all MMIO addresses in your SoC are 32-bit (they probably are), I
> think it'd be neater to just make the entire "soc" bus 32-bit (so both
> address and size cells = <1>), and map it to the root node's address
> space with "ranges", like this:
>
>     soc: soc@0 {
>         compatible = "simple-bus";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x0 0x0 0x0 0x20000000>;
>         ...
>
> That's how it's done in exynos850 and gs101 dts for example. This way
> you could drop all those extra "reg = <0x0 ...>" in the child nodes,
> also avoid declaring "ranges" arrays in each USI node (just "ranges;"
> would be enough), and this patch won't be needed.

Yeah, but then we'll have one more DT patch that is way bigger, changing
every single "reg =" in /soc. And the device tree for the SoC is merged already.

I do think that the neatest option is to avoid that and set an enum in the
binding, as otherwise we'd be making a stylistic change that has no
impact on functionality.

If we want the device tree to model hardware identically to how it is, then
we'd want to define IPs per bus (which I cannot really do on my own, I don't
even have TRMs).

I'll leave it up to Krzysztof to decide what is best.

Best regards,
Ivaylo

> Maybe I'm missing
> some details though?
>
>> Best regards,
>> Ivaylo
>>
>>>  and
>>> allowing DMA for >32 bit. This should be the true reason - what is the
>>> address space and DMA range for children?
>>>
>>> Best regards,
>>> Krzysztof
>>>

