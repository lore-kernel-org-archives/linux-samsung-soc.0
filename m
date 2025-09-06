Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC52279791;
	Sat,  6 Sep 2025 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757142427; cv=none; b=jgngFWB7D6FGGSPvj8dvLh0bgllbZfaR5rTt5F6CgmjrWQq7DOhhG+QMNFlRQatSn1peKcBlotzylVJ2mG0Pgb1xwQlARK9pg1ITpAytmFOCicOdoNBm6PTwPGEBRlz5BIdK7gadwmoYcT4p85psOM0AOThHK4QZ4wXHBD37GQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757142427; c=relaxed/simple;
	bh=zwUvickVCM+ZhAxLgR4H3PvoKPhot7jbWmSR67igzyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGq0kTFijbka3zoYvzHS9IUgqQlPWRcyQGCTLSG9qbuXJQSfmGgXFQm26C42Dzcxzt5Xkk6DSqzMSvH4tUbhHie4kY7VN6yT672Qogf2xelAUCtr0+nlPFMD/EFFV/VgzvApLq8Hy/dgc6A4weSUAmMX3rDTvZfUjUDBnbqtpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBE5+xMn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBE5+xMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EE9C4CEE7;
	Sat,  6 Sep 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757142426;
	bh=zwUvickVCM+ZhAxLgR4H3PvoKPhot7jbWmSR67igzyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tBE5+xMnoAoUFdGYTMOW9wKiSEH2McQdJ9yJRSDLRMH4MwTgoKnmmwqdaaVe93eqL
	 i7hZeUrsiCtnuREkcQNFIC4IJE2m50X7iYbbyaATa9iiUxM5Aza1SxSdeN2/gwPUBM
	 ejwomEnK5mbrJDuaWtWMiPdtqnUva6npypYh69qTX2MSgVazinubyggeN7fhqOzHwy
	 B0voPFh0iQenq5Eh9G3yGineBffTquTNn2Yg1QRMKiyIm/gNEyBuouwMsKcs88PXMC
	 AEudpL+KsDFtcH80fxm1e04EvUoDHkzgriFdQRfxI4FG9KOOlmib+t1BPR/p3EEiZm
	 3rn44yTRoZQOA==
Message-ID: <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>
Date: Sat, 6 Sep 2025 09:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
 <aLshJ11k3c2T-MRs@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aLshJ11k3c2T-MRs@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2025 19:43, Mostafa Saleh wrote:
>>>
>>> As this value is only read once, it doesn't require to be stable, so
>>
>> Why it does not need to be stable? Onlining wrong CPU number is not
>> desired...
>>
>>> just use "raw_smp_processor_id" instead.
>>
>> You might be just hiding some other real issue, because above stacktrace
>> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
>> disabled. Provide analysis of the warning, instead of just making it
>> disappear.
> 
> Not sure I understand, how is preemption disabled? that wouldn't fire
> in that case.

Because there is explicit preempt_disable().

So far you did not present any code analysis, any actual arguments, so
deflecting reviewer's comment like above will get you nowhere. Instead
of replying with a question, bring arguments that the code path does not
disable the preemption.

My call is that you run all this on some other kernel, just like usually
happens in Google.

> 
> I am not familiar with this driver, but as I see the value is used
> only once, it would be stable, for example using get/put_cpu won't
> really matter, because next access doesn't depend on the current CPU.
> Otherwise, if you imply that this might not be enough, that means
> the driver is already broken even without CONFIG_DEBUG_PREEMP
> (which is beyond my knowledge at this point)
> 
>>
>>>
>>> Cc: Peter Griffin <peter.griffin@linaro.org>
>>> Cc: André Draszik <andre.draszik@linaro.org>
>>>
>>
>> No blank lines between tags.
>>
>> Missing Fixes tag... and then Cc is not necessary. Please follow
>> standard kernel process.
> 
> I will add the Fixes.
> 
> I am working with Peter and André, so I thought Cc is fine
> (according to the process) in:
> https://docs.kernel.org/process/5.Posting.html

Please learn how Fixes and get_maintainers.pl work.



Best regards,
Krzysztof
