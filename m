Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C993CB2C7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jun 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929272; cv=none; b=hzbpZnKcybMU8bqckvxM8EGUa7NqKQZNqEK6bF1Z94QiEeUZzRRhLzxySmJXOJm1KsOtiVZFE39+GgoRtjDWLU4whyxFG7fQu+AIkrl6cLLfFRNXb9rNlZ3n9JwsY7YENfjxlk9pjaCFGXQAqwcnnv1jgtjEiV4mV7OuCDScS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929272; c=relaxed/simple;
	bh=4kTILm4V8LGYTvPYFXVdN9AEbZcO30xqsG4kjfshh2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKlweV5sKCFOWvsjOfqKeC8mPtHnQQFTX0Dx6JExzxLQteZwzFt81lPIGLiqVfDu+jiTY4AmxMNi0d6lWY9qhR0sJMPPQrnm7Akqzx25OER7gW08OmzVdbEO66YQ3EET45njdV8LvTkcWVNyVwhAsJO/7Ak+wtXWVg0V7gvQuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YveAro9s; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YveAro9s"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2375887f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jun 2026 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780929268; x=1781534068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXHFXu7L7X5+W85+6JMWjYQ7nh2xx8JsX3L6W7xEiLY=;
        b=YveAro9sJjAVOU4L0VP49z4gWck2W1w5tdgfRt3QfRLTzNf8ruxlBp/LcujOt8VYmZ
         4Ktx4nQ7FxAOKdDU/mFODCZA980uiQCssS0P/7S7d5ms1RwSNc0mz4jJilGhZxW604k6
         U1v/0HRoUpFzg1dAp3TJGBnKBigDMpD4nDal/Jf7OIWBB8V1MkqSwDbNaLJ13mxFKMfD
         OUfy2E73l3jIevlo6xbm5h3oJRWOMPVXMT04e4MO1hbGnJeUO+qLmhUsNVBZXXarTK5h
         XRuQdt16vmJPioO5TABR0UX2hTsQJy3rjNLX3RoRcwVr8mewkpxMH5/zvnIH6Xosrgqd
         sXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929268; x=1781534068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXHFXu7L7X5+W85+6JMWjYQ7nh2xx8JsX3L6W7xEiLY=;
        b=Wacib95ipdGfD7aCWUTdN+rcD+mHX3nv5hdnAaXFOXhd9TTgrmuE65nsaGahrJ9Apq
         alUA69qL6Q71L/7v2jeGpV9HDLxhTzAwY88eCDQs8feXGSNjpgF4SL18McHNWm+l7bD2
         JVBhtJ0Caw8c9XBwAp5+MJbXyHgb4yTp2/Hs9JTpAfAVOFsWqNUvFiI/CHAavqIFba0Q
         QPBzATrmwGAxctb5BtNnUdvhExYcdkt8WX4CX4J8f0THjhk1cZCofD4/b/bR9NbE6LC0
         /xKPpx+d/52zaiLD8XWUqHN7nynoQKAa6K5j/1q211ShBS/QwUIfWN8fAIR/TmjC9w2t
         L0ng==
X-Forwarded-Encrypted: i=1; AFNElJ+aVB0ZY/ou+IWJJYAktK09q7u6dMYo9XJQOp+uaoYQcOwwXe0cIFxTWahW+D1XrxToalTi+jmToewNt6iwLk2WFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaR++rlqgHmkMF894IfBnAARZgukFUPbpxLLTnnwETY7uBHkNi
	7dLPfK+syoK5ukn1myMIR+LYwrvTwa/FSLK2lhatYWd4zxktiVPFURDxQPl3Qck8Z+M=
X-Gm-Gg: Acq92OHQF5+LNJFzxFW2t/Vjyccz2y2bPge7HFRRXLN1NPSzmcdsuZk06yEAlQawqGG
	Sd6Jf6CeRTvUZ70tP+ctI06jGPjKDdEayT7gOid1cI4HNGD0q+ybU0flIUDzjg4hp3c8gaDLSsG
	EUfF8w+ilZWdUucBPld1HZFdALy+3NxocAWgsp0wRoFKY2bhymgD9m/YZ3XrpqdOr9DNYFtKEvi
	rVN7Hj/8UbBad4OXdSfWlYM90HdWUiLU4j6AK4DLxRMvahCg65pZ2/bCmqpYK60jGvE8snfrprU
	B9m2OeXJc2lJLERpd+RsGAJAb8xrK66AD6ygyXQcMVL4X8OE0VkP/NtaQ2sfk6axC7LX4XFD1BZ
	mkU9Zb2e1J5fhPotSKiYZJcNftx5rJDBaoDIyZ/3uZtgOi/b5bFpuzMXJQpTdbI/9FdcQg+z24N
	QHHZ5b+FTRW8uMBgmoqvnug5sYFwQd4IbXeV2RaLjvqg==
X-Received: by 2002:adf:fcce:0:b0:45e:df08:b18 with SMTP id ffacd0b85a97d-4603075ca65mr16848230f8f.32.1780929268183;
        Mon, 08 Jun 2026 07:34:28 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm95437467f8f.27.2026.06.08.07.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:34:27 -0700 (PDT)
Message-ID: <cc544c9d-0587-4d07-bc47-83636584fcef@linaro.org>
Date: Mon, 8 Jun 2026 17:34:25 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Juan Yescas <jyescas@google.com>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
 <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
 <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 6:53 PM, Alexey Klimov wrote:
> Hi Tudor,
> 
Hi!

>>>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
>>
>> EXYNOS_MBOX_CHAN_COUNT is globally defined as:
>> #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>>
>> Does the Exynos850 have the exact same number of channels as the GS101?
>>
>> You may move num_chans into struct exynos_mbox_driver_data alongside the
>> register offsets so each SoC explicitly declares its channel capacity.
> 
> Here:
> 
> => md 2040000 <--- sram_base + initdata_base
> 02040000: 000063bc 00000007 0000650c 00000013  .c.......e......
> 02040010: 00000000 00000007 0000000b 0000000e  ................
> 				^^^^
> 02040020: 00000000 00000000 00000013 00000009  ................
> 02040030: 00008000 00008008 0000800c 00008010  ................
> 02040040: 00000010 0000017f 00007800 00000080  .........x......
> 02040050: 0001f800 00004000 00000300 00000010  .....@..........
> 02040060: 66633931 20613261 65766164 00383130  19cfa2a dave018.
> 02040070: 00000000 00000000 3a393000 353a3133  .........09:31:5
> 02040080: 65462034 31312062 32303220 00000030  4 Feb 11 2020...
> 02040090: 00000000 0000001b 00000002 00ff00df  ................
> 
> So it looks like the ipc_ap_max field is equal to 0xb.
> 
> [   12.972113] exynos-acpm-protocol firmware:power-management: calling acpm_channels_init
> [   12.972216] acpm_channels_init: acpm->num_chans=b.
> [   12.975541] exynos-acpm-protocol firmware:power-management: ID = 0 poll = 1, mlen = 16, qlen = 15
> [   12.976522] exynos-acpm-protocol firmware:power-management: calling acpm_channels_init
> [   12.979336] acpm_channels_init: acpm->num_chans=b.
> [   12.984133] exynos-acpm-protocol firmware:power-management: ID = 0 poll = 1, mlen = 16, qlen = 15
> [   12.993849] exynos-acpm-protocol firmware:power-management: ID = 1 poll = 1, mlen = 16, qlen = 3
> [   13.001756] exynos-acpm-protocol firmware:power-management: ID = 2 poll = 1, mlen = 16, qlen = 5
> [   13.010519] exynos-acpm-protocol firmware:power-management: ID = 3 poll = 0, mlen = 16, qlen = 1
> [   13.019317] exynos-acpm-protocol firmware:power-management: ID = 4 poll = 1, mlen = 16, qlen = 3
> [   13.028073] exynos-acpm-protocol firmware:power-management: ID = 5 poll = 0, mlen = 16, qlen = 1
> [   13.036805] exynos-acpm-protocol firmware:power-management: ID = 6 poll = 0, mlen = 16, qlen = 1
> [   13.050945] exynos-acpm-protocol firmware:power-management: ID = 7 poll = 1, mlen = 2, qlen = 1
> [   13.065791] exynos-acpm-protocol firmware:power-management: ID = 8 poll = 1, mlen = 2, qlen = 1
> [   13.079592] exynos-acpm-protocol firmware:power-management: ID = 9 poll = 1, mlen = 16, qlen = 7
> [   13.088398] exynos-acpm-protocol firmware:power-management: ID = 10 poll = 1, mlen = 8, qlen = 1
> 
> That's what sram + initdata provides but I guess these are implemented
> number of channels of ACPM firmware (when APM communicates with AP CPU).
> The mailbox hardware register though can process or consume 16 bits or
> in other words HWEIGHT32(GENMASK(15, 0)). I guess this field should
> indicate hardware capability of mbox hardware like max number of
> possible channels? I'll change the code to use HWEIGHT32(mask) of
> corresponding register then.

Exactly. The mailbox controller driver should model the underlying
hardware's capabilities, not the firmware's specific usage limits.
Since the Exynos850 hardware register uses a 16-bit mask, exposing
16 hardware channels is the right move. Moving num_chans into
struct exynos_mbox_driver_data alongside the register masks for
each SoC is the cleanest approach.

> 
> Or should there be a call to acpm firmware driver to query the number
> of channels? Or should we get it from device tree?

There is no need to call the ACPM firmware driver. The mailbox
controller merely exposes the available pipes.

> 
> Does gs101 have less than 16 number of ACPM ap channels?
> 

I don't remember, but regardless of how many channels the gs101 acpm
firmware actually utilizes, its hw mask is also 16 bit, so exposing
16 hardware channels for it is correct.

Cheers,
ta
