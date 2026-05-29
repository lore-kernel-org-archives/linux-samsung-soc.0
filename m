Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733453D2FFB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053628; cv=none; b=ltLWY2+ejuYkfKnal+bq+y7xINbXxH7aEmscidOy2SstI7mfmiJqAkK6nVN+U71brFFuEhqP5dfTmn4IMUdDIlq/McThWrXPwhCCS4SPM82Ql+A6Srh1lzpWml0L1OMrB01PfhUVR/yV7NCSMjfPNyF4G6PXbN+F/h9lFortrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053628; c=relaxed/simple;
	bh=pd32XOCS7yV5a9RhUSykxcYh8xaJJjXibHtl2zqWdHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv3zRoZ0PMku/V+7OZFyaWC2WS+IzB6XOB/SoBYs9PidKZWXXkgO/yVCcDfsgUYKOqTMnVzgLesxzk1v0qqkx/C1tbhM/1wboPP8RH/ZznyJX0o8ORBJ0KEUUAJgZPCSvRtnL01CLyegrDRBnsmtUHyODxGP1cEroXtkILKtxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8DVz5W5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8DVz5W5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d146705b4so146125865e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780053625; x=1780658425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRQnl4cL1WBl6UH6DzyzccF/izxjjWzeBGgbQMxLsH4=;
        b=q8DVz5W5d7DRvIpVlwz0JxelhelTwuDSjKuMjztDr0m4rhaDAdap+7Bmwlwc7X2qPn
         cFSQUqMWBzaNGVV5cToPLfzXMZBwYJIzGEXJMZ+00upyPjdhiFf2+njDt4NouUBzHJec
         IHM9quopiOWKyiPXEu4fQuTgRTNhAdfSt3xe9dbhmQAgE/sYPL+ghdz2ScQqUByz7QBz
         OnGXfZMr8Z+/zoz2GakZgd92vHZekP+yby3+S4b4KnFI0dS/Wqkdj7q8LtXKY/Vegb2s
         aByE1SMcQhKHb1lZvKOU/MlwNAOpSeVpniw5+f1K85xXpBGRg+BdGWEbyWLbvxP/UFQe
         Pb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053625; x=1780658425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRQnl4cL1WBl6UH6DzyzccF/izxjjWzeBGgbQMxLsH4=;
        b=aJvoC1qpSsAxQiffrIk8YzbrJ3K9La1A3Saq7tvLW/yv9eLrgoK35Fl/MN8CMiXZLi
         cJB/jkMYryabfwlkHowGMD8bmpaks5cYG2iFZKUfiG6cocBwgt7s93/oGM05/MAjMi8O
         r2gaguu5XLTm8j6w8PLQGtVVHkAL8yOogWoVLv6vXs9nQV/CEMp0qSQ1gwoEWtXcLWXN
         aphH62XzvgfuidW0sh9ZJuMnWnABY495nFzxhqT182XTAS11pd5xLDk0QWSwh7u5Yhu0
         bE3ESwYuOViLYs/wfKCEF1HIhmGWGGghB01+7sbpzYrh44McMXhKHVIHuKruS+z0zggC
         xqug==
X-Forwarded-Encrypted: i=1; AFNElJ9uMkYfL6MUF/G+lwsJysZByHP8WNMw0jm865mNrmXxZlYL75RzPxNJ25MCj/vhZmYiz1rBWWuiP8Mm/c6gVnT8FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/oLEowJm44juX1fF6zMINXPVaWKxUO5lLgN2zMVzybATL8al
	pjV7FD0v4J+DAVLd4cOQua2iBEhvAzgdaps6Djz8kvPwl1c65wVt6GQJCiagrVs//cw=
X-Gm-Gg: Acq92OFvv9jXgNP/kz1Dh4qIVo8vPMX06R19pRvImFS++cuF8XxhGz2914dzWloOOfq
	x/j1FScGRYGd8AG8TbFOZHPDXWlLQN9mbA0iXN17pd3OECOKn/jd18B3vgUifSZUMbJCS/JnHIn
	zsktUK7r9QDsxljNh8zoyhz8WH0C6EDIwi0t3B/MG3boiCr0/eERuwBx2lcdgbJWI4dIM7RVg3q
	BrVprNImtnIcuyawYJi/r27kz3fnP8WFKVtpyL0cTx1H6jaJNSEkpm27v1bLiNuQElxel1CuDiG
	uM1eYB/4QIiBdLQ0tay3Vr+t6AlqW126dSj3kwUirClwP2CeAjfUn0iYdqcFYCLC6K4zvi3wxBP
	qW1dC/LxByRDAEUyndO4NugL3mcAVgX6eu2OI6Xm2P3EYhx72IdI55nqcal1JS2yY/J5U0Ea3A3
	apkYmjqwZsQpqn3F4FEQTOca7MqgDVB6qdWuYMSWjbSA==
X-Received: by 2002:a05:600c:560d:b0:490:4ee0:82f9 with SMTP id 5b1f17b1804b1-4909c0920c0mr32909035e9.7.1780053624779;
        Fri, 29 May 2026 04:20:24 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm3257061f8f.16.2026.05.29.04.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 04:20:24 -0700 (PDT)
Message-ID: <ed771a16-6241-4246-976e-48349e544b5b@linaro.org>
Date: Fri, 29 May 2026 14:20:22 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
 <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
 <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
 <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/29/26 11:25 AM, Arnd Bergmann wrote:
> On Fri, May 29, 2026, at 09:47, Krzysztof Kozlowski wrote:
>> On 28/05/2026 19:44, Arnd Bergmann wrote:
>>> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>>>> Sashiko identified a silent data corruption in [1].
>>>>
>>>> In acpm_get_rx(), the driver reads the response payload from SRAM using
>>>> __ioread32_copy() and subsequently updates the hardware RX rear pointer
>>>> via writel().
>>>>
>>>> On weakly ordered architectures like ARM64, writel() provides a write
>>>> memory barrier (wmb()), which strictly orders prior writes against
>>>> subsequent writes. However, it does not order prior reads against
>>>> subsequent writes. Consequently, the CPU is permitted to reorder the
>>>> writel() store to become globally visible before the payload reads
>>>> have completed.
>>>
>>> I am very confused by this after seeing it in the Exynos fixes pull
>>> request. How would anything get reordered here? What I see is that
>>>
>>> - The SRAM is device memory, so any access to it is architecturally
>>>   ordered against other accesses to the same device. Even on
>>>   architectures that don't guarantee this, Linux I/O accessors
>>>   do.
>>
>> Well, __ioread32_copy does not guarantee that, I think. That's the
>> relaxed version.
> 
> __ioread32_copy() certainly does not guarantee the ordering within
> the block, and I think you are right that we don't properly document
> the ordering between a __raw_readl() and following writel(), but
> as far as I can tell all implementations do provide strict
> ordering here because either the MMIO load/store instructions are
> architecturally ordered (x86, arm64, ...) or there are sufficient
> barriers in the writel() to serialize the __raw_readl() as well
> (mips, alpha, ...).
> 
> [side note: there is a difference between __raw_readl() and
> readl_relaxed() here. The _relaxed MMIO operations are required
> to to be serialized with each other but not against memory
> accesses, while the __raw_ version used here provides neither
> guarantee]
> 
>>>   after the read (because of the data dependency).
>>
>> I don't see the data dependency regarding the write. We read 'rx_front'
>> and 'i' in the loop. The 'i' is used for subsequent read (addr = base +
>> mlen*i) and that's dependency, but that 'addr' is not used in any
>> further writes.
> 
> What I meant is that the store into the target memory buffer
> (xfer->rxd or rx_data->cmd) depends on the data being read from
> MMIO first. The writel() guarantees that this buffer is visible
> to all DMA masters in the system and that can only happen when
> the __raw_readl() has provided the data first.
> 
Thanks both for the detailed explanations.

I missed the data dependency chain. I focused too much on the read
part in __ioread32_copy() that I missed the RAM store implications
in it. The RAM store is forced to wait for its SRAM load, and the
writel is forced to wait for all the RAM stores. So the entire
payload is guaranteed to be visible in memory RAM before the writel.

Maybe I thought about the reordering of the final __raw_readl() loop
iteration with the writel(). But the dma_wmb() -> __dma_wmb() ->
dmb(oshst) from writel has a compiler barrier, so the compiler can't
reorder the code. And given the ARM64 device memory accesses ordering,
the ordering is protected.

My bad, sorry. We shall either drop or revert the patch. Please let
me know if you prefer a revert.

Thanks,
ta
