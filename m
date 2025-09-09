Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7344125B30E;
	Tue,  9 Sep 2025 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433009; cv=none; b=T0gVUK/QeXdRR/xl10nul8d6DyBdiaCjDLzDz8vBSnmCudX7hFLyZ8ime/KjF35QJ+GJwqeB7/gEKuL62c3dMWRjrxRj1OqB88CPvfgEKUyI6gTAZI8L2GBTTWx8kDWZmJxmWUEahFVRmptaqjkwDJapFfsYeIvT2P7oT2vpdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433009; c=relaxed/simple;
	bh=79jYp++lEJN4rEF9ynSAQ+SA/L+k4rLn8ofklQoqDng=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t/AG/0v6KQ0Pjv+Wr2i6nEmhwdFjd3RgV4B3hn8MXz6CDJycKvXJPdGX7MdSv5XK9gwosQgGo+7ZaK4yy7MSvV0cvY1EM7a54msXQYzybAVy0MpsvryPsIpDniLKRtC37c5+rM0Ae/zAI/D2L5ZY8kliLLazYH0ThMVD56/Z8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFGvDDlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFGvDDlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45B0C4CEF4;
	Tue,  9 Sep 2025 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757433008;
	bh=79jYp++lEJN4rEF9ynSAQ+SA/L+k4rLn8ofklQoqDng=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hFGvDDlc/03WPrXT3HTPBrBNXDe05KRqPNU2SSvk6QXBx1VRLGhswHwx1CFE2AxrJ
	 WdLUi/qPABxHPxYlvHhJPzTBLR6vDXIdrLREJMgRq//HvTvc7BjkdoofeeyYTZkAP8
	 xrzQuwu6jHeZ72y3mhwGIIaN6fnsk6D3Cl32UmRhiKpPQOortvCfCo3HuemxJGkQRc
	 hgsx9MDxpzged2Vlnz3fmE8hR3vm+BhDE6qA7vNEcgv3SOkh6rnk8L0+sl+jJSCPuG
	 xogODt+PqTpXk4UCYOwD1k1F9waAzsqw1Qj+XVO0kcG1uSIMRy0upyMZLt+Hlzbw8g
	 vTQ6ZU/CnS41Q==
Message-ID: <c0388c9a-0e1e-455f-a933-5b378806e2cc@kernel.org>
Date: Tue, 9 Sep 2025 17:50:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
 <aLshJ11k3c2T-MRs@google.com>
 <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>
 <aL_-N43BTtQynMS_@willie-the-truck>
 <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 17:43, Krzysztof Kozlowski wrote:
> On 09/09/2025 12:15, Will Deacon wrote:
>> Krzysztof,
>>
>> On Sat, Sep 06, 2025 at 09:07:02AM +0200, Krzysztof Kozlowski wrote:
>>> On 05/09/2025 19:43, Mostafa Saleh wrote:
>>>>>>
>>>>>> As this value is only read once, it doesn't require to be stable, so
>>>>>
>>>>> Why it does not need to be stable? Onlining wrong CPU number is not
>>>>> desired...
>>>>>
>>>>>> just use "raw_smp_processor_id" instead.
>>>>>
>>>>> You might be just hiding some other real issue, because above stacktrace
>>>>> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
>>>>> disabled. Provide analysis of the warning, instead of just making it
>>>>> disappear.
>>>>
>>>> Not sure I understand, how is preemption disabled? that wouldn't fire
>>>> in that case.
>>>
>>> Because there is explicit preempt_disable().
>>
>> Where do you see that?
> 
> I did look at the code.
> 
> All the calls I saw (including calltrace from commit msg) were under raw
> spinlock and raw spinlock does:
> 
> preempt_disable();
> 
>>
>> From what I can tell, the driver (somewhat bizarrely) registers its
>> online callback much earlier (at CPUHP_BP_PREPARE_DYN) than the offline
>> callback so that gs101_cpuhp_pmu_online() will be run in the context of
>> the caller/onliner rather than the actual CPU coming up. I don't see
>> anything which disables preemption on that path.
>>
>>> So far you did not present any code analysis, any actual arguments, so
>>> deflecting reviewer's comment like above will get you nowhere. Instead
>>> of replying with a question, bring arguments that the code path does not
>>> disable the preemption.
>>
>> Mostafa's reported a bug and had a go at fixing it, for goodness sake.
>> Would you rather not hear about bugs in the code you maintain?
> 
> I am happy to see such patch, but Mostafa instead of replying with
> anything useful just shoved back my comment back to me.
> 
> 
>>
>> As somebody who should understand this code better than most, perhaps
>> you could try a bit harder to fill in the blanks on the technical side
> 
> I did and I investigated the code and I cannot find the issue leading to
> it, thus I asked.
> 
> And then contributor just replied whatever so I will go away and stop
> bothering them?
> 
>> rather than pointing out extraneous blank lines and making questionable
>> judgements about CC lines.
>>
>>> My call is that you run all this on some other kernel, just like usually
>>> happens in Google.
>>
>> Whilst that inevitably happens with some of the more product-facing
>> teams, I think it's foolish to assume that nobody works directly with
>> upstream at Google. We're also not going to waste time fabricating bug
> 
> I saw many, many  bug reports from Google and Linaro done on Android
> kernel. Really, too many.


And I read now reply from Peter which nicely points that this bug report
was not done on something older. Again my pure guess - some Android kernel.

@Will, I pointed out - except new lines - real issue with this patch and
explain in gs101_cpuhp_pmu_online() why I think that. Contributor did
not even bother to check that logic I pointed out, so your scoffing is
inappropriate.

Best regards,
Krzysztof
