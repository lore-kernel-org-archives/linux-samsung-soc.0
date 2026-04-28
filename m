Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D24611EE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381070; cv=none; b=bab3yvQH69zyR6BH7CTh28noGSZg0/lRF77c6rnAJ8dvoQUj+ph9ngPPZYOJ9GJxXzS7qpiq2HjskYNeqpRO0UNV1J/rVFFk8dFp+4nfdTwfpRADqM7EgXUjBnePS6RSXPcHlA6Tk+WfwnidKR9/cGD0ckvmyeXYQRQ4kMs38OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381070; c=relaxed/simple;
	bh=25SMsyBtf1HepaNd7fd0AZY+tgS5iDhu2BBf/dTE/fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLfRg6H768DePFV/id+P6wwLDE9J/ffgSkfz1TcNQxNu5y0HMg7fR+KHycNoiX4Kz6ndPrH0n0TWLe3lCArNHk/+GqsBKDRhGD9VMmR42pqJzvdx3ZuM7u0+kKiSas7kJAc6vful5yTOzlDKO34KdFWDGpJpham1QINhjsZbD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVThJXkM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVThJXkM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b886fc047d5so2037299266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777381065; x=1777985865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qziSDnZnW0hzNlxAbwh27iZM0znzpYCyRyBZAEASdgk=;
        b=kVThJXkMxdCEvb8IO3MwgZ/QPkLhEqFYegkzF7TdVkQHfCCh03arbEyZn0D7F13967
         ns2/QsiBp1W/cX15SGUY1/rSVjZyG3rpwbJdEXOH1KYTAoKI+CfyRzd9Pa0VLvrmvKrX
         IGC4OUqCob+3es3OdS+3PL/ryFDz/1MlZbo2HJxlAdCwAW9++Q6grDOxLPMaJf3tFHO7
         bdR5wCcpnIJ96oj2OXtwfYMr6fWlvp7UyxVxNh4SdEtbJa2WhhusLnYXMf6cYYoJvlHU
         E2ksCcvgfCXroNmSJcXv1+aDJjMzp3Mogl6jaZX9mbDv/nWs6vQc9UK8GDOkF+Ip92Vn
         Xwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381065; x=1777985865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qziSDnZnW0hzNlxAbwh27iZM0znzpYCyRyBZAEASdgk=;
        b=KuCp9udmYv40Df59DrjbQvXZm2kz98sGtvLxzY0Vqv4aQQOm/USjnzcSD0yngslqRa
         4yuRAlfyshcUh7C2tF3dfCWI8Lm/YZ2LVybYkY2+gz9gL/Gnya4gbthMfmwPknHNVo18
         M4bpFCppE/43Xd6c5GeYO00P7dk0KgMSP66umhMnEJbIk0S10+LJec+1pAI1cC3PTzJG
         s6kRurjjfpr/fqy21/+xOH4uHtxlnn3STXZ2PN36l2BQ89+HrBgp/lfoGKKMT5dX4PFe
         NDC/acxOf/DBLShruGL/IYbmL+m7PT/HDNA+QlFDWbHaUKusB7Q/VETtqUYhkzqb6gDw
         Nj3g==
X-Forwarded-Encrypted: i=1; AFNElJ8FPDUFG6P0d+KI15Jmg5Tu5D4GRY7SG/BOArOffHWkAewAMojsPGN5XA3oZvxulfGLZY0yvqGk2lT2yswdQMGgxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBu3/b4pynLYVm+IS3EMpA7WqjMK6aLz8rV92saH8pIsIt3B8O
	cqBXH/ONDH1xYOeW75OyM3Ur2hJBUM0m/SHryMedbeBFouzyfxYh2XvY72d7S0VHNwg=
X-Gm-Gg: AeBDieup1IUr1iDv/30srzvTBgdDSq3pJedY1iZ6zcOzfGeYAAqX7XaPGqwmGwVwdyw
	MYu10EXRSbLvGppmJHRcoropL7ZKgZoL9oStyDfdCTCydCZ/zoOboXw+cjlxDzqeKrIIYp5uJEA
	TNsuYlCLFIuB/mLKfb4sv+hQpVaFQnsRPHBWpL2Yd9Nq1RpHQ4BFu5bDisr+q+FePtDpciMrKe1
	vCqETHS3J03dFLF9l6qYaInicQPYyeBJPkzK2uMPGC/e48u21ul4NNXcp1FZ9vIEAYFqx6gRvqa
	UA1j2CTp1TyoqSxNykcnlUehZMdM2foHxjOBhuiswJZsW5rIVT5IwPyn2EL8m/sHigqoPl8hdWr
	L5FYddDdgIX/+AkI6qfxGoQU4kiY0sqrZUKbsxikqReR3geCTdKxx0DRt/y6asnxtFMFYloddiX
	2YUJ09SskSP9qApYpz0T2sRzyJNeEzXNWDcT6iFYsu4yggNf28uwN/9w==
X-Received: by 2002:a17:907:3e9c:b0:bae:642a:8712 with SMTP id a640c23a62f3a-bb804728367mr182366766b.26.1777381064507;
        Tue, 28 Apr 2026 05:57:44 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd9381esm101392866b.52.2026.04.28.05.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:57:44 -0700 (PDT)
Message-ID: <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Date: Tue, 28 Apr 2026 15:57:39 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
 <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

Thanks for the review! I indeed missed something in the acquire path,
details below.

On 4/28/26 12:52 PM, Krzysztof Kozlowski wrote:
> On 27/04/2026 17:04, Tudor Ambarus wrote:
>> Sashiko identified a memory ordering race in RX path [1].
>>
>> When draining the RX queue or reading saved responses, the driver uses
>> clear_bit() to release the sequence number back to the available pool.
>> However, on weakly ordered architectures like ARM64, clear_bit() does
>> not provide implicit memory barriers.
> 
> And it does not have to if entire access is synchronized by other locks.

Right.

> You need to analyze also this and mention here path which is not
> synchronized and uses these weakly ordered atomic operations.
>

The TX path is protected by tx_lock, and the RX path is protected by
rx_lock. Because the bitmap_seqnum is modified by the RX thread
(clearing the bit) and the TX thread (setting the bit), the bitmap is
accessed across two different lock domains. Therefore, from the
bitmap's perspective, the synchronization is entirely lockless, and
explicit memory barriers are required. I'll add a comment in the
commit message.

>>
>> This allows the CPU to reorder instructions, making the cleared bit
>> globally visible before the preceding memory operations (memcpy() or
>> __ioread32_copy()) have completed. If a concurrent thread allocates the
>> newly freed sequence number, it can execute acpm_prepare_xfer() and
>> zero out the buffer via memset() while the RX thread is still actively
>> reading from it, leading to silent data corruption.
>>
>> Fix this by replacing clear_bit() with clear_bit_unlock() across the
>> RX path. This provides release semantics, guaranteeing that all prior
>> memory reads and writes are fully completed and visible before the
>> sequence number is marked as free.
> 
> Barriers should be paired and release is paired with acquire.
> bitmap_seqnum() is used with test_bit() and a separate set_bit(), which
> do not have acquire semantics, although in some calls it is within lock.
> Problem is I guess acpm_dequeue_by_polling() which is called without any
> locks.
> 
> This means that other thread won't see updated values.
> 
> I think you also need to investigate and fix that acquire path.

:) thanks for the challenge!

In acpm_dequeue_by_polling(), zero-lenght messages (rxcnt == 0) can have
their bits cleared by a concurrent thread draining the queue. If we have
our thread sitting in the do...while loop and calling test_bit() we risk
speculative execution of the caller's subsequent instructions before the
bit actually flips to zero. The fix is to s/test_bit()/test_bit_acquire().

In what concerns acpm_prepare_xfer(), where we use set_bit(), I find it
safe as it is, I don't think we need an acquire barrier. By the time the
test_bit() loop observes a 0, the RX's clear_bit_unlock() has guaranteed
that the payload was copied out. The rx_data->cmd buffer is dead.

Another thing that I thought about was about the reordering of memset
and set_bit in acpm_prepare_xfer(), but even there, the internal
execution order doesn't matter. Both are guaranteed to be completed
before writel (wmb). One may notice that I even reordered the memset and
set_bit in patch 6/6.

Also, test_bit() in acpm_prepare_xfer() will be replaced in patch 6/6
by find_next_zero_bit(), they are functionally equivalent.

I'll send a v3, s/test_bit()/test_bit_acquire()/ in RX path and update
the commit message with the details described above.

Cheers,
ta
